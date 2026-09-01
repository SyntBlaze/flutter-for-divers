# Core Trees

Flutter represents an interface through several related hierarchies rather
than one universal tree. Widgets provide immutable configuration, elements
retain mounted framework identity, render objects perform layout and paint,
and layers retain compositing operations. Semantics and focus form their own
interaction-facing structures.

```text
Widget Tree --inflates / updates--> Element Tree --configures--> RenderObject Tree
                                                               |          |
                                                               | paint    | semantics
                                                               v          v
                                                           Layer Tree  Semantics Tree

Widget and element structure --attaches focus nodes--> Focus Tree
```

The trees overlap, but their nodes do not have a one-to-one relationship. A
single element may build several descendants, a render object may contribute
or merge semantics, and only paint operations that need retained compositing
state produce layers. Follow the hierarchy responsible for the behavior being
debugged instead of assuming every widget has a matching node in every tree.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees) — Focused, bite-sized article covering Core Trees
- [Learning Path](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees) — Step-by-step material that builds practical Core Trees knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees) — Structured, in-depth material for learning about Core Trees thoroughly

## Core Tree Indexes

| Tree | What it represents | Primary relationship | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| [Widget Tree](<Widget Tree/README.md>) | Immutable descriptions of the UI for a particular configuration | Widgets create or update elements and express composition or render-object configuration | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree "Deep Dive") |
| [Element Tree](<Element Tree/README.md>) | Persistent mounted instances that connect widgets to framework state and render objects | Elements reconcile new widgets with existing children while preserving compatible identity | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Element-Tree "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Element-Tree "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Element-Tree "Deep Dive") |
| [RenderObject Tree](<RenderObject Tree/README.md>) | Mutable objects responsible for layout, painting, hit testing, and semantics input | Render-object elements configure render objects and maintain their child structure | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree "Deep Dive") |
| [Layer Tree](<Layer Tree/README.md>) | Retained compositing records for transforms, clips, effects, pictures, textures, and platform views | Painting creates or updates layers that are assembled into an engine scene | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree "Deep Dive") |
| [Semantics Tree](<Semantics Tree/README.md>) | Accessibility-facing nodes, properties, actions, grouping, and traversal information | Render semantics are compiled into nodes consumed by platform accessibility services | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Semantics-Tree "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Semantics-Tree "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Semantics-Tree "Deep Dive") |
| [Focus Tree](<Focus Tree/README.md>) | Focus nodes and scopes used for keyboard focus and traversal | Focus widgets attach nodes whose hierarchy usually follows the relevant UI structure | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree "Deep Dive") |

## Working Across the Trees

- Start with the Widget Tree when a configuration or composition decision is wrong.
- Inspect the Element Tree when rebuilds, dependencies, identity, or mounted state are involved.
- Inspect the RenderObject Tree when constraints, geometry, hit testing, painting, or parent data are involved.
- Inspect the Layer Tree when transforms, clipping, effects, retained painting, or platform composition are involved.
- Inspect the Semantics Tree when assistive technology receives the wrong structure, label, action, or order.
- Inspect the Focus Tree when keyboard events, primary focus, scopes, or traversal behave unexpectedly.

[< Back to Trees](../README.md)
