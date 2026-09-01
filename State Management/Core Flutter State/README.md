# Core Flutter State

Flutter's built-in state tools range from a `State` object owned by one
`StatefulWidget` to inherited dependencies and reusable notification sources.
They can cover many local and shared-state needs when ownership, mutation, and
subscription boundaries remain explicit.

```text
StatefulWidget configuration
            |
            v
          State -- setState() --> rebuild

shared owner -- Listenable --> focused builder
     |
     +--> inherited scope --> dependent descendants
```

`setState()` belongs to a mounted `State` and reports that a synchronous
mutation can affect rendering. `ChangeNotifier` and `ValueNotifier` separate a
notification source from the widget lifecycle, while listenable builders can
keep rebuilding focused. Inherited widgets distribute dependencies through the
tree and establish which descendants are eligible to react.

Restoration and keep-alive solve different lifetime problems. Restoration
reconstructs registered values after the operating system destroys and later
restores an application activity. Keep-alive asks a lazy parent to retain an
existing child state while that child is temporarily outside the visible
viewport; it is not durable persistence.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State) — Focused, bite-sized article covering Core Flutter State
- [Learning Path](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State) — Step-by-step material that builds practical Core Flutter State knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State) — Structured, in-depth material for learning about Core Flutter State thoroughly

## Core Flutter State Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| StatefulWidget | Defines immutable widget configuration that creates mutable lifecycle state | Keep mutable fields on the associated state object rather than changing the widget configuration | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/StatefulWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/StatefulWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/StatefulWidget "Deep Dive") |
| State | Owns mutable data, lifecycle callbacks, and building for a stateful widget | Treat mounting and disposal as hard ownership boundaries for callbacks and resources | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/State "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/State "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/State "Deep Dive") |
| `setState()` | Reports a synchronous local mutation and schedules the affected element to rebuild | Change the state inside the callback and never call it after disposal | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/setState-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/setState-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/setState-method "Deep Dive") |
| InheritedWidget | Exposes a value to descendants and registers dependent build contexts | Notify only when the exposed dependency meaningfully changes | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/InheritedWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/InheritedWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/InheritedWidget "Deep Dive") |
| InheritedModel | Adds aspect-based dependency tracking to inherited state | Use stable, well-defined aspects so consumers rebuild only for relevant changes | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/InheritedModel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/InheritedModel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/InheritedModel "Deep Dive") |
| InheritedNotifier | Converts notifications from a `Listenable` into inherited dependency changes | Keep notifier ownership and disposal separate from the inherited wrapper when appropriate | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/InheritedNotifier "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/InheritedNotifier "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/InheritedNotifier "Deep Dive") |
| ValueNotifier | Holds one value and notifies listeners when it is replaced with a non-equal value | Replace the value rather than mutating mutable contents in place | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/ValueNotifier "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/ValueNotifier "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/ValueNotifier "Deep Dive") |
| ChangeNotifier | Maintains listeners and sends explicit invalidation notifications | Batch coherent changes and dispose the notifier at its owning boundary | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/ChangeNotifier "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/ChangeNotifier "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/ChangeNotifier "Deep Dive") |
| ValueListenableBuilder | Rebuilds from the current value of a `ValueListenable` | Pass invariant work through `child` and keep the builder free of side effects | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/ValueListenableBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/ValueListenableBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/ValueListenableBuilder "Deep Dive") |
| AnimatedBuilder | Rebuilds from any `Listenable`, despite its animation-oriented name | Hoist invariant subtrees through `child` and avoid broad notification sources | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/AnimatedBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/AnimatedBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/AnimatedBuilder "Deep Dive") |
| RestorationMixin | Registers restorable properties under stable restoration identifiers | Restore only serializable UI state and unregister or dispose properties correctly | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/RestorationMixin "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/RestorationMixin "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/RestorationMixin "Deep Dive") |
| AutomaticKeepAliveClientMixin | Sends keep-alive notifications for a child in a lazy parent | Implement `wantKeepAlive`, call `super.build`, and update the request when the preference changes | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Core-Flutter-State/AutomaticKeepAliveClientMixin "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Core-Flutter-State/AutomaticKeepAliveClientMixin "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Core-Flutter-State/AutomaticKeepAliveClientMixin "Deep Dive") |

## Questions

- [Why are mutable fields placed in `State` rather than `StatefulWidget`?](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Why-are-mutable-fields-placed-in-State-rather-than-StatefulWidget%3F)
- [What lifecycle check must asynchronous callbacks make before calling `setState()`?](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/What-lifecycle-check-must-asynchronous-callbacks-make-before-calling-setState()%3F)
- [How does an inherited dependency differ from looking up an ancestor without listening?](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/How-does-an-inherited-dependency-differ-from-looking-up-an-ancestor-without-listening%3F)
- [When is aspect-based dependency tracking worth the added complexity?](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/When-is-aspect-based-dependency-tracking-worth-the-added-complexity%3F)
- [Who owns and disposes a notifier passed to an `InheritedNotifier`?](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Who-owns-and-disposes-a-notifier-passed-to-an-InheritedNotifier%3F)
- [Why can mutating a collection inside a `ValueNotifier` fail to notify consumers?](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Why-can-mutating-a-collection-inside-a-ValueNotifier-fail-to-notify-consumers%3F)
- [How narrowly should a `ChangeNotifier` define the changes it broadcasts?](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/How-narrowly-should-a-ChangeNotifier-define-the-changes-it-broadcasts%3F)
- [Which widget work can be passed as the `child` of a listenable builder?](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Which-widget-work-can-be-passed-as-the-child-of-a-listenable-builder%3F)
- [How does restorable state differ from ordinary persisted application data?](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/How-does-restorable-state-differ-from-ordinary-persisted-application-data%3F)
- [When should a lazily built child be kept alive rather than recreated?](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/When-should-a-lazily-built-child-be-kept-alive-rather-than-recreated%3F)

## Best Practices

- [Keep local UI state in the closest lifecycle owner that needs it](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Keep-local-UI-state-in-the-closest-lifecycle-owner-that-needs-it)
- [Make `setState()` callbacks synchronous, small, and limited to the mutation](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Make-setState()-callbacks-synchronous%2C-small%2C-and-limited-to-the-mutation)
- [Stop asynchronous work or reject late results when a state object is disposed](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Stop-asynchronous-work-or-reject-late-results-when-a-state-object-is-disposed)
- [Use inherited dependencies when subtree scope is part of the design](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Use-inherited-dependencies-when-subtree-scope-is-part-of-the-design)
- [Prefer aspect filtering only when consumers genuinely depend on distinct slices](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Prefer-aspect-filtering-only-when-consumers-genuinely-depend-on-distinct-slices)
- [Give every notifier one clear owner responsible for disposal](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Give-every-notifier-one-clear-owner-responsible-for-disposal)
- [Replace `ValueNotifier` values instead of mutating their internal collections](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Replace-ValueNotifier-values-instead-of-mutating-their-internal-collections)
- [Send notifications only after a coherent state transition](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Send-notifications-only-after-a-coherent-state-transition)
- [Hoist invariant subtrees out of listenable builder callbacks](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Hoist-invariant-subtrees-out-of-listenable-builder-callbacks)
- [Keep all builders pure and repeatable](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Keep-all-builders-pure-and-repeatable)
- [Use restoration identifiers and property registration consistently](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Use-restoration-identifiers-and-property-registration-consistently)
- [Treat keep-alive as temporary retention, not persistence](https://app.syntblaze.com/qsp/flutter/State-Management/Core-Flutter-State/Treat-keep-alive-as-temporary-retention%2C-not-persistence)

[< Back to State Management](../README.md)
