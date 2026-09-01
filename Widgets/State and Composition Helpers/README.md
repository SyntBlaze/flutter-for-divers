# State and Composition Helpers

Flutter composes interfaces from widgets while state and inherited values
determine what each subtree builds. `InheritedWidget`, `InheritedModel`, and
`InheritedNotifier` publish data or change signals through `BuildContext`.
Builder widgets create focused rebuild boundaries or provide a context at a
specific place in the tree, while `RestorationScope` organizes restorable state
so it can survive process termination and later reconstruction.

```text
ancestor-owned state
       |
       +--> InheritedWidget / InheritedModel / InheritedNotifier
       |                  |
       |                  v
       |          dependent descendants rebuild
       |
       +--> ValueListenableBuilder / AnimatedBuilder
       |                  |
       |                  v
       |          focused listenable-driven rebuild
       |
       +--> Builder / StatefulBuilder
       |                  |
       |                  v
       |          local context or local state boundary
       |
       +--> RestorationScope -> restoration bucket hierarchy
```

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/State-and-Composition-Helpers) — Focused, bite-sized article covering State and Composition Helpers
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/State-and-Composition-Helpers) — Step-by-step material that builds practical State and Composition Helpers knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/State-and-Composition-Helpers) — Structured, in-depth material for learning about State and Composition Helpers thoroughly

## Selection and Composition Guidance

Use `InheritedWidget` when descendants need to read immutable configuration or
ancestor-owned state whose replacement should notify dependents. Use
`InheritedModel` only when consumers can depend on independent aspects and the
reduced rebuild scope is worth the added complexity. Use `InheritedNotifier`
when an existing `Listenable` owns the change signal; it combines inherited
lookup with notifier-driven dependency updates. These widgets distribute state
but do not decide how that state is created, mutated, or disposed, so keep
ownership and lifecycle responsibilities explicit.

Choose `ValueListenableBuilder` when a source exposes both a typed current value
and change notifications. Choose `AnimatedBuilder` for a general `Listenable`,
including an `Animation`, when the builder can read the current state directly
from that source. Pass invariant subtrees through `child` to avoid rebuilding
them on every notification, and keep each builder boundary narrow enough that
its rebuild cost and dependencies remain obvious.

Use `Builder` when code needs a `BuildContext` below an ancestor created in the
same build method. Use `StatefulBuilder` for small, short-lived state inside a
dialog, sheet, or similarly local region; move state into a dedicated
`StatefulWidget` when it needs lifecycle methods, resource ownership, testing in
isolation, or reuse. Add `RestorationScope` at stable restoration boundaries,
assign durable restoration IDs, and test by terminating and restoring the app
rather than relying only on ordinary hot reload or navigation.

## State and Composition Helpers

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `InheritedWidget` | Efficiently exposes ancestor-owned data to dependent descendants | Notify only when the value relevant to dependents has meaningfully changed | [💡](https://app.syntblaze.com/qt/flutter/Widgets/State-and-Composition-Helpers/InheritedWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/State-and-Composition-Helpers/InheritedWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/State-and-Composition-Helpers/InheritedWidget "Deep Dive") |
| `InheritedModel` | Lets descendants depend on selected aspects of inherited data | Aspect partitioning helps only when dependencies are declared precisely and aspects change independently | [💡](https://app.syntblaze.com/qt/flutter/Widgets/State-and-Composition-Helpers/InheritedModel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/State-and-Composition-Helpers/InheritedModel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/State-and-Composition-Helpers/InheritedModel "Deep Dive") |
| `InheritedNotifier` | Publishes a `Listenable` through inherited lookup and rebuilds dependents when it notifies | Keep notifier identity and ownership deliberate, and do not mutate it during the build phase | [💡](https://app.syntblaze.com/qt/flutter/Widgets/State-and-Composition-Helpers/InheritedNotifier "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/State-and-Composition-Helpers/InheritedNotifier "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/State-and-Composition-Helpers/InheritedNotifier "Deep Dive") |
| `ValueListenableBuilder` | Rebuilds a subtree with the current typed value of a `ValueListenable<T>` | Hoist value-independent UI into `child` and let the widget manage listener registration | [💡](https://app.syntblaze.com/qt/flutter/Widgets/State-and-Composition-Helpers/ValueListenableBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/State-and-Composition-Helpers/ValueListenableBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/State-and-Composition-Helpers/ValueListenableBuilder "Deep Dive") |
| `AnimatedBuilder` | Rebuilds selected UI whenever a general `Listenable` notifies | It works beyond animations; keep the rebuilt region small and pass invariant content as `child` | [💡](https://app.syntblaze.com/qt/flutter/Widgets/State-and-Composition-Helpers/AnimatedBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/State-and-Composition-Helpers/AnimatedBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/State-and-Composition-Helpers/AnimatedBuilder "Deep Dive") |
| `Builder` | Builds with a new `BuildContext` at its exact location in the tree | Use its local context to access ancestors introduced above it, not the outer build context | [💡](https://app.syntblaze.com/qt/flutter/Widgets/State-and-Composition-Helpers/Builder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/State-and-Composition-Helpers/Builder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/State-and-Composition-Helpers/Builder "Deep Dive") |
| `StatefulBuilder` | Provides a local `StateSetter` for a callback-built stateful region | Store mutable values outside the builder callback so they survive its calls to `setState` | [💡](https://app.syntblaze.com/qt/flutter/Widgets/State-and-Composition-Helpers/StatefulBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/State-and-Composition-Helpers/StatefulBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/State-and-Composition-Helpers/StatefulBuilder "Deep Dive") |
| `RestorationScope` | Creates a restoration bucket boundary for restorable descendants | Use stable IDs and ensure an ancestor restoration scope or app restoration ID supplies a bucket | [💡](https://app.syntblaze.com/qt/flutter/Widgets/State-and-Composition-Helpers/RestorationScope "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/State-and-Composition-Helpers/RestorationScope "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/State-and-Composition-Helpers/RestorationScope "Deep Dive") |

## Questions

- [How does a descendant register a dependency on an `InheritedWidget`?](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/How-does-a-descendant-register-a-dependency-on-an-InheritedWidget%3F)
- [When does aspect-based dependency tracking justify an `InheritedModel`?](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/When-does-aspect-based-dependency-tracking-justify-an-InheritedModel%3F)
- [Who should create, replace, and dispose the notifier exposed by `InheritedNotifier`?](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/Who-should-create%2C-replace%2C-and-dispose-the-notifier-exposed-by-InheritedNotifier%3F)
- [When is `ValueListenableBuilder` preferable to manually adding a listener?](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/When-is-ValueListenableBuilder-preferable-to-manually-adding-a-listener%3F)
- [Why can `AnimatedBuilder` listen to objects that are not animations?](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/Why-can-AnimatedBuilder-listen-to-objects-that-are-not-animations%3F)
- [When is a fresh `BuildContext` from `Builder` necessary?](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/When-is-a-fresh-BuildContext-from-Builder-necessary%3F)
- [When should local `StatefulBuilder` state become a dedicated stateful widget?](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/When-should-local-StatefulBuilder-state-become-a-dedicated-stateful-widget%3F)
- [How do restoration scopes and restoration IDs map state into buckets?](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/How-do-restoration-scopes-and-restoration-IDs-map-state-into-buckets%3F)

## Best Practices

- [Make inherited values immutable and keep `updateShouldNotify` aligned with observable changes](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/Make-inherited-values-immutable-and-keep-updateShouldNotify-aligned-with-observable-changes)
- [Use stable, narrowly defined aspects and test that unrelated consumers do not rebuild](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/Use-stable%2C-narrowly-defined-aspects-and-test-that-unrelated-consumers-do-not-rebuild)
- [Keep notifier ownership explicit and replace notifier instances intentionally](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/Keep-notifier-ownership-explicit-and-replace-notifier-instances-intentionally)
- [Use `ValueListenableBuilder.child` for subtrees that do not depend on the current value](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/Use-ValueListenableBuilder.child-for-subtrees-that-do-not-depend-on-the-current-value)
- [Scope `AnimatedBuilder` around only the widgets affected by its listenable](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/Scope-AnimatedBuilder-around-only-the-widgets-affected-by-its-listenable)
- [Use the innermost correct context for inherited lookup, navigation, themes, and scaffolds](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/Use-the-innermost-correct-context-for-inherited-lookup%2C-navigation%2C-themes%2C-and-scaffolds)
- [Reserve `StatefulBuilder` for small local interactions without complex lifecycle needs](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/Reserve-StatefulBuilder-for-small-local-interactions-without-complex-lifecycle-needs)
- [Choose stable restoration IDs and test state restoration from a killed application](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/Choose-stable-restoration-IDs-and-test-state-restoration-from-a-killed-application)
- [Keep state ownership close to its mutation logic and expose only what descendants need](https://app.syntblaze.com/qsp/flutter/Widgets/State-and-Composition-Helpers/Keep-state-ownership-close-to-its-mutation-logic-and-expose-only-what-descendants-need)

[< Back to widgets](../README.md)
