# MDX Taxonomy Converter

`mdx_to_docs.dart` converts compact MDX outlines into a hierarchy of Markdown
indexes. Each unindented line is a topic-group name; each following `- ` line is
a concept. Concepts may be nested to any depth with two spaces per level. A
concept with children becomes a directory containing `README.md`; every concept
appears in a table with Quick Bite, Learning Path, and Deep Dive links, while a
leaf never becomes a standalone file. Every generated index also includes a
page-level Learn More section with the same three resource types, their full
links, and their standard descriptions.
Blank lines are allowed, but skipped or malformed indentation, empty groups,
empty topics, and duplicate siblings are rejected with source line numbers.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qp/flutter/MDX-Taxonomy-Converter) — Focused, bite-sized article covering MDX Taxonomy Converter
- [Learning Path](https://app.syntblaze.com/lp/flutter/MDX-Taxonomy-Converter) — Step-by-step material that builds practical MDX Taxonomy Converter knowledge
- [Deep Dive](https://app.syntblaze.com/dp/flutter/MDX-Taxonomy-Converter) — Structured, in-depth material for learning about MDX Taxonomy Converter thoroughly

Preview a conversion:

```sh
dart run tool/mdx_to_docs.dart path/to/outlines \
  --domain-map path/to/domain_names.json \
  --framework "Framework Name" \
  --subject canonical-subject-slug \
  --output build/flutter-docs \
  --dry-run
```

Inputs may be individual `.mdx` files or directories. Directory scans include
only `.mdx` files directly inside each directory; they are non-recursive.

Remove `--dry-run` to write the files. The converter will not overwrite any
differing file by default, and one conflict prevents the entire batch from
being written. Byte-identical files are left untouched. Use `--overwrite` only
when replacing generated or existing content is intentional.

Before writing, the converter validates all display names and normalized paths,
checks case-insensitive and file/directory collisions, prevents relative-path
traversal, rejects a symbolic-link output root and non-directory or
symbolic-link ancestors within it, and enforces portable filename limits.
Markdown link destinations encode the filename characters `#` and `%`. Every
generated local link targets a planned README. Branch concepts link to those
indexes; leaf concepts link only to their SyntBlaze learning resources.

For another framework, name each source file after its intended domain or pass
`--domain stem="Exact Domain Name"`. Pass its canonical SyntBlaze subject slug
with `--subject`; when omitted, the converter infers a lowercase slug from the
framework name. The domain key may also be a filename or a source path relative
to the current working directory. A JSON object accepted by `--domain-map` is
more convenient when several filenames need explicit display names.

Run the dependency-free checks with:

```sh
dart run tool/mdx_to_docs_test.dart
```

The suite covers parser and naming errors, randomized parser/path properties,
Markdown link resolution, omitted leaf files, nested indexes, dry runs,
conflicts, idempotency, overwrite behavior, filesystem and symbolic-link
safety, CLI exit codes and overrides, and representative Flutter generation
plus rerun checks including `Hot reload` and `App icons`.
