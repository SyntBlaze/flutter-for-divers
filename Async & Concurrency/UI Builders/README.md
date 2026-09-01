# UI Builders

Flutter's asynchronous builder widgets translate changing sources into widget
subtrees. `FutureBuilder` observes one eventual completion, `StreamBuilder`
observes a sequence of events, and `ValueListenableBuilder` reacts to a
synchronously available value plus change notifications. The builder callback
does not own the work itself: it receives the latest state and decides what the
interface should show.

```text
Future --------------------> FutureBuilder --+
Stream --------------------> StreamBuilder ---+--> builder --> loading / empty
                                                |              error / data UI
ValueListenable --> ValueListenableBuilder ----+

FutureBuilder / StreamBuilder
              |
              +--> AsyncSnapshot(data, error, connectionState)
                               |
                               +--> none -> waiting -> active* -> done

* `active` is normally observed while a stream is producing events; a future
  progresses from `waiting` to `done`.
```

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders) — Focused, bite-sized article covering UI Builders
- [Learning Path](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders) — Step-by-step material that builds practical UI Builders knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders) — Structured, in-depth material for learning about UI Builders thoroughly

## Source and Snapshot Guidance

Obtain a future or stream before `build`, such as in `initState`,
`didChangeDependencies`, or `didUpdateWidget`. Creating it inline can restart
network calls, parsing, or subscriptions whenever an ancestor rebuilds. When an
input changes, replace the source intentionally and make stale-result handling
part of the surrounding state design. The framework schedules builds according
to the rendering pipeline, so a builder can receive a timing-dependent
subsequence of source transitions rather than one build per event.

Read `AsyncSnapshot` as a state description, not as a single boolean. Its
`connectionState` reports the source relationship, while `data` and `error`
report the latest payload. Existing data can remain present while a replacement
source is waiting, and `hasData` is false for a successful `null` result.
Therefore, choose rendering rules from the complete snapshot and the domain's
own meaning of empty rather than treating `!hasData` as loading.

`ValueListenableBuilder` differs from the asynchronous snapshot builders. A
`ValueListenable<T>` always exposes a current `value`, and the builder receives
that value directly after each notification. Use its `child` parameter for
value-independent UI so that expensive invariant subtrees are not rebuilt.
Keep all builder callbacks inexpensive and free of side effects: rendering may
happen often and is not a reliable place to start requests, mutate state, or
perform navigation.

## UI State Guidance

Loading, empty, error, and data are application presentation states, not four
mutually exclusive `ConnectionState` values. Loading usually means a source is
waiting and no usable content is available. Empty means an operation completed
successfully but its domain result contains nothing to display. Error means the
latest operation failed, although an interface may retain stale data alongside
an error or retry control. Data means useful content is available, potentially
while a refresh remains in progress.

Design these states together so the layout remains stable and accessible.
Reserve progress indicators for work that is actually pending, distinguish an
empty result from a failure, provide an actionable retry path when appropriate,
and preserve useful content during refreshes when that matches the product's
semantics. Tests should cover source replacement, successful `null`, empty
collections, errors, completion, and disposal—not only the happy path.

## UI Builders Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `FutureBuilder` | Builds from the latest interaction with one `Future` | Keep the future stable across unrelated rebuilds and handle waiting, completion, data, and error deliberately | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/FutureBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/FutureBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/FutureBuilder "Deep Dive") |
| `StreamBuilder` | Builds from the latest events and lifecycle of a `Stream` | Account for repeated values, errors, completion, and intentional stream replacement | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/StreamBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/StreamBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/StreamBuilder "Deep Dive") |
| `ValueListenableBuilder` | Rebuilds with the current value of a `ValueListenable<T>` | Pass invariant UI through `child` and let the widget manage listener attachment | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/ValueListenableBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/ValueListenableBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/ValueListenableBuilder "Deep Dive") |
| `AsyncSnapshot` | Describes connection state plus the latest data or error | Interpret all fields together; `hasData`, `hasError`, and `connectionState` answer different questions | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/AsyncSnapshot "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/AsyncSnapshot "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/AsyncSnapshot "Deep Dive") |
| `ConnectionState.none` | Indicates that no asynchronous source is connected | Render an intentional idle or unconfigured state instead of assuming work is pending | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.none "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.none "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.none "Deep Dive") |
| `ConnectionState.waiting` | Indicates that a source is connected and awaiting asynchronous interaction | Decide whether to show initial loading or retain previously available content | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.waiting "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.waiting "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.waiting "Deep Dive") |
| `ConnectionState.active` | Indicates that a stream is connected and may continue producing events | Treat the current event as an intermediate value unless domain semantics say otherwise | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.active "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.active "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.active "Deep Dive") |
| `ConnectionState.done` | Indicates that a future or stream has terminated | Inspect data and error as well as completion; done does not imply success or non-empty data | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.done "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.done "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.done "Deep Dive") |
| Loading state | Communicates that required content is still being obtained | Avoid replacing usable content with a full-screen spinner during every refresh | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/Loading-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/Loading-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/Loading-state "Deep Dive") |
| Empty state | Communicates successful completion with no domain content to show | Define emptiness from the result type and offer a useful next action where possible | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/Empty-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/Empty-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/Empty-state "Deep Dive") |
| Error state | Communicates failure and supports recovery | Present actionable context, preserve safe existing data, and make retry behavior explicit | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/Error-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/Error-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/Error-state "Deep Dive") |
| Data state | Presents usable current or cached content | Keep refresh and staleness indicators separate from whether content can be rendered | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/Data-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/Data-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/Data-state "Deep Dive") |

## Questions

- [Where should a `Future` be created so a rebuild does not restart its work?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Where-should-a-Future-be-created-so-a-rebuild-does-not-restart-its-work%3F)
- [How do stream events, errors, source changes, and closure affect a `StreamBuilder`?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/How-do-stream-events%2C-errors%2C-source-changes%2C-and-closure-affect-a-StreamBuilder%3F)
- [When is `ValueListenableBuilder` preferable to registering a listener manually?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/When-is-ValueListenableBuilder-preferable-to-registering-a-listener-manually%3F)
- [Why must `connectionState`, `data`, `error`, `hasData`, and `hasError` be interpreted together?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Why-must-connectionState%2C-data%2C-error%2C-hasData%2C-and-hasError-be-interpreted-together%3F)
- [When can a builder produce `ConnectionState.none`, and what should the UI show?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/When-can-a-builder-produce-ConnectionState.none%2C-and-what-should-the-UI-show%3F)
- [How should the UI distinguish initial waiting from a refresh with existing data?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/How-should-the-UI-distinguish-initial-waiting-from-a-refresh-with-existing-data%3F)
- [Why is `ConnectionState.active` associated mainly with streams rather than futures?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Why-is-ConnectionState.active-associated-mainly-with-streams-rather-than-futures%3F)
- [Why does `ConnectionState.done` not by itself mean that usable data exists?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Why-does-ConnectionState.done-not-by-itself-mean-that-usable-data-exists%3F)
- [When should loading replace the whole screen, and when should it be an unobtrusive refresh indicator?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/When-should-loading-replace-the-whole-screen%2C-and-when-should-it-be-an-unobtrusive-refresh-indicator%3F)
- [How should an app distinguish a valid empty result from loading, `null`, or failure?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/How-should-an-app-distinguish-a-valid-empty-result-from-loading%2C-null%2C-or-failure%3F)
- [What information and recovery actions make an asynchronous error state useful?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/What-information-and-recovery-actions-make-an-asynchronous-error-state-useful%3F)
- [How can a data state communicate refreshing or stale content without hiding it?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/How-can-a-data-state-communicate-refreshing-or-stale-content-without-hiding-it%3F)

## Best Practices

- [Acquire and replace futures outside `build` so incidental rebuilds do not duplicate work](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Acquire-and-replace-futures-outside-build-so-incidental-rebuilds-do-not-duplicate-work)
- [Keep stream identity stable and model errors, completion, and source changes explicitly](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Keep-stream-identity-stable-and-model-errors%2C-completion%2C-and-source-changes-explicitly)
- [Use `ValueListenableBuilder.child` for subtrees that do not depend on the current value](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Use-ValueListenableBuilder.child-for-subtrees-that-do-not-depend-on-the-current-value)
- [Treat an `AsyncSnapshot` as immutable state and avoid reducing it to only `hasData`](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Treat-an-AsyncSnapshot-as-immutable-state-and-avoid-reducing-it-to-only-hasData)
- [Provide a meaningful idle presentation when no source is configured](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Provide-a-meaningful-idle-presentation-when-no-source-is-configured)
- [Preserve usable prior content while waiting for a refresh when product semantics allow it](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Preserve-usable-prior-content-while-waiting-for-a-refresh-when-product-semantics-allow-it)
- [Expect multiple active stream updates without assuming every event produces a separate frame](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Expect-multiple-active-stream-updates-without-assuming-every-event-produces-a-separate-frame)
- [Check completion data and errors independently rather than equating done with success](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Check-completion-data-and-errors-independently-rather-than-equating-done-with-success)
- [Use progress indicators only for pending work and preserve layout stability](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Use-progress-indicators-only-for-pending-work-and-preserve-layout-stability)
- [Define empty results in domain terms and give users a relevant next step](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Define-empty-results-in-domain-terms-and-give-users-a-relevant-next-step)
- [Show concise failure context, expose safe retry, and avoid retry loops](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Show-concise-failure-context%2C-expose-safe-retry%2C-and-avoid-retry-loops)
- [Render useful data consistently while representing freshness separately](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Render-useful-data-consistently-while-representing-freshness-separately)
- [Keep builder callbacks pure, fast, and free of request-starting side effects](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Keep-builder-callbacks-pure%2C-fast%2C-and-free-of-request-starting-side-effects)
- [Test initial, loading, empty, error, data, refresh, source replacement, and disposal paths](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/UI-Builders/Test-initial%2C-loading%2C-empty%2C-error%2C-data%2C-refresh%2C-source-replacement%2C-and-disposal-paths)

[< Back to Async & Concurrency](../README.md)
