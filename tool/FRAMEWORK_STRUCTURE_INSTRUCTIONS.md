# Instructions for Building This Documentation Structure for Another Framework

Use this document to create a sibling documentation repository for another
framework. It describes the structural rules demonstrated by this Flutter
repository and explains which parts should be adapted instead of copied.

## Goal

Create a browsable documentation taxonomy in which a developer can move from a
broad framework concern to a focused concept:

```text
repository
  -> domain
    -> topic group
      -> focused concepts listed in the group README
```

The initial deliverable is the complete information architecture, not a full
encyclopedia. Index pages should be useful immediately. Lowest-level concepts
are index entries, not title-only Markdown placeholder files.

## Existing Repository Pattern

The Flutter repository uses exactly three documentation levels below the root:

```text
README.md
<Domain>/
  README.md
  <Topic Group>/
    README.md
```

Its current structure has:

- 19 top-level domains;
- 155 second-level topic groups;
- one `README.md` at the root, in every domain, and in every topic group;
- focused concepts listed directly in domain and group indexes;
- no category nesting below a topic group.

The levels have different responsibilities:

| Level | Purpose | Required content |
| --- | --- | --- |
| Root `README.md` | Introduce the framework collection and link all domains | Framework identity, local domain links, contribution or project information |
| Domain `README.md` | Explain one broad concern and expose all of its groups | Short overview, group summary, group links, and optionally every concept entry |
| Group `README.md` | Teach the shape of one subject and index its concepts | Explanation, concept table, questions, best practices, back link |

Do not create standalone `.md` files for lowest-level concepts. A concept can
become its own nested `README.md` index only when it has child concepts that
need a separate hierarchy.

## Inputs to Decide Before Creating Files

Record these values first:

```text
FRAMEWORK_NAME       = public framework name
FRAMEWORK_KIND       = UI, full-stack web, backend, desktop, mobile, or other
PRIMARY_LANGUAGE     = language or languages used by the framework
TARGETS              = browser, server, mobile, desktop, embedded, or a subset
OFFICIAL_DOCS        = canonical documentation URL
PACKAGE_ECOSYSTEM    = npm, Maven, NuGet, RubyGems, PyPI, Composer, etc.
REPOSITORY_NAME      = name of the new documentation repository
```

Use current official framework, language, platform, and package documentation
as the primary sources for the taxonomy. Use ecosystem popularity only to
prioritize package pages; do not let third-party tutorials define framework
internals.

## Taxonomy Design Rules

### 1. Preserve concerns, not Flutter terminology

Start from the concerns represented by the Flutter domains, then translate each
one into the target framework's own mental model. Never perform a word-for-word
replacement such as `Widget` to `Component` if the lifecycle, rendering model,
or public API is different.

Use the following matrix as a coverage checklist:

| Concern in this repository | Keep when | Adaptation examples |
| --- | --- | --- |
| Architecture | Almost always | Modules, layers, server/client boundaries, project organization |
| Async Concurrency | The language or framework has asynchronous work | Promises, coroutines, tasks, workers, event loops, structured concurrency |
| Build & Release Deployment | Almost always | Compiler/bundler, environments, artifacts, hosting, stores, containers, CI/CD |
| Data Networking & Storage | Almost always | HTTP/RPC, serialization, caching, databases, browser or device storage |
| Engine Runtime | The framework has a meaningful runtime or execution engine | VM, reconciler, scheduler, request runtime, hydration runtime |
| Forms & Input Gestures | The framework handles interactive UI | Forms, validation, keyboard, pointer, touch, drag-and-drop |
| Hit Testing & Input Dispatch | The framework owns or exposes input dispatch | DOM events, responder chain, event propagation, gesture recognition |
| Internationalization & Accessibility | User-facing output exists | Locale data, translation, semantics, ARIA, assistive technology |
| Layout Constraints | The framework participates in layout | CSS layout, constraint systems, native layout, responsive behavior |
| Navigation & Routing | The framework changes screens, pages, or endpoints | Client routes, server routes, deep links, middleware, nested navigation |
| Packages | A meaningful third-party ecosystem exists | Group by capability, not vendor; keep framework bindings separate when useful |
| Performance Debugging | Almost always | Profilers, tracing, bundle size, memory, rendering, request latency |
| Platform Integration | Multiple host platforms or native APIs exist | Browser APIs, OS bridges, native modules, server adapters, plugins |
| Rendering Pipeline | The framework renders UI or output through phases | Reconciliation, DOM commits, hydration, templates, native rendering |
| Security & Privacy | Always | Authentication boundaries, storage, transport, injection, permissions, secrets |
| Testing & Quality | Always | Unit, component, integration, end-to-end, static analysis, framework test APIs |
| Theming & Design | The framework owns presentation | Tokens, styling systems, responsive design, assets, design systems |
| Trees | Trees are part of the framework's public mental model | Component, DOM, render, route, dependency, syntax, or accessibility trees |
| Widgets | A UI framework exposes reusable visual primitives | Rename to Components, Views, Controls, Elements, or the official term |

Add a target-specific domain when it is central to the framework. Examples
include server middleware, dependency injection containers, server-side
rendering and hydration, ORM/database access, request pipelines, or compiler
directives. Remove a domain when it would be artificial for the target. Record
every addition, merge, rename, and omission in a short taxonomy decision table
before scaffolding.

### 2. Keep domains broad and groups cohesive

A domain should answer “which major framework concern am I learning?” A topic
group should answer “which closely related mechanism or API family am I
learning?” A concept entry should name one focused question or API.

Use these boundaries:

- Aim for roughly 5–20 topic groups in a domain.
- Aim for roughly 5–30 concept entries in a group.
- Split a group when its concepts require unrelated introductions.
- Merge groups that would otherwise have only one or two concepts.
- Do not add empty groups merely to make two frameworks look symmetrical.
- Prefer the maximum nesting depth of domain/group. Use a nested concept
  directory only when that concept has children and needs its own `README.md`.
- Allow a concept in more than one group when the learning context is genuinely
  different.

### 3. Use framework-native names

- Use the official capitalization of APIs, packages, commands, and lifecycle
  methods.
- Use readable Title Case for conceptual domain and group directory names.
- Preserve code punctuation and formatting in concept display names, for
  example `useEffect()` or `Task<T>`.
- Avoid names based only on acronyms unless that is the official public name.
- Do not put sequence numbers in names. Navigation order belongs in indexes.

Examples:

```text
Components/State and Lifecycle/README.md -> `useEffect()`
Routing/Route Configuration/README.md -> Dynamic routes
Build & Deployment/Framework Commands/README.md -> `framework build`
```

## Research and Planning Procedure

### Phase 1: Learn the framework's model

1. Read the official overview, concepts, API reference, tooling, testing,
   deployment, security, accessibility, and performance documentation.
2. List the framework's own nouns for application units, state, lifecycle,
   rendering, routing, data flow, extension points, and build artifacts.
3. Separate framework APIs from language APIs, host-platform APIs, and
   third-party packages.
4. Identify target-specific concerns such as server rendering, native bridges,
   middleware, or code generation.
5. Note version-dependent subjects. Use unversioned names only when the concept
   is stable across supported releases.

### Phase 2: Design before scaffolding

Create a planning table like this:

| Proposed domain | Topic groups | Why it belongs | Source coverage |
| --- | --- | --- | --- |
| Components | Basics; Composition; State; Lifecycle | Core UI abstraction | Official concepts and API reference |
| Routing | Configuration; Navigation; Data loading | Framework-owned navigation | Official routing guide |

Then verify:

- every official major concept has a home;
- groups do not mix framework core, platform APIs, and packages accidentally;
- the same term is spelled consistently everywhere;
- package categories describe capabilities rather than current popularity;
- no Flutter-only concept survived without a target-framework equivalent.

### Phase 3: Build indexes first

Create in this order:

1. all domain directories;
2. all group directories;
3. every group `README.md`, including all leaf concept entries;
4. every domain `README.md`;
5. the root `README.md`.

Write structural indexes before adding optional long-form content so every
generated link and count can be validated against the filesystem.

### Phase 4: Expand content incrementally

After the complete taxonomy is reviewed, expand the highest-value group indexes
first. Do not block the structure milestone on long-form writing.

## Required Templates

### Root README

Do not copy the current Flutter root README verbatim. It contains legacy
roadmap-style external links and does not act as a complete local index. New
framework repositories should use local links as their navigation source of
truth.

```markdown
# <Framework Name> for Developers

A structured guide to <Framework Name>, from its core model and APIs to
architecture, testing, performance, security, and deployment.

## Domains

| Domain | Focus | Groups |
| --- | --- | ---: |
| [Architecture](Architecture/README.md) | Project organization and dependency boundaries | <count> |
| [<Domain>](<Domain/README.md>) | <one-sentence focus> | <count> |

## How to Use This Repository

Choose a domain and open a topic group to review its focused concepts.

## Contributing

<Repository-specific contribution instructions.>
```

Wrap Markdown destinations in angle brackets when the path contains spaces or
characters that can confuse link parsing:

```markdown
[Build and Release](<Build & Release/README.md>)
```

### Domain README

```markdown
# <Framework Name> <Domain>

<Two or three sentences defining the domain, its scope, and why it matters.>

## At a glance

| Category | Focus | Topics |
| --- | --- | ---: |
| [<Group>](<Group/README.md>) | <one concise purpose> | <count> |

## <Group> [>](<Group/README.md>)

- `<API>` — <one precise responsibility>
- Concept — <one precise responsibility>

---

> <One short principle that summarizes the domain.>
```

For very large API catalogs, a linked bullet list may replace the detailed
topic table at the domain level. The group README must still carry useful
descriptions.

### Topic-group README

````markdown
# <Topic Group>

<Definition, boundaries, and relationship to the framework.>

```text
<Optional small flow, hierarchy, or lifecycle diagram when it clarifies the model>
```

<Selection guidance, lifecycle guidance, or important tradeoffs.>

## <Concepts, APIs, Packages, Phases, or another accurate label>

| Topic | Role | Best for |
| --- | --- | --- |
| `<API>` | <what it does> | <when to use it> |

## Questions

- <A question a developer would ask?>

## Best Practices

- <Actionable rule written as an imperative>

[< Back to <domain>](../README.md)
````

Adapt table columns to the subject. Good alternatives include:

- `Topic | Focus` for concepts;
- `Package | Approach | Best for` for ecosystem packages;
- `Phase | Primary responsibility | Key consideration` for a
  pipeline;
- `API | Purpose | Caution` for a reference-style group.

Leaf concept rows, questions, and best-practice items are intentionally plain
text. Link only structural entries that have a generated `README.md`. This
keeps navigation honest and prevents broken links to omitted placeholders.

## Package Taxonomy Rules

Packages need extra care because they change faster than framework concepts.

- Create capability groups first, such as state management, authentication,
  networking, testing, or UI systems.
- Include only packages that are active, relevant to the target framework, and
  supported by reliable current evidence.
- Distinguish a core library from its framework binding when developers choose
  or install them separately.
- Use the official package name as the concept display name.
- Describe approach and selection criteria without declaring one universal
  winner.
- Recheck maintenance status and compatibility whenever the package index is
  revised.

## Link and Count Rules

- All links are relative.
- Every domain links to all of its group READMEs.
- Leaf concepts are plain text and never link to placeholder `.md` files.
- A topic with children links to its nested `README.md` index.
- Every group links back to its parent domain.
- Displayed topic counts must match source entries; displayed group counts must
  match the filesystem.
- Use exact filename capitalization; assume links will be checked on a
  case-sensitive filesystem.
- Do not leave copied framework names, commands, package managers, code syntax,
  or platform terms in the new repository.

## Validation Checklist

Run equivalent checks from the new repository root.

### Structure

```sh
# There should be one root README, one per domain, and one per group.
find . -type f -name README.md -not -path './.git/*' | sort

# Inspect all directory levels; unexpected fourth-level categories are a smell.
find . -type d -not -path './.git*' | sort

# Lowest-level Markdown placeholders must not exist.
find . -type f -name '*.md' ! -name README.md -not -path './.git/*'
```

### Naming residue

Search for terms from the source repository and review every match:

```sh
rg -n 'Flutter|Dart|Widget|BuildContext|pubspec|flutter ' --glob '*.md' .
```

Change this list to include all framework-specific terms from any repository
used as structural inspiration.

### Links

Use a Markdown link checker that understands relative links and filenames with
spaces. Fix broken links; do not silence them globally. Also sample paths with
spaces, ampersands, parentheses, angle brackets, and dots because those expose
most encoding mistakes.

### Content consistency

- Confirm each source concept appears in the intended index.
- Confirm no leaf concept is emitted as, or linked to, a standalone `.md` file.
- Confirm every table count matches the source entries.
- Confirm terminology and capitalization match official documentation.
- Confirm diagrams describe the target framework's actual flow.
- Confirm package claims and version-sensitive APIs are current.
- Confirm all group READMEs end with a working parent link.

## Definition of Done for a New Framework Structure

The structure is complete when:

- the framework research and taxonomy decision table have been reviewed;
- every necessary domain and cohesive topic group exists;
- every group contains a useful, target-specific README;
- every planned concept appears in the correct README index;
- every level can be reached through local README links;
- counts and links pass validation;
- no source-framework residue remains;
- additions and omissions from the Flutter coverage matrix are intentional.

## Compact Execution Prompt

The following prompt can be reused after supplying the framework inputs:

```text
Create the documentation folder and file structure for <FRAMEWORK_NAME> using
FRAMEWORK_STRUCTURE_INSTRUCTIONS.md as the structural specification.

Research the current official framework documentation first. Translate the
repository's concerns into the framework's native concepts; do not mechanically
rename Flutter terms. Before creating files, provide a taxonomy decision table
showing retained, renamed, merged, added, and omitted domains with reasons.

Use root -> domain -> topic group as the normal directory levels. Add README.md
at the root, in every domain, and in every topic group. Write useful navigation
content for all READMEs. List lowest-level concepts as plain text and do not
create or link to standalone concept Markdown placeholders. Use official API
and package names, relative structural links, accurate counts, and back links.

After scaffolding, validate structure, links, counts, headings, capitalization,
and copied terminology. Report the final domain/group/concept counts and any
intentional departures from the specification.
```
