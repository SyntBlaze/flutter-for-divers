# Project Structure

Project structure is the way a Flutter codebase arranges entry points, features,
layers, and reusable code. A clear structure makes ownership and dependency
direction visible, helping developers find code and change it without creating
unintended coupling.

```text
Entry point -> app composition -> features -> layers -> shared foundations
```

Choose folders from real boundaries in the application rather than from a fixed
template. Feature-first organization keeps related behavior together, while
layer-first organization emphasizes technical responsibilities. Larger projects
often combine both: features form the primary boundary, and each feature contains
only the layers it needs.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure) — Focused, bite-sized article covering Project Structure
- [Learning Path](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure) — Step-by-step material that builds practical Project Structure knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure) — Structured, in-depth material for learning about Project Structure thoroughly

## Structure Options

| Topic | Role | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Feature-first folders | Groups UI, state, domain logic, and data access by user-facing capability | Independent features, parallel team ownership, and localized changes | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/Feature-first-folders "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/Feature-first-folders "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/Feature-first-folders "Deep Dive") |
| Layer-first folders | Groups code by technical responsibility across the application | Small applications and codebases with strong shared layers | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/Layer-first-folders "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/Layer-first-folders "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/Layer-first-folders "Deep Dive") |
| `lib/src` | Holds implementation code beneath a package or application's public surface | Separating internal implementation from public entry files | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/lib-src "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/lib-src "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/lib-src "Deep Dive") |
| `lib/app` | Contains application-wide composition, startup, routing, and theme wiring | Keeping application-shell concerns separate from features | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/lib-app "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/lib-app "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/lib-app "Deep Dive") |
| `lib/features` | Contains folders for distinct product capabilities | Feature-first applications with clear ownership boundaries | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/lib-features "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/lib-features "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/lib-features "Deep Dive") |
| `lib/core` | Contains foundational, application-wide abstractions and infrastructure | Stable low-level utilities that genuinely serve many features | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/lib-core "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/lib-core "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/lib-core "Deep Dive") |
| `lib/shared` | Contains reusable presentation elements and cross-feature helpers | Code intentionally shared by several features | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/lib-shared "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/lib-shared "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/lib-shared "Deep Dive") |
| `lib/domain` | Contains application-wide entities, value objects, and business rules | Layer-first projects with an independent domain model | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/lib-domain "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/lib-domain "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/lib-domain "Deep Dive") |
| `lib/data` | Contains repository implementations, data sources, DTOs, and mappers | Isolating persistence and remote-service details | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/lib-data "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/lib-data "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/lib-data "Deep Dive") |
| `lib/presentation` | Contains screens, widgets, presentation state, and UI coordination | Layer-first projects with a distinct user-interface boundary | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/lib-presentation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/lib-presentation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/lib-presentation "Deep Dive") |
| `main.dart` | Provides the executable entry point and performs minimal bootstrap work | Selecting configuration and starting the application | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/main.dart "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/main.dart "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/main.dart "Deep Dive") |
| `app.dart` | Defines the root application widget and top-level composition | Centralizing routing, theming, localization, and app-level providers | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/app.dart "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/app.dart "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/app.dart "Deep Dive") |
| Barrel files | Re-export several libraries through one convenient import | Small, stable groups of closely related APIs | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/Barrel-files "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/Barrel-files "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/Barrel-files "Deep Dive") |
| Public API files | Deliberately expose the supported surface of a package or module | Enforcing module boundaries and hiding implementation details | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Project-Structure/Public-API-files "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Project-Structure/Public-API-files "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Project-Structure/Public-API-files "Deep Dive") |

## Questions

- [Should a Flutter project use feature-first or layer-first folders?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Should-a-Flutter-project-use-feature-first-or-layer-first-folders%3F)
- [When is layer-first organization sufficient?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/When-is-layer-first-organization-sufficient%3F)
- [Can feature-first and layer-first structures be combined?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Can-feature-first-and-layer-first-structures-be-combined%3F)
- [What belongs under `lib/src`?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/What-belongs-under-lib%2Fsrc%3F)
- [What is the difference between `lib/app` and `lib/core`?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/What-is-the-difference-between-lib%2Fapp-and-lib%2Fcore%3F)
- [How should code inside `lib/features` be divided?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/How-should-code-inside-lib%2Ffeatures-be-divided%3F)
- [What belongs in `lib/core`?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/What-belongs-in-lib%2Fcore%3F)
- [How is `lib/shared` different from `lib/core`?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/How-is-lib%2Fshared-different-from-lib%2Fcore%3F)
- [When should `domain`, `data`, and `presentation` be top-level folders?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/When-should-domain%2C-data%2C-and-presentation-be-top-level-folders%3F)
- [How small should `main.dart` remain?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/How-small-should-main.dart-remain%3F)
- [What belongs in `app.dart`?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/What-belongs-in-app.dart%3F)
- [When do barrel files improve or obscure imports?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/When-do-barrel-files-improve-or-obscure-imports%3F)
- [How does a public API file enforce a module boundary?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/How-does-a-public-API-file-enforce-a-module-boundary%3F)
- [How should generated files and tests mirror the source structure?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/How-should-generated-files-and-tests-mirror-the-source-structure%3F)

## Best Practices

- [Choose a structure that reflects the application's real boundaries](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Choose-a-structure-that-reflects-the-application's-real-boundaries)
- [Keep code that changes together close together](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Keep-code-that-changes-together-close-together)
- [Use layers inside a feature only when the feature needs them](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Use-layers-inside-a-feature-only-when-the-feature-needs-them)
- [Avoid empty architectural folders added only for symmetry](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Avoid-empty-architectural-folders-added-only-for-symmetry)
- [Keep internal implementation beneath `lib/src`](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Keep-internal-implementation-beneath-lib%2Fsrc)
- [Keep application composition separate from feature behavior](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Keep-application-composition-separate-from-feature-behavior)
- [Give every feature a clear owner and public surface](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Give-every-feature-a-clear-owner-and-public-surface)
- [Reserve `core` for stable, broadly used foundations](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Reserve-core-for-stable%2C-broadly-used-foundations)
- [Move code to `shared` only after genuine reuse appears](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Move-code-to-shared-only-after-genuine-reuse-appears)
- [Keep domain code independent of Flutter and infrastructure](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Keep-domain-code-independent-of-Flutter-and-infrastructure)
- [Contain transport and persistence details in the data boundary](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Contain-transport-and-persistence-details-in-the-data-boundary)
- [Keep presentation code focused on rendering and user interaction](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Keep-presentation-code-focused-on-rendering-and-user-interaction)
- [Limit `main.dart` to configuration, bootstrap, and error setup](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Limit-main.dart-to-configuration%2C-bootstrap%2C-and-error-setup)
- [Keep the root app widget declarative](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Keep-the-root-app-widget-declarative)
- [Use small, intentional barrel files instead of exporting entire directory trees](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Use-small%2C-intentional-barrel-files-instead-of-exporting-entire-directory-trees)
- [Expose only supported types through public API files](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Expose-only-supported-types-through-public-API-files)
- [Make dependency direction clear from imports and module boundaries](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Make-dependency-direction-clear-from-imports-and-module-boundaries)
- [Evolve the folder structure as the application grows](https://app.syntblaze.com/qsp/flutter/App-Architecture/Project-Structure/Evolve-the-folder-structure-as-the-application-grows)

[< Back to app architecture](../README.md)
