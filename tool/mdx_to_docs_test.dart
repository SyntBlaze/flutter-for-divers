import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'mdx_to_docs.dart';

typedef TestBody = void Function();

void main() {
  final tests = <String, TestBody>{
    'parser accepts BOM, CRLF, blank lines, and multiple groups':
        _testParserAcceptsSupportedInput,
    'parser preserves topic markup, punctuation, and Unicode':
        _testParserPreservesDisplayText,
    'parser preserves arbitrarily nested topic trees':
        _testParserPreservesNestedTopics,
    'parser rejects empty and orphaned input': _testParserRejectsMissingShape,
    'parser rejects malformed whitespace and bullets':
        _testParserRejectsMalformedLines,
    'parser rejects malformed topic nesting':
        _testParserRejectsMalformedNesting,
    'parser rejects duplicate groups and duplicate topics':
        _testParserRejectsDuplicates,
    'parser round-trips deterministic randomized outlines':
        _testParserRandomizedRoundTrips,
    'path conversion follows portable repository conventions':
        _testSafePathConversion,
    'path conversion rejects unusable names': _testSafePathRejections,
    'path conversion satisfies portable properties for randomized names':
        _testSafePathRandomizedProperties,
    'plan contains complete topic tables, learning links, and final newlines':
        _testPlanShapeAndContent,
    'plan creates branch indexes and topic tables for nested topics':
        _testNestedPlanShapeAndLinks,
    'plan can omit the root README': _testPlanWithoutRootReadme,
    'plan rejects normalized and case-insensitive collisions':
        _testPlanRejectsCollisions,
    'plan rejects unsafe display text from public callers':
        _testPlanRejectsUnsafeDisplayText,
    'plan escapes Markdown link labels': _testPlanEscapesLinkLabels,
    'plan encodes URL-reserved filename characters in links':
        _testPlanEncodesReservedLinkCharacters,
    'plan gives placeholder syntax a valid learning-link segment':
        _testPlaceholderSyntaxLinkSegments,
    'plan preserves periods in learning-link segments':
        _testLearningLinksPreservePeriods,
    'all links in a generated plan resolve to planned files':
        _testGeneratedLinksResolve,
    'writer dry-run never creates the output directory':
        _testDryRunDoesNotWrite,
    'writer creates files and reruns idempotently': _testSafeIdempotentWrites,
    'writer conflict aborts every file and overwrite is explicit':
        _testConflictIsAtomicAndOverwriteIsExplicit,
    'writer rejects a directory at a planned file path':
        _testDirectoryAtTargetIsAConflict,
    'writer rejects a file used as an output ancestor':
        _testParentFileAbortsEveryWrite,
    'writer rejects unsafe and duplicate manually planned paths':
        _testWriterRejectsUnsafePlans,
    'writer does not follow target or ancestor symbolic links':
        _testWriterRejectsSymbolicLinks,
    'writer rejects a symbolic-link output root':
        _testWriterRejectsSymbolicLinkRoot,
    'CLI help and usage errors use stable exit codes': _testCliHelpAndErrors,
    'CLI generates, reruns, detects conflicts, and overwrites explicitly':
        _testCliWriteLifecycle,
    'CLI no-root mode omits the root and its inbound back-links':
        _testCliNoRootMode,
    'CLI domain map works and command-line override wins':
        _testCliDomainOverridePrecedence,
    'CLI path-specific overrides distinguish equal source stems':
        _testCliPathSpecificDomainOverrides,
    'CLI rejects invalid maps, missing inputs, and empty directories':
        _testCliRejectsInvalidExternalInputs,
    'CLI rejects malformed source before creating output':
        _testCliRejectsMalformedSource,
    'representative Flutter corpus omits leaf files and broken links':
        _testRepresentativeFlutterCorpusPlan,
    'representative Flutter corpus writes completely and reruns unchanged':
        _testRepresentativeFlutterCorpusWriteAndRerun,
  };

  var failures = 0;
  for (final entry in tests.entries) {
    try {
      entry.value();
      stdout.writeln('PASS ${entry.key}');
    } catch (error, stackTrace) {
      failures++;
      stderr
        ..writeln('FAIL ${entry.key}')
        ..writeln('  $error')
        ..writeln(stackTrace);
    }
  }

  if (failures != 0) {
    stderr.writeln('$failures of ${tests.length} tests failed.');
    exitCode = 1;
    return;
  }
  stdout.writeln('All ${tests.length} mdx_to_docs tests passed.');
}

void _testParserAcceptsSupportedInput() {
  final groups = parseMdxOutline(
    'fixture.mdx',
    '\uFEFFFirst Group\r\n- One\r\n- Two\r\n\r\nSecond Group\r\n- Three\r\n',
  );
  _expect(groups.length == 2, 'expected two parsed groups');
  _expect(groups[0].name == 'First Group', 'UTF-8 BOM was not removed');
  _expectList(groups[0].topics, ['One', 'Two'], 'first topics');
  _expect(groups[1].name == 'Second Group', 'second group changed');
  _expectList(groups[1].topics, ['Three'], 'second topics');
}

void _testParserPreservesDisplayText() {
  final groups = parseMdxOutline(
    'fixture.mdx',
    'APIs & Żółć\n- `lib/src`\n- GlobalKey<FormState>\n- `yield*`\n',
  );
  _expect(groups.single.name == 'APIs & Żółć', 'group display text changed');
  _expectList(groups.single.topics, [
    '`lib/src`',
    'GlobalKey<FormState>',
    '`yield*`',
  ], 'topic display text');
  _expectUnsupportedMutation(groups, 'parsed group list must be immutable');
  _expectUnsupportedMutation(
    groups.single.topics,
    'parsed topic list must be immutable',
  );
}

void _testParserPreservesNestedTopics() {
  final groups = parseMdxOutline(
    'nested.mdx',
    'Group\n'
        '- Parent\n'
        '  - Child\n'
        '    - Grandchild\n'
        '  - Sibling child\n'
        '- Root sibling\n',
  );
  final group = groups.single;
  _expectList(group.topics, [
    'Parent',
    'Child',
    'Grandchild',
    'Sibling child',
    'Root sibling',
  ], 'flat nested topic view');

  final roots = group.topicTree.toList();
  _expectList(roots.map((topic) => topic.name).toList(), [
    'Parent',
    'Root sibling',
  ], 'root topics');
  _expectList(roots.first.children.map((topic) => topic.name).toList(), [
    'Child',
    'Sibling child',
  ], 'child topics');
  _expect(
    roots.first.children.first.children.single.name == 'Grandchild',
    'grandchild nesting was not preserved',
  );
  _expectUnsupportedMutation(
    roots.first.children,
    'parsed child lists must be immutable',
  );
}

void _testParserRejectsMissingShape() {
  _expectFormatException(
    () => parseMdxOutline('empty.mdx', ''),
    contains: 'contains no groups',
  );
  _expectFormatException(
    () => parseMdxOutline('blank.mdx', ' \n\t\n'),
    contains: 'contains no groups',
  );
  _expectFormatException(
    () => parseMdxOutline('orphan.mdx', '- Orphan\n'),
    contains: 'before a group',
  );
  _expectFormatException(
    () => parseMdxOutline('empty-group.mdx', 'Empty group\n'),
    contains: 'has no topics',
  );
  _expectFormatException(
    () => parseMdxOutline('middle.mdx', 'Empty\nNext\n- Topic\n'),
    contains: 'group "Empty" has no topics',
  );
}

void _testParserRejectsMalformedLines() {
  _expectFormatException(
    () => parseMdxOutline('spacing.mdx', 'Group \n- Topic\n'),
    contains: 'trailing whitespace is not supported',
  );
  _expectFormatException(
    () => parseMdxOutline('bullet.mdx', 'Group\n-Topic\n'),
    contains: 'topics must start with "- "',
  );
  _expectFormatException(
    () => parseMdxOutline('bullet.mdx', 'Group\n- \n'),
    contains: 'topic is empty',
  );
}

void _testParserRejectsMalformedNesting() {
  _expectFormatException(
    () => parseMdxOutline('odd.mdx', 'Group\n - Topic\n'),
    contains: 'must use two spaces',
  );
  _expectFormatException(
    () => parseMdxOutline('tab.mdx', 'Group\n\t- Topic\n'),
    contains: 'spaces, not tabs',
  );
  _expectFormatException(
    () => parseMdxOutline('skip.mdx', 'Group\n  - Topic\n'),
    contains: 'skips a level',
  );
  _expectFormatException(
    () =>
        parseMdxOutline('deep-skip.mdx', 'Group\n- Parent\n    - Grandchild\n'),
    contains: 'skips a level',
  );
  _expectFormatException(
    () => parseMdxOutline('heading.mdx', 'Group\n  Indented heading\n'),
    contains: 'only bullet topics may be indented',
  );
}

void _testParserRejectsDuplicates() {
  _expectFormatException(
    () => parseMdxOutline('groups.mdx', 'Group\n- One\nGroup\n- Two\n'),
    contains: 'duplicate group heading "Group"',
  );
  _expectFormatException(
    () => parseMdxOutline('topics.mdx', 'Group\n- One\n- One\n'),
    contains: 'duplicate topic "One"',
  );
}

void _testParserRandomizedRoundTrips() {
  final random = Random(4815162342);
  for (var documentIndex = 0; documentIndex < 100; documentIndex++) {
    final newline = random.nextBool() ? '\n' : '\r\n';
    final expected = <TopicGroup>[];
    final source = StringBuffer();
    if (documentIndex.isEven) source.write('\uFEFF');
    final groupCount = 1 + random.nextInt(5);
    for (var groupIndex = 0; groupIndex < groupCount; groupIndex++) {
      final groupName = 'Group $documentIndex-$groupIndex & Ż';
      final topics = <String>[];
      source.write('$groupName$newline');
      final topicCount = 1 + random.nextInt(8);
      for (var topicIndex = 0; topicIndex < topicCount; topicIndex++) {
        final topic = topicIndex.isEven
            ? '`api$documentIndex.$groupIndex.$topicIndex()`'
            : 'Topic $documentIndex-$groupIndex-$topicIndex 日本語';
        topics.add(topic);
        source.write('- $topic$newline');
      }
      expected.add(TopicGroup(groupName, topics));
      if (groupIndex + 1 < groupCount && random.nextBool()) {
        source.write(newline);
      }
    }

    final actual = parseMdxOutline(
      'random-$documentIndex.mdx',
      source.toString(),
    );
    _expect(actual.length == expected.length, 'random group count changed');
    for (var index = 0; index < expected.length; index++) {
      _expect(
        actual[index].name == expected[index].name,
        'random group changed',
      );
      _expectList(
        actual[index].topics,
        expected[index].topics,
        'random topics in ${expected[index].name}',
      );
    }
  }
}

void _testSafePathConversion() {
  final cases = <String, String>{
    'Layout: Single Child': 'Layout Single Child',
    '`lib/src`': 'lib src',
    '`yield*`': 'yield star',
    'I/O': 'I-O',
    '`.proto` files': 'proto files',
    'A:B/C\\D|E?F<G>"H': 'A B-C D E F G H',
    '  repeated   whitespace  ': 'repeated whitespace',
    'trailing...   ': 'trailing',
    'CON': '_CON',
    'com1.txt': '_com1.txt',
    'Résumé 日本語': 'Résumé 日本語',
    'A\u0085B\u2028C\u202eD\ufeffE': 'A B C D E',
  };
  for (final entry in cases.entries) {
    _expect(
      safePathSegment(entry.key) == entry.value,
      'safePathSegment(${entry.key}) produced '
      '${safePathSegment(entry.key)}, expected ${entry.value}',
    );
  }
}

void _testSafePathRejections() {
  for (final value in ['', ' ', '.', '..', '```', ':::///']) {
    _expectFormatException(
      () => safePathSegment(value),
      contains: 'cannot form a safe filename',
    );
  }
  _expectFormatException(
    () => safePathSegment(List.filled(121, 'é').join()),
    contains: 'too long for a portable filename',
  );
}

void _testSafePathRandomizedProperties() {
  final random = Random(8675309);
  const characters = [
    'a',
    'Z',
    ' ',
    '.',
    '`',
    '*',
    '/',
    r'\',
    ':',
    '<',
    '>',
    '"',
    '|',
    '?',
    '#',
    '%',
    '\t',
    '\u0085',
    '\u2028',
    '\u202e',
    '\u2067',
    '\ufeff',
    'é',
    '日',
  ];
  var successes = 0;
  var rejections = 0;
  for (var iteration = 0; iteration < 1000; iteration++) {
    final input = List.generate(
      1 + random.nextInt(40),
      (_) => characters[random.nextInt(characters.length)],
    ).join();
    try {
      final output = safePathSegment(input);
      successes++;
      _expect(output.isNotEmpty, 'sanitizer produced an empty successful path');
      _expect(
        !RegExp(
          r'[<>:"/\\|?`*\x00-\x1f\x7f-\x9f\u2028-\u202e\u2066-\u2069\ufeff]',
        ).hasMatch(output),
        'sanitizer left an unsafe character in "$output"',
      );
      _expect(!output.endsWith('.'), 'sanitizer left a trailing dot');
      _expect(!output.endsWith(' '), 'sanitizer left a trailing space');
      _expect(!output.startsWith('.'), 'sanitizer left a hidden-file prefix');
      _expect(!output.startsWith(' '), 'sanitizer left a leading space');
      _expect(utf8.encode(output).length <= 240, 'sanitizer exceeded byte cap');
      _expect(
        safePathSegment(output) == output,
        'sanitizer is not idempotent for "$output"',
      );
    } on FormatException {
      rejections++;
    }
  }
  _expect(successes > 900, 'random sanitizer rejected too many useful names');
  _expect(rejections > 0, 'random sanitizer never exercised rejection');
}

void _testPlanShapeAndContent() {
  final plan = buildDocumentationPlan(
    frameworkName: 'Example',
    domains: const [
      DomainOutline(
        sourcePath: 'zeta.mdx',
        name: 'Zeta',
        groups: [
          TopicGroup('Second', ['Topic Z']),
        ],
      ),
      DomainOutline(
        sourcePath: 'alpha.mdx',
        name: 'Alpha & UI',
        groups: [
          TopicGroup('Layout: Single Child', ['`lib/src`', 'Foo/Bar']),
          TopicGroup('Lifecycle', ['Start']),
        ],
      ),
    ],
  );
  final byPath = {for (final file in plan) file.relativePath: file.content};
  _expect(plan.length == 7, 'unexpected planned file count: ${plan.length}');
  final sortedPaths = plan.map((file) => file.relativePath).toList()..sort();
  _expectList(
    plan.map((file) => file.relativePath).toList(),
    sortedPaths,
    'planned paths',
  );
  _expect(byPath.containsKey('README.md'), 'root README missing');
  _expect(
    byPath['README.md']!.contains(
      '## Learn More\n\n'
      '- [Quick Bite](https://app.syntblaze.com/qp/example/'
      'Example-Documentation) — Focused, bite-sized article covering '
      'Example Documentation\n'
      '- [Learning Path](https://app.syntblaze.com/lp/example/'
      'Example-Documentation) — Step-by-step material that builds practical '
      'Example Documentation knowledge\n'
      '- [Deep Dive](https://app.syntblaze.com/dp/example/'
      'Example-Documentation) — Structured, in-depth material for learning '
      'about Example Documentation thoroughly\n\n## Categories\n',
    ),
    'root index should contain its complete Learn More section',
  );
  _expect(
    !byPath['README.md']!.contains('## How to Use This Repository'),
    'root index should omit repository usage instructions',
  );
  _expect(
    byPath['README.md']!.endsWith(
      '## Contribution\n\n'
      '- Correct inaccurate or outdated content\n'
      '- Add missing topics to an existing category\n'
      '- Report broken links and content gaps in issues\n\n'
      '## Thanks to all contributors ❤\n\n'
      '## License\n\n'
      'Have a look at the [license file](./license) for details\n',
    ),
    'root index should end with contribution and license details',
  );
  _expect(
    byPath['license'] ==
        'Everything including text and images in this project are protected '
            'by the copyright laws.\n'
            'You are allowed to use this material for personal use but are '
            'not allowed to use it for\n'
            'any other purpose including publishing the images, the project '
            'files or the content in\n'
            'the images in any form either digital, non-digital, textual, '
            'graphical or written formats.\n'
            'You are allowed to share the links to the repository or the '
            'website app.syntblaze.com but not\n'
            'the content for any sort of usage that involves the content of '
            'this repository taken out\n'
            'of the repository and be shared from any other medium including '
            'but not limited to blog\n'
            'posts, articles, newsletters, you must get prior consent from '
            'the understated. These\n'
            'conditions do not apply to the readonly GitHub forks created '
            'using the Fork button on\n'
            'GitHub with the whole purpose of contributing to the project.\n\n'
            'Copyright © 2025 - Present. SyntBlaze LLC '
            '<syntblaze@gmail.com>\n',
    'root license content changed',
  );
  _expect(
    plan.every((file) => !file.content.toLowerCase().contains('concept')),
    'generated indexes should use topic terminology',
  );
  _expect(
    byPath['Alpha & UI/README.md']!.contains(
      '# Example Alpha & UI\n\n'
      'Explore Alpha & UI through the topic groups below.\n',
    ),
    'category index should introduce its topic groups naturally',
  );
  _expect(
    byPath['Alpha & UI/README.md']!.contains(
      '## Learn More\n\n'
      '- [Quick Bite](https://app.syntblaze.com/qt/example/Alpha-and-UI) — '
      'Focused, bite-sized article covering Example Alpha & UI\n'
      '- [Learning Path](https://app.syntblaze.com/lt/example/Alpha-and-UI) — '
      'Step-by-step material that builds practical Example Alpha & UI '
      'knowledge\n'
      '- [Deep Dive](https://app.syntblaze.com/dt/example/Alpha-and-UI) — '
      'Structured, in-depth material for learning about Example Alpha & UI '
      'thoroughly\n\n'
      '## Layout: Single Child [>](<Layout Single Child/README.md>)\n',
    ),
    'domain index should contain its complete Learn More section',
  );
  _expect(
    !byPath['Alpha & UI/README.md']!.contains('## Categories') &&
        !byPath['Alpha & UI/README.md']!.contains(
          '- [Layout: Single Child](<Layout Single Child/README.md>) — '
          '2 topics',
        ),
    'domain index should omit the category topic-count section',
  );
  _expect(
    byPath['Alpha & UI/Layout Single Child/README.md']!.contains(
      '## Learn More\n\n'
      '- [Quick Bite](https://app.syntblaze.com/qt/example/'
      'Alpha-and-UI/Layout-Single-Child) — Focused, bite-sized article '
      'covering Layout: Single Child\n'
      '- [Learning Path](https://app.syntblaze.com/lt/example/'
      'Alpha-and-UI/Layout-Single-Child) — Step-by-step material that builds '
      'practical Layout: Single Child knowledge\n'
      '- [Deep Dive](https://app.syntblaze.com/dt/example/'
      'Alpha-and-UI/Layout-Single-Child) — Structured, in-depth material for '
      'learning about Layout: Single Child thoroughly\n\n## Topics\n',
    ),
    'group index should contain its complete Learn More section',
  );
  _expect(
    !plan.any((file) => file.relativePath.endsWith('/lib src.md')),
    'leaf concept unexpectedly produced a file',
  );
  _expect(
    byPath['Alpha & UI/Layout Single Child/README.md']!.contains(
      '| Topic | Quick Bite | Learning Path | Deep Dive |\n'
      '| --- | :---: | :---: | :---: |\n',
    ),
    'group index should contain the compact topic table',
  );
  _expect(
    byPath['Alpha & UI/Layout Single Child/README.md']!.contains(
      '| `lib/src` | [💡](https://app.syntblaze.com/qt/example/'
      'Alpha-and-UI/Layout-Single-Child/lib-src "Quick Bite") '
      '| [👣](https://app.syntblaze.com/lt/example/'
      'Alpha-and-UI/Layout-Single-Child/lib-src "Learning Path") '
      '| [📖](https://app.syntblaze.com/dt/example/'
      'Alpha-and-UI/Layout-Single-Child/lib-src "Deep Dive") |',
    ),
    'group index should preserve display text and add all learning links',
  );
  _expect(
    byPath['Alpha & UI/Layout Single Child/README.md']!.contains(
      'This file covers topics within Layout: Single Child.\n\n'
      '## Learn More\n',
    ),
    'group index should describe its entries before Learn More',
  );
  _expect(
    !plan.any((file) => file.content.contains('lib src.md')),
    'an index linked to an omitted leaf file',
  );
  _expect(
    byPath['README.md']!.indexOf('Alpha & UI') <
        byPath['README.md']!.indexOf('Zeta'),
    'root domains should be sorted by display name',
  );
  _expect(
    plan.every((file) => file.content.endsWith('\n')),
    'every planned file must end with one newline',
  );
  _expect(
    plan.every((file) => !file.content.endsWith('\n\n')),
    'planned files should not end with extra blank lines',
  );
}

void _testNestedPlanShapeAndLinks() {
  final groups = parseMdxOutline(
    'nested.mdx',
    'Group\n'
        '- Parent\n'
        '  - Child\n'
        '  - Branch\n'
        '    - Grandchild\n'
        '- Root leaf\n',
  );
  final plan = buildDocumentationPlan(
    frameworkName: 'Example',
    domains: [
      DomainOutline(sourcePath: 'nested.mdx', name: 'Domain', groups: groups),
    ],
  );
  final byPath = {for (final file in plan) file.relativePath: file.content};
  for (final path in [
    'Domain/Group/Parent/README.md',
    'Domain/Group/Parent/Branch/README.md',
  ]) {
    _expect(byPath.containsKey(path), 'nested path missing: $path');
  }
  _expect(
    plan.every(
      (file) =>
          !file.relativePath.endsWith('/Child.md') &&
          !file.relativePath.endsWith('/Grandchild.md') &&
          !file.relativePath.endsWith('/Root leaf.md'),
    ),
    'a leaf topic unexpectedly produced a Markdown file',
  );
  _expect(
    byPath['Domain/Group/README.md']!.contains(
      '| [Parent](<Parent/README.md>) |',
    ),
    'group index omitted its branch navigation link',
  );
  _expect(
    byPath['Domain/Group/README.md']!.contains(
      '| &nbsp;&nbsp;[Branch](<Parent/Branch/README.md>) |',
    ),
    'group index omitted its nested branch navigation link',
  );
  _expect(
    byPath['Domain/Group/README.md']!.contains(
      'https://app.syntblaze.com/dt/example/'
      'Domain/Group/Parent/Branch/Grandchild "Deep Dive"',
    ),
    'nested topic link omitted part of the catalog hierarchy',
  );
  _expect(
    byPath['Domain/Group/Parent/Branch/README.md']!.contains(
      '[< Back to Parent](../README.md)',
    ),
    'nested index backlink is wrong',
  );
  _expect(
    byPath['Domain/Group/Parent/Branch/README.md']!.contains(
      '# Branch\n\nThis file covers topics within Branch.\n',
    ),
    'nested index should introduce its child topics naturally',
  );
  _expect(
    byPath['Domain/Group/Parent/Branch/README.md']!.contains(
      '## Learn More\n\n'
      '- [Quick Bite](https://app.syntblaze.com/qt/example/'
      'Domain/Group/Parent/Branch) — Focused, bite-sized article covering '
      'Branch\n'
      '- [Learning Path](https://app.syntblaze.com/lt/example/'
      'Domain/Group/Parent/Branch) — Step-by-step material that builds '
      'practical Branch knowledge\n'
      '- [Deep Dive](https://app.syntblaze.com/dt/example/'
      'Domain/Group/Parent/Branch) — Structured, in-depth material for '
      'learning about Branch thoroughly\n\n## Topics\n',
    ),
    'nested index should contain its complete Learn More section',
  );
  _expect(
    plan
        .where((file) => file.relativePath.endsWith('README.md'))
        .every(
          (file) =>
              RegExp(
                r'^## Learn More$',
                multiLine: true,
              ).allMatches(file.content).length ==
              1,
        ),
    'every generated README should contain exactly one Learn More section',
  );
  _expect(
    plan.length == 6,
    'nested plan should contain five indexes and a license',
  );
  _expectAllLinksResolve(plan);
}

void _testPlanWithoutRootReadme() {
  final plan = buildDocumentationPlan(
    frameworkName: 'Example',
    domains: const [
      DomainOutline(
        sourcePath: 'fixture.mdx',
        name: 'Domain',
        groups: [
          TopicGroup('Group', ['Topic']),
        ],
      ),
    ],
    includeRootReadme: false,
  );
  _expect(
    plan.length == 3,
    'domain and group indexes plus the license should remain',
  );
  _expect(
    !plan.any((file) => file.relativePath == 'README.md'),
    'root README should be omitted',
  );
  _expect(
    plan.any((file) => file.relativePath == 'license'),
    'root license should remain when only the root README is omitted',
  );
  final domain = plan.singleWhere(
    (file) => file.relativePath == 'Domain/README.md',
  );
  _expect(
    !domain.content.contains('Back to documentation'),
    'domain README links to an omitted root README',
  );
  _expect(
    plan
        .singleWhere((file) => file.relativePath.endsWith('/Group/README.md'))
        .content
        .contains('| Topic | [💡]('),
    'group index omitted its leaf concept',
  );
  _expectAllLinksResolve(plan);
}

void _testPlanRejectsCollisions() {
  _expectFormatException(
    () => buildDocumentationPlan(
      frameworkName: 'Example',
      domains: const [
        DomainOutline(
          sourcePath: 'collision.mdx',
          name: 'Domain',
          groups: [
            TopicGroup('Foo/Bar', ['One']),
            TopicGroup('Foo:Bar', ['Two']),
          ],
        ),
      ],
    ),
    contains: 'Path collision',
  );
  _expectFormatException(
    () => buildDocumentationPlan(
      frameworkName: 'Example',
      domains: const [
        DomainOutline(
          sourcePath: 'collision.mdx',
          name: 'Domain',
          groups: [
            TopicGroup('Topic', ['One']),
            TopicGroup('topic', ['Two']),
          ],
        ),
      ],
    ),
    contains: 'Path collision',
  );
  _expectFormatException(
    () => buildDocumentationPlan(
      frameworkName: 'Example',
      domains: const [
        DomainOutline(
          sourcePath: 'collision.mdx',
          name: 'Domain',
          groups: [
            TopicGroup('README.md', ['Topic']),
          ],
        ),
      ],
    ),
    contains: 'Path collision',
  );
  _expectFormatException(
    () => buildDocumentationPlan(
      frameworkName: 'Example',
      domains: const [
        DomainOutline(
          sourcePath: 'one.mdx',
          name: 'Same',
          groups: [
            TopicGroup('One', ['A']),
          ],
        ),
        DomainOutline(
          sourcePath: 'two.mdx',
          name: 'same',
          groups: [
            TopicGroup('Two', ['B']),
          ],
        ),
      ],
    ),
    contains: 'Path collision',
  );
}

void _testPlanRejectsUnsafeDisplayText() {
  _expectFormatException(
    () => buildDocumentationPlan(
      frameworkName: ' Example ',
      domains: const [
        DomainOutline(
          sourcePath: 'fixture.mdx',
          name: 'Domain',
          groups: [
            TopicGroup('Group', ['Topic']),
          ],
        ),
      ],
    ),
    contains: 'Framework name must be non-empty without outer whitespace',
  );
  for (final domainName in [
    '',
    ' Domain',
    'Domain\nInjected',
    'Domain\u0085Control',
    'Domain\u202eOverride',
    'Domain\ufeffBom',
  ]) {
    _expectFormatException(
      () => buildDocumentationPlan(
        frameworkName: 'Example',
        domains: [
          DomainOutline(
            sourcePath: 'fixture.mdx',
            name: domainName,
            groups: const [
              TopicGroup('Group', ['Topic']),
            ],
          ),
        ],
      ),
      contains: 'Domain name',
    );
  }
  _expectFormatException(
    () => buildDocumentationPlan(
      frameworkName: 'Example',
      domains: const [
        DomainOutline(
          sourcePath: 'fixture.mdx',
          name: 'Domain',
          groups: [
            TopicGroup('Group', ['Bad\tTopic']),
          ],
        ),
      ],
    ),
    contains: 'Topic name',
  );
}

void _testPlanEscapesLinkLabels() {
  final plan = buildDocumentationPlan(
    frameworkName: 'Example',
    domains: const [
      DomainOutline(
        sourcePath: 'fixture.mdx',
        name: r'Domain [A]\B',
        groups: [
          TopicGroup('Group [C]', [r'Topic [D]\E']),
        ],
      ),
    ],
  );
  final root = plan.singleWhere((file) => file.relativePath == 'README.md');
  final group = plan.singleWhere(
    (file) => file.relativePath.endsWith('/Group [C]/README.md'),
  );
  _expect(root.content.contains(r'Domain \[A\]\\B'), 'root label not escaped');
  _expect(group.content.contains(r'Topic \[D\]\\E'), 'topic label not escaped');
}

void _testPlanEncodesReservedLinkCharacters() {
  final groups = parseMdxOutline(
    'fixture.mdx',
    'C# APIs\n- C#\n- 100% coverage\n  - Leaf\n',
  );
  final plan = buildDocumentationPlan(
    frameworkName: 'Example',
    domains: [
      DomainOutline(
        sourcePath: 'fixture.mdx',
        name: 'C# & 100%',
        groups: groups,
      ),
    ],
  );
  final byPath = {for (final file in plan) file.relativePath: file.content};
  _expect(
    !byPath.containsKey('C# & 100%/C# APIs/C#.md'),
    'leaf with a reserved character unexpectedly produced a file',
  );
  _expect(
    byPath['README.md']!.contains('C%23 & 100%25/README.md'),
    'root link did not encode # and %',
  );
  _expect(
    byPath['C# & 100%/C# APIs/README.md']!.contains(
      '| C# | [💡](https://app.syntblaze.com/qt/example/'
      'C-sharp-and-100-percent/C-sharp-APIs/C-sharp "Quick Bite") |',
    ),
    'topic row should preserve # and normalize it in the learning link',
  );
  _expect(
    byPath['C# & 100%/C# APIs/README.md']!.contains(
      '| [100% coverage](<100%25 coverage/README.md>) |',
    ),
    'branch topic link did not encode %',
  );
  _expectAllLinksResolve(plan);
}

void _testGeneratedLinksResolve() {
  final plan = buildDocumentationPlan(
    frameworkName: 'Example',
    domains: const [
      DomainOutline(
        sourcePath: 'fixture.mdx',
        name: 'UI & Layout',
        groups: [
          TopicGroup('Layout: Single Child', ['`lib/src`', 'A B']),
          TopicGroup('Lifecycle', ['Start']),
        ],
      ),
    ],
  );
  _expectAllLinksResolve(plan);
}

void _testPlaceholderSyntaxLinkSegments() {
  final plan = buildDocumentationPlan(
    frameworkName: 'Ansible',
    domains: const [
      DomainOutline(
        sourcePath: 'templating.mdx',
        name: 'Templating',
        groups: [
          TopicGroup('Jinja Expressions', [
            '`{{ ... }}`',
            '`{% ... %}`',
            '`{# ... #}`',
          ]),
        ],
      ),
    ],
  );
  final group = plan.singleWhere(
    (file) => file.relativePath == 'Templating/Jinja Expressions/README.md',
  );
  for (final segment in ['...', 'percent-...-percent', 'sharp-...-sharp']) {
    _expect(
      group.content.contains(
        'https://app.syntblaze.com/qt/ansible/'
        'Templating/Jinja-Expressions/$segment "Quick Bite"',
      ),
      'Jinja placeholder link segment was not generated: $segment',
    );
  }
}

void _testLearningLinksPreservePeriods() {
  final plan = buildDocumentationPlan(
    frameworkName: 'Example.SDK',
    domains: const [
      DomainOutline(
        sourcePath: 'runtime.mdx',
        name: 'Runtime APIs',
        groups: [
          TopicGroup('Errors 2.0', [
            'FlutterError.onError',
            'Future.wait()',
            '.ansible-lint',
            'android/app/build.gradle',
          ]),
        ],
      ),
    ],
  );
  final group = plan.singleWhere(
    (file) => file.relativePath == 'Runtime APIs/Errors 2.0/README.md',
  );
  for (final segment in [
    'Runtime-APIs/Errors-2.0/FlutterError.onError',
    'Runtime-APIs/Errors-2.0/Future.wait-method',
    'Runtime-APIs/Errors-2.0/.ansible-lint',
    'Runtime-APIs/Errors-2.0/android-app-build.gradle',
  ]) {
    _expect(
      group.content.contains(
        'https://app.syntblaze.com/qt/example-sdk/$segment "Quick Bite"',
      ),
      'learning link did not preserve periods: $segment',
    );
  }
}

void _testDryRunDoesNotWrite() {
  _withTemporaryDirectory((temporary) {
    final output = Directory('${temporary.path}/missing-output');
    final result = writeDocumentationPlan(
      outputDirectory: output.path,
      plan: const [PlannedFile('Domain/Topic.md', '# Topic\n')],
      dryRun: true,
    );
    _expect(result.succeeded && result.dryRun, 'dry run should succeed');
    _expect(result.created.length == 1, 'dry run should report creation');
    _expect(!output.existsSync(), 'dry run created the output directory');
  });
}

void _testSafeIdempotentWrites() {
  _withTemporaryDirectory((temporary) {
    final initialPlan = const [
      PlannedFile('Domain/Topic.md', '# Topic\n'),
      PlannedFile('README.md', '# Root\n'),
    ];
    final first = writeDocumentationPlan(
      outputDirectory: temporary.path,
      plan: initialPlan,
    );
    _expect(first.created.length == 2 && first.succeeded, 'first write failed');

    final topic = File('${temporary.path}/Domain/Topic.md');
    final firstModified = topic.lastModifiedSync();
    final second = writeDocumentationPlan(
      outputDirectory: temporary.path,
      plan: initialPlan,
    );
    _expect(second.unchanged.length == 2, 'rerun is not idempotent');
    _expect(
      topic.lastModifiedSync() == firstModified,
      'unchanged file was rewritten',
    );
  });
}

void _testConflictIsAtomicAndOverwriteIsExplicit() {
  _withTemporaryDirectory((temporary) {
    File('${temporary.path}/Domain/Topic.md')
      ..createSync(recursive: true)
      ..writeAsStringSync('# Existing\n');
    final plan = const [
      PlannedFile('Domain/New.md', '# New\n'),
      PlannedFile('Domain/Topic.md', '# Changed\n'),
    ];
    final conflict = writeDocumentationPlan(
      outputDirectory: temporary.path,
      plan: plan,
    );
    _expect(!conflict.succeeded, 'differing file should conflict');
    _expect(conflict.conflicts.length == 1, 'conflict count is wrong');
    _expect(
      !File('${temporary.path}/Domain/New.md').existsSync(),
      'preflight conflict should prevent every write',
    );
    _expect(
      File('${temporary.path}/Domain/Topic.md').readAsStringSync() ==
          '# Existing\n',
      'conflicting file changed without overwrite',
    );

    final overwritten = writeDocumentationPlan(
      outputDirectory: temporary.path,
      plan: plan,
      overwrite: true,
    );
    _expect(overwritten.succeeded, 'explicit overwrite failed');
    _expect(overwritten.created.length == 1, 'created count is wrong');
    _expect(overwritten.updated.length == 1, 'updated count is wrong');
    _expect(
      File('${temporary.path}/Domain/Topic.md').readAsStringSync() ==
          '# Changed\n',
      'overwrite content is wrong',
    );
  });
}

void _testDirectoryAtTargetIsAConflict() {
  _withTemporaryDirectory((temporary) {
    Directory('${temporary.path}/Domain/Topic.md').createSync(recursive: true);
    final result = writeDocumentationPlan(
      outputDirectory: temporary.path,
      plan: const [PlannedFile('Domain/Topic.md', '# Topic\n')],
      overwrite: true,
    );
    _expect(!result.succeeded, 'directory target should conflict');
    _expect(result.conflicts.length == 1, 'directory conflict not reported');
  });
}

void _testParentFileAbortsEveryWrite() {
  _withTemporaryDirectory((temporary) {
    File('${temporary.path}/Blocked').writeAsStringSync('not a directory');
    final result = writeDocumentationPlan(
      outputDirectory: temporary.path,
      plan: const [
        PlannedFile('Available/First.md', '# First\n'),
        PlannedFile('Blocked/Second.md', '# Second\n'),
      ],
    );

    _expect(!result.succeeded, 'parent file should be a preflight conflict');
    _expect(
      result.conflicts.contains('Blocked/Second.md'),
      'blocked target should be reported',
    );
    _expect(
      !File('${temporary.path}/Available/First.md').existsSync(),
      'an ancestor conflict should prevent every planned write',
    );
    _expect(
      File('${temporary.path}/Blocked').readAsStringSync() == 'not a directory',
      'the blocking parent file should remain untouched',
    );
  });
}

void _testWriterRejectsUnsafePlans() {
  _withTemporaryDirectory((temporary) {
    for (final path in [
      '../escaped.md',
      '/absolute.md',
      r'C:\absolute.md',
      r'Domain\Topic.md',
      'Domain//Topic.md',
      'Domain/./Topic.md',
      'Domain/../Topic.md',
      'Domain/Bad\u0000Name.md',
      'Domain/Bad\u0085Name.md',
      'Domain/Bad\u2028Name.md',
      'Domain/Bad\u202eName.md',
      'Domain/Bad\ufeffName.md',
    ]) {
      _expectFormatException(
        () => writeDocumentationPlan(
          outputDirectory: temporary.path,
          plan: [PlannedFile(path, '# Unsafe\n')],
          dryRun: true,
        ),
        contains: 'Planned path',
      );
    }
    _expectFormatException(
      () => writeDocumentationPlan(
        outputDirectory: temporary.path,
        plan: const [
          PlannedFile('Domain/Topic.md', '# One\n'),
          PlannedFile('domain/topic.md', '# Two\n'),
        ],
        dryRun: true,
      ),
      contains: 'Duplicate planned path',
    );
    _expectFormatException(
      () => writeDocumentationPlan(
        outputDirectory: temporary.path,
        plan: const [
          PlannedFile('Domain/README.md', '# Domain\n'),
          PlannedFile('Domain/README.md/Nested.md', '# Nested\n'),
        ],
        dryRun: true,
      ),
      contains: 'ancestor directory',
    );
    _expectFormatException(
      () => writeDocumentationPlan(
        outputDirectory: temporary.path,
        plan: [
          PlannedFile('Domain/${List.filled(256, 'a').join()}', '# Too long\n'),
        ],
        dryRun: true,
      ),
      contains: 'component longer than 255 UTF-8 bytes',
    );
    _expect(
      !File('${temporary.parent.path}/escaped.md').existsSync(),
      'unsafe path escaped output root',
    );
  });
}

void _testWriterRejectsSymbolicLinks() {
  _withTemporaryDirectory((temporary) {
    final output = Directory('${temporary.path}/output')..createSync();
    final outsideFile = File('${temporary.path}/outside.md')
      ..writeAsStringSync('outside');
    final targetLink = Link('${output.path}/Target.md');
    if (!_tryCreateLink(targetLink, outsideFile.path)) return;

    final targetResult = writeDocumentationPlan(
      outputDirectory: output.path,
      plan: const [PlannedFile('Target.md', '# Changed\n')],
      overwrite: true,
    );
    _expect(!targetResult.succeeded, 'target symlink should conflict');
    _expect(
      outsideFile.readAsStringSync() == 'outside',
      'symlink was followed',
    );

    final outsideDirectory = Directory('${temporary.path}/outside-dir')
      ..createSync();
    final ancestorLink = Link('${output.path}/Domain');
    if (!_tryCreateLink(ancestorLink, outsideDirectory.path)) return;
    final ancestorResult = writeDocumentationPlan(
      outputDirectory: output.path,
      plan: const [PlannedFile('Domain/Topic.md', '# Topic\n')],
      overwrite: true,
    );
    _expect(!ancestorResult.succeeded, 'ancestor symlink should conflict');
    _expect(
      !File('${outsideDirectory.path}/Topic.md').existsSync(),
      'ancestor symlink was followed outside the output root',
    );
  });
}

void _testWriterRejectsSymbolicLinkRoot() {
  _withTemporaryDirectory((temporary) {
    final realRoot = Directory('${temporary.path}/real')..createSync();
    final rootLink = Link('${temporary.path}/linked-root');
    if (!_tryCreateLink(rootLink, realRoot.path)) return;
    _expectFileSystemException(
      () => writeDocumentationPlan(
        outputDirectory: rootLink.path,
        plan: const [PlannedFile('Topic.md', '# Topic\n')],
      ),
      contains: 'Output path is not a directory',
    );
    _expect(
      !File('${realRoot.path}/Topic.md').existsSync(),
      'symbolic-link output root was followed',
    );
  });
}

void _testCliHelpAndErrors() {
  final help = _runCli(['--help']);
  _expect(help.exitCode == 0, 'help exit code was ${help.exitCode}');
  _expect(help.stdout.toString().contains('Usage:'), 'help text missing');

  final noInput = _runCli([]);
  _expect(noInput.exitCode == 64, 'no-input exit should be 64');
  _expect(
    noInput.stderr.toString().contains('at least one .mdx'),
    'no-input error missing',
  );

  final unknown = _runCli(['--unknown']);
  _expect(unknown.exitCode == 64, 'unknown-option exit should be 64');
  _expect(
    unknown.stderr.toString().contains('Unknown option'),
    'unknown-option error missing',
  );

  final missingValue = _runCli(['--output']);
  _expect(missingValue.exitCode == 64, 'missing-value exit should be 64');
  _expect(
    missingValue.stderr.toString().contains('requires a value'),
    'missing-value error missing',
  );

  final swallowedOption = _runCli(['--output', '--dry-run']);
  _expect(swallowedOption.exitCode == 64, 'option-as-value exit should be 64');
  _expect(
    swallowedOption.stderr.toString().contains('--output requires a value'),
    'option-as-value diagnostic missing',
  );

  _withTemporaryDirectory((temporary) {
    final input = File('${temporary.path}/source.mdx')
      ..writeAsStringSync('Group\n- Topic\n');
    final emptyOutput = _runCli([input.path, '--output', '   ']);
    _expect(emptyOutput.exitCode == 64, 'empty output exit should be 64');
    _expect(
      emptyOutput.stderr.toString().contains(
        'Output directory cannot be empty',
      ),
      'empty output diagnostic missing',
    );
  });
}

void _testCliWriteLifecycle() {
  _withTemporaryDirectory((temporary) {
    final input = File('${temporary.path}/my_framework.mdx')
      ..writeAsStringSync('First Group\n- One\n- `Two()`\n\nSecond\n- Three\n');
    final output = '${temporary.path}/docs';
    final arguments = [
      input.path,
      '--framework',
      'Example',
      '--subject',
      'example-sdk',
      '--output',
      output,
    ];

    final first = _runCli(arguments);
    _expect(first.exitCode == 0, 'CLI first write failed: ${first.stderr}');
    _expect(
      first.stdout.toString().contains(
        'Conversion: 1 categories, 2 groups, 3 topics, 5 files planned.',
      ),
      'CLI count summary is wrong: ${first.stdout}',
    );
    _expect(
      !File('$output/My Framework/First Group/Two().md').existsSync(),
      'CLI unexpectedly created a leaf concept file',
    );
    _expect(
      File(
        '$output/My Framework/First Group/README.md',
      ).readAsStringSync().contains(
        '| `Two()` | [💡](https://app.syntblaze.com/qt/example-sdk/'
        'My-Framework/First-Group/Two-method "Quick Bite") |',
      ),
      'CLI group index omitted a leaf concept',
    );

    final second = _runCli(arguments);
    _expect(second.exitCode == 0, 'CLI idempotent rerun failed');
    _expect(
      second.stdout.toString().contains('unchanged: 5'),
      'CLI did not report unchanged files',
    );

    final root = File('$output/README.md')..writeAsStringSync('# Manual\n');
    final conflict = _runCli(arguments);
    _expect(conflict.exitCode == 2, 'CLI conflict exit should be 2');
    _expect(root.readAsStringSync() == '# Manual\n', 'conflict changed root');

    final overwritten = _runCli([...arguments, '--overwrite']);
    _expect(overwritten.exitCode == 0, 'CLI overwrite failed');
    _expect(
      root.readAsStringSync().startsWith('# Example Documentation\n'),
      'CLI overwrite did not restore generated root',
    );
  });
}

void _testCliNoRootMode() {
  _withTemporaryDirectory((temporary) {
    final input = File('${temporary.path}/sample.mdx')
      ..writeAsStringSync('Group\n- Topic\n');
    final output = '${temporary.path}/docs';
    final result = _runCli([
      input.path,
      '--output',
      output,
      '--no-root-readme',
    ]);
    _expect(result.exitCode == 0, 'no-root CLI failed: ${result.stderr}');
    _expect(!File('$output/README.md').existsSync(), 'root README was created');
    _expect(File('$output/license').existsSync(), 'root license was omitted');
    final domainReadme = File('$output/Sample/README.md').readAsStringSync();
    _expect(
      !domainReadme.contains('Back to documentation'),
      'domain README links to omitted root README',
    );
    _expect(
      File(
        '$output/Sample/Group/README.md',
      ).readAsStringSync().contains('| Topic | [💡]('),
      'no-root mode omitted a concept from the group index',
    );
    _expect(
      !File('$output/Sample/Group/Topic.md').existsSync(),
      'no-root mode created a leaf concept file',
    );
  });
}

void _testCliDomainOverridePrecedence() {
  _withTemporaryDirectory((temporary) {
    final input = File('${temporary.path}/sample.mdx')
      ..writeAsStringSync('Group\n- Topic\n');
    final map = File('${temporary.path}/map.json')
      ..writeAsStringSync(jsonEncode({'sample': 'Map Domain'}));
    final output = '${temporary.path}/docs';
    final result = _runCli([
      input.path,
      '--domain-map',
      map.path,
      '--domain',
      'sample=CLI Domain',
      '--output',
      output,
    ]);
    _expect(result.exitCode == 0, 'override CLI failed: ${result.stderr}');
    _expect(
      File('$output/CLI Domain/Group/README.md').existsSync(),
      'CLI override did not win over JSON map',
    );
    _expect(
      !Directory('$output/Map Domain').existsSync(),
      'JSON map incorrectly won over CLI override',
    );
  });
}

void _testCliPathSpecificDomainOverrides() {
  _withTemporaryDirectory((temporary) {
    File('${temporary.path}/one/shared.mdx')
      ..createSync(recursive: true)
      ..writeAsStringSync('Group\n- One\n');
    File('${temporary.path}/two/shared.mdx')
      ..createSync(recursive: true)
      ..writeAsStringSync('Group\n- Two\n');
    File('${temporary.path}/map.json').writeAsStringSync(
      jsonEncode({
        'one/shared.mdx': '  First Domain  ',
        'two/shared.mdx': 'Second Domain',
      }),
    );
    final result = _runCli([
      'one/shared.mdx',
      'two/shared.mdx',
      '--domain-map',
      'map.json',
      '--output',
      'docs',
    ], workingDirectory: temporary.path);
    _expect(result.exitCode == 0, 'path-specific map failed: ${result.stderr}');
    _expect(
      File(
        '${temporary.path}/docs/First Domain/Group/README.md',
      ).readAsStringSync().contains('| One | [💡]('),
      'first relative source path was not mapped or trimmed',
    );
    _expect(
      File(
        '${temporary.path}/docs/Second Domain/Group/README.md',
      ).readAsStringSync().contains('| Two | [💡]('),
      'second relative source path was not mapped',
    );
  });
}

void _testCliRejectsInvalidExternalInputs() {
  _withTemporaryDirectory((temporary) {
    final source = File('${temporary.path}/source.mdx')
      ..writeAsStringSync('Group\n- Topic\n');
    final arrayMap = File('${temporary.path}/array.json')
      ..writeAsStringSync('[]');
    final arrayResult = _runCli([
      source.path,
      '--domain-map',
      arrayMap.path,
      '--dry-run',
    ]);
    _expect(arrayResult.exitCode == 64, 'array map exit should be 64');
    _expect(
      arrayResult.stderr.toString().contains('must be a JSON object'),
      'array map diagnostic missing',
    );

    final badValueMap = File('${temporary.path}/bad-value.json')
      ..writeAsStringSync('{"source": 42}');
    final badValueResult = _runCli([
      source.path,
      '--domain-map',
      badValueMap.path,
      '--dry-run',
    ]);
    _expect(badValueResult.exitCode == 64, 'bad map value exit should be 64');
    _expect(
      badValueResult.stderr.toString().contains('must be a non-empty string'),
      'bad map value diagnostic missing',
    );

    final missingResult = _runCli(['${temporary.path}/missing.mdx']);
    _expect(missingResult.exitCode == 74, 'missing input exit should be 74');
    _expect(
      missingResult.stderr.toString().contains('Input does not exist'),
      'missing input diagnostic missing',
    );

    final emptyDirectory = Directory('${temporary.path}/empty')..createSync();
    Directory('${emptyDirectory.path}/nested').createSync();
    File(
      '${emptyDirectory.path}/nested/ignored.mdx',
    ).writeAsStringSync('Group\n- Topic\n');
    final emptyResult = _runCli([emptyDirectory.path, '--dry-run']);
    _expect(emptyResult.exitCode == 64, 'empty scan exit should be 64');
    _expect(
      emptyResult.stderr.toString().contains('No .mdx source files'),
      'non-recursive empty scan diagnostic missing',
    );
  });
}

void _testCliRejectsMalformedSource() {
  _withTemporaryDirectory((temporary) {
    final input = File('${temporary.path}/bad.mdx')
      ..writeAsStringSync('- Orphan\n');
    final output = '${temporary.path}/docs';
    final result = _runCli([input.path, '--output', output]);
    _expect(result.exitCode == 64, 'malformed source exit should be 64');
    _expect(
      result.stderr.toString().contains('topic appears before a group'),
      'malformed source diagnostic missing',
    );
    _expect(
      !Directory(output).existsSync(),
      'malformed source created output before validation',
    );
  });
}

void _testRepresentativeFlutterCorpusPlan() {
  final plan = _representativeFlutterPlan();
  final byPath = {for (final file in plan) file.relativePath: file.content};
  _expect(
    plan.length == 6,
    'representative plan should contain five indexes and a license',
  );
  _expect(
    plan.every(
      (file) =>
          file.relativePath == 'license' ||
          file.relativePath.endsWith('README.md'),
    ),
    'representative plan contains a lowest-level Markdown file',
  );
  _expect(
    byPath['Build & Release Deployment/Build Modes/README.md']!.contains(
      '| Hot reload | [💡](',
    ),
    'Build Modes index omitted Hot reload',
  );
  _expect(
    byPath['Build & Release Deployment/iOS Release/README.md']!.contains(
      '| App icons | [💡](',
    ),
    'iOS Release index omitted its leaf topic',
  );
  _expect(
    byPath['Build & Release Deployment/iOS Release/README.md']!.contains(
      '| [Distribution](<Distribution/README.md>) |',
    ),
    'iOS Release index omitted its branch topic',
  );
  _expect(
    byPath['Build & Release Deployment/iOS Release/README.md']!.contains(
      '| &nbsp;&nbsp;TestFlight | [💡](',
    ),
    'iOS Release index omitted its nested leaf topic',
  );
  _expect(
    !plan.any(
      (file) =>
          file.content.contains('Hot reload.md') ||
          file.content.contains('App icons.md') ||
          file.content.contains('TestFlight.md'),
    ),
    'representative indexes link to omitted leaf files',
  );
  _expectAllLinksResolve(plan);
}

void _testRepresentativeFlutterCorpusWriteAndRerun() {
  final plan = _representativeFlutterPlan();
  _withTemporaryDirectory((temporary) {
    final output = '${temporary.path}/docs';
    final first = writeDocumentationPlan(outputDirectory: output, plan: plan);
    _expect(first.succeeded, 'representative corpus write failed');
    _expect(first.created.length == 6, 'representative creation count changed');
    _expect(File('$output/license').existsSync(), 'license was not written');
    final markdownFiles = Directory(output)
        .listSync(recursive: true, followLinks: false)
        .whereType<File>()
        .where((file) => file.path.endsWith('.md'))
        .toList();
    _expect(markdownFiles.length == 5, 'not every planned index was written');
    _expect(
      markdownFiles.every((file) => file.uri.pathSegments.last == 'README.md'),
      'write created a lowest-level Markdown file',
    );

    final second = writeDocumentationPlan(outputDirectory: output, plan: plan);
    _expect(second.succeeded, 'representative corpus rerun failed');
    _expect(second.created.isEmpty, 'rerun unexpectedly created files');
    _expect(second.updated.isEmpty, 'rerun unexpectedly updated files');
    _expect(second.unchanged.length == 6, 'rerun unchanged count changed');
  });
}

List<PlannedFile> _representativeFlutterPlan() {
  final groups = parseMdxOutline(
    'build_release.mdx',
    'Build Modes\n'
        '- Debug mode\n'
        '- Hot reload\n'
        '\n'
        'iOS Release\n'
        '- App icons\n'
        '- Distribution\n'
        '  - TestFlight\n',
  );
  return buildDocumentationPlan(
    frameworkName: 'Flutter',
    domains: [
      DomainOutline(
        sourcePath: 'build_release.mdx',
        name: 'Build & Release Deployment',
        groups: groups,
      ),
    ],
  );
}

void _expectAllLinksResolve(List<PlannedFile> plan) {
  final paths = {for (final file in plan) file.relativePath};
  final linkPattern = RegExp(r'\]\((?:<([^>]+)>|([^\s)]+))\)');
  for (final file in plan) {
    for (final match in linkPattern.allMatches(file.content)) {
      final destination = match.group(1) ?? match.group(2)!;
      if (Uri.parse(destination).hasScheme) continue;
      final resolved = _resolveRelativeLink(file.relativePath, destination);
      _expect(
        paths.contains(resolved),
        '${file.relativePath} links to missing $destination ($resolved)',
      );
    }
  }
}

String _resolveRelativeLink(String sourcePath, String destination) {
  final parts = sourcePath.split('/')..removeLast();
  for (final part in Uri.decodeComponent(destination).split('/')) {
    if (part == '.' || part.isEmpty) continue;
    if (part == '..') {
      _expect(parts.isNotEmpty, 'link escapes plan root: $destination');
      parts.removeLast();
    } else {
      parts.add(part);
    }
  }
  return parts.join('/');
}

ProcessResult _runCli(List<String> arguments, {String? workingDirectory}) {
  final converter = File.fromUri(
    Platform.script,
  ).parent.uri.resolve('mdx_to_docs.dart').toFilePath();
  return Process.runSync(Platform.resolvedExecutable, [
    converter,
    ...arguments,
  ], workingDirectory: workingDirectory);
}

void _withTemporaryDirectory(void Function(Directory) body) {
  final temporary = Directory.systemTemp.createTempSync('mdx-to-docs-test-');
  try {
    body(temporary);
  } finally {
    temporary.deleteSync(recursive: true);
  }
}

bool _tryCreateLink(Link link, String target) {
  try {
    link.createSync(target);
    return true;
  } on FileSystemException {
    // Windows may deny symlink creation without Developer Mode. The behavior is
    // exercised on platforms where the runtime permits creating the fixture.
    return false;
  }
}

void _expect(bool condition, String message) {
  if (!condition) throw StateError(message);
}

void _expectList(List<String> actual, List<String> expected, String label) {
  _expect(
    actual.length == expected.length &&
        Iterable<int>.generate(
          actual.length,
        ).every((index) => actual[index] == expected[index]),
    '$label was $actual, expected $expected',
  );
}

void _expectUnsupportedMutation(List<Object?> list, String message) {
  try {
    list.clear();
  } on UnsupportedError {
    return;
  }
  throw StateError(message);
}

void _expectFormatException(
  void Function() callback, {
  required String contains,
}) {
  try {
    callback();
  } on FormatException catch (error) {
    _expect(
      error.message.toString().contains(contains),
      'FormatException "${error.message}" did not contain "$contains"',
    );
    return;
  }
  throw StateError('Expected FormatException containing "$contains".');
}

void _expectFileSystemException(
  void Function() callback, {
  required String contains,
}) {
  try {
    callback();
  } on FileSystemException catch (error) {
    _expect(
      error.message.contains(contains),
      'FileSystemException "${error.message}" did not contain "$contains"',
    );
    return;
  }
  throw StateError('Expected FileSystemException containing "$contains".');
}
