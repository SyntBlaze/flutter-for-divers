# Serialization

Serialization defines how application data crosses representation boundaries:
between Dart objects, JSON-compatible values, text payloads, persistence, and
domain models. Dart's `dart:convert` library supplies JSON encoding and
decoding, while application-specific `fromJson` and `toJson` contracts make
the meaning, validation, and evolution of each payload explicit.

```text
HTTP body / stored text
         |
         v
   jsonDecode()
         |
         v
Map<String, Object?> / List<Object?>
         |
         +----> DTO.fromJson() ----> Mapper ----> Entity
         |                              |
         |                              +----> sealed response model
         |
         +<--- DTO.toJson() <----- Mapper <----- Entity
         |
         v
   jsonEncode()
         |
         v
HTTP body / stored text
```

Keep syntax conversion separate from application meaning. `jsonDecode`
parses text into dynamic JSON-shaped values, but it does not validate that a
payload satisfies an API contract. A DTO should own transport-specific fields
and parsing rules; an entity should express domain meaning; and a mapper should
make the translation between them deliberate. This separation limits the
impact of wire-format changes and keeps domain code independent of JSON.

Model success, expected failures, and exceptional protocol states explicitly.
Sealed response models can make exhaustive handling possible, but they should
not become a generic wrapper that erases useful error details. Decide where
validation occurs, how unknown or missing fields are handled, and how backward
compatibility is maintained before generated or handwritten serialization is
shared across layers.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Serialization) — Focused, bite-sized article covering Serialization
- [Learning Path](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Serialization) — Step-by-step material that builds practical Serialization knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Serialization) — Structured, in-depth material for learning about Serialization thoroughly

## Serialization Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `dart:convert` | Provides codecs for JSON, UTF-8, Base64, and related conversions | Import only the standard codecs needed and distinguish text encoding from structured-data serialization | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Serialization/dart-convert "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Serialization/dart-convert "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Serialization/dart-convert "Deep Dive") |
| `jsonEncode` | Converts a JSON-compatible Dart object graph into a JSON string | Values must be directly encodable or expose an intentional conversion through `toEncodable` or `toJson` | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Serialization/jsonEncode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Serialization/jsonEncode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Serialization/jsonEncode "Deep Dive") |
| `jsonDecode` | Parses a JSON string into Dart lists, maps, scalars, or null | Treat the result as untrusted dynamic data until its shape and field types are validated | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Serialization/jsonDecode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Serialization/jsonDecode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Serialization/jsonDecode "Deep Dive") |
| `fromJson` | Constructs a typed model from a decoded JSON object | Define behavior for missing, null, unknown, malformed, and versioned fields rather than relying on casts alone | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Serialization/fromJson "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Serialization/fromJson "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Serialization/fromJson "Deep Dive") |
| `toJson` | Projects a typed model into a JSON-compatible representation | Keep output keys and null-handling aligned with the external contract, not merely the Dart field layout | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Serialization/toJson "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Serialization/toJson "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Serialization/toJson "Deep Dive") |
| DTO | Represents a transport- or persistence-specific data contract | Keep wire names, nullable compatibility fields, and serialization concerns out of domain entities | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Serialization/DTO "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Serialization/DTO "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Serialization/DTO "Deep Dive") |
| Entity | Represents stable domain meaning and invariants | Prefer domain types that remain useful even when the server schema or storage format changes | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Serialization/Entity "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Serialization/Entity "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Serialization/Entity "Deep Dive") |
| Mapper | Translates deliberately between DTOs, entities, and other representations | Centralize lossy conversions, defaults, normalization, and error policy so they can be tested directly | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Serialization/Mapper "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Serialization/Mapper "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Serialization/Mapper "Deep Dive") |
| sealed response models | Represents a closed set of response outcomes with distinct typed data | Preserve actionable failure information and use exhaustive matching so new variants cannot be silently ignored | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Serialization/sealed-response-models "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Serialization/sealed-response-models "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Serialization/sealed-response-models "Deep Dive") |

## Questions

- [Which conversions belong to `dart:convert`, and which belong to application models?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Which-conversions-belong-to-dart%3Aconvert%2C-and-which-belong-to-application-models%3F)
- [Which Dart values can `jsonEncode` serialize without a custom conversion?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Which-Dart-values-can-jsonEncode-serialize-without-a-custom-conversion%3F)
- [Why must a `jsonDecode` result be validated before fields are cast or consumed?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Why-must-a-jsonDecode-result-be-validated-before-fields-are-cast-or-consumed%3F)
- [How should `fromJson` distinguish absent, explicit null, malformed, and unknown fields?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/How-should-fromJson-distinguish-absent%2C-explicit-null%2C-malformed%2C-and-unknown-fields%3F)
- [Should `toJson` omit null values, emit them, or reject incomplete models?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Should-toJson-omit-null-values%2C-emit-them%2C-or-reject-incomplete-models%3F)
- [When does a separate DTO protect the application from an external schema?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/When-does-a-separate-DTO-protect-the-application-from-an-external-schema%3F)
- [Which invariants should an entity enforce independently of transport data?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Which-invariants-should-an-entity-enforce-independently-of-transport-data%3F)
- [Where should a mapper normalize values or turn malformed data into typed failures?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Where-should-a-mapper-normalize-values-or-turn-malformed-data-into-typed-failures%3F)
- [Which success, empty, unauthorized, validation, unavailable, and unexpected outcomes deserve sealed variants?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Which-success%2C-empty%2C-unauthorized%2C-validation%2C-unavailable%2C-and-unexpected-outcomes-deserve-sealed-variants%3F)
- [How will old application versions behave when a service adds fields or changes optionality?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/How-will-old-application-versions-behave-when-a-service-adds-fields-or-changes-optionality%3F)
- [Which serialization failures should be logged, reported, retried, or shown to a user?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Which-serialization-failures-should-be-logged%2C-reported%2C-retried%2C-or-shown-to-a-user%3F)

## Best Practices

- [Use `dart:convert` for representation conversion, not as schema validation](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Use-dart%3Aconvert-for-representation-conversion%2C-not-as-schema-validation)
- [Pass only JSON-compatible values to `jsonEncode` and keep custom conversion explicit](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Pass-only-JSON-compatible-values-to-jsonEncode-and-keep-custom-conversion-explicit)
- [Validate decoded container shapes and field types at the system boundary](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Validate-decoded-container-shapes-and-field-types-at-the-system-boundary)
- [Make `fromJson` parsing policy consistent and cover malformed payloads with tests](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Make-fromJson-parsing-policy-consistent-and-cover-malformed-payloads-with-tests)
- [Keep `toJson` output deterministic and aligned with the documented wire contract](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Keep-toJson-output-deterministic-and-aligned-with-the-documented-wire-contract)
- [Use DTOs to isolate transport naming, compatibility, and optional fields](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Use-DTOs-to-isolate-transport-naming%2C-compatibility%2C-and-optional-fields)
- [Keep entities focused on domain meaning, valid state, and behavior](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Keep-entities-focused-on-domain-meaning%2C-valid-state%2C-and-behavior)
- [Write pure, deterministic mappers and test both normal and lossy conversions](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Write-pure%2C-deterministic-mappers-and-test-both-normal-and-lossy-conversions)
- [Use sealed response variants for a finite set of outcomes that callers must handle](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Use-sealed-response-variants-for-a-finite-set-of-outcomes-that-callers-must-handle)
- [Avoid passing `dynamic` JSON maps beyond the boundary layer](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Avoid-passing-dynamic-JSON-maps-beyond-the-boundary-layer)
- [Preserve unknown-field tolerance when compatible APIs may evolve independently](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Preserve-unknown-field-tolerance-when-compatible-APIs-may-evolve-independently)
- [Never log complete payloads when they may contain credentials or personal data](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Never-log-complete-payloads-when-they-may-contain-credentials-or-personal-data)
- [Test round trips only where bidirectional equivalence is actually part of the contract](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Serialization/Test-round-trips-only-where-bidirectional-equivalence-is-actually-part-of-the-contract)

[< Back to data networking & storage](../README.md)
