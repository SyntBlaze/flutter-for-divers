# Tree Lifecycle and Pipeline

Flutter turns immutable widget configurations into persistent elements, mutable
state, render objects, and finally a composited frame. Reconciliation decides
whether a widget updates an existing element or causes a new element to be
inflated. Lifecycle hooks expose the safe points at which state can initialize,
respond to dependencies and configuration changes, build, deactivate, and
dispose.

```text
new widget configuration
          |
          v
reconcile at the element's tree location
          |
          +-> no compatible element -> inflate / mount
          |                              |
          |                         create State
          |                              |
          |                initState -> didChangeDependencies --+
          |                                                   |
          +-> compatible element -> update -> didUpdateWidget -+
                                                              |
                                                              v
frame pipeline:        Build -> create / update / attach RenderObjects
                                          |
                                          v
                               Layout -> Paint -> Compositing -> Semantics

removed subtree: deactivate -> reactivate in the same frame
                           \-> unmount -> dispose

active render tree: attached RenderObject <-> detached RenderObject
```

The framework can revisit parts of these processes independently: a state
change may require another build without recreating state, layout invalidation
does not necessarily require rebuilding widgets, and paint or compositing work
can sometimes be updated without repeating earlier phases. Attachment describes
membership in an active rendering pipeline, while mounting describes an
element or state object's association with the widget tree.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline) — Focused, bite-sized article covering Tree Lifecycle and Pipeline
- [Learning Path](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline) — Step-by-step material that builds practical Tree Lifecycle and Pipeline knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline) — Structured, in-depth material for learning about Tree Lifecycle and Pipeline thoroughly

## Lifecycle Events and Pipeline Stages

| Topic | Role in the lifecycle or pipeline | Key relationship | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Widget configuration update | Supplies a new immutable description for an existing tree location | Compatible runtime type and key let the current element update instead of being replaced | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Widget-configuration-update "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Widget-configuration-update "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Widget-configuration-update "Deep Dive") |
| Element inflation | Creates and mounts an element when no existing element can represent a widget | Turns a widget configuration into a persistent node at a parent-provided slot | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-inflation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-inflation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-inflation "Deep Dive") |
| Element update | Reconfigures an existing compatible element with a new widget | Preserves element identity and, for stateful elements, the associated `State` object | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-update "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-update "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-update "Deep Dive") |
| Element deactivation | Temporarily removes an element from the active tree | Allows same-frame reinsertion, including reparenting through a global key | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-deactivation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-deactivation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-deactivation "Deep Dive") |
| Element unmount | Permanently releases an inactive element at finalization | Ends the element lifecycle after it was not reactivated | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-unmount "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-unmount "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Element-unmount "Deep Dive") |
| State creation | Creates mutable state for a newly inflated `StatefulWidget` | A `StatefulElement` owns the new `State` and associates it with a tree location | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/State-creation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/State-creation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/State-creation "Deep Dive") |
| `initState()` | Performs one-time initialization after a `State` is mounted | Runs once before dependency initialization and the first build | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/initState-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/initState-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/initState-method "Deep Dive") |
| `didChangeDependencies()` | Responds when inherited dependencies are first available or later change | Runs after `initState()` and before a dependency-driven rebuild | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/didChangeDependencies-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/didChangeDependencies-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/didChangeDependencies-method "Deep Dive") |
| `build()` | Produces a widget description for the current configuration and dependencies | Its result is reconciled with the existing child element subtree | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/build-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/build-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/build-method "Deep Dive") |
| `didUpdateWidget()` | Responds when the parent supplies a compatible replacement widget | Runs before the subsequent build while preserving the same `State` object | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/didUpdateWidget-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/didUpdateWidget-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/didUpdateWidget-method "Deep Dive") |
| `deactivate()` | Notifies `State` that its element has left the active tree | May be followed by reinsertion or, if removal is permanent, disposal | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/deactivate-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/deactivate-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/deactivate-method "Deep Dive") |
| `dispose()` | Releases resources when a `State` is permanently unmounted | Runs once at the terminal end of that state object's lifecycle | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/dispose-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/dispose-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/dispose-method "Deep Dive") |
| RenderObject attachment | Connects a render-object subtree to an owner and active rendering pipeline | Enables layout, paint, compositing, and semantics work to be scheduled | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/RenderObject-attachment "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/RenderObject-attachment "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/RenderObject-attachment "Deep Dive") |
| RenderObject detachment | Disconnects a render-object subtree from its rendering owner | Stops active pipeline participation without necessarily destroying the render object | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/RenderObject-detachment "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/RenderObject-detachment "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/RenderObject-detachment "Deep Dive") |
| Build | Reconciles dirty elements and produces updated widget and render-object configuration | Framework output from this phase can invalidate layout, paint, or semantics | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Build "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Build "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Build "Deep Dive") |
| Layout | Computes render-object sizes and positions under parent-provided constraints | Geometry changes can require repainting and semantics updates | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Layout "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Layout "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Layout "Deep Dive") |
| Paint | Records visual drawing operations and constructs or updates layers | Traverses render objects in paint order after layout is current | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Paint "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Paint "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Paint "Deep Dive") |
| Compositing | Combines retained layers into the scene submitted to the engine | Applies transforms, clips, opacity, filters, and platform composition | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Compositing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Compositing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Compositing "Deep Dive") |
| Semantics | Produces and updates the accessibility tree from semantic annotations | Usually follows current layout and paint information but is managed as its own pipeline phase | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Semantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Semantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Lifecycle-and-Pipeline/Semantics "Deep Dive") |

## Questions

- [When does Flutter update an element instead of inflating a new one?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/When-does-Flutter-update-an-element-instead-of-inflating-a-new-one%3F)
- [How is a widget converted into a mounted element?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/How-is-a-widget-converted-into-a-mounted-element%3F)
- [What identity survives an element update?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/What-identity-survives-an-element-update%3F)
- [Why does deactivation happen before unmounting?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Why-does-deactivation-happen-before-unmounting%3F)
- [When does an inactive element become permanently unmounted?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/When-does-an-inactive-element-become-permanently-unmounted%3F)
- [Who creates and owns a `State` object?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Who-creates-and-owns-a-State-object%3F)
- [What initialization belongs in `initState()`?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/What-initialization-belongs-in-initState()%3F)
- [Why can `didChangeDependencies()` run more than once?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Why-can-didChangeDependencies()-run-more-than-once%3F)
- [What must a `build()` method avoid doing?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/What-must-a-build()-method-avoid-doing%3F)
- [When does `didUpdateWidget()` run without recreating state?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/When-does-didUpdateWidget()-run-without-recreating-state%3F)
- [Can a state object return to the active tree after `deactivate()`?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Can-a-state-object-return-to-the-active-tree-after-deactivate()%3F)
- [Which resources should be released in `dispose()`?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Which-resources-should-be-released-in-dispose()%3F)
- [How does render-object attachment differ from element mounting?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/How-does-render-object-attachment-differ-from-element-mounting%3F)
- [Can a detached render object later be attached again?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Can-a-detached-render-object-later-be-attached-again%3F)
- [How do build, layout, and paint invalidation differ?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/How-do-build%2C-layout%2C-and-paint-invalidation-differ%3F)
- [How do constraints flow down and geometry flow up during layout?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/How-do-constraints-flow-down-and-geometry-flow-up-during-layout%3F)
- [When does painting create or update composited layers?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/When-does-painting-create-or-update-composited-layers%3F)
- [What work is retained and reused during compositing?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/What-work-is-retained-and-reused-during-compositing%3F)
- [How is the accessibility tree updated independently of visual pixels?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/How-is-the-accessibility-tree-updated-independently-of-visual-pixels%3F)

## Best Practices

- [Keep widget configurations immutable and represent changes with new widget instances](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Keep-widget-configurations-immutable-and-represent-changes-with-new-widget-instances)
- [Use stable keys only where tree position alone cannot express identity](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Use-stable-keys-only-where-tree-position-alone-cannot-express-identity)
- [Do not depend on an element remaining deactivated beyond the current frame](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Do-not-depend-on-an-element-remaining-deactivated-beyond-the-current-frame)
- [Initialize one-time resources in `initState()` without reading inherited dependencies there](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Initialize-one-time-resources-in-initState()-without-reading-inherited-dependencies-there)
- [Respond to inherited values in `didChangeDependencies()` and keep repeated calls safe](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Respond-to-inherited-values-in-didChangeDependencies()-and-keep-repeated-calls-safe)
- [Keep `build()` deterministic, fast, and free of side effects](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Keep-build()-deterministic%2C-fast%2C-and-free-of-side-effects)
- [Update configuration-dependent subscriptions in `didUpdateWidget()`](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Update-configuration-dependent-subscriptions-in-didUpdateWidget())
- [Release controllers, listeners, subscriptions, and other owned resources in `dispose()`](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Release-controllers%2C-listeners%2C-subscriptions%2C-and-other-owned-resources-in-dispose())
- [Check `mounted` after asynchronous gaps before using `State` or its context](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Check-mounted-after-asynchronous-gaps-before-using-State-or-its-context)
- [Let the framework manage normal render-object attachment and detachment](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Let-the-framework-manage-normal-render-object-attachment-and-detachment)
- [Invalidate only the earliest pipeline phase whose inputs changed](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Invalidate-only-the-earliest-pipeline-phase-whose-inputs-changed)
- [Keep intrinsic and repeated layout work under control](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Keep-intrinsic-and-repeated-layout-work-under-control)
- [Use repaint boundaries where measured repaint isolation outweighs compositing cost](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Use-repaint-boundaries-where-measured-repaint-isolation-outweighs-compositing-cost)
- [Avoid unnecessary opacity, clipping, filtering, and extra compositing layers](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Avoid-unnecessary-opacity%2C-clipping%2C-filtering%2C-and-extra-compositing-layers)
- [Test semantic labels, actions, focus order, and merged nodes with accessibility tools](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Lifecycle-and-Pipeline/Test-semantic-labels%2C-actions%2C-focus-order%2C-and-merged-nodes-with-accessibility-tools)

[< Back to trees](../README.md)
