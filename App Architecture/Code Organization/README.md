# Code Organization

Code organization gives each kind of source file a clear purpose and home.
Consistent names and boundaries make models easier to distinguish, shared
helpers easier to discover, and generated or test-only code harder to misuse in
production paths.

```text
External payload <-> DTO -> mapper -> entity / value object
                                      |
                                      v
                            immutable application state
                                      |
                                      v
                         route definitions -> themed UI

Shared support: constants | extensions | validators
Separate inputs: generated files | test fixtures
```

Organize code by responsibility before by file type. Keep transport, domain,
presentation, generated, and test representations distinct when their rules or
lifecycles differ, and introduce shared folders only for code with genuinely
shared ownership.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization) — Focused, bite-sized article covering Code Organization
- [Learning Path](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization) — Step-by-step material that builds practical Code Organization knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization) — Structured, in-depth material for learning about Code Organization thoroughly

## Building Blocks

| Topic | Primary role | Useful when | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Immutable models | Represent complete values that cannot change after construction | State snapshots and layer contracts need predictable equality and updates | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/Immutable-models "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/Immutable-models "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/Immutable-models "Deep Dive") |
| DTOs | Mirror data transferred through APIs, storage, or messages | External schemas must evolve without shaping domain concepts | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/DTOs "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/DTOs "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/DTOs "Deep Dive") |
| Entities | Represent domain concepts whose identity persists as attributes change | Business behavior depends on which instance something is | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/Entities "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/Entities "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/Entities "Deep Dive") |
| Value objects | Represent validated domain concepts through their attributes | Primitive values need invariants, meaning, and value equality | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/Value-objects "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/Value-objects "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/Value-objects "Deep Dive") |
| Mappers | Translate one layer's representation into another | DTOs, entities, and presentation models intentionally differ | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/Mappers "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/Mappers "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/Mappers "Deep Dive") |
| Extensions | Add focused, discoverable operations to existing types | A helper naturally belongs to a type but cannot or should not modify it | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/Extensions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/Extensions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/Extensions "Deep Dive") |
| Validators | Apply reusable rules to untrusted or user-provided values | Validation behavior is shared across inputs or boundaries | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/Validators "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/Validators "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/Validators "Deep Dive") |
| Constants | Give stable values meaningful names | Repeated literals have one meaning and one deliberate owner | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/Constants "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/Constants "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/Constants "Deep Dive") |
| Theme files | Organize design tokens, application themes, and component variants | Visual rules must remain consistent and centrally configurable | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/Theme-files "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/Theme-files "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/Theme-files "Deep Dive") |
| Route definitions | Describe navigation destinations and their configuration | Routes need one discoverable, type-safe source of truth | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/Route-definitions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/Route-definitions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/Route-definitions "Deep Dive") |
| Generated files | Hold reproducible machine-written source separately from authored code | Serialization, routing, assets, or builders produce checked-in output | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/Generated-files "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/Generated-files "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/Generated-files "Deep Dive") |
| Test fixtures | Provide deterministic reusable inputs and expected values for tests | Several tests need representative data without obscuring their intent | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Code-Organization/Test-fixtures "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Code-Organization/Test-fixtures "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Code-Organization/Test-fixtures "Deep Dive") |

## Questions

- [When should an application model be immutable?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/When-should-an-application-model-be-immutable%3F)
- [How is a DTO different from a domain entity?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/How-is-a-DTO-different-from-a-domain-entity%3F)
- [What makes identity important for an entity?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/What-makes-identity-important-for-an-entity%3F)
- [When should a primitive become a value object?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/When-should-a-primitive-become-a-value-object%3F)
- [Where should mapping between layers happen?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Where-should-mapping-between-layers-happen%3F)
- [When is an extension clearer than a utility function?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/When-is-an-extension-clearer-than-a-utility-function%3F)
- [Should validation live in a validator or a value object?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Should-validation-live-in-a-validator-or-a-value-object%3F)
- [Which values deserve named constants?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Which-values-deserve-named-constants%3F)
- [How should theme tokens and component themes be divided?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/How-should-theme-tokens-and-component-themes-be-divided%3F)
- [Where should route names, paths, and arguments be defined?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Where-should-route-names%2C-paths%2C-and-arguments-be-defined%3F)
- [Should generated files be committed to source control?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Should-generated-files-be-committed-to-source-control%3F)
- [When should tests share a fixture instead of building data inline?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/When-should-tests-share-a-fixture-instead-of-building-data-inline%3F)
- [Should code be grouped by feature or by artifact type?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Should-code-be-grouped-by-feature-or-by-artifact-type%3F)

## Best Practices

- [Prefer immutable models at public state and layer boundaries](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Prefer-immutable-models-at-public-state-and-layer-boundaries)
- [Keep DTOs aligned with external schemas, not domain behavior](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Keep-DTOs-aligned-with-external-schemas%2C-not-domain-behavior)
- [Give entities stable identity and protect their invariants](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Give-entities-stable-identity-and-protect-their-invariants)
- [Make invalid value objects impossible or explicit to construct](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Make-invalid-value-objects-impossible-or-explicit-to-construct)
- [Keep conversions explicit and directional](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Keep-conversions-explicit-and-directional)
- [Use narrowly scoped extensions with unambiguous names](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Use-narrowly-scoped-extensions-with-unambiguous-names)
- [Separate input-format checks from domain invariants](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Separate-input-format-checks-from-domain-invariants)
- [Keep constants near their owner and avoid universal dumping grounds](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Keep-constants-near-their-owner-and-avoid-universal-dumping-grounds)
- [Build themes from named design tokens and focused component themes](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Build-themes-from-named-design-tokens-and-focused-component-themes)
- [Keep route definitions centralized enough to discover but feature-owned where practical](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Keep-route-definitions-centralized-enough-to-discover-but-feature-owned-where-practical)
- [Never hand-edit reproducible generated output](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Never-hand-edit-reproducible-generated-output)
- [Keep fixtures small, deterministic, and explicit about the scenario they represent](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Keep-fixtures-small%2C-deterministic%2C-and-explicit-about-the-scenario-they-represent)
- [Use names and folders that communicate ownership and boundary](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Use-names-and-folders-that-communicate-ownership-and-boundary)
- [Avoid creating shared abstractions before multiple real consumers exist](https://app.syntblaze.com/qsp/flutter/App-Architecture/Code-Organization/Avoid-creating-shared-abstractions-before-multiple-real-consumers-exist)

[< Back to app architecture](../README.md)
