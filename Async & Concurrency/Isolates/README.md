# Isolates

Dart isolates provide independent execution contexts with their own event loops
and isolated mutable state. They communicate through messages instead of
sharing mutable objects. In Flutter, this makes isolates useful for measured
CPU-bound work that would otherwise occupy the UI isolate long enough to delay
input, animation, layout, or painting. An isolate is not a replacement for
ordinary asynchronous I/O: awaiting a non-blocking network or file operation
already lets the current isolate process other events.

```text
root / UI isolate                         background isolate
-----------------                        ------------------
widgets, input, frames                    CPU-bound function
        |                                         |
        | SendPort: request + sendable data       |
        +---------------------------------------->|
        |                                         | parse / transform
        | ReceivePort: result or failure          |
        |<----------------------------------------+
        |
        v
update application state, if still relevant
```

Choose the smallest abstraction that fits the lifetime of the work.
`Isolate.run()` is a concise Dart API for one computation and one result.
Flutter's `compute()` offers a similarly shaped helper, but its platform
behavior matters: native platforms can run the callback in a background
isolate, while the web implementation runs it on the current event loop and
does not provide parallel CPU execution. Use `Isolate.spawn`, `ReceivePort`,
and `SendPort` when a worker must process multiple requests, stream progress,
or remain alive beyond one result.

Isolation has costs. Creating an isolate, serializing or copying messages, and
coordinating results may cost more than a small computation. Message values
must be sendable, and a callback can accidentally capture a much larger object
graph than its visible parameters suggest. `TransferableTypedData` is useful
for moving large byte buffers without copying their contents at send time, but
the sender gives up access and the receiver must materialize the data.

Background isolates cannot touch the widget tree or assume access to
root-isolate-only Flutter state. Platform plugins require special care. A
background isolate that uses platform channels may need registration with the
root isolate's token through `BackgroundIsolateBinaryMessenger`, and
background messengers cannot receive arbitrary unsolicited host messages.
Some plugins also impose their own isolate or platform-thread restrictions, so
their documentation and behavior on every target platform remain authoritative.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates) — Focused, bite-sized article covering Isolates
- [Learning Path](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates) — Step-by-step material that builds practical Isolates knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates) — Structured, in-depth material for learning about Isolates thoroughly

## Isolate Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Isolate` | Represents an independent Dart execution context with its own event loop and mutable state | Manage startup, errors, exit, and termination explicitly when using a long-lived isolate | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/Isolate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/Isolate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/Isolate "Deep Dive") |
| `Isolate.run()` | Runs one callback in a new isolate and completes with its result | Prefer it for one-shot CPU work, and keep the callback's captured object graph small and sendable | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/Isolate.run-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/Isolate.run-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/Isolate.run-method "Deep Dive") |
| `compute()` | Runs a top-level or static-style callback with one message and one result through Flutter's convenience API | It provides background execution on native targets but runs on the current event loop on web | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/compute-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/compute-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/compute-method "Deep Dive") |
| `ReceivePort` | Receives messages as a single-subscription stream | Close ports that are no longer needed so they do not retain resources or keep a worker protocol alive | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/ReceivePort "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/ReceivePort "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/ReceivePort "Deep Dive") |
| `SendPort` | Sends asynchronous messages to the isolate that owns the corresponding receive port | Send only supported values and design an explicit request, result, error, and shutdown protocol | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/SendPort "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/SendPort "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/SendPort "Deep Dive") |
| `TransferableTypedData` | Transfers ownership of large typed byte data between isolates efficiently | The sent transferable can no longer be materialized by the sender, and the receiver can materialize it only once | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/TransferableTypedData "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/TransferableTypedData "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/TransferableTypedData "Deep Dive") |
| Background parsing | Moves sufficiently expensive decoding and model transformation away from frame-critical work | Measure parsing and transfer costs together; small payloads may be faster on the UI isolate | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/Background-parsing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/Background-parsing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/Background-parsing "Deep Dive") |
| CPU-bound work | Uses sustained computation rather than waiting on an external resource | Offload work only when profiling shows it threatens responsiveness, and split or cancel work when practical | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/CPU-bound-work "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/CPU-bound-work "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/CPU-bound-work "Deep Dive") |
| Message passing | Coordinates isolated state through asynchronous, sendable values | Include correlation IDs and structured failures when multiple operations can overlap or finish out of order | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/Message-passing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/Message-passing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/Message-passing "Deep Dive") |
| Plugin restrictions in background isolates | Defines which Flutter and platform-channel capabilities are available away from the root isolate | Initialize the background messenger when required and verify each plugin's isolate and platform constraints | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/Plugin-restrictions-in-background-isolates "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/Plugin-restrictions-in-background-isolates "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/Plugin-restrictions-in-background-isolates "Deep Dive") |

## Questions

- [What state and execution resources are isolated from the root isolate?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/What-state-and-execution-resources-are-isolated-from-the-root-isolate%3F)
- [When is `Isolate.run()` preferable to creating and managing a long-lived worker?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/When-is-Isolate.run()-preferable-to-creating-and-managing-a-long-lived-worker%3F)
- [How does `compute()` behave differently on native platforms and the web?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/How-does-compute()-behave-differently-on-native-platforms-and-the-web%3F)
- [Why should every manually created `ReceivePort` have a clear owner and close condition?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Why-should-every-manually-created-ReceivePort-have-a-clear-owner-and-close-condition%3F)
- [Which values can cross a `SendPort`, and how should protocol failures be represented?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Which-values-can-cross-a-SendPort%2C-and-how-should-protocol-failures-be-represented%3F)
- [When does `TransferableTypedData` reduce the cost of sending a large binary payload?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/When-does-TransferableTypedData-reduce-the-cost-of-sending-a-large-binary-payload%3F)
- [How large must a parsing workload be before isolate startup and message transfer are worthwhile?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/How-large-must-a-parsing-workload-be-before-isolate-startup-and-message-transfer-are-worthwhile%3F)
- [Why does asynchronous I/O usually not require a background isolate?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Why-does-asynchronous-I%2FO-usually-not-require-a-background-isolate%3F)
- [How can request IDs prevent replies from being applied to the wrong or stale operation?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/How-can-request-IDs-prevent-replies-from-being-applied-to-the-wrong-or-stale-operation%3F)
- [How is a background isolate registered to send platform-channel messages through Flutter?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/How-is-a-background-isolate-registered-to-send-platform-channel-messages-through-Flutter%3F)
- [Which errors and exit events must a long-lived isolate report to its owner?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Which-errors-and-exit-events-must-a-long-lived-isolate-report-to-its-owner%3F)
- [What data is copied, shared as immutable state, or transferred when it crosses an isolate boundary?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/What-data-is-copied%2C-shared-as-immutable-state%2C-or-transferred-when-it-crosses-an-isolate-boundary%3F)

## Best Practices

- [Profile first and reserve isolates for CPU work that materially affects responsiveness](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Profile-first-and-reserve-isolates-for-CPU-work-that-materially-affects-responsiveness)
- [Use `Isolate.run()` for finite one-shot computations with a single result](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Use-Isolate.run()-for-finite-one-shot-computations-with-a-single-result)
- [Use `compute()` only with an explicit understanding of its native and web behavior](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Use-compute()-only-with-an-explicit-understanding-of-its-native-and-web-behavior)
- [Reuse a long-lived worker only when repeated work justifies its lifecycle and protocol complexity](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Reuse-a-long-lived-worker-only-when-repeated-work-justifies-its-lifecycle-and-protocol-complexity)
- [Keep isolate entry points, arguments, return values, and captured state small and sendable](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Keep-isolate-entry-points%2C-arguments%2C-return-values%2C-and-captured-state-small-and-sendable)
- [Close receive ports and terminate workers through an intentional shutdown path](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Close-receive-ports-and-terminate-workers-through-an-intentional-shutdown-path)
- [Define structured request, success, failure, progress, and shutdown messages](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Define-structured-request%2C-success%2C-failure%2C-progress%2C-and-shutdown-messages)
- [Add request identifiers when more than one operation may be in flight](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Add-request-identifiers-when-more-than-one-operation-may-be-in-flight)
- [Use `TransferableTypedData` for measured large-byte transfer bottlenecks and respect ownership transfer](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Use-TransferableTypedData-for-measured-large-byte-transfer-bottlenecks-and-respect-ownership-transfer)
- [Combine decoding and expensive transformation in the worker to avoid unnecessary intermediate messages](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Combine-decoding-and-expensive-transformation-in-the-worker-to-avoid-unnecessary-intermediate-messages)
- [Keep widget, render, and UI state access on the root isolate](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Keep-widget%2C-render%2C-and-UI-state-access-on-the-root-isolate)
- [Initialize background platform messaging correctly and confirm that every plugin supports the intended isolate](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Initialize-background-platform-messaging-correctly-and-confirm-that-every-plugin-supports-the-intended-isolate)
- [Handle worker errors, exits, cancellation intent, and stale results as part of the calling lifecycle](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Handle-worker-errors%2C-exits%2C-cancellation-intent%2C-and-stale-results-as-part-of-the-calling-lifecycle)
- [Benchmark isolate startup, computation, message transfer, and end-to-end latency on representative devices](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Isolates/Benchmark-isolate-startup%2C-computation%2C-message-transfer%2C-and-end-to-end-latency-on-representative-devices)

[< Back to Async & Concurrency](../README.md)
