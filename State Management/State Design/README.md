# State Design

State design defines the valid snapshots an application can hold and the
transitions that move between them. Immutable and sealed models make those
possibilities visible, while explicit loading, error, empty, and success states
prevent unrelated booleans and nullable fields from describing contradictory
conditions.

```text
command
   |
   v
loading ----failure----> error
   |
 success
   |
   +---- no results ---> empty
   |
   +---- data ---------> success
                            |
                            +--> derived selectors --> UI
```

Equality determines whether consumers consider two snapshots meaningfully the
same. A copy-with operation supports focused immutable changes, but it should
preserve invariants and distinguish “leave unchanged” from “set to null.”
Selectors derive small view-facing values from the source snapshot so consumers
do not subscribe to unrelated changes.

Durable state and transient effects are different outputs. Restoration records
values that can recreate state later, while navigation, messages, analytics,
and other one-time effects require controlled delivery and acknowledgement.
Commands can initiate those effects without hiding them inside rendering.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/State-Management/State-Design) — Focused, bite-sized article covering State Design
- [Learning Path](https://app.syntblaze.com/lt/flutter/State-Management/State-Design) — Step-by-step material that builds practical State Design knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/State-Management/State-Design) — Structured, in-depth material for learning about State Design thoroughly

## State Design Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Immutable state | Represents each transition with a replacement snapshot | Prevent mutable children from changing behind an immutable outer object | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Immutable-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Immutable-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Immutable-state "Deep Dive") |
| Sealed state | Defines a closed family of valid state variants | Make consumers handle every meaningful variant and keep shared data intentional | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Sealed-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Sealed-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Sealed-state "Deep Dive") |
| Loading state | Describes required work that is currently pending | Decide whether previous data, progress, cancellation, or request identity remains visible | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Loading-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Loading-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Loading-state "Deep Dive") |
| Error state | Describes a failure the current layer can present or recover from | Preserve actionable context without leaking infrastructure details or secrets | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Error-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Error-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Error-state "Deep Dive") |
| Empty state | Describes a successful result containing no usable items | Keep it distinct from loading, missing data, filtered data, and failure | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Empty-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Empty-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Empty-state "Deep Dive") |
| Success state | Describes a completed operation with usable current data | Record freshness or partial-data metadata when success is not the whole story | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Success-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Success-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Success-state "Deep Dive") |
| Copy with | Creates a modified immutable snapshot from an existing one | Preserve invariants and support nullable fields without ambiguous parameters | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Copy-with "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Copy-with "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Copy-with "Deep Dive") |
| Equality | Defines whether two values represent the same observable state | Include all semantically relevant fields and keep hash behavior consistent | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Equality "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Equality "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Equality "Deep Dive") |
| Derived selectors | Calculate a focused value from authoritative state for a consumer | Keep selectors pure and use stable equality to avoid unnecessary updates | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Derived-selectors "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Derived-selectors "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Derived-selectors "Deep Dive") |
| Command side effects | Runs external actions in response to explicit intent | Keep execution and failure observable instead of initiating effects during build | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Command-side-effects "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Command-side-effects "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Command-side-effects "Deep Dive") |
| One-time events | Represents transient navigation, messaging, or similar effects | Prevent accidental replay, loss, and duplicate handling across rebuilds | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/One-time-events "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/One-time-events "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/One-time-events "Deep Dive") |
| State restoration | Serializes and reconstructs eligible state under restoration scopes | Use stable identifiers, validate restored values, and avoid treating restoration as secure persistence | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/State-restoration "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/State-restoration "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/State-restoration "Deep Dive") |

## Questions

- [Which objects inside an immutable snapshot could still be mutated?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Which-objects-inside-an-immutable-snapshot-could-still-be-mutated%3F)
- [Does a sealed model make every valid state representable and invalid combinations impossible?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Does-a-sealed-model-make-every-valid-state-representable-and-invalid-combinations-impossible%3F)
- [Should loading preserve stale content or replace it?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Should-loading-preserve-stale-content-or-replace-it%3F)
- [What failure information can the UI act on safely?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/What-failure-information-can-the-UI-act-on-safely%3F)
- [How does empty differ from unavailable, filtered, or not yet loaded?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/How-does-empty-differ-from-unavailable%2C-filtered%2C-or-not-yet-loaded%3F)
- [Does success need freshness, pagination, or partial-result metadata?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Does-success-need-freshness%2C-pagination%2C-or-partial-result-metadata%3F)
- [How does a copy-with API distinguish omission from explicitly assigning null?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/How-does-a-copy-with-API-distinguish-omission-from-explicitly-assigning-null%3F)
- [Which fields participate in semantic equality?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Which-fields-participate-in-semantic-equality%3F)
- [Can a selector be computed purely from authoritative state?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Can-a-selector-be-computed-purely-from-authoritative-state%3F)
- [Where are command failures reported?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Where-are-command-failures-reported%3F)
- [How is a one-time event acknowledged and prevented from replaying?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/How-is-a-one-time-event-acknowledged-and-prevented-from-replaying%3F)
- [Which state is eligible for restoration, and under which stable identifier?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Which-state-is-eligible-for-restoration%2C-and-under-which-stable-identifier%3F)

## Best Practices

- [Use replacement snapshots for non-trivial shared state](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Use-replacement-snapshots-for-non-trivial-shared-state)
- [Keep collections inside immutable state unmodifiable or defensively copied](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Keep-collections-inside-immutable-state-unmodifiable-or-defensively-copied)
- [Use sealed variants when states have meaningfully different valid data](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Use-sealed-variants-when-states-have-meaningfully-different-valid-data)
- [Model loading, empty, error, and success explicitly](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Model-loading%2C-empty%2C-error%2C-and-success-explicitly)
- [Preserve prior data during refresh only when the UI can communicate staleness clearly](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Preserve-prior-data-during-refresh-only-when-the-UI-can-communicate-staleness-clearly)
- [Translate failures into actionable, presentation-safe state](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Translate-failures-into-actionable%2C-presentation-safe-state)
- [Make copy-with operations preserve domain invariants](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Make-copy-with-operations-preserve-domain-invariants)
- [Define equality from observable semantics and test it](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Define-equality-from-observable-semantics-and-test-it)
- [Derive view-specific values instead of storing duplicates](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Derive-view-specific-values-instead-of-storing-duplicates)
- [Execute commands outside build and expose their progress and failures](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Execute-commands-outside-build-and-expose-their-progress-and-failures)
- [Give one-time events deliberate delivery and acknowledgement semantics](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Give-one-time-events-deliberate-delivery-and-acknowledgement-semantics)
- [Treat restoration data as reconstructable UI state, not trusted permanent storage](https://app.syntblaze.com/qsp/flutter/State-Management/State-Design/Treat-restoration-data-as-reconstructable-UI-state%2C-not-trusted-permanent-storage)

[< Back to State Management](../README.md)
