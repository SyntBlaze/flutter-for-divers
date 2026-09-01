import 'dart:convert';
import 'dart:io';

/// One topic in the compact MDX outline format.
final class OutlineTopic {
  const OutlineTopic(this.name, [this.children = const []]);

  final String name;
  final List<OutlineTopic> children;
}

/// One heading and its bullet topics from the compact MDX outline format.
final class TopicGroup {
  const TopicGroup(this.name, this.topics) : _topicTree = null;

  TopicGroup._parsed(this.name, this.topics, this._topicTree);

  final String name;

  /// Every topic name in source order, including nested topics.
  ///
  /// This flat view preserves the original public API. Plan generation uses
  /// [topicTree] so source nesting is retained.
  final List<String> topics;

  final List<OutlineTopic>? _topicTree;

  Iterable<OutlineTopic> get topicTree =>
      _topicTree ?? topics.map(OutlineTopic.new);
}

/// A parsed source outline and the domain name chosen for it.
final class DomainOutline {
  const DomainOutline({
    required this.sourcePath,
    required this.name,
    required this.groups,
  });

  final String sourcePath;
  final String name;
  final List<TopicGroup> groups;

  int get topicCount =>
      groups.fold(0, (sum, group) => sum + group.topics.length);
}

/// A file that the converter intends to create.
final class PlannedFile {
  const PlannedFile(this.relativePath, this.content);

  final String relativePath;
  final String content;
}

/// Result of preflighting or writing a documentation plan.
final class WriteResult {
  const WriteResult({
    required this.created,
    required this.updated,
    required this.unchanged,
    required this.conflicts,
    required this.dryRun,
  });

  final List<String> created;
  final List<String> updated;
  final List<String> unchanged;
  final List<String> conflicts;
  final bool dryRun;

  bool get succeeded => conflicts.isEmpty;
}

/// Parses the repository's outline-style MDX:
///
/// ```text
/// Group name
/// - Topic one
///   - Nested topic
/// - `literalApi()`
/// ```
///
/// Blank lines may separate groups. Topic nesting uses two spaces per level;
/// skipped levels and indented headings are rejected.
List<TopicGroup> parseMdxOutline(String sourcePath, String source) {
  final groups = <TopicGroup>[];
  final groupNames = <String>{};
  String? currentName;
  List<String>? currentTopics;
  List<_TopicBuilder>? currentTopicTree;
  final topicStack = <_TopicBuilder>[];

  void finishGroup(int lineNumber) {
    if (currentName == null) return;
    if (currentTopics!.isEmpty) {
      throw FormatException(
        '$sourcePath:$lineNumber: group "$currentName" has no topics.',
      );
    }
    groups.add(
      TopicGroup._parsed(
        currentName!,
        List.unmodifiable(currentTopics!),
        List.unmodifiable(currentTopicTree!.map(_freezeTopic)),
      ),
    );
    currentName = null;
    currentTopics = null;
    currentTopicTree = null;
    topicStack.clear();
  }

  final lines = const LineSplitter().convert(source);
  for (var index = 0; index < lines.length; index++) {
    final lineNumber = index + 1;
    // A UTF-8 BOM decoded by dart:io becomes U+FEFF at the start of the first
    // line. It is transport metadata, not part of the first group name.
    final line = index == 0 && lines[index].startsWith('\uFEFF')
        ? lines[index].substring(1)
        : lines[index];
    if (line.trim().isEmpty) continue;
    final leftTrimmed = line.trimLeft();
    if (leftTrimmed.startsWith('- ') &&
        leftTrimmed.substring(2).trim().isEmpty) {
      throw FormatException('$sourcePath:$lineNumber: topic is empty.');
    }
    if (line != line.trimRight()) {
      throw FormatException(
        '$sourcePath:$lineNumber: trailing whitespace is not supported.',
      );
    }

    var indentation = 0;
    while (indentation < line.length && line.codeUnitAt(indentation) == 0x20) {
      indentation++;
    }
    final content = line.substring(indentation);
    if (content.startsWith('\t')) {
      throw FormatException(
        '$sourcePath:$lineNumber: topic indentation must use spaces, not tabs.',
      );
    }

    if (content.startsWith('- ')) {
      if (content.substring(2).trim().isEmpty) {
        throw FormatException('$sourcePath:$lineNumber: topic is empty.');
      }
      if (currentName == null) {
        throw FormatException(
          '$sourcePath:$lineNumber: topic appears before a group heading.',
        );
      }
      if (indentation.isOdd) {
        throw FormatException(
          '$sourcePath:$lineNumber: topic indentation must use two spaces '
          'per nesting level.',
        );
      }
      final depth = indentation ~/ 2;
      if (depth > topicStack.length) {
        throw FormatException(
          '$sourcePath:$lineNumber: topic nesting skips a level.',
        );
      }

      final topic = content.substring(2).trim();
      final siblings = depth == 0
          ? currentTopicTree!
          : topicStack[depth - 1].children;
      if (siblings.any((sibling) => sibling.name == topic)) {
        throw FormatException(
          '$sourcePath:$lineNumber: duplicate topic "$topic" under the '
          'same parent in group "$currentName".',
        );
      }

      final builder = _TopicBuilder(topic);
      siblings.add(builder);
      if (topicStack.length > depth) {
        topicStack.removeRange(depth, topicStack.length);
      }
      topicStack.add(builder);
      currentTopics!.add(topic);
      continue;
    }

    if (content.startsWith('-')) {
      throw FormatException(
        '$sourcePath:$lineNumber: topics must start with "- ".',
      );
    }
    if (indentation != 0) {
      throw FormatException(
        '$sourcePath:$lineNumber: only bullet topics may be indented.',
      );
    }

    finishGroup(lineNumber);
    if (!groupNames.add(content)) {
      throw FormatException(
        '$sourcePath:$lineNumber: duplicate group heading "$content".',
      );
    }
    currentName = content;
    currentTopics = <String>[];
    currentTopicTree = <_TopicBuilder>[];
  }

  finishGroup(lines.length + 1);
  if (groups.isEmpty) {
    throw FormatException('$sourcePath: the outline contains no groups.');
  }
  return List.unmodifiable(groups);
}

final class _TopicBuilder {
  _TopicBuilder(this.name);

  final String name;
  final List<_TopicBuilder> children = [];
}

OutlineTopic _freezeTopic(_TopicBuilder topic) => OutlineTopic(
  topic.name,
  List.unmodifiable(topic.children.map(_freezeTopic)),
);

/// Converts a display name to a portable path segment.
///
/// Backticks are Markdown presentation, `/` and other cross-platform-invalid
/// filename characters become spaces, and colons are removed. This matches
/// established path segments such as `lib/src` -> `lib src` and
/// `Layout: Single Child` -> `Layout Single Child`.
String safePathSegment(String displayName) {
  var value = displayName.replaceAll('`', '');
  // Spell out `*` because Dart stream syntax uses both `yield` and `yield*`;
  // merely deleting the character would collapse two distinct topics onto
  // the same path. This also follows the repository's existing `yield star.md`
  // and `async star.md` convention.
  value = value.replaceAll('*', ' star ');
  // Keep compact abbreviations such as I/O readable without changing ordinary
  // slash-separated names such as lib/src or Properties/launchSettings.json.
  value = value.replaceAllMapped(
    RegExp(r'\b([A-Za-z])/([A-Za-z])\b'),
    (match) => '${match.group(1)}-${match.group(2)}',
  );
  value = value.replaceAll(
    RegExp(r'[<>:"/\\|?\x00-\x1f\x7f-\x9f\u2028-\u202e\u2066-\u2069\ufeff]'),
    ' ',
  );
  value = value.replaceAll(RegExp(r'\s+'), ' ').trim();
  value = value.replaceAll(RegExp(r'[. ]+$'), '');
  // A topic such as `.proto files` must not become a hidden file on Unix.
  value = value.replaceFirst(RegExp(r'^[. ]+'), '');
  if (value.isEmpty || value == '.' || value == '..') {
    throw FormatException('"$displayName" cannot form a safe filename.');
  }
  if (utf8.encode(value).length > 240) {
    throw FormatException(
      '"$displayName" is too long for a portable filename.',
    );
  }

  final reserved = RegExp(
    r'^(con|prn|aux|nul|com[1-9]|lpt[1-9])(\..*)?$',
    caseSensitive: false,
  );
  if (reserved.hasMatch(value)) value = '_$value';
  return value;
}

/// Builds every documentation index and the root license without touching the
/// filesystem.
///
/// Topics with children become nested README indexes. Every topic is listed in
/// a table with SyntBlaze learning links; leaf topics do not produce placeholder
/// files.
List<PlannedFile> buildDocumentationPlan({
  required String frameworkName,
  required List<DomainOutline> domains,
  String? subjectSlug,
  bool includeRootReadme = true,
}) {
  _validateDisplayText(frameworkName, 'Framework name');
  final resolvedSubjectSlug = subjectSlug ?? _defaultSubjectSlug(frameworkName);
  _validateSubjectSlug(resolvedSubjectSlug);
  if (domains.isEmpty) {
    throw const FormatException('At least one MDX outline is required.');
  }

  for (final domain in domains) {
    _validateDisplayText(domain.name, 'Domain name from ${domain.sourcePath}');
    for (final group in domain.groups) {
      _validateDisplayText(group.name, 'Group name in ${domain.sourcePath}');
      for (final topic in group.topics) {
        _validateDisplayText(
          topic,
          'Topic name in ${domain.sourcePath} group "${group.name}"',
        );
      }
    }
  }

  final plan = <PlannedFile>[];
  final paths = <String, String>{};

  void add(String path, String content, String origin) {
    final normalizedPath = path.toLowerCase();
    final previous = paths[normalizedPath];
    if (previous != null) {
      throw FormatException(
        'Path collision for "$path" between $previous and $origin. '
        'Rename one of the source entries.',
      );
    }
    for (final entry in paths.entries) {
      if (normalizedPath.startsWith('${entry.key}/') ||
          entry.key.startsWith('$normalizedPath/')) {
        throw FormatException(
          'Path collision for "$path" between ${entry.value} and $origin: '
          'a planned file cannot also be a directory. Rename one of the '
          'source entries.',
        );
      }
    }
    paths[normalizedPath] = origin;
    plan.add(PlannedFile(path, _withFinalNewline(content)));
  }

  final sortedDomains = List<DomainOutline>.of(domains)
    ..sort((left, right) {
      final folded = left.name.toLowerCase().compareTo(
        right.name.toLowerCase(),
      );
      return folded != 0 ? folded : left.name.compareTo(right.name);
    });

  add('license', _licenseContent, 'the generated root license');

  if (includeRootReadme) {
    add(
      'README.md',
      _rootReadme(frameworkName, resolvedSubjectSlug, sortedDomains),
      'the generated root index',
    );
  }

  for (final domain in sortedDomains) {
    final domainDirectory = safePathSegment(domain.name);
    add(
      '$domainDirectory/README.md',
      _domainReadme(
        frameworkName,
        resolvedSubjectSlug,
        domain,
        includeRootBackLink: includeRootReadme,
      ),
      '${domain.sourcePath} domain index',
    );

    for (final group in domain.groups) {
      final groupDirectory = safePathSegment(group.name);
      final groupRoot = '$domainDirectory/$groupDirectory';
      add(
        '$groupRoot/README.md',
        _groupReadme(resolvedSubjectSlug, domain.name, group),
        '${domain.sourcePath} group "${group.name}"',
      );

      void addTopic(
        OutlineTopic topic,
        String parentRoot,
        String parentName,
        List<String> parentTopicPath,
      ) {
        if (topic.children.isEmpty) return;

        final pathSegment = safePathSegment(topic.name);
        final topicRoot = '$parentRoot/$pathSegment';
        final topicPath = [...parentTopicPath, topic.name];
        add(
          '$topicRoot/README.md',
          _topicReadme(resolvedSubjectSlug, topic, parentName, topicPath),
          '${domain.sourcePath} nested topic "${topic.name}"',
        );
        for (final child in topic.children) {
          addTopic(child, topicRoot, topic.name, topicPath);
        }
      }

      for (final topic in group.topicTree) {
        addTopic(topic, groupRoot, group.name, [domain.name, group.name]);
      }
    }
  }

  plan.sort((left, right) => left.relativePath.compareTo(right.relativePath));
  return List.unmodifiable(plan);
}

/// Preflights the complete plan and then writes it if it is safe to do so.
///
/// With [overwrite] false, one differing existing file aborts the entire batch.
/// Byte-identical files are considered unchanged, making reruns idempotent.
WriteResult writeDocumentationPlan({
  required String outputDirectory,
  required List<PlannedFile> plan,
  bool overwrite = false,
  bool dryRun = false,
}) {
  final root = Directory(outputDirectory).absolute;
  final rootType = FileSystemEntity.typeSync(root.path, followLinks: false);
  if (rootType != FileSystemEntityType.notFound &&
      rootType != FileSystemEntityType.directory) {
    throw FileSystemException('Output path is not a directory', root.path);
  }

  // buildDocumentationPlan always produces safe, unique relative paths, but
  // writeDocumentationPlan is public and may be called with a hand-built plan.
  // Validate the complete plan before inspecting or changing the filesystem.
  final plannedPaths = <String>{};
  for (final item in plan) {
    final key = _validatedPlanPathKey(item.relativePath);
    if (plannedPaths.contains(key)) {
      throw FormatException(
        'Duplicate planned path "${item.relativePath}". Paths are compared '
        'case-insensitively.',
      );
    }
    if (plannedPaths.any(
      (previous) =>
          key.startsWith('$previous/') || previous.startsWith('$key/'),
    )) {
      throw FormatException(
        'Planned path "${item.relativePath}" would make a planned file an '
        'ancestor directory. Rename one of the paths.',
      );
    }
    plannedPaths.add(key);
  }

  final created = <String>[];
  final updated = <String>[];
  final unchanged = <String>[];
  final conflicts = <String>[];

  for (final item in plan) {
    final target = File(_join(root.path, item.relativePath));
    if (_hasNonDirectoryAncestor(root, target)) {
      conflicts.add(item.relativePath);
      continue;
    }
    final type = FileSystemEntity.typeSync(target.path, followLinks: false);
    if (type == FileSystemEntityType.notFound) {
      created.add(item.relativePath);
    } else if (type != FileSystemEntityType.file) {
      conflicts.add(item.relativePath);
    } else if (target.readAsStringSync() == item.content) {
      unchanged.add(item.relativePath);
    } else if (overwrite) {
      updated.add(item.relativePath);
    } else {
      conflicts.add(item.relativePath);
    }
  }

  if (conflicts.isNotEmpty || dryRun) {
    return WriteResult(
      created: List.unmodifiable(created),
      updated: List.unmodifiable(updated),
      unchanged: List.unmodifiable(unchanged),
      conflicts: List.unmodifiable(conflicts),
      dryRun: dryRun,
    );
  }

  root.createSync(recursive: true);
  for (final item in plan) {
    if (unchanged.contains(item.relativePath)) continue;
    final target = File(_join(root.path, item.relativePath));
    target.parent.createSync(recursive: true);
    target.writeAsStringSync(item.content, flush: true);
  }

  return WriteResult(
    created: List.unmodifiable(created),
    updated: List.unmodifiable(updated),
    unchanged: List.unmodifiable(unchanged),
    conflicts: const [],
    dryRun: false,
  );
}

bool _hasNonDirectoryAncestor(Directory root, File target) {
  var ancestor = target.parent;
  while (ancestor.path != root.path) {
    final type = FileSystemEntity.typeSync(ancestor.path, followLinks: false);
    if (type != FileSystemEntityType.notFound &&
        type != FileSystemEntityType.directory) {
      return true;
    }
    ancestor = ancestor.parent;
  }
  return false;
}

String _validatedPlanPathKey(String path) {
  if (path.isEmpty ||
      path.startsWith('/') ||
      path.startsWith(r'\') ||
      RegExp(r'^[A-Za-z]:[\/\\]').hasMatch(path) ||
      path.contains(r'\')) {
    throw FormatException(
      'Planned path must be relative and portable: "$path".',
    );
  }
  final segments = path.split('/');
  if (segments.any(
    (segment) => segment.isEmpty || segment == '.' || segment == '..',
  )) {
    throw FormatException(
      'Planned path contains an empty, current, or parent segment: "$path".',
    );
  }
  if (segments.any((segment) => utf8.encode(segment).length > 255)) {
    throw FormatException(
      'Planned path contains a component longer than 255 UTF-8 bytes: "$path".',
    );
  }
  if (path.codeUnits.any(_isUnsafeTextCodeUnit)) {
    throw FormatException(
      'Planned path contains a control character: "$path".',
    );
  }
  return path.toLowerCase();
}

void _validateDisplayText(String value, String label) {
  if (value.isEmpty || value != value.trim()) {
    throw FormatException('$label must be non-empty without outer whitespace.');
  }
  if (value.codeUnits.any(_isUnsafeTextCodeUnit)) {
    throw FormatException('$label must not contain control characters.');
  }
}

bool _isUnsafeTextCodeUnit(int unit) =>
    unit < 0x20 ||
    (unit >= 0x7f && unit <= 0x9f) ||
    (unit >= 0x2028 && unit <= 0x202e) ||
    (unit >= 0x2066 && unit <= 0x2069) ||
    unit == 0xfeff;

void main(List<String> arguments) {
  try {
    final options = _Options.parse(arguments);
    if (options.showHelp) {
      stdout.write(_usage);
      return;
    }

    final sources = _expandSources(options.inputs);
    final domainNames = _normalizeDomainOverrideKeys({
      ..._readDomainMap(options.domainMapPath),
      ...options.domainOverrides,
    });
    final domains = <DomainOutline>[];
    for (final source in sources) {
      final content = source.readAsStringSync();
      final stem = _fileStem(source.path);
      final domainName = _domainNameFor(source.path, stem, domainNames);
      domains.add(
        DomainOutline(
          sourcePath: source.path,
          name: domainName,
          groups: parseMdxOutline(source.path, content),
        ),
      );
    }

    final plan = buildDocumentationPlan(
      frameworkName: options.frameworkName,
      subjectSlug: options.subjectSlug,
      domains: domains,
      includeRootReadme: options.includeRootReadme,
    );
    final result = writeDocumentationPlan(
      outputDirectory: options.outputDirectory,
      plan: plan,
      overwrite: options.overwrite,
      dryRun: options.dryRun,
    );
    _printResult(result, plan.length, domains);
    if (!result.succeeded) exitCode = 2;
  } on FormatException catch (error) {
    stderr.writeln('Error: ${error.message}');
    exitCode = 64;
  } on FileSystemException catch (error) {
    stderr.writeln(
      'Error: ${error.message}${error.path == null ? '' : ': ${error.path}'}',
    );
    exitCode = 74;
  }
}

String _rootReadme(
  String frameworkName,
  String subjectSlug,
  List<DomainOutline> domains,
) {
  final title = '$frameworkName Documentation';
  final buffer = StringBuffer()
    ..writeln('# $title')
    ..writeln()
    ..writeln(
      'A structured guide to $frameworkName, organized from broad categories '
      'to focused topic indexes.',
    );
  _writeLearnMore(
    buffer,
    subjectSlug: subjectSlug,
    title: title,
    freePrompt: true,
  );
  buffer
    ..writeln('## Categories')
    ..writeln();
  for (final domain in domains) {
    final path = safePathSegment(domain.name);
    buffer.writeln(
      '- [${_linkLabel(domain.name)}](<${_linkDestination('$path/README.md')}>) — '
      '${domain.groups.length} topic groups, ${domain.topicCount} topics',
    );
  }
  buffer
    ..writeln()
    ..writeln('## Contribution')
    ..writeln()
    ..writeln('- Correct inaccurate or outdated content')
    ..writeln('- Add missing topics to an existing category')
    ..writeln('- Report broken links and content gaps in issues')
    ..writeln()
    ..writeln('## Thanks to all contributors ❤')
    ..writeln()
    ..writeln('## License')
    ..writeln()
    ..writeln('Have a look at the [license file](./license) for details');
  return buffer.toString();
}

const _licenseContent = '''
Everything including text and images in this project are protected by the copyright laws.
You are allowed to use this material for personal use but are not allowed to use it for
any other purpose including publishing the images, the project files or the content in
the images in any form either digital, non-digital, textual, graphical or written formats.
You are allowed to share the links to the repository or the website app.syntblaze.com but not
the content for any sort of usage that involves the content of this repository taken out
of the repository and be shared from any other medium including but not limited to blog
posts, articles, newsletters, you must get prior consent from the understated. These
conditions do not apply to the readonly GitHub forks created using the Fork button on
GitHub with the whole purpose of contributing to the project.

Copyright © 2025 - Present. SyntBlaze LLC <syntblaze@gmail.com>
''';

String _domainReadme(
  String frameworkName,
  String subjectSlug,
  DomainOutline domain, {
  required bool includeRootBackLink,
}) {
  final buffer = StringBuffer()
    ..writeln('# $frameworkName ${domain.name}')
    ..writeln()
    ..writeln('Explore ${domain.name} through the topic groups below.');
  _writeLearnMore(
    buffer,
    subjectSlug: subjectSlug,
    title: '$frameworkName ${domain.name}',
    topicPath: [domain.name],
  );
  for (var index = 0; index < domain.groups.length; index++) {
    final group = domain.groups[index];
    final directory = safePathSegment(group.name);
    if (index != 0) buffer.writeln();
    buffer
      ..writeln(
        '## ${group.name} [>](<${_linkDestination('$directory/README.md')}>)',
      )
      ..writeln();
    _writeTopicTable(
      buffer,
      group.topicTree,
      subjectSlug: subjectSlug,
      parentTopicPath: [domain.name, group.name],
      pathPrefix: directory,
    );
  }
  if (includeRootBackLink) {
    buffer
      ..writeln()
      ..writeln('[< Back to documentation](../README.md)');
  }
  return buffer.toString();
}

String _groupReadme(String subjectSlug, String domainName, TopicGroup group) {
  final buffer = StringBuffer()
    ..writeln('# ${group.name}')
    ..writeln()
    ..writeln('This file covers topics within ${group.name}.');
  _writeLearnMore(
    buffer,
    subjectSlug: subjectSlug,
    title: group.name,
    topicPath: [domainName, group.name],
  );
  buffer
    ..writeln('## Topics')
    ..writeln();
  _writeTopicTable(
    buffer,
    group.topicTree,
    subjectSlug: subjectSlug,
    parentTopicPath: [domainName, group.name],
  );
  buffer
    ..writeln()
    ..writeln('[< Back to ${_linkLabel(domainName)}](../README.md)');
  return buffer.toString();
}

String _topicReadme(
  String subjectSlug,
  OutlineTopic topic,
  String parentName,
  List<String> topicPath,
) {
  final buffer = StringBuffer()
    ..writeln('# ${topic.name}')
    ..writeln()
    ..writeln('This file covers topics within ${topic.name}.');
  _writeLearnMore(
    buffer,
    subjectSlug: subjectSlug,
    title: topic.name,
    topicPath: topicPath,
  );
  buffer
    ..writeln('## Topics')
    ..writeln();
  _writeTopicTable(
    buffer,
    topic.children,
    subjectSlug: subjectSlug,
    parentTopicPath: topicPath,
  );
  buffer
    ..writeln()
    ..writeln('[< Back to ${_linkLabel(parentName)}](../README.md)');
  return buffer.toString();
}

void _writeLearnMore(
  StringBuffer buffer, {
  required String subjectSlug,
  required String title,
  List<String> topicPath = const [],
  bool freePrompt = false,
}) {
  assert(freePrompt != topicPath.isNotEmpty);
  String? url(String topicPrefix, String promptPrefix) => freePrompt
      ? _tryFreePromptUrl(promptPrefix, subjectSlug, title)
      : _tryTopicUrl(topicPrefix, subjectSlug, topicPath);
  final quickBiteUrl = url('qt', 'qp');
  final learningPathUrl = url('lt', 'lp');
  final deepDiveUrl = url('dt', 'dp');
  if (quickBiteUrl == null || learningPathUrl == null || deepDiveUrl == null) {
    return;
  }

  buffer
    ..writeln()
    ..writeln('## Learn More')
    ..writeln()
    ..writeln(
      '- [Quick Bite]($quickBiteUrl) — '
      'Focused, bite-sized article covering $title',
    )
    ..writeln(
      '- [Learning Path]($learningPathUrl) — '
      'Step-by-step material that builds practical $title knowledge',
    )
    ..writeln(
      '- [Deep Dive]($deepDiveUrl) — '
      'Structured, in-depth material for learning about $title thoroughly',
    )
    ..writeln();
}

void _writeTopicTable(
  StringBuffer buffer,
  Iterable<OutlineTopic> topics, {
  required String subjectSlug,
  required List<String> parentTopicPath,
  String pathPrefix = '',
  int depth = 0,
}) {
  if (depth == 0) {
    buffer
      ..writeln('| Topic | Quick Bite | Learning Path | Deep Dive |')
      ..writeln('| --- | :---: | :---: | :---: |');
  }
  for (final topic in topics) {
    final topicPath = [...parentTopicPath, topic.name];
    final indentation = '&nbsp;&nbsp;' * depth;
    final displayName = _tableCell(topic.name);
    var topicCell = '$indentation$displayName';
    var childPathPrefix = pathPrefix;
    if (topic.children.isNotEmpty) {
      final pathSegment = safePathSegment(topic.name);
      childPathPrefix = pathPrefix.isEmpty
          ? pathSegment
          : '$pathPrefix/$pathSegment';
      topicCell =
          '$indentation[$displayName]'
          '(<${_linkDestination('$childPathPrefix/README.md')}>)';
    }
    final quickBiteUrl = _tryTopicUrl('qt', subjectSlug, topicPath);
    final learningPathUrl = _tryTopicUrl('lt', subjectSlug, topicPath);
    final deepDiveUrl = _tryTopicUrl('dt', subjectSlug, topicPath);
    if (quickBiteUrl == null ||
        learningPathUrl == null ||
        deepDiveUrl == null) {
      // The client codec cannot address punctuation-only names such as `>>`.
      // Keep the catalog entry visible without emitting a link the client will
      // reject or resolve ambiguously.
      buffer.writeln('| $topicCell | — | — | — |');
    } else {
      buffer.writeln(
        '| $topicCell '
        '| [💡]($quickBiteUrl "Quick Bite") '
        '| [👣]($learningPathUrl "Learning Path") '
        '| [📖]($deepDiveUrl "Deep Dive") |',
      );
    }
    if (topic.children.isNotEmpty) {
      _writeTopicTable(
        buffer,
        topic.children,
        subjectSlug: subjectSlug,
        parentTopicPath: topicPath,
        pathPrefix: childPathPrefix,
        depth: depth + 1,
      );
    }
  }
}

String _topicUrl(String prefix, String subjectSlug, List<String> topicPath) =>
    'https://app.syntblaze.com/$prefix/$subjectSlug/'
    '${topicPath.map(topicLinkSegment).join('/')}';

String _freePromptUrl(String prefix, String subjectSlug, String title) =>
    'https://app.syntblaze.com/$prefix/$subjectSlug/'
    '${topicLinkSegment(title)}';

String? _tryTopicUrl(
  String prefix,
  String subjectSlug,
  List<String> topicPath,
) {
  try {
    return _topicUrl(prefix, subjectSlug, topicPath);
  } on FormatException {
    return null;
  }
}

String? _tryFreePromptUrl(String prefix, String subjectSlug, String title) {
  try {
    return _freePromptUrl(prefix, subjectSlug, title);
  } on FormatException {
    return null;
  }
}

/// Encodes a catalog topic name exactly as the client-side
/// `DeepLinkTopicNameCodec` does.
String topicLinkSegment(String displayName) {
  var value = displayName.trim().replaceAll('()', ' method ');
  const replacements = {
    '&': ' and ',
    '+': ' plus ',
    '#': ' sharp ',
    '@': ' at ',
    '%': ' percent ',
    '*': ' star ',
  };
  for (final entry in replacements.entries) {
    value = value.replaceAll(entry.key, entry.value);
  }
  value = value
      .replaceAll(RegExp(r'[^A-Za-z0-9.]+'), '-')
      .replaceAll(RegExp(r'^-+|-+$'), '');
  if (value.isEmpty || value == '.' || value == '..') {
    throw FormatException(
      '"$displayName" cannot form a SyntBlaze topic link segment.',
    );
  }
  return value;
}

String _defaultSubjectSlug(String frameworkName) =>
    topicLinkSegment(frameworkName)
        .replaceAll(RegExp(r'[.]+'), '-')
        .replaceAll(RegExp(r'^-+|-+$'), '')
        .toLowerCase();

void _validateSubjectSlug(String value) {
  if (!RegExp(r'^[a-z0-9]+(?:-[a-z0-9]+)*$').hasMatch(value)) {
    throw FormatException(
      'Subject slug must use lowercase letters and digits separated by single '
      'hyphens: "$value".',
    );
  }
}

String _tableCell(String value) => _linkLabel(value).replaceAll('|', r'\|');

String _linkLabel(String value) =>
    value.replaceAll(r'\', r'\\').replaceAll('[', r'\[').replaceAll(']', r'\]');

String _linkDestination(String value) =>
    value.replaceAll('%', '%25').replaceAll('#', '%23');

String _withFinalNewline(String value) => '${value.trimRight()}\n';

String _join(String first, String second) =>
    first.endsWith(Platform.pathSeparator)
    ? '$first$second'
    : '$first${Platform.pathSeparator}$second';

String _fileStem(String path) {
  final filename = path.split(RegExp(r'[/\\]')).last;
  return filename.toLowerCase().endsWith('.mdx')
      ? filename.substring(0, filename.length - 4)
      : filename;
}

String _inferredDomainName(String stem) => stem
    .split(RegExp(r'[_-]+'))
    .where((part) => part.isNotEmpty)
    .map((part) => '${part[0].toUpperCase()}${part.substring(1)}')
    .join(' ');

String _domainNameFor(
  String sourcePath,
  String stem,
  Map<String, String> overrides,
) {
  final filename = sourcePath.split(RegExp(r'[/\\]')).last;
  final candidates = [sourcePath, filename, stem];
  for (final candidate in candidates) {
    final value = overrides[candidate];
    if (value != null) return value;
  }
  return _inferredDomainName(stem);
}

Map<String, String> _readDomainMap(String? path) {
  if (path == null) return const {};
  final decoded = jsonDecode(File(path).readAsStringSync());
  if (decoded is! Map<String, dynamic>) {
    throw FormatException('$path: domain map must be a JSON object.');
  }
  final result = <String, String>{};
  for (final entry in decoded.entries) {
    if (entry.value is! String || (entry.value as String).trim().isEmpty) {
      throw FormatException(
        '$path: value for "${entry.key}" must be a non-empty string.',
      );
    }
    result[entry.key] = (entry.value as String).trim();
  }
  return result;
}

Map<String, String> _normalizeDomainOverrideKeys(Map<String, String> values) {
  final result = <String, String>{};
  for (final entry in values.entries) {
    final key = entry.key;
    result[key.contains('/') || key.contains(r'\')
            ? File(key).absolute.path
            : key] =
        entry.value;
  }
  return result;
}

List<File> _expandSources(List<String> inputs) {
  final files = <String, File>{};
  for (final input in inputs) {
    final type = FileSystemEntity.typeSync(input);
    if (type == FileSystemEntityType.file) {
      if (!input.toLowerCase().endsWith('.mdx')) {
        throw FormatException('$input: source file must end in .mdx.');
      }
      files[File(input).absolute.path] = File(input).absolute;
    } else if (type == FileSystemEntityType.directory) {
      for (final entity in Directory(input).listSync(followLinks: false)) {
        if (entity is File && entity.path.toLowerCase().endsWith('.mdx')) {
          files[entity.absolute.path] = entity.absolute;
        }
      }
    } else {
      throw FileSystemException('Input does not exist', input);
    }
  }
  final result = files.values.toList()
    ..sort((left, right) => left.path.compareTo(right.path));
  if (result.isEmpty) {
    throw const FormatException('No .mdx source files were found.');
  }
  return result;
}

void _printResult(
  WriteResult result,
  int plannedCount,
  List<DomainOutline> domains,
) {
  final groupCount = domains.fold(0, (sum, item) => sum + item.groups.length);
  final topicCount = domains.fold(0, (sum, item) => sum + item.topicCount);
  stdout.writeln(
    '${result.dryRun ? 'Dry run' : 'Conversion'}: '
    '${domains.length} categories, $groupCount groups, $topicCount topics, '
    '$plannedCount files planned.',
  );
  stdout.writeln(
    'Created: ${result.created.length}; updated: ${result.updated.length}; '
    'unchanged: ${result.unchanged.length}; conflicts: ${result.conflicts.length}.',
  );
  if (result.conflicts.isNotEmpty) {
    stderr.writeln(
      'No files were written because these paths differ from the plan:',
    );
    for (final path in result.conflicts) {
      stderr.writeln('  $path');
    }
    stderr.writeln('Use --overwrite only if replacing them is intentional.');
  }
}

final class _Options {
  const _Options({
    required this.inputs,
    required this.outputDirectory,
    required this.frameworkName,
    required this.subjectSlug,
    required this.domainMapPath,
    required this.domainOverrides,
    required this.includeRootReadme,
    required this.overwrite,
    required this.dryRun,
    required this.showHelp,
  });

  factory _Options.parse(List<String> arguments) {
    final inputs = <String>[];
    final overrides = <String, String>{};
    var output = '.';
    var framework = 'Flutter';
    String? subjectSlug;
    String? domainMap;
    var includeRootReadme = true;
    var overwrite = false;
    var dryRun = false;
    var showHelp = false;

    String valueAfter(int index, String option) {
      if (index + 1 >= arguments.length ||
          arguments[index + 1].startsWith('-')) {
        throw FormatException('$option requires a value.');
      }
      return arguments[index + 1];
    }

    for (var index = 0; index < arguments.length; index++) {
      final argument = arguments[index];
      switch (argument) {
        case '-h':
        case '--help':
          showHelp = true;
        case '-o':
        case '--output':
          output = valueAfter(index, argument);
          index++;
        case '--framework':
          framework = valueAfter(index, argument).trim();
          index++;
        case '--subject':
          subjectSlug = valueAfter(index, argument).trim();
          index++;
        case '--domain-map':
          domainMap = valueAfter(index, argument);
          index++;
        case '--domain':
          final value = valueAfter(index, argument);
          index++;
          final separator = value.indexOf('=');
          if (separator <= 0 || separator == value.length - 1) {
            throw const FormatException(
              '--domain must use SOURCE_OR_STEM=DOMAIN_NAME.',
            );
          }
          final key = value.substring(0, separator).trim();
          final name = value.substring(separator + 1).trim();
          if (key.isEmpty || name.isEmpty) {
            throw const FormatException(
              '--domain key and domain name must be non-empty.',
            );
          }
          overrides[key] = name;
        case '--no-root-readme':
          includeRootReadme = false;
        case '--overwrite':
          overwrite = true;
        case '--dry-run':
          dryRun = true;
        default:
          if (argument.startsWith('-')) {
            throw FormatException('Unknown option: $argument');
          }
          inputs.add(argument);
      }
    }
    if (!showHelp && inputs.isEmpty) {
      throw const FormatException(
        'Provide at least one .mdx file or directory.',
      );
    }
    if (!showHelp && output.trim().isEmpty) {
      throw const FormatException('Output directory cannot be empty.');
    }
    return _Options(
      inputs: List.unmodifiable(inputs),
      outputDirectory: output,
      frameworkName: framework,
      subjectSlug: subjectSlug,
      domainMapPath: domainMap,
      domainOverrides: Map.unmodifiable(overrides),
      includeRootReadme: includeRootReadme,
      overwrite: overwrite,
      dryRun: dryRun,
      showHelp: showHelp,
    );
  }

  final List<String> inputs;
  final String outputDirectory;
  final String frameworkName;
  final String? subjectSlug;
  final String? domainMapPath;
  final Map<String, String> domainOverrides;
  final bool includeRootReadme;
  final bool overwrite;
  final bool dryRun;
  final bool showHelp;
}

const _usage = '''
Convert outline-style MDX files into nested root/category/group Markdown indexes.
Leaf topics are table rows with learning links, not standalone files. Indent
child topics by two spaces per level; topics with children become nested indexes.

Usage:
  dart run tool/mdx_to_docs.dart [options] <file-or-directory> [...]

Options:
  -o, --output DIR       Output root (default: current directory)
      --framework NAME   Framework name used in indexes (default: Flutter)
      --subject SLUG     Canonical SyntBlaze subject slug (default: inferred)
      --domain-map FILE  JSON object mapping source stems/files to domain names
      --domain KEY=NAME  Override one domain name; may be repeated
      --no-root-readme   Do not include README.md at the output root
      --dry-run          Validate and show counts without writing files
      --overwrite        Replace differing files after the full preflight
  -h, --help             Show this help

Inputs may be .mdx files or directories containing .mdx files. Directory scans
are non-recursive and deterministic. Existing differing files abort the entire
batch unless --overwrite is supplied; identical files remain untouched.

Flutter example:
  dart run tool/mdx_to_docs.dart flutter \\
    --domain-map tool/flutter_domain_names.json \\
    --framework Flutter --output build/flutter-docs --dry-run
''';
