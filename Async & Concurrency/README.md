# Flutter Async & Concurrency

A practical index of Dart and Flutter asynchronous programming: one-shot
futures, event streams, reactive UI builders, event-loop scheduling, isolate
boundaries, and lifecycle-safe coordination. Browse a category below, then
open a topic for focused notes and examples.

```text
asynchronous source
        |
        +--> one result ------> Future
        +--> many events -----> Stream
        +--> CPU-heavy work --> Isolate (Dart Native)
        |
        v
event loop / frame scheduling
        |
        v
lifecycle-safe state ---------> UI builder
```

Concurrency in Dart is primarily about interleaving asynchronous work on an
isolate's event loop. It does not imply that work runs in parallel. Futures and
streams keep I/O and other waiting operations composable, but synchronous
callbacks still occupy the current isolate and can delay input and frames. On
Dart Native, use an isolate when CPU-bound work must execute in parallel, then
cross the isolate boundary with explicit messages. Dart web does not support
isolates, and Flutter's `compute()` runs on the current event loop there rather
than providing parallel CPU execution.

Flutter adds two responsibilities: translate asynchronous outcomes into
deliberate loading, empty, error, and data states; and prevent late callbacks
from outliving the widget, controller, subscription, or request that owns them.
Treat cancellation, disposal, request identity, and stale-result prevention as
part of an asynchronous API's design rather than cleanup added afterward.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency) — Focused, bite-sized article covering Flutter Async & Concurrency
- [Learning Path](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency) — Step-by-step material that builds practical Flutter Async & Concurrency knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency) — Structured, in-depth material for learning about Flutter Async & Concurrency thoroughly

## At a glance

- [Futures](Futures/README.md) — Compose one eventual value or error
- [Streams](Streams/README.md) — Produce, transform, consume, and stop asynchronous event sequences
- [UI Builders](<UI Builders/README.md>) — Render asynchronous source and presentation states safely
- [Event Loop](<Event Loop/README.md>) — Understand task ordering, timers, frames, and UI blocking
- [Isolates](Isolates/README.md) — Move CPU-bound work across memory-isolated workers on native platforms
- [Lifecycle Safety](<Lifecycle Safety/README.md>) — Prevent leaks, stale updates, duplicate work, and timing races

## Futures [>](Futures/README.md)

| Topic | Focus | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| `Future` | Represent one eventual value or error | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Future "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Future "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Future "Deep Dive") |
| `FutureOr` | Accept either an immediate or eventual result | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/FutureOr "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/FutureOr "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/FutureOr "Deep Dive") |
| `Completer` | Bridge externally driven completion into a future | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Completer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Completer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Completer "Deep Dive") |
| `async` | Define a function with asynchronous completion semantics | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/async "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/async "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/async "Deep Dive") |
| `await` | Suspend an asynchronous function without blocking its isolate | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/await "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/await "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/await "Deep Dive") |
| `then()` | Transform a successful completion | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/then-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/then-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/then-method "Deep Dive") |
| `catchError()` | Handle a failure in a future chain | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/catchError-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/catchError-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/catchError-method "Deep Dive") |
| `whenComplete()` | Run cleanup after either outcome | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/whenComplete-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/whenComplete-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/whenComplete-method "Deep Dive") |
| `Future.wait()` | Collect a group of future results | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Future.wait-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Future.wait-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Future.wait-method "Deep Dive") |
| `Future.any()` | Settle from the first future to complete | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Future.any-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Future.any-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Future.any-method "Deep Dive") |
| `Future.delayed()` | Schedule completion after a minimum delay | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Future.delayed-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Future.delayed-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Future.delayed-method "Deep Dive") |
| Timeout | Bound how long a caller waits | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Timeout "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Timeout "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Timeout "Deep Dive") |
| Cancellation pattern | Abandon or supersede work cooperatively | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Cancellation-pattern "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Cancellation-pattern "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Cancellation-pattern "Deep Dive") |

## Streams [>](Streams/README.md)

| Topic | Focus | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| `Stream` | Represent a sequence of asynchronous events | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/Stream "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/Stream "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/Stream "Deep Dive") |
| `StreamController` | Add data, errors, and completion to a stream | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/StreamController "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/StreamController "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/StreamController "Deep Dive") |
| Broadcast stream | Share live events with multiple listeners | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/Broadcast-stream "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/Broadcast-stream "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/Broadcast-stream "Deep Dive") |
| Single-subscription stream | Give one listener ownership of a sequence | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/Single-subscription-stream "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/Single-subscription-stream "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/Single-subscription-stream "Deep Dive") |
| `StreamSubscription` | Control one active listener | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/StreamSubscription "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/StreamSubscription "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/StreamSubscription "Deep Dive") |
| `async*` | Define an asynchronous generator | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/async-star "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/async-star "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/async-star "Deep Dive") |
| `yield` | Emit one generator value | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/yield "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/yield "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/yield "Deep Dive") |
| `yield*` | Forward another stream from a generator | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/yield-star "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/yield-star "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/yield-star "Deep Dive") |
| `listen()` | Subscribe to data, error, and done events | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/listen-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/listen-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/listen-method "Deep Dive") |
| `pause()` | Temporarily stop subscription delivery | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/pause-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/pause-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/pause-method "Deep Dive") |
| `resume()` | Release a subscription pause | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/resume-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/resume-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/resume-method "Deep Dive") |
| `cancel()` | End a subscription and request cleanup | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/cancel-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/cancel-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/cancel-method "Deep Dive") |
| `map()` | Transform each data event | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/map-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/map-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/map-method "Deep Dive") |
| `where()` | Filter data events | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/where-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/where-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/where-method "Deep Dive") |
| `debounce` pattern | Wait for a quiet interval before emitting | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/debounce-pattern "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/debounce-pattern "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/debounce-pattern "Deep Dive") |
| `distinct()` | Suppress consecutive equal events | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/distinct-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/distinct-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/distinct-method "Deep Dive") |

## UI Builders [>](<UI Builders/README.md>)

| Topic | Focus | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| `FutureBuilder` | Build from one future's latest snapshot | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/FutureBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/FutureBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/FutureBuilder "Deep Dive") |
| `StreamBuilder` | Build from a stream's latest snapshot | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/StreamBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/StreamBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/StreamBuilder "Deep Dive") |
| `ValueListenableBuilder` | Build from a synchronous listenable value | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/ValueListenableBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/ValueListenableBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/ValueListenableBuilder "Deep Dive") |
| `AsyncSnapshot` | Describe connection, data, and error state | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/AsyncSnapshot "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/AsyncSnapshot "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/AsyncSnapshot "Deep Dive") |
| `ConnectionState.none` | Represent no connected asynchronous source | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.none "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.none "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.none "Deep Dive") |
| `ConnectionState.waiting` | Represent a connected source awaiting interaction | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.waiting "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.waiting "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.waiting "Deep Dive") |
| `ConnectionState.active` | Represent an active stream connection | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.active "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.active "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.active "Deep Dive") |
| `ConnectionState.done` | Represent a terminated future or stream | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.done "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.done "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/ConnectionState.done "Deep Dive") |
| Loading state | Communicate pending required content | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/Loading-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/Loading-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/Loading-state "Deep Dive") |
| Empty state | Communicate a successful result with no content | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/Empty-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/Empty-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/Empty-state "Deep Dive") |
| Error state | Communicate failure and recovery options | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/Error-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/Error-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/Error-state "Deep Dive") |
| Data state | Present usable current or cached content | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/UI-Builders/Data-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/UI-Builders/Data-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/UI-Builders/Data-state "Deep Dive") |

## Event Loop [>](<Event Loop/README.md>)

| Topic | Focus | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| Event queue | Run timers, I/O completions, and other event tasks | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Event-queue "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Event-queue "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Event-queue "Deep Dive") |
| Microtask queue | Finish high-priority deferred work before the next event | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Microtask-queue "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Microtask-queue "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Microtask-queue "Deep Dive") |
| `scheduleMicrotask()` | Enqueue an explicit microtask | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/scheduleMicrotask-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/scheduleMicrotask-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/scheduleMicrotask-method "Deep Dive") |
| `Future.microtask()` | Run a computation as a future-backed microtask | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Future.microtask-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Future.microtask-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Future.microtask-method "Deep Dive") |
| `Timer` | Schedule a one-shot event callback | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Timer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Timer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Timer "Deep Dive") |
| `Timer.periodic()` | Schedule repeated event callbacks | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Timer.periodic-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Timer.periodic-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Timer.periodic-method "Deep Dive") |
| Frame callback | Run frame-synchronized work | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Frame-callback "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Frame-callback "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Frame-callback "Deep Dive") |
| Post-frame callback | Run one callback after a frame is flushed | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Post-frame-callback "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Post-frame-callback "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Post-frame-callback "Deep Dive") |
| Synchronous work blocking UI | Recognize work that delays input and frames | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Synchronous-work-blocking-UI "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Synchronous-work-blocking-UI "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Synchronous-work-blocking-UI "Deep Dive") |

## Isolates [>](Isolates/README.md)

| Topic | Focus | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| `Isolate` | Run Dart code with separate memory and an event loop on Dart Native | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/Isolate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/Isolate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/Isolate "Deep Dive") |
| `Isolate.run()` | Execute a bounded computation in a worker isolate on Dart Native | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/Isolate.run-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/Isolate.run-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/Isolate.run-method "Deep Dive") |
| `compute()` | Use a worker isolate on native or the current event loop on web | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/compute-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/compute-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/compute-method "Deep Dive") |
| `ReceivePort` | Receive messages from another isolate | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/ReceivePort "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/ReceivePort "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/ReceivePort "Deep Dive") |
| `SendPort` | Send permitted values across an isolate boundary | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/SendPort "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/SendPort "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/SendPort "Deep Dive") |
| `TransferableTypedData` | Transfer large byte buffers efficiently | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/TransferableTypedData "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/TransferableTypedData "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/TransferableTypedData "Deep Dive") |
| Background parsing | Decode large payloads away from the UI isolate | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/Background-parsing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/Background-parsing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/Background-parsing "Deep Dive") |
| CPU-bound work | Identify computation that can justify isolate overhead | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/CPU-bound-work "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/CPU-bound-work "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/CPU-bound-work "Deep Dive") |
| Message passing | Coordinate workers without shared mutable memory | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/Message-passing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/Message-passing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/Message-passing "Deep Dive") |
| Plugin restrictions in background isolates | Account for platform-channel and registration limits | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Isolates/Plugin-restrictions-in-background-isolates "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Isolates/Plugin-restrictions-in-background-isolates "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Isolates/Plugin-restrictions-in-background-isolates "Deep Dive") |

## Lifecycle Safety [>](<Lifecycle Safety/README.md>)

| Topic | Focus | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| `mounted` | Check whether a `State` remains in the tree | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/mounted "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/mounted "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/mounted "Deep Dive") |
| `context.mounted` | Check whether a build context remains mounted | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/context.mounted "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/context.mounted "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/context.mounted "Deep Dive") |
| Disposing subscriptions | Stop listeners owned by a lifecycle object | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-subscriptions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-subscriptions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-subscriptions "Deep Dive") |
| Disposing controllers | Release controller-owned resources | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-controllers "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-controllers "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-controllers "Deep Dive") |
| Avoiding setState after dispose | Prevent late callbacks from mutating dead state | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Avoiding-setState-after-dispose "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Avoiding-setState-after-dispose "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Avoiding-setState-after-dispose "Deep Dive") |
| Race condition handling | Make competing completion order explicit | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Race-condition-handling "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Race-condition-handling "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Race-condition-handling "Deep Dive") |
| Request deduplication | Share or suppress equivalent in-flight work | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Request-deduplication "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Request-deduplication "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Request-deduplication "Deep Dive") |
| Stale response prevention | Reject results from superseded operations | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Stale-response-prevention "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Stale-response-prevention "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Stale-response-prevention "Deep Dive") |
| Debounced actions | Wait for an input quiet period before acting | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Debounced-actions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Debounced-actions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Debounced-actions "Deep Dive") |
| Throttled actions | Limit how frequently an action can run | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Throttled-actions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Throttled-actions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Throttled-actions "Deep Dive") |

---

> Keep asynchronous ownership explicit. Start work outside rendering, propagate
> failures, dispose resources at the matching lifecycle boundary, ignore stale
> completions, and, on supported native platforms, move only genuinely
> CPU-bound work off the UI isolate.
