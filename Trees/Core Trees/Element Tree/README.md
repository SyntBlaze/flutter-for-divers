# Element Tree

The element tree is Flutter's persistent, mutable representation of the UI.
Widgets describe a configuration for a moment in time; elements hold each
widget's place in the hierarchy, connect it to its build context, and decide
whether a new widget can update the existing subtree. Render-object elements
also bridge the element tree to the render-object tree.

```text
Widget configuration
        |
        v
      Element ----------------------> BuildOwner
        |                          dirty elements / build scheduling
        +-> ComponentElement
        |      +-> StatelessElement
        |      +-> StatefulElement -> State
        |      +-> ProxyElement
        |
        +-> RenderObjectElement ----> RenderObject
               +-> leaf
               +-> single child
               +-> multiple children
```

An element normally stays mounted while compatible widget configurations
replace one another at the same location. Its lifecycle and identity therefore
explain why state survives some rebuilds, why inherited dependencies trigger
new builds, and why moving or removing a subtree can deactivate and eventually
unmount its elements.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree) — Focused, bite-sized article covering Element Tree
- [Learning Path](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree) — Step-by-step material that builds practical Element Tree knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree) — Structured, in-depth material for learning about Element Tree thoroughly

## Element Tree Nodes

| Topic | Role in the element tree | Key relationship | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Element | Persistent instance that occupies a location in the UI hierarchy and implements `BuildContext` | Holds the current widget and participates in mounting, updating, building, and unmounting | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/Element "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/Element "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/Element "Deep Dive") |
| ComponentElement | Element whose widget composes its subtree by building another widget | Reconciles the result of `build` with its current child element | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/ComponentElement "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/ComponentElement "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/ComponentElement "Deep Dive") |
| StatelessElement | Element created for a `StatelessWidget` | Calls the widget's `build` method when first built or marked dirty | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/StatelessElement "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/StatelessElement "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/StatelessElement "Deep Dive") |
| StatefulElement | Element created for a `StatefulWidget` | Creates, owns, and binds a `State` object to a stable tree location | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/StatefulElement "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/StatefulElement "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/StatefulElement "Deep Dive") |
| ProxyElement | Base element for proxy widgets that pass through or expose information | Updates its child and may notify dependent elements when its widget changes | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/ProxyElement "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/ProxyElement "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/ProxyElement "Deep Dive") |
| InheritedElement | Element that tracks consumers of an `InheritedWidget` | Registers dependencies and selectively marks dependents for rebuilding | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/InheritedElement "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/InheritedElement "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/InheritedElement "Deep Dive") |
| ParentDataElement | Element that applies a `ParentDataWidget`'s configuration to a descendant render object | Carries parent-specific layout data across the element-to-render-object boundary | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/ParentDataElement "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/ParentDataElement "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/ParentDataElement "Deep Dive") |
| RenderObjectElement | Element that creates and manages a render object | Connects widget configuration and element children to the render-object tree | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/RenderObjectElement "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/RenderObjectElement "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/RenderObjectElement "Deep Dive") |
| LeafRenderObjectElement | Render-object element with no element children | Manages a leaf render object and its widget-driven updates | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/LeafRenderObjectElement "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/LeafRenderObjectElement "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/LeafRenderObjectElement "Deep Dive") |
| SingleChildRenderObjectElement | Render-object element that manages at most one child | Inserts, moves, updates, or removes one child render object | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/SingleChildRenderObjectElement "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/SingleChildRenderObjectElement "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/SingleChildRenderObjectElement "Deep Dive") |
| MultiChildRenderObjectElement | Render-object element that manages an ordered child list | Reconciles multiple child elements and their render-object slots | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/MultiChildRenderObjectElement "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/MultiChildRenderObjectElement "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/MultiChildRenderObjectElement "Deep Dive") |
| RootElement | Top element boundary through which a root widget is attached to a build owner | Anchors the framework-managed element hierarchy | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/RootElement "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/RootElement "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/RootElement "Deep Dive") |
| BuildOwner | Coordinates building, element locking, inactive elements, and finalization | Schedules and rebuilds dirty elements in a valid tree order | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/BuildOwner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/BuildOwner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/BuildOwner "Deep Dive") |
| Dirty element list | Collection of mounted elements scheduled to rebuild | Lets the build phase process invalidated elements in depth-aware order | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/Dirty-element-list "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/Dirty-element-list "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/Dirty-element-list "Deep Dive") |
| Element lifecycle | State machine governing an element from creation through removal | Controls which tree operations and context lookups are valid | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/Element-lifecycle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/Element-lifecycle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/Element-lifecycle "Deep Dive") |
| Mounted element | Element currently associated with the active widget tree | May build, resolve ancestors, and participate in framework updates | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/Mounted-element "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/Mounted-element "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/Mounted-element "Deep Dive") |
| Inactive element | Element removed from its parent but retained temporarily for possible reinsertion | Can be reactivated in the same frame, notably during global-key reparenting | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/Inactive-element "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/Inactive-element "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/Inactive-element "Deep Dive") |
| Defunct element | Permanently unmounted element whose framework associations have been released | Cannot be remounted or safely used as an active build context | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree/Defunct-element "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree/Defunct-element "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree/Defunct-element "Deep Dive") |

## Questions

- [How is an element different from its widget and render object?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/How-is-an-element-different-from-its-widget-and-render-object%3F)
- [Why does Flutter keep elements between widget rebuilds?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Why-does-Flutter-keep-elements-between-widget-rebuilds%3F)
- [How does a component element reconcile the widget returned by `build`?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/How-does-a-component-element-reconcile-the-widget-returned-by-build%3F)
- [When does a stateless element rebuild?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/When-does-a-stateless-element-rebuild%3F)
- [How does a stateful element preserve and update its `State` object?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/How-does-a-stateful-element-preserve-and-update-its-State-object%3F)
- [How do proxy and inherited elements propagate information through the tree?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/How-do-proxy-and-inherited-elements-propagate-information-through-the-tree%3F)
- [How are inherited-widget dependencies registered and invalidated?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/How-are-inherited-widget-dependencies-registered-and-invalidated%3F)
- [How does parent data reach the correct descendant render object?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/How-does-parent-data-reach-the-correct-descendant-render-object%3F)
- [How does a render-object element connect the element and render-object trees?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/How-does-a-render-object-element-connect-the-element-and-render-object-trees%3F)
- [How do leaf, single-child, and multi-child elements differ?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/How-do-leaf%2C-single-child%2C-and-multi-child-elements-differ%3F)
- [How are ordered child elements reconciled and assigned render-object slots?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/How-are-ordered-child-elements-reconciled-and-assigned-render-object-slots%3F)
- [What anchors the element tree at its root?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/What-anchors-the-element-tree-at-its-root%3F)
- [Why does a build owner rebuild dirty elements in tree order?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Why-does-a-build-owner-rebuild-dirty-elements-in-tree-order%3F)
- [What marks an element dirty, and when is the dirty list flushed?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/What-marks-an-element-dirty%2C-and-when-is-the-dirty-list-flushed%3F)
- [Which transitions can occur during an element's lifecycle?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Which-transitions-can-occur-during-an-element's-lifecycle%3F)
- [When is it valid to use an element as a `BuildContext`?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/When-is-it-valid-to-use-an-element-as-a-BuildContext%3F)
- [Why can an element become inactive before it is unmounted?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Why-can-an-element-become-inactive-before-it-is-unmounted%3F)
- [Can a defunct element ever be mounted again?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Can-a-defunct-element-ever-be-mounted-again%3F)

## Best Practices

- [Treat `BuildContext` as a location in the element tree, not as a widget](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Treat-BuildContext-as-a-location-in-the-element-tree%2C-not-as-a-widget)
- [Keep component build methods deterministic and free of side effects](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Keep-component-build-methods-deterministic-and-free-of-side-effects)
- [Keep expensive work out of frequently rebuilt stateless subtrees](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Keep-expensive-work-out-of-frequently-rebuilt-stateless-subtrees)
- [Own mutable UI state in the `State` associated with the correct tree location](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Own-mutable-UI-state-in-the-State-associated-with-the-correct-tree-location)
- [Use inherited dependencies when consumers should rebuild after an ambient value changes](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Use-inherited-dependencies-when-consumers-should-rebuild-after-an-ambient-value-changes)
- [Use non-listening ancestor lookup only when no rebuild dependency is required](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Use-non-listening-ancestor-lookup-only-when-no-rebuild-dependency-is-required)
- [Place parent-data widgets under the render-object widget that understands their data](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Place-parent-data-widgets-under-the-render-object-widget-that-understands-their-data)
- [Keep render-object child models consistent with their element child models](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Keep-render-object-child-models-consistent-with-their-element-child-models)
- [Give ordered children stable keys when identity must survive insertion or reordering](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Give-ordered-children-stable-keys-when-identity-must-survive-insertion-or-reordering)
- [Let the framework coordinate dirty-element scheduling through the build owner](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Let-the-framework-coordinate-dirty-element-scheduling-through-the-build-owner)
- [Avoid retaining a build context beyond the mounted lifetime of its element](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Avoid-retaining-a-build-context-beyond-the-mounted-lifetime-of-its-element)
- [Check mounted state after an asynchronous gap before using a context or updating state](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Check-mounted-state-after-an-asynchronous-gap-before-using-a-context-or-updating-state)
- [Reserve global-key reparenting for cases that genuinely require element and state preservation](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Reserve-global-key-reparenting-for-cases-that-genuinely-require-element-and-state-preservation)
- [Release subscriptions and other owned resources before an element becomes defunct](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Release-subscriptions-and-other-owned-resources-before-an-element-becomes-defunct)
- [Use framework lifecycle hooks instead of depending on internal lifecycle states](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Element-Tree/Use-framework-lifecycle-hooks-instead-of-depending-on-internal-lifecycle-states)

[< Back to Core Trees](../README.md)
