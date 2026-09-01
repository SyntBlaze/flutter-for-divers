import 'dart:convert';
import 'dart:io';

import 'mdx_to_docs.dart' show topicLinkSegment;

const origin = 'https://app.syntblaze.com';
final placeholderPattern = RegExp(r'https://app\.syntblaze\.com(?!/)');

final class Topic {
  Topic({required this.name, required this.path, required this.parent});

  final String name;
  final String path;
  final Topic? parent;
  final List<Topic> children = [];
}

void main(List<String> arguments) {
  final write = arguments.contains('--write');
  final unknownArguments = arguments.where((value) => value != '--write');
  if (unknownArguments.isNotEmpty) {
    stderr.writeln('Usage: dart run tool/_populate_links.dart [--write]');
    exitCode = 64;
    return;
  }

  final catalog = _readCatalog();
  final readmes = _readmeFiles();
  final topicByReadme = _mapReadmes(catalog.roots, readmes);

  var replacements = 0;
  var updatedFiles = 0;
  final errors = <String>[];
  final routeCounts = <String, int>{};

  for (final entry in topicByReadme.entries) {
    final file = File(entry.key);
    final currentTopic = entry.value;
    final original = file.readAsStringSync();
    final lines = const LineSplitter().convert(original);
    final documentTitle = lines.first.replaceFirst(RegExp(r'^#\s+'), '');
    final output = <String>[];
    var section = '';

    for (var index = 0; index < lines.length; index++) {
      var line = lines[index];
      if (line.startsWith('## ')) section = line.substring(3);
      final occurrences = placeholderPattern.allMatches(line).length;
      if (occurrences == 0) {
        output.add(line);
        continue;
      }

      final paths = _pathsForLine(
        line: line,
        section: section,
        documentTitle: documentTitle,
        currentTopic: currentTopic,
        location: '${entry.key}:${index + 1}',
        errors: errors,
      );
      if (paths.length != occurrences) {
        errors.add(
          '${entry.key}:${index + 1}: resolved ${paths.length} of '
          '$occurrences placeholder(s)',
        );
        output.add(line);
        continue;
      }

      var pathIndex = 0;
      line = line.replaceAllMapped(
        placeholderPattern,
        (_) => '$origin${paths[pathIndex++]}',
      );
      for (final path in paths) {
        final prefix = path.split('/')[1];
        routeCounts[prefix] = (routeCounts[prefix] ?? 0) + 1;
        replacements++;
      }
      output.add(line);
    }

    final changed = '${output.join('\n')}\n';
    if (changed != original) {
      updatedFiles++;
      if (write) file.writeAsStringSync(changed);
    }
  }

  if (errors.isNotEmpty) {
    stderr
      ..writeln('Link errors (${errors.length}):')
      ..writeln(errors.join('\n'));
    exitCode = 1;
    return;
  }

  stdout.writeln(
    '${write ? 'Updated' : 'Would update'} $updatedFiles files with '
    '$replacements links. Route types: ${_sortedJson(routeCounts)}',
  );
  if (write || replacements == 0) {
    _validateGeneratedLinks(catalog.all, readmes);
  }
}

({List<Topic> roots, List<Topic> all}) _readCatalog() {
  final json =
      jsonDecode(File('flutter_content.json').readAsStringSync())
          as Map<String, dynamic>;
  final roots = <Topic>[];
  final all = <Topic>[];

  Topic parse(Map<String, dynamic> value, Topic? parent) {
    final topic = Topic(
      name: value['name'] as String,
      path: value['path'] as String,
      parent: parent,
    );
    all.add(topic);
    for (final childValue
        in (value['children'] as List<dynamic>? ?? const [])) {
      topic.children.add(parse(childValue as Map<String, dynamic>, topic));
    }
    return topic;
  }

  for (final value in json['topics'] as List<dynamic>) {
    roots.add(parse(value as Map<String, dynamic>, null));
  }
  return (roots: roots, all: all);
}

List<File> _readmeFiles() =>
    Directory.current
        .listSync(recursive: true, followLinks: false)
        .whereType<File>()
        .where(
          (file) => file.path.endsWith('${Platform.pathSeparator}README.md'),
        )
        .toList()
      ..sort((left, right) => left.path.compareTo(right.path));

Map<String, Topic?> _mapReadmes(List<Topic> roots, List<File> readmes) {
  final result = <String, Topic?>{};
  final errors = <String>[];
  for (final file in readmes) {
    final relative = _relativePath(file.path);
    final content = file.readAsStringSync();
    if (relative == 'README.md' || !placeholderPattern.hasMatch(content)) {
      continue;
    }
    if (relative == 'tool/README.md') {
      result[relative] = null;
      continue;
    }

    final directory = relative.substring(
      0,
      relative.length - '/README.md'.length,
    );
    final segments = directory.split('/');
    var candidates = roots
        .where((topic) => _fileSegment(topic.name) == segments.first)
        .toList();
    for (final segment in segments.skip(1)) {
      candidates = [
        for (final candidate in candidates)
          ...candidate.children.where(
            (topic) => _fileSegment(topic.name) == segment,
          ),
      ];
    }
    if (candidates.length == 1) {
      result[relative] = candidates.single;
    } else {
      errors.add(
        '$relative -> ${candidates.map((topic) => topic.path).toList()}',
      );
    }
  }
  if (errors.isNotEmpty) {
    throw FormatException(
      'README mapping errors (${errors.length}):\n${errors.join('\n')}',
    );
  }
  return result;
}

List<String> _pathsForLine({
  required String line,
  required String section,
  required String documentTitle,
  required Topic? currentTopic,
  required String location,
  required List<String> errors,
}) {
  if (section == 'Learn More') {
    if (line.contains('[Quick Bite]')) {
      return [
        currentTopic == null
            ? _freePromptRoute('qp', documentTitle)
            : _topicRoute('qt', currentTopic),
      ];
    }
    if (line.contains('[Learning Path]')) {
      return [
        currentTopic == null
            ? _freePromptRoute('lp', documentTitle)
            : _topicRoute('lt', currentTopic),
      ];
    }
    if (line.contains('[Deep Dive]')) {
      return [
        currentTopic == null
            ? _freePromptRoute('dp', documentTitle)
            : _topicRoute('dt', currentTopic),
      ];
    }
  }

  if (section == 'Questions' || section == 'Best Practices') {
    final match = RegExp(
      r'^- \[(.*)\]\(https://app\.syntblaze\.com\)$',
    ).firstMatch(line);
    if (match != null && currentTopic != null) {
      return [_promptRoute('qsp', currentTopic, match.group(1)!)];
    }
    errors.add('$location: malformed or unscoped prompt link');
    return const [];
  }

  if (line.startsWith('|') && line.contains('"Quick Bite"')) {
    final cells = _tableCells(line);
    final target = currentTopic == null || cells.isEmpty
        ? null
        : _resolveRowTarget(
            currentTopic: currentTopic,
            section: section,
            rowLabel: cells.first,
          );
    if (target != null) {
      return [
        _topicRoute('qt', target),
        _topicRoute('lt', target),
        _topicRoute('dt', target),
      ];
    }
    errors.add(
      '$location: cannot resolve "$section" / '
      '"${cells.isEmpty ? '' : cells.first}"',
    );
    return const [];
  }

  errors.add('$location: unclassified placeholder in "$section"');
  return const [];
}

Topic? _resolveRowTarget({
  required Topic currentTopic,
  required String section,
  required String rowLabel,
}) {
  final row = _normalizeLabel(rowLabel);
  final direct = currentTopic.children
      .where((topic) => _labelsMatch(row, _normalizeLabel(topic.name)))
      .toList();
  if (direct.length == 1) return direct.single;

  final sectionParents = currentTopic.children
      .where((topic) => _sectionMatches(section, topic.name))
      .toList();
  if (sectionParents.length == 1) {
    final matches = sectionParents.single.children
        .where((topic) => _labelsMatch(row, _normalizeLabel(topic.name)))
        .toList();
    if (matches.length == 1) return matches.single;
  }

  final grandchildren = currentTopic.children.expand((topic) => topic.children);
  final matches = grandchildren
      .where((topic) => _labelsMatch(row, _normalizeLabel(topic.name)))
      .toList();
  return matches.length == 1 ? matches.single : null;
}

bool _sectionMatches(String section, String topicName) {
  final normalized = _normalizeLabel(
    section.replaceFirst(RegExp(r'\s+\[>\].*$'), ''),
  );
  final topic = _normalizeLabel(topicName);
  if (normalized == topic) return true;
  for (final suffix in [
    ' topics',
    ' widgets and apis',
    ' widgets',
    ' components and configuration',
    ' tree nodes',
    ' guidance',
    ' options',
    ' techniques and lifetimes',
  ]) {
    if (normalized.endsWith(suffix) &&
        normalized.substring(0, normalized.length - suffix.length) == topic) {
      return true;
    }
  }
  return false;
}

String _normalizeLabel(String value) {
  var result = value
      .replaceAllMapped(
        RegExp(r'\[([^\]]+)\]\(<[^>]+>\)'),
        (match) => match.group(1)!,
      )
      .replaceAll('*', ' star ')
      .replaceAll('()', ' method ')
      .replaceAll(RegExp(r'[`_()]'), '')
      .replaceAll('&amp;', '&')
      .trim()
      .toLowerCase();
  return result.replaceAll(RegExp(r'\s+'), ' ');
}

bool _labelsMatch(String row, String topic) {
  if (row == topic) return true;
  const aliases = <String, String>{
    'android/app/build.gradle.kts / build.gradle': 'android/app/build.gradle',
    'mousecursor': 'cursor',
    'mediaquerydata.viewpadding': 'viewpadding',
    'mediaquerydata.viewinsets': 'viewinsets',
    'opacity and savelayer method': 'opacity savelayer',
    'expensive savelayer method': 'expensive savelayer',
    'semantics hit testing': 'hit testing semantics',
    'appbarthemedata': 'appbartheme',
    'inputdecorationthemedata': 'inputdecorationtheme',
    'dialogthemedata': 'dialogtheme',
    'application root': 'app',
  };
  if (aliases[row] == topic) return true;
  return row.split(RegExp(r'\s+/\s+|\s+or\s+')).contains(topic);
}

void _validateGeneratedLinks(List<Topic> topics, List<File> readmes) {
  final topicPaths = topics.map(_topicRoutePath).toSet();
  final errors = <String>[];
  final counts = <String, int>{};
  var routeCount = 0;
  var homeCount = 0;
  final urlPattern = RegExp(r'https://app\.syntblaze\.com(?:/[^\s)"<>]*)?');

  for (final file in readmes) {
    final relative = _relativePath(file.path);
    for (final match in urlPattern.allMatches(file.readAsStringSync())) {
      final value = match.group(0)!;
      final uri = Uri.parse(value);
      if (uri.path.isEmpty) {
        if (relative != 'README.md') {
          errors.add('$relative: bare application origin');
        }
        homeCount++;
        continue;
      }

      final segments = uri.pathSegments;
      if (segments.length >= 2 && segments[1] != 'flutter') {
        continue;
      }

      routeCount++;
      if (segments.length < 3) {
        errors.add('$relative: malformed route $value');
        continue;
      }
      final prefix = segments.first;
      counts[prefix] = (counts[prefix] ?? 0) + 1;
      if (const {'dt', 'lt', 'qt'}.contains(prefix)) {
        final topicPath = segments.skip(2).join('/');
        if (!topicPaths.contains(topicPath)) {
          errors.add('$relative: unknown topic route $value');
        }
      } else if (const {'dsp', 'lsp', 'qsp'}.contains(prefix)) {
        if (segments.length < 4 || segments.last.isEmpty) {
          errors.add('$relative: malformed scoped prompt route $value');
          continue;
        }
        final topicPath = segments.skip(2).take(segments.length - 3).join('/');
        if (!topicPaths.contains(topicPath)) {
          errors.add('$relative: unknown scoped topic route $value');
        }
      } else if (const {'dp', 'lp', 'qp'}.contains(prefix)) {
        if (segments.length != 3 || segments.last.isEmpty) {
          errors.add('$relative: malformed free prompt route $value');
        }
      } else {
        errors.add('$relative: unsupported route prefix in $value');
      }
    }
  }

  if (errors.isNotEmpty) {
    stderr
      ..writeln('Generated link validation errors (${errors.length}):')
      ..writeln(errors.join('\n'));
    exitCode = 1;
    return;
  }
  stdout.writeln(
    'Validated $routeCount generated routes and $homeCount intentional '
    'home/share links. Route types: ${_sortedJson(counts)}',
  );
}

String _fileSegment(String displayName) {
  var value = displayName.replaceAll('`', '').replaceAll('*', ' star ');
  value = value.replaceAllMapped(
    RegExp(r'\b([A-Za-z])/([A-Za-z])\b'),
    (match) => '${match.group(1)}-${match.group(2)}',
  );
  value = value.replaceAll(RegExp(r'[<>:"/\\|?]'), ' ');
  return value
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim()
      .replaceAll(RegExp(r'[. ]+$'), '');
}

List<String> _tableCells(String line) {
  final body = line.substring(
    1,
    line.endsWith('|') ? line.length - 1 : line.length,
  );
  return body.split('|').map((cell) => cell.trim()).toList();
}

String _topicRoute(String prefix, Topic topic) =>
    '/$prefix/flutter/${_topicRoutePath(topic)}';

String _freePromptRoute(String prefix, String markdownPrompt) =>
    '/$prefix/flutter/${_encodePrompt(markdownPrompt)}';

String _promptRoute(String prefix, Topic topic, String markdownPrompt) =>
    '/$prefix/flutter/${_topicRoutePath(topic)}/${_encodePrompt(markdownPrompt)}';

String _topicRoutePath(Topic topic) {
  final segments = <String>[];
  for (Topic? current = topic; current != null; current = current.parent) {
    segments.add(topicLinkSegment(current.name));
  }
  return segments.reversed.join('/');
}

String _encodePrompt(String markdownPrompt) => Uri.encodeComponent(
  markdownPrompt.replaceAll('`', '').replaceAll(' ', '-'),
);

String _relativePath(String absolutePath) {
  final root = '${Directory.current.absolute.path}${Platform.pathSeparator}';
  return absolutePath
      .substring(root.length)
      .replaceAll(Platform.pathSeparator, '/');
}

String _sortedJson(Map<String, int> values) => jsonEncode(
  Map.fromEntries(
    values.entries.toList()
      ..sort((left, right) => left.key.compareTo(right.key)),
  ),
);
