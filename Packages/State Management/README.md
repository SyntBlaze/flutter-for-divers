# State Management

State management is the way an application stores, changes, and exposes the data
that drives its UI. A good state-management approach makes updates predictable,
keeps business logic separate from rendering, and gives each piece of state a
clear owner and source of truth.

```text
User or system input -> application logic -> new state -> notification -> UI
```

Use the simplest mechanism that fits the lifetime and reach of the state. Local,
short-lived UI state often belongs in a `StatefulWidget`, `ValueNotifier`, or
`ChangeNotifier`. A dedicated state-management package becomes more useful when
state is shared, asynchronous, long-lived, or governed by non-trivial business
rules.

State-management libraries differ mainly in how updates are expressed and how
consumers subscribe to them. Some expose mutable notifiers, some publish
immutable states in response to events or methods, and others track fine-grained
reactive dependencies. Architectural toolkits add conventions for view models,
services, navigation, and dependency lookup on top of state updates.

## Selection Guidance

Start with the state itself: identify its owner, lifetime, consumers, update
rules, and side effects. Provider is a small, familiar choice for exposing
objects and listening to simple notifiers. Bloc favors explicit state
transitions and strong separation between UI and application logic, especially
when named events make a complex workflow easier to understand.

Riverpod is useful when state and dependencies should be testable without a
widget tree, while Hooks Riverpod and Riverpod Generator support different
authoring styles. MobX and Signals suit teams that prefer automatic reactive
tracking and targeted updates. GetX and Stacked offer a broader collection of
application conventions, which can speed up development when the team accepts
their larger architectural footprint. Choose based on how clearly the approach
makes ownership, transitions, disposal, testing, and debugging visible to the
whole team.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/State-Management) — Focused, bite-sized article covering State Management
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/State-Management) — Step-by-step material that builds practical State Management knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/State-Management) — Structured, in-depth material for learning about State Management thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Provider | Widget-tree scoping and dependency exposure, commonly paired with `ChangeNotifier` | Small to medium features that need straightforward shared state with familiar Flutter primitives | [💡](https://app.syntblaze.com/qt/flutter/Packages/State-Management/Provider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/State-Management/Provider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/State-Management/Provider "Deep Dive") |
| Bloc | Event-driven state machines that map inputs to explicit state snapshots | Complex workflows where named events, predictable transitions, and traceability are important | [💡](https://app.syntblaze.com/qt/flutter/Packages/State-Management/Bloc "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/State-Management/Bloc "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/State-Management/Bloc "Deep Dive") |
| Riverpod | Explicit providers with container-based dependency graphs, caching, and lifecycle management | Applications that want testable state and dependencies without relying on a widget tree | [💡](https://app.syntblaze.com/qt/flutter/Packages/State-Management/Riverpod "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/State-Management/Riverpod "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/State-Management/Riverpod "Deep Dive") |
| Hooks Riverpod | Riverpod consumption combined with Flutter Hooks | Hook-based widgets that need concise access to providers and reusable widget lifecycle logic | [💡](https://app.syntblaze.com/qt/flutter/Packages/State-Management/Hooks-Riverpod "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/State-Management/Hooks-Riverpod "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/State-Management/Hooks-Riverpod "Deep Dive") |
| Riverpod Generator | Annotation-driven generation of Riverpod provider declarations | Riverpod codebases that prefer generated provider wiring and consistent declaration patterns | [💡](https://app.syntblaze.com/qt/flutter/Packages/State-Management/Riverpod-Generator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/State-Management/Riverpod-Generator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/State-Management/Riverpod-Generator "Deep Dive") |
| GetX | Reactive values and controllers within a broader application toolkit | Teams seeking concise state APIs together with optional routing and dependency management conventions | [💡](https://app.syntblaze.com/qt/flutter/Packages/State-Management/GetX "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/State-Management/GetX "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/State-Management/GetX "Deep Dive") |
| MobX | Observable state, computed values, actions, and automatically tracked reactions | Reactive domain models where derived state and automatic dependency tracking fit the team's mental model | [💡](https://app.syntblaze.com/qt/flutter/Packages/State-Management/MobX "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/State-Management/MobX "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/State-Management/MobX "Deep Dive") |
| Flutter MobX | Flutter observer widgets and bindings for MobX stores | Rebuilding targeted widget regions from observable MobX state | [💡](https://app.syntblaze.com/qt/flutter/Packages/State-Management/Flutter-MobX "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/State-Management/Flutter-MobX "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/State-Management/Flutter-MobX "Deep Dive") |
| Signals | Fine-grained reactive signals, computed values, and effects | Local or shared reactive graphs that need focused subscriptions and inexpensive derived values | [💡](https://app.syntblaze.com/qt/flutter/Packages/State-Management/Signals "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/State-Management/Signals "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/State-Management/Signals "Deep Dive") |
| Stacked | View-model-oriented application architecture with services and reactive views | Teams that want an opinionated structure for separating views, view models, and application services | [💡](https://app.syntblaze.com/qt/flutter/Packages/State-Management/Stacked "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/State-Management/Stacked "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/State-Management/Stacked "Deep Dive") |

## Questions

- [What is application state?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/What-is-application-state%3F)
- [What is the difference between ephemeral and application state?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/What-is-the-difference-between-ephemeral-and-application-state%3F)
- [When is `setState` enough?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/When-is-setState-enough%3F)
- [What does “single source of truth” mean?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/What-does-%E2%80%9Csingle-source-of-truth%E2%80%9D-mean%3F)
- [How is state management different from dependency injection?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/How-is-state-management-different-from-dependency-injection%3F)
- [Should state be mutable or immutable?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Should-state-be-mutable-or-immutable%3F)
- [Where should business logic live?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Where-should-business-logic-live%3F)
- [How should loading, empty, success, and error states be modeled?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/How-should-loading%2C-empty%2C-success%2C-and-error-states-be-modeled%3F)
- [What is derived state?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/What-is-derived-state%3F)
- [How should one-off UI effects be handled?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/How-should-one-off-UI-effects-be-handled%3F)
- [Why did a widget rebuild—or fail to rebuild?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Why-did-a-widget-rebuild%E2%80%94or-fail-to-rebuild%3F)
- [Which state-management approach should I choose?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Which-state-management-approach-should-I-choose%3F)
- [How is state-management logic tested?](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/How-is-state-management-logic-tested%3F)

## Best Practices

- [Give each piece of state one clear owner](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Give-each-piece-of-state-one-clear-owner)
- [Keep state close to the widgets that need it](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Keep-state-close-to-the-widgets-that-need-it)
- [Use immutable snapshots for non-trivial state](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Use-immutable-snapshots-for-non-trivial-state)
- [Model asynchronous states explicitly](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Model-asynchronous-states-explicitly)
- [Derive values instead of storing duplicate state](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Derive-values-instead-of-storing-duplicate-state)
- [Keep UI builders pure and move side effects elsewhere](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Keep-UI-builders-pure-and-move-side-effects-elsewhere)
- [Separate presentation, business, and data-access responsibilities](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Separate-presentation%2C-business%2C-and-data-access-responsibilities)
- [Inject repositories and services instead of creating them in state objects](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Inject-repositories-and-services-instead-of-creating-them-in-state-objects)
- [Expose user intent instead of arbitrary setters](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Expose-user-intent-instead-of-arbitrary-setters)
- [Select only the state a widget needs](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Select-only-the-state-a-widget-needs)
- [Create new collections instead of mutating shared ones](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Create-new-collections-instead-of-mutating-shared-ones)
- [Prevent stale asynchronous work from overwriting newer state](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Prevent-stale-asynchronous-work-from-overwriting-newer-state)
- [Keep widgets, controllers, and `BuildContext` out of application state](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Keep-widgets%2C-controllers%2C-and-BuildContext-out-of-application-state)
- [Persist only durable, safe, and versionable state](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Persist-only-durable%2C-safe%2C-and-versionable-state)
- [Represent failures in terms the UI can act on](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Represent-failures-in-terms-the-UI-can-act-on)
- [Dispose state owners and subscriptions with the correct lifecycle](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Dispose-state-owners-and-subscriptions-with-the-correct-lifecycle)
- [Test transitions, failures, retries, and race conditions](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Test-transitions%2C-failures%2C-retries%2C-and-race-conditions)
- [Choose the simplest suitable state-management primitive](https://app.syntblaze.com/qsp/flutter/Packages/State-Management/Choose-the-simplest-suitable-state-management-primitive)

[< Back to packages](../README.md)
