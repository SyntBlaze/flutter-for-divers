# State Coordination

Coordination connects state owners to their inputs, dependencies, consumers,
and data sources. Flutter supports tree-based dependency lookup and synchronous
listenables directly, while futures, streams, and explicit events describe
different asynchronous relationships.

```text
UI intent --> controller / presenter --> repository
                    |                      |
                    v                      v
               local state <------ remote or stored data
                    |
          notifier / value / stream
                    |
                    v
            scoped UI consumers
```

Choose a contract that matches the source. A future has one eventual outcome; a
stream has a sequence and a subscription lifecycle; a listenable reports
synchronous invalidation; an event-driven owner translates named inputs into
transitions. Wrapping one contract in another does not remove its original
cancellation, error, ordering, or ownership concerns.

Scope is also part of the contract. Inherited lookup makes visibility follow
the widget tree, controller and presenter boundaries associate behavior with a
workflow or view, and repositories separate state coordination from concrete
data sources. Global state should be reserved for data whose ownership and
consumers are genuinely application-wide.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination) — Focused, bite-sized article covering State Coordination
- [Learning Path](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination) — Step-by-step material that builds practical State Coordination knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination) — Structured, in-depth material for learning about State Coordination thoroughly

## State Coordination Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Inherited dependency lookup | Resolves a shared dependency from an ancestor and optionally subscribes to changes | Read from below the intended provider and understand whether the lookup listens or only reads | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Inherited-dependency-lookup "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Inherited-dependency-lookup "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Inherited-dependency-lookup "Deep Dive") |
| Listenable state | Uses synchronous invalidation callbacks to notify registered consumers | Keep ownership, listener removal, and notification granularity explicit | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Listenable-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Listenable-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Listenable-state "Deep Dive") |
| Value state | Couples a current readable value with change notification | Replace values predictably and avoid exposing mutable contents that change silently | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Value-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Value-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Value-state "Deep Dive") |
| Notifier state | Centralizes state mutations behind methods and explicit notifications | Expose user intent rather than unrestricted setters and dispose the notifier once | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Notifier-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Notifier-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Notifier-state "Deep Dive") |
| Stream-backed state | Coordinates a sequence of asynchronous values, errors, and completion | Own subscription cancellation and define whether old data remains during reconnection | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Stream-backed-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Stream-backed-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Stream-backed-state "Deep Dive") |
| Future-backed state | Coordinates one pending asynchronous value or error | Preserve request identity because ignoring a future does not cancel its underlying operation | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Future-backed-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Future-backed-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Future-backed-state "Deep Dive") |
| Event-driven state | Maps explicit inputs to state transitions and effects | Define ordering, concurrency, duplicate-event, and error policies | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Event-driven-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Event-driven-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Event-driven-state "Deep Dive") |
| Scoped state | Makes an owner available only inside a widget subtree or feature boundary | Create and dispose the owner at the same scope and avoid accidental shadowing | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Scoped-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Scoped-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Scoped-state "Deep Dive") |
| Global app state | Shares state across otherwise distant application features | Keep the surface small and define session, reset, persistence, and testing behavior | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Global-app-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Global-app-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Global-app-state "Deep Dive") |
| Controller-owned state | Assigns an imperative workflow owner to expose state and accept commands | Keep widget lifecycles and `BuildContext` out of longer-lived controllers | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Controller-owned-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Controller-owned-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Controller-owned-state "Deep Dive") |
| Presenter-owned state | Transforms use-case results into view-facing state and actions | Keep platform rendering details outside the presenter while preserving user intent | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Presenter-owned-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Presenter-owned-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Presenter-owned-state "Deep Dive") |
| Repository-backed state | Coordinates view or application state with an abstract data-access boundary | Treat repositories as sources of domain data, not dumping grounds for transient UI state | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Repository-backed-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Repository-backed-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Repository-backed-state "Deep Dive") |

## Questions

- [Does an inherited lookup subscribe the caller or only obtain a current value?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Does-an-inherited-lookup-subscribe-the-caller-or-only-obtain-a-current-value%3F)
- [What owns each listener and guarantees its removal?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/What-owns-each-listener-and-guarantees-its-removal%3F)
- [Is value equality sufficient to determine whether consumers must update?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Is-value-equality-sufficient-to-determine-whether-consumers-must-update%3F)
- [Which mutations should a notifier expose as intent-revealing methods?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Which-mutations-should-a-notifier-expose-as-intent-revealing-methods%3F)
- [How are stream errors, completion, pauses, and reconnections represented?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/How-are-stream-errors%2C-completion%2C-pauses%2C-and-reconnections-represented%3F)
- [How are stale future completions prevented from replacing newer results?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/How-are-stale-future-completions-prevented-from-replacing-newer-results%3F)
- [In what order may events run, and can any be cancelled or coalesced?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/In-what-order-may-events-run%2C-and-can-any-be-cancelled-or-coalesced%3F)
- [Where is a scoped owner created and disposed?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Where-is-a-scoped-owner-created-and-disposed%3F)
- [Which state truly needs global reach?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Which-state-truly-needs-global-reach%3F)
- [What distinguishes a controller from a widget state object?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/What-distinguishes-a-controller-from-a-widget-state-object%3F)
- [Which transformations belong in a presenter?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Which-transformations-belong-in-a-presenter%3F)
- [Where do caching and data-source selection belong behind a repository?](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Where-do-caching-and-data-source-selection-belong-behind-a-repository%3F)

## Best Practices

- [Match the coordination primitive to the source's actual completion model](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Match-the-coordination-primitive-to-the-source's-actual-completion-model)
- [Distinguish reading a dependency from subscribing to it](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Distinguish-reading-a-dependency-from-subscribing-to-it)
- [Give listeners and subscriptions the same explicit lifecycle as their owner](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Give-listeners-and-subscriptions-the-same-explicit-lifecycle-as-their-owner)
- [Expose immutable values or controlled mutations](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Expose-immutable-values-or-controlled-mutations)
- [Name notifier operations after user or domain intent](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Name-notifier-operations-after-user-or-domain-intent)
- [Represent stream connection and failure states explicitly](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Represent-stream-connection-and-failure-states-explicitly)
- [Reject stale future results by request identity or generation](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Reject-stale-future-results-by-request-identity-or-generation)
- [Define event concurrency before concurrent inputs occur](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Define-event-concurrency-before-concurrent-inputs-occur)
- [Create scoped owners at the narrowest boundary shared by all consumers](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Create-scoped-owners-at-the-narrowest-boundary-shared-by-all-consumers)
- [Keep global state small, partitioned, and resettable](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Keep-global-state-small%2C-partitioned%2C-and-resettable)
- [Keep widget-specific objects out of controllers and presenters](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Keep-widget-specific-objects-out-of-controllers-and-presenters)
- [Inject repositories so coordination logic remains independently testable](https://app.syntblaze.com/qsp/flutter/State-Management/State-Coordination/Inject-repositories-so-coordination-logic-remains-independently-testable)

[< Back to State Management](../README.md)
