# Lifecycle Safety

Asynchronous work often outlives the widget state, route, request, or user
intent that started it. Lifecycle safety means making resource ownership and
result validity explicit: stop owned work when its owner ends, check that UI
objects are still mounted after an asynchronous gap, and accept a result only
when it still belongs to the current operation.

```text
widget or feature starts work
            |
            +---- owns subscription / controller ----> dispose: cancel / close
            |
            +---- awaits result ----------------------> still mounted?
            |                                             |
            |                                      no: ignore UI work
            |                                      yes
            |                                             |
            +---- request generation / key ----------> still current?
                                                          |
                                                   no: discard result
                                                   yes: update state
```

`mounted` and `context.mounted` answer a narrow lifecycle question. They
prevent use of a `State` or `BuildContext` after it has been permanently
removed from the tree, but they do not prove that an old result is still
relevant. A mounted screen can start two searches and receive the older one
last. Use an operation identifier, generation counter, or equivalent policy in
addition to a mounted check when ordering matters.

Resources have a similarly narrow ownership rule. A state object should
cancel subscriptions and close controllers that it creates and owns, normally
from `dispose`. It should not dispose objects borrowed from an ancestor,
provider, or another shared owner. Cancel upstream producers, timers, and
listeners as well when closing a controller alone would leave work running.

Debouncing and throttling regulate when operations start. Deduplication avoids
starting equivalent work that is already in flight. Cancellation can reduce
wasted work when the underlying API supports it, while stale-response checks
remain the final guard because cancellation may race with completion or may
not be supported at all.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety) — Focused, bite-sized article covering Lifecycle Safety
- [Learning Path](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety) — Step-by-step material that builds practical Lifecycle Safety knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety) — Structured, in-depth material for learning about Lifecycle Safety thoroughly

## Lifecycle Safety Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `mounted` | Report whether a `State` remains associated with the widget tree | Check it immediately after an asynchronous gap and before calling `setState` or using state-bound UI | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/mounted "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/mounted "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/mounted "Deep Dive") |
| `context.mounted` | Report whether a particular `BuildContext` remains mounted | After `await`, check the same context that will be used for navigation, dialogs, inherited lookups, or other tree work | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/context.mounted "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/context.mounted "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/context.mounted "Deep Dive") |
| Disposing subscriptions | Stop listening when the owning lifecycle ends | Keep subscription handles, cancel them in `dispose`, and update them when dependencies or widget inputs change | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-subscriptions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-subscriptions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-subscriptions "Deep Dive") |
| Disposing controllers | Release controllers and their listeners when their owner ends | Close or dispose only controllers the object owns, and stop any producer feeding them | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-controllers "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-controllers "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Disposing-controllers "Deep Dive") |
| Avoiding setState after dispose | Prevent callbacks from mutating a state object after unmounting | Prefer stopping callback sources; retain a mounted check as a boundary guard for work that can still complete | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Avoiding-setState-after-dispose "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Avoiding-setState-after-dispose "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Avoiding-setState-after-dispose "Deep Dive") |
| Race condition handling | Make competing asynchronous operations follow an explicit ordering policy | Define whether first, latest, all, or one-at-a-time results win, then encode and test that rule | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Race-condition-handling "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Race-condition-handling "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Race-condition-handling "Deep Dive") |
| Request deduplication | Share or suppress equivalent work already in flight | Use a stable request key, share the same future where appropriate, and remove entries when work completes | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Request-deduplication "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Request-deduplication "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Request-deduplication "Deep Dive") |
| Stale response prevention | Keep an older completion from overwriting newer state | Capture an operation generation or identity and validate it immediately before committing the result | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Stale-response-prevention "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Stale-response-prevention "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Stale-response-prevention "Deep Dive") |
| Debounced actions | Wait for a quiet interval before starting an action | Replace the pending timer or task on new input and cancel it when the owner is disposed | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Debounced-actions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Debounced-actions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Debounced-actions "Deep Dive") |
| Throttled actions | Limit how often an action may run during sustained input | Choose leading, trailing, or combined behavior deliberately and define how queued calls are handled | [💡](https://app.syntblaze.com/qt/flutter/Async-and-Concurrency/Lifecycle-Safety/Throttled-actions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Async-and-Concurrency/Lifecycle-Safety/Throttled-actions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Async-and-Concurrency/Lifecycle-Safety/Throttled-actions "Deep Dive") |

## Questions

- [What does `State.mounted` guarantee, and what race conditions does it not prevent?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/What-does-State.mounted-guarantee%2C-and-what-race-conditions-does-it-not-prevent%3F)
- [Which `BuildContext` should be checked after an asynchronous gap?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Which-BuildContext-should-be-checked-after-an-asynchronous-gap%3F)
- [Who owns a stream subscription, and when should it be replaced or canceled?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Who-owns-a-stream-subscription%2C-and-when-should-it-be-replaced-or-canceled%3F)
- [Should this layer close the controller, or is it borrowing the controller from another owner?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Should-this-layer-close-the-controller%2C-or-is-it-borrowing-the-controller-from-another-owner%3F)
- [Why is canceling a callback source stronger than only checking `mounted` inside the callback?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Why-is-canceling-a-callback-source-stronger-than-only-checking-mounted-inside-the-callback%3F)
- [Should overlapping operations use first-wins, latest-wins, sequential, or merge semantics?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Should-overlapping-operations-use-first-wins%2C-latest-wins%2C-sequential%2C-or-merge-semantics%3F)
- [Which inputs form a stable key for equivalent in-flight requests?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Which-inputs-form-a-stable-key-for-equivalent-in-flight-requests%3F)
- [How can a response prove that it still belongs to the latest user intent?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/How-can-a-response-prove-that-it-still-belongs-to-the-latest-user-intent%3F)
- [When should the debounce interval begin again, and what happens on disposal?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/When-should-the-debounce-interval-begin-again%2C-and-what-happens-on-disposal%3F)
- [Should a throttle emit the leading call, the trailing call, or both?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Should-a-throttle-emit-the-leading-call%2C-the-trailing-call%2C-or-both%3F)
- [Can cancellation race with completion, and what validity check protects the final state update?](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Can-cancellation-race-with-completion%2C-and-what-validity-check-protects-the-final-state-update%3F)

## Best Practices

- [Check `mounted` after every relevant asynchronous gap before mutating a `State`](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Check-mounted-after-every-relevant-asynchronous-gap-before-mutating-a-State)
- [Check `context.mounted` immediately before using that context after `await`](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Check-context.mounted-immediately-before-using-that-context-after-await)
- [Cancel owned subscriptions and detach listeners when their lifecycle ends](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Cancel-owned-subscriptions-and-detach-listeners-when-their-lifecycle-ends)
- [Close or dispose only controllers owned by the current object](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Close-or-dispose-only-controllers-owned-by-the-current-object)
- [Stop timers, listeners, animations, and subscriptions that could call `setState` after disposal](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Stop-timers%2C-listeners%2C-animations%2C-and-subscriptions-that-could-call-setState-after-disposal)
- [State the concurrency policy explicitly instead of relying on completion timing](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/State-the-concurrency-policy-explicitly-instead-of-relying-on-completion-timing)
- [Deduplicate only semantically equivalent requests and clear in-flight entries on both success and failure](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Deduplicate-only-semantically-equivalent-requests-and-clear-in-flight-entries-on-both-success-and-failure)
- [Pair cancellation with an identity or generation check before committing results](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Pair-cancellation-with-an-identity-or-generation-check-before-committing-results)
- [Cancel pending debounce work in `dispose` and avoid retaining a dead context](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Cancel-pending-debounce-work-in-dispose-and-avoid-retaining-a-dead-context)
- [Document leading and trailing throttle behavior and test boundary timing](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Document-leading-and-trailing-throttle-behavior-and-test-boundary-timing)
- [Keep loading, data, empty, and error transitions consistent when an operation is ignored or superseded](https://app.syntblaze.com/qsp/flutter/Async-and-Concurrency/Lifecycle-Safety/Keep-loading%2C-data%2C-empty%2C-and-error-transitions-consistent-when-an-operation-is-ignored-or-superseded)

[< Back to Async & Concurrency](../README.md)
