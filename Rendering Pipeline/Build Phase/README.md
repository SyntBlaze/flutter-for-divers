# Build Phase

Flutter's build phase reconciles immutable widget configurations with the
persistent element tree. A state or dependency change marks an element dirty;
the `BuildOwner` then rebuilds eligible dirty elements in depth order so that
ancestors are processed before their descendants. Rebuilding produces new
widget descriptions, not a new element tree from scratch.

For each new widget, the parent element either updates a compatible child,
inflates a replacement, moves a globally keyed child, or removes the old child.
Compatibility is determined by `Widget.canUpdate`: runtime type and key must
match. Reusing an element preserves its identity and, for a `StatefulWidget`,
its `State`; replacing it creates a new lifecycle. The same reconciliation can
also update render-object configuration and trigger later layout or paint work.

```text
state or inherited dependency changes
                 │
                 v
        element.markNeedsBuild()
                 │
                 v
     BuildOwner schedules dirty element
                 │
                 v
       buildScope() during the frame
       (eligible ancestors first)
                 │
                 v
          performRebuild()
                 │
                 v
       new widget configuration(s)
                 │
                 v
            updateChild()
         ┌───────┴────────┐
         │ canUpdate?     │
       yes                no
         │                 │
 update existing       deactivate old child;
 element and keep      inflate replacement
 identity/State
```

Inherited lookups are part of this process as well. Calling
`dependOnInheritedWidgetOfExactType` through a `BuildContext` records a
dependency on the corresponding inherited element. When that inherited value
notifies dependents, the consumers become eligible to rebuild in a later build
scope.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase) — Focused, bite-sized article covering Build Phase
- [Learning Path](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase) — Step-by-step material that builds practical Build Phase knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase) — Structured, in-depth material for learning about Build Phase thoroughly

## Build Phase Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Widget | Provides an immutable description of part of the user interface | A new widget instance does not necessarily imply a new element or `State` | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/Widget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/Widget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/Widget "Deep Dive") |
| Element | Maintains a mounted widget instance and its place in the framework tree | Element identity persists only while reconciliation can reuse the element | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/Element "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/Element "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/Element "Deep Dive") |
| BuildContext | Exposes an element location for inherited lookup, navigation, and tree access | A context is tied to its mounted location, not permanently to a particular widget value | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/BuildContext "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/BuildContext "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/BuildContext "Deep Dive") |
| BuildOwner | Tracks dirty elements and coordinates their ordered rebuilds | Applications normally rely on `WidgetsBinding` to own and drive it | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/BuildOwner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/BuildOwner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/BuildOwner "Deep Dive") |
| Dirty elements list | Collects elements scheduled for the next eligible build scope | Dirty elements are ordered so eligible ancestors rebuild before descendants | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/Dirty-elements-list "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/Dirty-elements-list "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/Dirty-elements-list "Deep Dive") |
| `markNeedsBuild()` | Marks an element dirty so it will rebuild in a future build scope | Calling it during build is restricted because it can invalidate the active traversal | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/markNeedsBuild-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/markNeedsBuild-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/markNeedsBuild-method "Deep Dive") |
| `scheduleBuildFor()` | Adds a dirty element to the `BuildOwner` rebuild schedule | This is framework coordination; normal widgets request rebuilds through state and element APIs | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/scheduleBuildFor-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/scheduleBuildFor-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/scheduleBuildFor-method "Deep Dive") |
| `buildScope()` | Rebuilds eligible dirty elements within a defined portion of the tree | Elements dirtied outside the active scope wait for an eligible scope | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/buildScope-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/buildScope-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/buildScope-method "Deep Dive") |
| `performRebuild()` | Executes an element rebuild and reconciles its resulting widgets | Implementations differ among component, render-object, and other element types | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/performRebuild-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/performRebuild-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/performRebuild-method "Deep Dive") |
| `updateChild()` | Inflates, updates, moves, or removes one child element during reconciliation | The new widget, old child, and parent-provided slot determine the outcome | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/updateChild-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/updateChild-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/updateChild-method "Deep Dive") |
| `canUpdate()` | Tests widget runtime type and key to decide whether an element can be reused | Both runtime type and key equality must match | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/canUpdate-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/canUpdate-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/canUpdate-method "Deep Dive") |
| `GlobalKey` reparenting | Moves a keyed element across parents in the same frame while preserving its `State` | Reparenting deactivates the subtree and can trigger inherited-dependency rebuilds | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/GlobalKey-reparenting "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/GlobalKey-reparenting "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/GlobalKey-reparenting "Deep Dive") |
| Inherited dependency tracking | Registers inherited-widget consumers and rebuilds them when dependencies change | Dependency-forming lookup must occur while the context is mounted and in a valid lifecycle phase | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Build-Phase/Inherited-dependency-tracking "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Build-Phase/Inherited-dependency-tracking "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Build-Phase/Inherited-dependency-tracking "Deep Dive") |

## Questions

- [What work belongs to Flutter's build phase?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/What-work-belongs-to-Flutter's-build-phase%3F)
- [Why can Flutter create new widgets without recreating the entire element tree?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Why-can-Flutter-create-new-widgets-without-recreating-the-entire-element-tree%3F)
- [How do widgets, elements, and render objects differ during a rebuild?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/How-do-widgets%2C-elements%2C-and-render-objects-differ-during-a-rebuild%3F)
- [When does `setState` cause an element to become dirty?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/When-does-setState-cause-an-element-to-become-dirty%3F)
- [How does `BuildOwner` order dirty elements within a build scope?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/How-does-BuildOwner-order-dirty-elements-within-a-build-scope%3F)
- [Why are ancestors generally rebuilt before their dirty descendants?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Why-are-ancestors-generally-rebuilt-before-their-dirty-descendants%3F)
- [When is calling `markNeedsBuild()` during a build allowed or rejected?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/When-is-calling-markNeedsBuild()-during-a-build-allowed-or-rejected%3F)
- [What happens inside `performRebuild()` for a component element?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/What-happens-inside-performRebuild()-for-a-component-element%3F)
- [How does `updateChild()` choose between updating, inflating, moving, and removing an element?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/How-does-updateChild()-choose-between-updating%2C-inflating%2C-moving%2C-and-removing-an-element%3F)
- [Which runtime-type and key combinations make `Widget.canUpdate` return true?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Which-runtime-type-and-key-combinations-make-Widget.canUpdate-return-true%3F)
- [When does rebuilding preserve a `State` object, and when is it discarded?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/When-does-rebuilding-preserve-a-State-object%2C-and-when-is-it-discarded%3F)
- [How do child slots participate in reordering and reconciliation?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/How-do-child-slots-participate-in-reordering-and-reconciliation%3F)
- [What happens when a `GlobalKey` moves a subtree to a new parent?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/What-happens-when-a-GlobalKey-moves-a-subtree-to-a-new-parent%3F)
- [How does an inherited-widget lookup register a dependency?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/How-does-an-inherited-widget-lookup-register-a-dependency%3F)
- [When does an inherited dependency cause `didChangeDependencies` and a rebuild?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/When-does-an-inherited-dependency-cause-didChangeDependencies-and-a-rebuild%3F)
- [How can build work cause later layout or paint work?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/How-can-build-work-cause-later-layout-or-paint-work%3F)
- [How can Flutter DevTools help identify an expensive rebuild?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/How-can-Flutter-DevTools-help-identify-an-expensive-rebuild%3F)

## Best Practices

- [Keep `build` methods pure, synchronous, and free of externally visible side effects](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Keep-build-methods-pure%2C-synchronous%2C-and-free-of-externally-visible-side-effects)
- [Move expensive computation and I/O out of `build`](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Move-expensive-computation-and-I%2FO-out-of-build)
- [Call `setState` only for mutations that affect the rendered result](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Call-setState-only-for-mutations-that-affect-the-rendered-result)
- [Check that a `State` or context is still mounted after an asynchronous gap](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Check-that-a-State-or-context-is-still-mounted-after-an-asynchronous-gap)
- [Split large widgets at stable responsibility boundaries to localize rebuild work](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Split-large-widgets-at-stable-responsibility-boundaries-to-localize-rebuild-work)
- [Use `const` widgets where the configuration is compile-time constant](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Use-const-widgets-where-the-configuration-is-compile-time-constant)
- [Preserve widget runtime type and key when existing state should survive reconciliation](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Preserve-widget-runtime-type-and-key-when-existing-state-should-survive-reconciliation)
- [Use stable keys for reorderable or insertable sibling collections](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Use-stable-keys-for-reorderable-or-insertable-sibling-collections)
- [Prefer local keys unless global access or cross-parent reparenting is required](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Prefer-local-keys-unless-global-access-or-cross-parent-reparenting-is-required)
- [Create long-lived `GlobalKey` instances outside `build`](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Create-long-lived-GlobalKey-instances-outside-build)
- [Read inherited values as close as practical to the widgets that consume them](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Read-inherited-values-as-close-as-practical-to-the-widgets-that-consume-them)
- [Use non-listening lookup APIs when a dependency-driven rebuild is not required](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Use-non-listening-lookup-APIs-when-a-dependency-driven-rebuild-is-not-required)
- [Avoid manually invoking framework build-scheduling internals in application code](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Avoid-manually-invoking-framework-build-scheduling-internals-in-application-code)
- [Profile build cost in profile mode before optimizing rebuild boundaries](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Profile-build-cost-in-profile-mode-before-optimizing-rebuild-boundaries)
- [Verify rebuild behavior with DevTools instead of assuming every new widget is expensive](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Build-Phase/Verify-rebuild-behavior-with-DevTools-instead-of-assuming-every-new-widget-is-expensive)

[< Back to Rendering Pipeline](../README.md)
