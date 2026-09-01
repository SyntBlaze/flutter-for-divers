# Flutter State Management

State management is the practice of giving application data a clear owner,
lifetime, update path, and set of consumers. Flutter supplies small, composable
primitives for local and shared state; an application can combine them with
controllers, repositories, asynchronous sources, and immutable models without
making the widget tree the owner of every decision.

```text
input or external result
          |
          v
      state owner ----> next state
          |                 |
          +<--- policy -----+
          |
          v
 notification or dependency change
          |
          v
    affected UI rebuilds
```

Choose ownership before choosing a notification mechanism. Ephemeral state can
usually remain close to one widget, while application, route, cached server,
and persisted state need boundaries that match their consumers and lifetime.
Derived values should be calculated from authoritative state, and asynchronous
updates need explicit loading, failure, cancellation, and stale-result rules.

The same design can be coordinated in several ways: inherited dependencies,
listenables, streams, futures, events, scoped state owners, or controllers and
presenters backed by repositories. Whichever mechanism is used, keep rendering
free of side effects, make transitions observable and testable, and release
subscriptions and other resources at the lifecycle boundary that owns them.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/State-Management) — Focused, bite-sized article covering Flutter State Management
- [Learning Path](https://app.syntblaze.com/lt/flutter/State-Management) — Step-by-step material that builds practical Flutter State Management knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/State-Management) — Structured, in-depth material for learning about Flutter State Management thoroughly

## At a glance

- [Core Flutter State](<Core Flutter State/README.md>) — Use Flutter's built-in state owners, notifications, builders, and restoration hooks
- [State Lifetimes](<State Lifetimes/README.md>) — Match ownership and retention to how long each kind of state must survive
- [State Coordination](<State Coordination/README.md>) — Connect state sources, owners, dependencies, and consumers
- [State Design](<State Design/README.md>) — Model snapshots, outcomes, derived values, effects, and restoration deliberately
- [Common Pitfalls](<Common Pitfalls/README.md>) — Prevent lifecycle errors, hidden mutation, excessive rebuilding, and leaked work

## Core Flutter State [>](<Core Flutter State/README.md>)

| Topic | Focus | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| StatefulWidget | Define a widget whose mutable lifecycle state lives in a separate object | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/StatefulWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/StatefulWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/StatefulWidget "Deep Dive") |
| State | Own mutable data and lifecycle callbacks for a stateful widget instance | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/State "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/State "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/State "Deep Dive") |
| `setState()` | Report a synchronous state change so Flutter schedules a rebuild | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/setState-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/setState-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/setState-method "Deep Dive") |
| InheritedWidget | Expose a value to dependent descendants through the element tree | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/InheritedWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/InheritedWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/InheritedWidget "Deep Dive") |
| InheritedModel | Rebuild descendants only for inherited aspects they depend on | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/InheritedModel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/InheritedModel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/InheritedModel "Deep Dive") |
| InheritedNotifier | Bridge a listenable notification source into inherited dependencies | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/InheritedNotifier "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/InheritedNotifier "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/InheritedNotifier "Deep Dive") |
| ValueNotifier | Publish changes to one directly replaceable value | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/ValueNotifier "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/ValueNotifier "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/ValueNotifier "Deep Dive") |
| ChangeNotifier | Notify registered listeners after an owner changes | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/ChangeNotifier "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/ChangeNotifier "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/ChangeNotifier "Deep Dive") |
| ValueListenableBuilder | Rebuild a focused subtree from a value listenable | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/ValueListenableBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/ValueListenableBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/ValueListenableBuilder "Deep Dive") |
| AnimatedBuilder | Rebuild from a listenable while hoisting invariant children | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/AnimatedBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/AnimatedBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/AnimatedBuilder "Deep Dive") |
| RestorationMixin | Register restorable properties with Flutter's restoration system | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/RestorationMixin "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/RestorationMixin "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/RestorationMixin "Deep Dive") |
| AutomaticKeepAliveClientMixin | Request that a lazily built child preserve its state while offscreen | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/AutomaticKeepAliveClientMixin "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/AutomaticKeepAliveClientMixin "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/AutomaticKeepAliveClientMixin "Deep Dive") |

## State Lifetimes [>](<State Lifetimes/README.md>)

| Topic | Focus | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| Ephemeral state | Keep short-lived presentation details near the UI that owns them | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Ephemeral-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Ephemeral-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Ephemeral-state "Deep Dive") |
| App state | Share in-memory data across features or the application shell | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/App-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/App-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/App-state "Deep Dive") |
| Route state | Scope state to a route instance and its navigation lifetime | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Route-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Route-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Route-state "Deep Dive") |
| Form state | Preserve editable, validation, and submission state for a user task | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Form-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Form-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Form-state "Deep Dive") |
| Server cache state | Retain remote results with freshness and invalidation rules | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Server-cache-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Server-cache-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Server-cache-state "Deep Dive") |
| Persisted state | Store selected durable values across process restarts | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Persisted-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Persisted-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Persisted-state "Deep Dive") |
| Derived state | Compute values from authoritative source state | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Derived-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Derived-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Derived-state "Deep Dive") |
| Optimistic state | Present an expected result before remote confirmation arrives | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Optimistic-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Optimistic-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Optimistic-state "Deep Dive") |
| Restorable state | Reconstruct eligible UI state after operating-system restoration | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Lifetimes/Restorable-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Lifetimes/Restorable-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Lifetimes/Restorable-state "Deep Dive") |

## State Coordination [>](<State Coordination/README.md>)

| Topic | Focus | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| Inherited dependency lookup | Resolve shared values through an ancestor scope | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Inherited-dependency-lookup "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Inherited-dependency-lookup "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Inherited-dependency-lookup "Deep Dive") |
| Listenable state | Broadcast synchronous invalidation to registered listeners | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Listenable-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Listenable-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Listenable-state "Deep Dive") |
| Value state | Expose one current value together with change notifications | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Value-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Value-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Value-state "Deep Dive") |
| Notifier state | Centralize mutations and notify consumers after transitions | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Notifier-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Notifier-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Notifier-state "Deep Dive") |
| Stream-backed state | Consume an asynchronous sequence of values or events | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Stream-backed-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Stream-backed-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Stream-backed-state "Deep Dive") |
| Future-backed state | Represent one pending asynchronous outcome | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Future-backed-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Future-backed-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Future-backed-state "Deep Dive") |
| Event-driven state | Translate explicit inputs into controlled state transitions | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Event-driven-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Event-driven-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Event-driven-state "Deep Dive") |
| Scoped state | Limit state ownership and visibility to a subtree or feature | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Scoped-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Scoped-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Scoped-state "Deep Dive") |
| Global app state | Coordinate genuinely application-wide data and services | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Global-app-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Global-app-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Global-app-state "Deep Dive") |
| Controller-owned state | Give an imperative controller responsibility for a UI workflow | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Controller-owned-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Controller-owned-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Controller-owned-state "Deep Dive") |
| Presenter-owned state | Prepare view-facing state outside widgets | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Presenter-owned-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Presenter-owned-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Presenter-owned-state "Deep Dive") |
| Repository-backed state | Coordinate UI state with a data-source abstraction | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Coordination/Repository-backed-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Coordination/Repository-backed-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Coordination/Repository-backed-state "Deep Dive") |

## State Design [>](<State Design/README.md>)

| Topic | Focus | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| Immutable state | Replace snapshots instead of mutating shared state in place | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Immutable-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Immutable-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Immutable-state "Deep Dive") |
| Sealed state | Express a closed set of valid state variants | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Sealed-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Sealed-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Sealed-state "Deep Dive") |
| Loading state | Represent work whose required result has not arrived | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Loading-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Loading-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Loading-state "Deep Dive") |
| Error state | Preserve actionable failure information and recovery paths | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Error-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Error-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Error-state "Deep Dive") |
| Empty state | Distinguish a successful result with no content | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Empty-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Empty-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Empty-state "Deep Dive") |
| Success state | Represent an available, usable result | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Success-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Success-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Success-state "Deep Dive") |
| Copy with | Produce an updated immutable snapshot while retaining other fields | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Copy-with "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Copy-with "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Copy-with "Deep Dive") |
| Equality | Define when snapshots are observably equivalent | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Equality "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Equality "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Equality "Deep Dive") |
| Derived selectors | Read and recompute only the portion a consumer needs | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Derived-selectors "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Derived-selectors "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Derived-selectors "Deep Dive") |
| Command side effects | Execute external actions through intentional command boundaries | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/Command-side-effects "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/Command-side-effects "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/Command-side-effects "Deep Dive") |
| One-time events | Deliver transient effects without treating them as durable state | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/One-time-events "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/One-time-events "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/One-time-events "Deep Dive") |
| State restoration | Serialize and reconstruct eligible state within restoration scopes | [💡](https://app.syntblaze.com/qt/flutter/State-Management/State-Design/State-restoration "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/State-Design/State-restoration "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/State-Design/State-restoration "Deep Dive") |

## Common Pitfalls [>](<Common Pitfalls/README.md>)

| Topic | Focus | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| Calling setState after dispose | Prevent late callbacks from updating an unmounted `State` object | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Calling-setState-after-dispose "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Calling-setState-after-dispose "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Calling-setState-after-dispose "Deep Dive") |
| Reading inherited state above its scope | Read a dependency only from descendants of its provider | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Reading-inherited-state-above-its-scope "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Reading-inherited-state-above-its-scope "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Reading-inherited-state-above-its-scope "Deep Dive") |
| Mutating state in place | Replace shared snapshots so consumers can observe a change | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Mutating-state-in-place "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Mutating-state-in-place "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Mutating-state-in-place "Deep Dive") |
| Over-rebuilding large subtrees | Narrow subscriptions and hoist invariant widget work | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Over-rebuilding-large-subtrees "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Over-rebuilding-large-subtrees "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Over-rebuilding-large-subtrees "Deep Dive") |
| Triggering effects during build | Keep build repeatable and move effects to controlled lifecycle points | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Triggering-effects-during-build "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Triggering-effects-during-build "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Triggering-effects-during-build "Deep Dive") |
| Retaining BuildContext too long | Avoid keeping an element-bound handle beyond its valid lifetime | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Retaining-BuildContext-too-long "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Retaining-BuildContext-too-long "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Retaining-BuildContext-too-long "Deep Dive") |
| Mixing UI and domain logic | Separate rendering concerns from business decisions and data access | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Mixing-UI-and-domain-logic "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Mixing-UI-and-domain-logic "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Mixing-UI-and-domain-logic "Deep Dive") |
| Uncancelled subscriptions | Dispose listeners and prevent late events from reaching dead owners | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Uncancelled-subscriptions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Uncancelled-subscriptions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Uncancelled-subscriptions "Deep Dive") |

---

> Give each state one authoritative owner, match its scope to its lifetime,
> expose only the transitions consumers need, and make asynchronous cleanup
> part of the design.
