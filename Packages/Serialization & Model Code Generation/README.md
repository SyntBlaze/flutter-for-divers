# Serialization & Model Code Generation

Serialization converts application data to and from transport or storage
formats such as JSON. Model code generation complements that work by producing
repetitive, type-aware code for value equality, immutable updates, builders,
unions, and mapping. Used together, these tools can make data boundaries easier
to audit without making generated files the source of business rules.

```text
JSON or stored data -> generated parser -> data-transfer model -> domain model
                                                               |
JSON or stored data <- generated encoder <- boundary mapping <---+

Model declaration -> build runner -> generated equality, copy, and mapping code
```

Treat serialization and value modeling as separate decisions. A class may need
JSON conversion without immutability or generated equality, while a domain
value may need strong value semantics without ever being serialized. Keeping
the distinction clear prevents wire-format details from spreading through the
rest of the application.

Generated code trades a build step for consistency and compile-time feedback.
The hand-written declaration remains the source of intent; generated parts
should be reproducible from it. When an external schema changes, regeneration
and boundary tests should happen together so stale output does not hide an
incompatible payload.

## Selection Guidance

Start with the smallest capability the model needs. JSON Serializable is a
focused choice for generated JSON conversion, with JSON Annotation providing
the annotations used by model declarations. Equatable adds value equality
without a generator, and Copy With Extension generates immutable-style update
helpers when that is the main missing feature.

Freezed combines generated immutable data classes, value semantics, copying,
and sealed unions, and it can integrate with JSON Serializable for JSON
conversion. Freezed Annotation contains the annotations consumed by that
generation workflow. Choose this combination when concise model declarations
and exhaustive state variants are worth the additional generated surface.

Built Value uses explicit builder-based immutable values and a structured
serialization system; Built Collection provides immutable collection types
that fit that model. Dart Mappable offers a broader generated mapping approach
for teams that want serialization and common data-class behavior under one
mapping configuration. Before adopting a broad solution, compare its support
for inheritance, generics, custom converters, default values, unknown fields,
and schema evolution against the application's actual data contracts.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Serialization-and-Model-Code-Generation) — Focused, bite-sized article covering Serialization & Model Code Generation
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Serialization-and-Model-Code-Generation) — Step-by-step material that builds practical Serialization & Model Code Generation knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Serialization-and-Model-Code-Generation) — Structured, in-depth material for learning about Serialization & Model Code Generation thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Freezed | Generated immutable data classes and sealed unions with value equality and copying support | Models and application states that need concise declarations, safe updates, and explicit variants | [💡](https://app.syntblaze.com/qt/flutter/Packages/Serialization-and-Model-Code-Generation/Freezed "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Serialization-and-Model-Code-Generation/Freezed "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Serialization-and-Model-Code-Generation/Freezed "Deep Dive") |
| Freezed Annotation | Annotation definitions consumed by the Freezed generator | Keeping Freezed model declarations available as a regular application dependency | [💡](https://app.syntblaze.com/qt/flutter/Packages/Serialization-and-Model-Code-Generation/Freezed-Annotation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Serialization-and-Model-Code-Generation/Freezed-Annotation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Serialization-and-Model-Code-Generation/Freezed-Annotation "Deep Dive") |
| JSON Serializable | Build-time generation of `fromJson` and `toJson` conversion code | Typed JSON boundaries that need explicit, repeatable mapping with little hand-written boilerplate | [💡](https://app.syntblaze.com/qt/flutter/Packages/Serialization-and-Model-Code-Generation/JSON-Serializable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Serialization-and-Model-Code-Generation/JSON-Serializable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Serialization-and-Model-Code-Generation/JSON-Serializable "Deep Dive") |
| JSON Annotation | Annotations and configuration types used by JSON Serializable | Declaring field names, inclusion rules, converters, and other JSON mapping behavior in model code | [💡](https://app.syntblaze.com/qt/flutter/Packages/Serialization-and-Model-Code-Generation/JSON-Annotation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Serialization-and-Model-Code-Generation/JSON-Annotation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Serialization-and-Model-Code-Generation/JSON-Annotation "Deep Dive") |
| Built Value | Generated immutable value types, builders, and a configurable serialization framework | Codebases that prefer explicit builders and strongly structured value and serialization conventions | [💡](https://app.syntblaze.com/qt/flutter/Packages/Serialization-and-Model-Code-Generation/Built-Value "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Serialization-and-Model-Code-Generation/Built-Value "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Serialization-and-Model-Code-Generation/Built-Value "Deep Dive") |
| Built Collection | Immutable collection types with builder-based updates | Models that need immutable lists, sets, and maps, particularly alongside Built Value | [💡](https://app.syntblaze.com/qt/flutter/Packages/Serialization-and-Model-Code-Generation/Built-Collection "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Serialization-and-Model-Code-Generation/Built-Collection "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Serialization-and-Model-Code-Generation/Built-Collection "Deep Dive") |
| Equatable | Value equality and `hashCode` based on an explicitly declared property list | Hand-written models and states that need predictable equality without code generation | [💡](https://app.syntblaze.com/qt/flutter/Packages/Serialization-and-Model-Code-Generation/Equatable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Serialization-and-Model-Code-Generation/Equatable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Serialization-and-Model-Code-Generation/Equatable "Deep Dive") |
| Copy With Extension | Annotation-driven generation of `copyWith` APIs | Existing immutable-style classes that primarily need safer, less repetitive copy operations | [💡](https://app.syntblaze.com/qt/flutter/Packages/Serialization-and-Model-Code-Generation/Copy-With-Extension "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Serialization-and-Model-Code-Generation/Copy-With-Extension "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Serialization-and-Model-Code-Generation/Copy-With-Extension "Deep Dive") |
| Dart Mappable | Generated object mapping with serialization and data-class capabilities | Applications that want one configurable generator for model mapping and common value operations | [💡](https://app.syntblaze.com/qt/flutter/Packages/Serialization-and-Model-Code-Generation/Dart-Mappable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Serialization-and-Model-Code-Generation/Dart-Mappable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Serialization-and-Model-Code-Generation/Dart-Mappable "Deep Dive") |

## Questions

- [What is serialization, and where should it happen?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/What-is-serialization%2C-and-where-should-it-happen%3F)
- [What is the difference between a transport model and a domain model?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/What-is-the-difference-between-a-transport-model-and-a-domain-model%3F)
- [When is hand-written JSON conversion sufficient?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/When-is-hand-written-JSON-conversion-sufficient%3F)
- [When is code generation worth adding to a project?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/When-is-code-generation-worth-adding-to-a-project%3F)
- [How do Freezed and JSON Serializable work together?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/How-do-Freezed-and-JSON-Serializable-work-together%3F)
- [Why are annotation packages separate from generator packages?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Why-are-annotation-packages-separate-from-generator-packages%3F)
- [Should every model be immutable?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Should-every-model-be-immutable%3F)
- [How are missing, null, and default values different?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/How-are-missing%2C-null%2C-and-default-values-different%3F)
- [How should unknown enum values and fields be handled?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/How-should-unknown-enum-values-and-fields-be-handled%3F)
- [When should a custom converter be introduced?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/When-should-a-custom-converter-be-introduced%3F)
- [How should nested objects, collections, generics, and inheritance be mapped?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/How-should-nested-objects%2C-collections%2C-generics%2C-and-inheritance-be-mapped%3F)
- [What makes two model instances equal?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/What-makes-two-model-instances-equal%3F)
- [When should sealed unions represent model or state variants?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/When-should-sealed-unions-represent-model-or-state-variants%3F)
- [How should generated files be kept current in development and CI?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/How-should-generated-files-be-kept-current-in-development-and-CI%3F)
- [How can serialization remain compatible as an API or stored schema evolves?](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/How-can-serialization-remain-compatible-as-an-API-or-stored-schema-evolves%3F)

## Best Practices

- [Keep wire-format models at data boundaries](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Keep-wire-format-models-at-data-boundaries)
- [Separate transport models from domain models when their responsibilities differ](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Separate-transport-models-from-domain-models-when-their-responsibilities-differ)
- [Make nullability, required fields, and defaults explicit](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Make-nullability%2C-required-fields%2C-and-defaults-explicit)
- [Map external field names deliberately instead of leaking them into domain naming](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Map-external-field-names-deliberately-instead-of-leaking-them-into-domain-naming)
- [Treat absent values and explicit `null` values according to the data contract](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Treat-absent-values-and-explicit-null-values-according-to-the-data-contract)
- [Use custom converters for repeated non-primitive mappings](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Use-custom-converters-for-repeated-non-primitive-mappings)
- [Define a deliberate policy for unknown enum values and forward-compatible fields](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Define-a-deliberate-policy-for-unknown-enum-values-and-forward-compatible-fields)
- [Validate semantic constraints after syntactic deserialization](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Validate-semantic-constraints-after-syntactic-deserialization)
- [Keep generated files reproducible from committed declarations and configuration](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Keep-generated-files-reproducible-from-committed-declarations-and-configuration)
- [Run generation after changing models, annotations, or schemas](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Run-generation-after-changing-models%2C-annotations%2C-or-schemas)
- [Fail CI when generated output is stale](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Fail-CI-when-generated-output-is-stale)
- [Never edit generated files by hand](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Never-edit-generated-files-by-hand)
- [Pin compatible generator, annotation, and runtime package versions](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Pin-compatible-generator%2C-annotation%2C-and-runtime-package-versions)
- [Avoid mixing multiple generation systems on one model without a clear need](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Avoid-mixing-multiple-generation-systems-on-one-model-without-a-clear-need)
- [Prefer immutable collections when the containing model promises immutability](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Prefer-immutable-collections-when-the-containing-model-promises-immutability)
- [Include every identity-defining field in value equality](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Include-every-identity-defining-field-in-value-equality)
- [Keep secrets and sensitive fields out of logs, diagnostics, and accidental serialization](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Keep-secrets-and-sensitive-fields-out-of-logs%2C-diagnostics%2C-and-accidental-serialization)
- [Test round trips, malformed payloads, missing fields, nulls, and unknown values](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Test-round-trips%2C-malformed-payloads%2C-missing-fields%2C-nulls%2C-and-unknown-values)
- [Add migration or compatibility tests for persisted data and versioned APIs](https://app.syntblaze.com/qsp/flutter/Packages/Serialization-and-Model-Code-Generation/Add-migration-or-compatibility-tests-for-persisted-data-and-versioned-APIs)

[< Back to packages](../README.md)
