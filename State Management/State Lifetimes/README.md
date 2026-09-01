# State Lifetimes

A state's correct owner depends on how long it must remain valid, which events
may end that lifetime, and which consumers need to observe it. A focus flag may
live for one widget instance, a draft may belong to a form or route, and account
data may span the entire signed-in application session.

```text
widget instance < route or form < feature < application session
       |
       +---------------- process restart ----------------+
                                                         v
                                            persisted / restorable state

remote request --> server cache --> derived presentation state
```

Lifetime and storage location are separate choices. Application state can
remain only in memory, route state can be encoded in a URL, and cached server
state may be persisted while still requiring freshness checks. Keep each source
authoritative and derive alternate representations rather than maintaining
several independently mutable copies.

Optimistic state temporarily represents an expected outcome. It needs enough
identity and prior information to confirm, reconcile, or roll back when the
authoritative operation completes. Restorable and persisted state also require
explicit schemas and validation because a later process may recreate them.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes) — Focused, bite-sized article covering State Lifetimes
- [Learning Path](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes) — Step-by-step material that builds practical State Lifetimes knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes) — Structured, in-depth material for learning about State Lifetimes thoroughly

## State Lifetimes Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Ephemeral state | Short-lived presentation state owned near one widget or interaction | Do not promote it to application scope unless distant consumers truly need it | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Ephemeral-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Ephemeral-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Ephemeral-state "Deep Dive") |
| App state | In-memory data shared across application features or shell | Define session reset rules and avoid turning unrelated feature state into one global object | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/App-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/App-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/App-state "Deep Dive") |
| Route state | Data and interaction state associated with one navigation entry | Decide what belongs in route arguments, restorable navigation, or a route-scoped owner | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Route-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Route-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Route-state "Deep Dive") |
| Form state | Editable values, validation, focus, dirtiness, and submission progress | Preserve user input intentionally and clear it only at a defined completion or cancellation boundary | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Form-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Form-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Form-state "Deep Dive") |
| Server cache state | Remote data retained locally with request and freshness metadata | Model loading, stale, refresh, failure, invalidation, and deduplication independently | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Server-cache-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Server-cache-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Server-cache-state "Deep Dive") |
| Persisted state | Durable application data stored across process launches | Version, validate, migrate, and protect stored values according to their sensitivity | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Persisted-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Persisted-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Persisted-state "Deep Dive") |
| Derived state | Values calculated from one or more authoritative sources | Recompute instead of storing a second mutable source that can drift | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Derived-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Derived-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Derived-state "Deep Dive") |
| Optimistic state | A provisional local result shown before authoritative confirmation | Correlate requests and define confirmation, conflict, failure, and rollback behavior | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Optimistic-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Optimistic-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Optimistic-state "Deep Dive") |
| Restorable state | Framework-reconstructable UI state after activity or process recreation | Register eligible values under stable scopes and do not confuse restoration with permanent storage | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Restorable-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Restorable-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Restorable-state "Deep Dive") |

## Questions

- [Which event creates and destroys each piece of state?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Which-event-creates-and-destroys-each-piece-of-state%3F)
- [How can ephemeral state remain local while still being testable?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/How-can-ephemeral-state-remain-local-while-still-being-testable%3F)
- [When should application state reset during sign-out or account switching?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/When-should-application-state-reset-during-sign-out-or-account-switching%3F)
- [Which route values must be addressable or serializable?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Which-route-values-must-be-addressable-or-serializable%3F)
- [How should a form preserve a draft without retaining obsolete controllers?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/How-should-a-form-preserve-a-draft-without-retaining-obsolete-controllers%3F)
- [When is cached server data stale, and can stale data still be displayed?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/When-is-cached-server-data-stale%2C-and-can-stale-data-still-be-displayed%3F)
- [Which persisted values require migration, encryption, or expiry?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Which-persisted-values-require-migration%2C-encryption%2C-or-expiry%3F)
- [Can a value be derived cheaply and reliably from authoritative sources?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Can-a-value-be-derived-cheaply-and-reliably-from-authoritative-sources%3F)
- [What information is required to roll back an optimistic transition?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/What-information-is-required-to-roll-back-an-optimistic-transition%3F)
- [What does Flutter restoration recreate, and what must durable storage handle instead?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/What-does-Flutter-restoration-recreate%2C-and-what-must-durable-storage-handle-instead%3F)

## Best Practices

- [Identify creation, ownership, and destruction events before selecting a mechanism](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Identify-creation%2C-ownership%2C-and-destruction-events-before-selecting-a-mechanism)
- [Keep ephemeral state at widget or feature scope](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Keep-ephemeral-state-at-widget-or-feature-scope)
- [Split unrelated application state by responsibility and lifetime](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Split-unrelated-application-state-by-responsibility-and-lifetime)
- [Make route-scoped owners follow route disposal](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Make-route-scoped-owners-follow-route-disposal)
- [Preserve form drafts deliberately and model submission separately from editing](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Preserve-form-drafts-deliberately-and-model-submission-separately-from-editing)
- [Attach freshness, request identity, and invalidation metadata to server cache state](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Attach-freshness%2C-request-identity%2C-and-invalidation-metadata-to-server-cache-state)
- [Version and validate all persisted schemas](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Version-and-validate-all-persisted-schemas)
- [Derive duplicate views from a single authoritative source](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Derive-duplicate-views-from-a-single-authoritative-source)
- [Give optimistic writes stable identities and deterministic rollback behavior](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Give-optimistic-writes-stable-identities-and-deterministic-rollback-behavior)
- [Reconcile late remote results only with the operation they belong to](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Reconcile-late-remote-results-only-with-the-operation-they-belong-to)
- [Register restorable values in stable restoration scopes](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Register-restorable-values-in-stable-restoration-scopes)
- [Test state across navigation, backgrounding, process recreation, and session reset](https://app.syntblaze.com/qsp/flutter/State-Management/State-Lifetimes/Test-state-across-navigation%2C-backgrounding%2C-process-recreation%2C-and-session-reset)

[< Back to State Management](../README.md)
