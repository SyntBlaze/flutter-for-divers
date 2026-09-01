# Event Loop

Dart code in an isolate runs on one execution thread at a time. Synchronous
code keeps control until its call stack returns; only then can the isolate run
queued asynchronous work. Microtasks have priority over ordinary event-queue
tasks, while Flutter's scheduler coordinates frame callbacks with display
frames. These scheduling mechanisms cooperate on the UI isolate, but they have
different purposes and timing guarantees.

```text
run synchronous callback to completion
                 |
                 v
         drain microtask queue
                 |
                 v
       take one event-queue task  <--- timers, I/O, messages, input
                 |
                 +-------------------- repeat

display vsync ---> frame callback ---> build / layout / paint
                                            |
                                            v
                                  post-frame callbacks
```

An event can enqueue microtasks, so those microtasks run before the next event
is selected. This makes microtasks useful for brief deferred cleanup or state
normalization, but a self-perpetuating microtask chain can starve timers, input,
platform messages, and frame processing. A zero-duration timer still enters the
event queue and therefore does not interrupt synchronous work or jump ahead of
already queued microtasks.

Frame callbacks are driven by Flutter's scheduler rather than by a fixed timer.
They are appropriate for work synchronized with rendering, especially
animation. Post-frame callbacks run after the framework has flushed a frame,
which is useful when work requires completed layout; registering one does not
itself request a new frame. None of these deferral APIs makes CPU-heavy work
parallel. Long parsing, loops, or transformations on the UI isolate can still
delay input and exceed the frame budget even when started from an `async`
function, future callback, timer, or frame callback.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop) — Focused, bite-sized article covering Event Loop
- [Learning Path](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop) — Step-by-step material that builds practical Event Loop knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop) — Structured, in-depth material for learning about Event Loop thoroughly

## Event Loop Topics

| Topic | Place in scheduling | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Event queue | Holds timers, I/O completions, isolate messages, and other asynchronous events | Events wait until current synchronous work and pending microtasks have finished | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Event-queue "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Event-queue "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Event-queue "Deep Dive") |
| Microtask queue | Holds high-priority deferred callbacks within an isolate | It is drained before the next event, so excessive microtasks can starve other work | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Microtask-queue "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Microtask-queue "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Microtask-queue "Deep Dive") |
| `scheduleMicrotask()` | Adds a callback directly to the microtask queue | Reserve it for short work that must precede the next event | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/scheduleMicrotask-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/scheduleMicrotask-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/scheduleMicrotask-method "Deep Dive") |
| `Future.microtask()` | Runs a computation as a microtask and exposes its result as a `Future` | Errors become future errors, and a returned future is flattened into the result | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Future.microtask-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Future.microtask-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Future.microtask-method "Deep Dive") |
| `Timer` | Schedules a one-shot callback after at least the requested duration | The callback can run late when the isolate is busy and must be cancelled when no longer relevant | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Timer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Timer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Timer "Deep Dive") |
| `Timer.periodic()` | Repeatedly schedules timer callbacks until cancellation | Do not assume exact cadence or use it for frame-synchronized animation | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Timer.periodic-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Timer.periodic-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Timer.periodic-method "Deep Dive") |
| Frame callback | Runs work in a scheduler phase associated with a display frame | Keep it short and use scheduler timestamps for animation progress | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Frame-callback "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Frame-callback "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Frame-callback "Deep Dive") |
| Post-frame callback | Runs after the current or next frame has been flushed | It is one-shot, does not request a frame, and may outlive the widget that registered it | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Post-frame-callback "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Post-frame-callback "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Post-frame-callback "Deep Dive") |
| Synchronous work blocking UI | Describes long UI-isolate work that prevents other callbacks from running | Deferring work changes when it starts, not whether it blocks once running | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Event-Loop/Synchronous-work-blocking-UI "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Event-Loop/Synchronous-work-blocking-UI "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Event-Loop/Synchronous-work-blocking-UI "Deep Dive") |

## Questions

- [What must finish before the event loop can process another event?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/What-must-finish-before-the-event-loop-can-process-another-event%3F)
- [Why do microtasks run before the next timer, message, or I/O event?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Why-do-microtasks-run-before-the-next-timer%2C-message%2C-or-I%2FO-event%3F)
- [How can an unbounded microtask chain make the application unresponsive?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/How-can-an-unbounded-microtask-chain-make-the-application-unresponsive%3F)
- [When is `scheduleMicrotask()` preferable to scheduling an ordinary event?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/When-is-scheduleMicrotask()-preferable-to-scheduling-an-ordinary-event%3F)
- [How does `Future.microtask()` report values and errors?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/How-does-Future.microtask()-report-values-and-errors%3F)
- [Does a zero-duration `Timer` run immediately?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Does-a-zero-duration-Timer-run-immediately%3F)
- [Why can a timer callback run later than its requested duration?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Why-can-a-timer-callback-run-later-than-its-requested-duration%3F)
- [Does `Timer.periodic()` provide an exact clock or frame cadence?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Does-Timer.periodic()-provide-an-exact-clock-or-frame-cadence%3F)
- [When should animation work use a frame callback instead of a timer?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/When-should-animation-work-use-a-frame-callback-instead-of-a-timer%3F)
- [Which Flutter frame phase runs transient frame callbacks?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Which-Flutter-frame-phase-runs-transient-frame-callbacks%3F)
- [When is layout information safe to read from a post-frame callback?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/When-is-layout-information-safe-to-read-from-a-post-frame-callback%3F)
- [Does registering a post-frame callback cause Flutter to schedule a frame?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Does-registering-a-post-frame-callback-cause-Flutter-to-schedule-a-frame%3F)
- [Why can CPU-heavy code inside an `async` function still freeze the UI?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Why-can-CPU-heavy-code-inside-an-async-function-still-freeze-the-UI%3F)
- [When should work be split, deferred, or moved to another isolate?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/When-should-work-be-split%2C-deferred%2C-or-moved-to-another-isolate%3F)

## Best Practices

- [Keep every event-loop callback short and bounded](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Keep-every-event-loop-callback-short-and-bounded)
- [Use microtasks only when work must finish before the next event](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Use-microtasks-only-when-work-must-finish-before-the-next-event)
- [Avoid recursive or unbounded microtask scheduling](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Avoid-recursive-or-unbounded-microtask-scheduling)
- [Use `Future.microtask()` when callers need a future value or error](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Use-Future.microtask()-when-callers-need-a-future-value-or-error)
- [Treat timer durations as minimum delays rather than execution deadlines](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Treat-timer-durations-as-minimum-delays-rather-than-execution-deadlines)
- [Cancel one-shot timers when their pending callback is no longer valid](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Cancel-one-shot-timers-when-their-pending-callback-is-no-longer-valid)
- [Cancel periodic timers as part of the lifecycle that owns them](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Cancel-periodic-timers-as-part-of-the-lifecycle-that-owns-them)
- [Use tickers or scheduler callbacks for animation instead of periodic timers](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Use-tickers-or-scheduler-callbacks-for-animation-instead-of-periodic-timers)
- [Use frame callbacks only for work that belongs to the frame lifecycle](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Use-frame-callbacks-only-for-work-that-belongs-to-the-frame-lifecycle)
- [Use post-frame callbacks for one-time work requiring completed layout](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Use-post-frame-callbacks-for-one-time-work-requiring-completed-layout)
- [Check lifecycle validity before acting from a delayed or post-frame callback](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Check-lifecycle-validity-before-acting-from-a-delayed-or-post-frame-callback)
- [Profile long frames and event-loop stalls before choosing a concurrency strategy](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Profile-long-frames-and-event-loop-stalls-before-choosing-a-concurrency-strategy)
- [Move substantial CPU-bound work off the UI isolate when transfer costs justify it](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Move-substantial-CPU-bound-work-off-the-UI-isolate-when-transfer-costs-justify-it)
- [Remember that `async`, futures, timers, and microtasks do not make synchronous work parallel](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Event-Loop/Remember-that-async%2C-futures%2C-timers%2C-and-microtasks-do-not-make-synchronous-work-parallel)

[< Back to Async & Concurrency](../README.md)
