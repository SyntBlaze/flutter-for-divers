# Streams

Dart streams represent asynchronous sequences of data, error, and completion
events. A producer can expose an existing `Stream`, add events through a
`StreamController`, or generate them with an `async*` function. Consumers
transform the sequence lazily and create a `StreamSubscription` with `listen()`
to control delivery and cleanup.

```text
producer
   |
   +-> StreamController.add / addError / close
   |               or
   +-> async* -> yield / yield*
                       |
                       v
                 Stream<T>
                       |
             map / where / distinct / debounce
                       |
                       v
                    listen()
                       |
                       v
             StreamSubscription<T>
                |       |       |
              pause   resume  cancel
```

A single-subscription stream models one consumer-owned event sequence and can
be listened to only once. A broadcast stream permits concurrent listeners, but
listeners generally receive only events emitted while they are subscribed.
That distinction is part of the stream's contract: converting a stream to
broadcast does not automatically make it a durable replay cache.

Stream transformations such as `map()`, `where()`, and `distinct()` preserve
the asynchronous event model and normally do no work until the result is
listened to. Errors remain events on the stream unless handled, and completion
is separate from both data and errors. Pausing a subscription controls delivery
to that subscription; depending on the source, events may be buffered rather
than production being stopped. Cancellation is therefore the important
lifecycle boundary for work and resources that are no longer needed.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams) — Focused, bite-sized article covering Streams
- [Learning Path](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams) — Step-by-step material that builds practical Streams knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams) — Structured, in-depth material for learning about Streams thoroughly

## Stream Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Stream` | Represents an asynchronous sequence of data, error, and done events | Know whether the stream is single-subscription or broadcast before exposing it as an API | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/Stream "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/Stream "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/Stream "Deep Dive") |
| `StreamController` | Produces a stream by adding data and errors and eventually closing it | Define ownership clearly and close application-owned controllers on every terminal path | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/StreamController "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/StreamController "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/StreamController "Deep Dive") |
| Broadcast stream | Delivers live events independently to multiple listeners | Events emitted without an active listener are normally not replayed | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/Broadcast-stream "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/Broadcast-stream "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/Broadcast-stream "Deep Dive") |
| Single-subscription stream | Gives one listener exclusive consumption of a sequence | It can be listened to only once, even after the first subscription is cancelled | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/Single-subscription-stream "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/Single-subscription-stream "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/Single-subscription-stream "Deep Dive") |
| `StreamSubscription` | Represents and controls one active stream listener | Retain it when lifecycle code must pause, resume, or cancel delivery | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/StreamSubscription "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/StreamSubscription "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/StreamSubscription "Deep Dive") |
| `async*` | Declares an asynchronous generator whose result is a stream | Generator execution and cancellation follow the listener's demand and lifecycle | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/async-star "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/async-star "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/async-star "Deep Dive") |
| `yield` | Emits one value from an `async*` generator | Yield values in sequence and allow cancellation to unwind generator cleanup | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/yield "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/yield "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/yield "Deep Dive") |
| `yield*` | Forwards all events from another stream inside an `async*` generator | Forwarding includes the nested stream's asynchronous lifecycle, not merely its data values | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/yield-star "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/yield-star "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/yield-star "Deep Dive") |
| `listen()` | Subscribes handlers for data, error, and completion events | Install intentional error handling and keep the returned subscription when cleanup is required | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/listen-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/listen-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/listen-method "Deep Dive") |
| `pause()` | Temporarily stops delivery to one subscription | A source that cannot pause may buffer events, so long pauses can increase memory use | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/pause-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/pause-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/pause-method "Deep Dive") |
| `resume()` | Releases one pause request on a subscription | Balance nested pauses because delivery resumes only after all pauses are released | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/resume-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/resume-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/resume-method "Deep Dive") |
| `cancel()` | Ends a subscription and requests source cleanup | Await the returned future when later work depends on cleanup having completed | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/cancel-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/cancel-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/cancel-method "Deep Dive") |
| `map()` | Converts each data event into another value | A mapper exception becomes an error event on the transformed stream | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/map-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/map-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/map-method "Deep Dive") |
| `where()` | Forwards only data events accepted by a predicate | A predicate exception becomes an error event rather than silently rejecting the value | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/where-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/where-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/where-method "Deep Dive") |
| `debounce` pattern | Emits only after an event has remained unsettled for a chosen interval | Specify leading or trailing behavior, completion flushing, and timer cancellation explicitly | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/debounce-pattern "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/debounce-pattern "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/debounce-pattern "Deep Dive") |
| `distinct()` | Suppresses consecutive data events considered equal | It removes adjacent duplicates, not every value previously seen in the stream | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Streams/distinct-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Streams/distinct-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Streams/distinct-method "Deep Dive") |

## Questions

- [What event types and completion guarantees make up a `Stream` contract?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/What-event-types-and-completion-guarantees-make-up-a-Stream-contract%3F)
- [Who should add events to and close a `StreamController`?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Who-should-add-events-to-and-close-a-StreamController%3F)
- [When is a broadcast stream appropriate, and what happens when it has no listeners?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/When-is-a-broadcast-stream-appropriate%2C-and-what-happens-when-it-has-no-listeners%3F)
- [Why can a single-subscription stream be listened to only once?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Why-can-a-single-subscription-stream-be-listened-to-only-once%3F)
- [When should code retain the `StreamSubscription` returned by `listen()`?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/When-should-code-retain-the-StreamSubscription-returned-by-listen()%3F)
- [When does an `async*` generator begin and stop producing events?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/When-does-an-async*-generator-begin-and-stop-producing-events%3F)
- [How does `yield` interact with ordering, pauses, and cancellation?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/How-does-yield-interact-with-ordering%2C-pauses%2C-and-cancellation%3F)
- [When should an asynchronous generator use `yield*` instead of manually listening?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/When-should-an-asynchronous-generator-use-yield*-instead-of-manually-listening%3F)
- [How should `listen()` handle data, error, and done events?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/How-should-listen()-handle-data%2C-error%2C-and-done-events%3F)
- [Does `pause()` stop the event source or only stop delivery to a subscription?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Does-pause()-stop-the-event-source-or-only-stop-delivery-to-a-subscription%3F)
- [How do nested pause and resume requests affect delivery?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/How-do-nested-pause-and-resume-requests-affect-delivery%3F)
- [Why might a caller need to await `cancel()`?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Why-might-a-caller-need-to-await-cancel()%3F)
- [What happens when a `map()` callback throws?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/What-happens-when-a-map()-callback-throws%3F)
- [What happens when a `where()` predicate throws?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/What-happens-when-a-where()-predicate-throws%3F)
- [How should a debounce implementation behave when the source closes or the consumer cancels?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/How-should-a-debounce-implementation-behave-when-the-source-closes-or-the-consumer-cancels%3F)
- [Why does `distinct()` still emit a value that appeared earlier in a non-adjacent position?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Why-does-distinct()-still-emit-a-value-that-appeared-earlier-in-a-non-adjacent-position%3F)
- [Which stream type fits a one-shot file read, a socket, or a UI event bus?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Which-stream-type-fits-a-one-shot-file-read%2C-a-socket%2C-or-a-UI-event-bus%3F)
- [How should stream ownership determine where subscription cancellation and controller closure happen?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/How-should-stream-ownership-determine-where-subscription-cancellation-and-controller-closure-happen%3F)

## Best Practices

- [Document whether every exposed stream is single-subscription or broadcast](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Document-whether-every-exposed-stream-is-single-subscription-or-broadcast)
- [Give each `StreamController` one clear owner and close it when that owner ends](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Give-each-StreamController-one-clear-owner-and-close-it-when-that-owner-ends)
- [Use broadcast streams only for genuinely shared, live event sources](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Use-broadcast-streams-only-for-genuinely-shared%2C-live-event-sources)
- [Preserve single-subscription semantics for sequences with one consumer or resource owner](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Preserve-single-subscription-semantics-for-sequences-with-one-consumer-or-resource-owner)
- [Store lifecycle-bound subscriptions and cancel them during disposal](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Store-lifecycle-bound-subscriptions-and-cancel-them-during-disposal)
- [Use `async*` when sequential asynchronous production is clearer than manual controller wiring](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Use-async*-when-sequential-asynchronous-production-is-clearer-than-manual-controller-wiring)
- [Put generator resource cleanup in `finally` so cancellation releases it](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Put-generator-resource-cleanup-in-finally-so-cancellation-releases-it)
- [Use `yield*` to forward a stream while preserving backpressure and cancellation behavior](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Use-yield*-to-forward-a-stream-while-preserving-backpressure-and-cancellation-behavior)
- [Provide deliberate `onError` and `onDone` behavior at terminal subscriptions](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Provide-deliberate-onError-and-onDone-behavior-at-terminal-subscriptions)
- [Avoid long subscription pauses on sources that must buffer](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Avoid-long-subscription-pauses-on-sources-that-must-buffer)
- [Balance every pause and resume path, including error and disposal paths](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Balance-every-pause-and-resume-path%2C-including-error-and-disposal-paths)
- [Await cancellation before reopening or deleting a resource that the stream owns](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Await-cancellation-before-reopening-or-deleting-a-resource-that-the-stream-owns)
- [Keep `map()` and `where()` callbacks fast, deterministic, and free of blocking work](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Keep-map()-and-where()-callbacks-fast%2C-deterministic%2C-and-free-of-blocking-work)
- [Define debounce timing, leading or trailing semantics, and done behavior in tests](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Define-debounce-timing%2C-leading-or-trailing-semantics%2C-and-done-behavior-in-tests)
- [Pass an explicit equality function to `distinct()` when domain equality differs from `==`](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Pass-an-explicit-equality-function-to-distinct()-when-domain-equality-differs-from-%3D%3D)
- [Test data, error, done, pause, resume, and cancellation paths independently](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Test-data%2C-error%2C-done%2C-pause%2C-resume%2C-and-cancellation-paths-independently)
- [Avoid synchronous stream controllers unless reentrant delivery is understood and required](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Streams/Avoid-synchronous-stream-controllers-unless-reentrant-delivery-is-understood-and-required)

[< Back to Async & Concurrency](../README.md)
