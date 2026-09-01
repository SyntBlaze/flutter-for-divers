# Futures

Dart futures represent one value or one error that may become available later.
They make asynchronous dependencies explicit without blocking the isolate that
runs the application. An `async` function usually creates the future-facing
API, `await` expresses ordering inside the function, and callback methods such
as `then()`, `catchError()`, and `whenComplete()` provide the same completion
pipeline directly.

```text
start asynchronous operation
            |
            v
       Future<T> pending
            |
      +-----+------+
      |            |
      v            v
  value T        error + stack trace
      |            |
      v            v
   await /       catchError()
   then()             |
      +-------+-------+
              |
              v
       whenComplete()
              |
              v
    next future in the chain
```

A future is a handle to eventual completion, not a thread and not necessarily
work running in parallel. Code before the first asynchronous suspension in an
`async` function still runs on the current isolate, and CPU-heavy synchronous
work can still block Flutter frames. Each transformation returns another
future, so callers should return or await the complete chain to preserve value,
error, and stack-trace propagation.

Combinators coordinate completion rather than stopping the underlying work.
`Future.wait()` collects successful values in input order, while `Future.any()`
settles from the first input to complete, whether that completion is a value or
an error. A timeout similarly stops waiting through a wrapper future; it does
not automatically cancel the source operation. Cancellation therefore needs an
API-specific mechanism or a cooperative application pattern with explicit
ownership and stale-result protection.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures) — Focused, bite-sized article covering Futures
- [Learning Path](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures) — Step-by-step material that builds practical Futures knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures) — Structured, in-depth material for learning about Futures thoroughly

## Futures Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Future` | Represents one eventual value or error | It describes completion, not a new thread; always observe or deliberately propagate its errors | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Future "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Future "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Future "Deep Dive") |
| `FutureOr` | Accepts either an immediate `T` or a `Future<T>` at an asynchronous API boundary | Use it in contracts that genuinely support both forms; normalize before composing when a concrete future is needed | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/FutureOr "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/FutureOr "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/FutureOr "Deep Dive") |
| `Completer` | Completes a future imperatively from callback-style or externally driven code | Complete exactly once and preserve both the error and its stack trace | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Completer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Completer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Completer "Deep Dive") |
| `async` | Marks a function whose result and failures are delivered asynchronously | Prefer an explicit `Future<T>` return type and reserve `async void` behavior for framework-required callbacks | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/async "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/async "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/async "Deep Dive") |
| `await` | Suspends the current asynchronous function until an expression completes | Awaiting yields control rather than blocking the isolate, but synchronous work around it can still block UI | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/await "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/await "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/await "Deep Dive") |
| `then()` | Transforms a successful completion into another value or future | Return the callback's asynchronous work so chaining and error propagation remain intact | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/then-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/then-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/then-method "Deep Dive") |
| `catchError()` | Handles an asynchronous error in the preceding future chain | Match the handler's return type and avoid swallowing failures that cannot be meaningfully recovered | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/catchError-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/catchError-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/catchError-method "Deep Dive") |
| `whenComplete()` | Runs cleanup after either success or failure | It normally preserves the prior outcome, but a cleanup failure replaces that outcome | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/whenComplete-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/whenComplete-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/whenComplete-method "Deep Dive") |
| `Future.wait()` | Waits for a group of futures and returns their values in input order | Decide how partial failure and cleanup should be handled; remaining operations are not automatically cancelled | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Future.wait-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Future.wait-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Future.wait-method "Deep Dive") |
| `Future.any()` | Uses the first input future to complete | The first completion may be an error, and losing operations keep running unless separately cancellable | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Future.any-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Future.any-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Future.any-method "Deep Dive") |
| `Future.delayed()` | Schedules completion after at least a specified duration | Timing is not exact and delayed work shares the isolate's event queue | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Future.delayed-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Future.delayed-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Future.delayed-method "Deep Dive") |
| Timeout | Bounds how long a caller waits for a future | A timeout changes the wrapper's completion but does not stop the source operation | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Timeout "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Timeout "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Timeout "Deep Dive") |
| Cancellation pattern | Gives callers a way to abandon, supersede, or cooperatively stop asynchronous work | Define ownership, cancellation checkpoints, cleanup, and how late completions are ignored | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Futures/Cancellation-pattern "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Futures/Cancellation-pattern "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Futures/Cancellation-pattern "Deep Dive") |

## Questions

- [What does a `Future<T>` guarantee, and what does it not say about where work runs?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/What-does-a-Future%3CT%3E-guarantee%2C-and-what-does-it-not-say-about-where-work-runs%3F)
- [When is `FutureOr<T>` useful in an API, and when does it make composition less clear?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/When-is-FutureOr%3CT%3E-useful-in-an-API%2C-and-when-does-it-make-composition-less-clear%3F)
- [When should a callback-based API be adapted with a `Completer`?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/When-should-a-callback-based-API-be-adapted-with-a-Completer%3F)
- [How are return values and thrown exceptions from an `async` function delivered to its caller?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/How-are-return-values-and-thrown-exceptions-from-an-async-function-delivered-to-its-caller%3F)
- [Does `await` block the isolate or only suspend the current asynchronous function?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Does-await-block-the-isolate-or-only-suspend-the-current-asynchronous-function%3F)
- [Why must a future created inside `then()` be returned from the callback?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Why-must-a-future-created-inside-then()-be-returned-from-the-callback%3F)
- [Which errors can a `catchError()` handler see, and what must the handler return?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Which-errors-can-a-catchError()-handler-see%2C-and-what-must-the-handler-return%3F)
- [Can `whenComplete()` change the value or error observed by the next stage?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Can-whenComplete()-change-the-value-or-error-observed-by-the-next-stage%3F)
- [Does `Future.wait()` preserve completion order or input order in its result?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Does-Future.wait()-preserve-completion-order-or-input-order-in-its-result%3F)
- [What happens to the other operations after `Future.any()` completes?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/What-happens-to-the-other-operations-after-Future.any()-completes%3F)
- [Why can `Future.delayed()` run later than the requested duration?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Why-can-Future.delayed()-run-later-than-the-requested-duration%3F)
- [Does timing out a future cancel its underlying network, file, or computation work?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Does-timing-out-a-future-cancel-its-underlying-network%2C-file%2C-or-computation-work%3F)
- [How can a caller prevent a cancelled or superseded operation from publishing a late result?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/How-can-a-caller-prevent-a-cancelled-or-superseded-operation-from-publishing-a-late-result%3F)
- [When should independent futures be started together instead of awaited one by one?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/When-should-independent-futures-be-started-together-instead-of-awaited-one-by-one%3F)

## Best Practices

- [Return `Future<T>` from asynchronous APIs so completion and failure are observable](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Return-Future%3CT%3E-from-asynchronous-APIs-so-completion-and-failure-are-observable)
- [Keep `FutureOr<T>` at intentional compatibility or callback boundaries rather than spreading dual-mode behavior](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Keep-FutureOr%3CT%3E-at-intentional-compatibility-or-callback-boundaries-rather-than-spreading-dual-mode-behavior)
- [Use `Completer` only to bridge an imperative completion source, not as a substitute for returning a future chain](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Use-Completer-only-to-bridge-an-imperative-completion-source%2C-not-as-a-substitute-for-returning-a-future-chain)
- [Give `async` functions explicit return types and avoid unobserved `async void` failures](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Give-async-functions-explicit-return-types-and-avoid-unobserved-async-void-failures)
- [Wrap awaited operations in the error-handling scope that owns recovery or reporting](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Wrap-awaited-operations-in-the-error-handling-scope-that-owns-recovery-or-reporting)
- [Return or await every asynchronous branch created by `then()`](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Return-or-await-every-asynchronous-branch-created-by-then())
- [Catch only errors that the current layer can recover from or translate](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Catch-only-errors-that-the-current-layer-can-recover-from-or-translate)
- [Keep `whenComplete()` cleanup safe, bounded, and independent of the successful value](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Keep-whenComplete()-cleanup-safe%2C-bounded%2C-and-independent-of-the-successful-value)
- [Start independent work before waiting for it collectively](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Start-independent-work-before-waiting-for-it-collectively)
- [Treat `Future.any()` as a completion race and arrange cancellation or cleanup for losing operations](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Treat-Future.any()-as-a-completion-race-and-arrange-cancellation-or-cleanup-for-losing-operations)
- [Use `Future.delayed()` for scheduling, not precise timing or CPU-intensive work](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Use-Future.delayed()-for-scheduling%2C-not-precise-timing-or-CPU-intensive-work)
- [Handle timeout as a distinct outcome and protect state from the source's possible late completion](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Handle-timeout-as-a-distinct-outcome-and-protect-state-from-the-source's-possible-late-completion)
- [Make cancellation cooperative and idempotent, with a clearly defined owner](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Make-cancellation-cooperative-and-idempotent%2C-with-a-clearly-defined-owner)
- [Preserve original stack traces when adapting or translating asynchronous errors](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Preserve-original-stack-traces-when-adapting-or-translating-asynchronous-errors)
- [Test success, failure, timeout, cancellation, and out-of-order completion paths](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Futures/Test-success%2C-failure%2C-timeout%2C-cancellation%2C-and-out-of-order-completion-paths)

[< Back to Async & Concurrency](../README.md)
