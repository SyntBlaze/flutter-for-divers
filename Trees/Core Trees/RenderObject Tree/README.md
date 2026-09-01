# RenderObject Tree

The render-object tree is Flutter's mutable hierarchy for layout, painting, hit
testing, and producing semantics information. Render-object elements create and
update these objects from widget configuration, while each render object
negotiates constraints and geometry with its parent and children.

```text
RenderView
   |
   +-> RenderBox subtree --------> box constraints and sizes
   |      +-> RenderFlex
   |      +-> RenderStack
   |      +-> RenderParagraph
   |
   +-> RenderViewport -----------> sliver constraints and geometry
          +-> RenderSliverList
          +-> RenderSliverGrid

Parent render object <-----------> child ParentData
```

The hierarchy is not a copy of the widget or element tree. Some widgets create
no render object, while render-object elements maintain the child and parent-data
relationships needed by the rendering protocol.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree) — Focused, bite-sized article covering RenderObject Tree
- [Learning Path](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree) — Step-by-step material that builds practical RenderObject Tree knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree) — Structured, in-depth material for learning about RenderObject Tree thoroughly

## RenderObject Tree Nodes

| Topic | Role in the render-object tree | Key relationship | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| RenderObject | Base class for mutable objects that participate in rendering | Defines lifecycle, layout, painting, hit testing, compositing, and semantics hooks | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderObject "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderObject "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderObject "Deep Dive") |
| RenderBox | Base for render objects that use two-dimensional Cartesian box layout | Receives `BoxConstraints` and reports a `Size` | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderBox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderBox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderBox "Deep Dive") |
| RenderSliver | Base for scrollable-area render objects using the sliver protocol | Converts `SliverConstraints` into `SliverGeometry` | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderSliver "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderSliver "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderSliver "Deep Dive") |
| RenderView | Root render object for a Flutter rendering pipeline | Adapts the platform view configuration and lays out the root render box | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderView "Deep Dive") |
| RenderProxyBox | Base render box that forwards much behavior to one child | Supports decorators and effects that wrap a child render box | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderProxyBox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderProxyBox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderProxyBox "Deep Dive") |
| RenderFlex | Lays out box children along a horizontal or vertical main axis | Implements the flex layout used by `Row`, `Column`, and `Flex` | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderFlex "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderFlex "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderFlex "Deep Dive") |
| RenderStack | Positions box children relative to the edges of a stack | Uses `StackParentData` for offsets and positioned-child values | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderStack "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderStack "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderStack "Deep Dive") |
| RenderParagraph | Lays out, paints, and hit-tests a paragraph of styled text | Uses a text painter while integrating inline placeholders as children | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderParagraph "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderParagraph "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderParagraph "Deep Dive") |
| RenderEditable | Renders and interacts with editable text | Connects text layout, selection, caret painting, scrolling, and hit testing | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderEditable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderEditable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderEditable "Deep Dive") |
| RenderViewport | Displays a scrollable subset of sliver children | Converts a scroll offset and viewport dimensions into sliver layout | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderViewport "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderViewport "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderViewport "Deep Dive") |
| RenderSliverList | Lays out a linear sequence of box children in a sliver | Materializes and positions children around the visible scroll range | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderSliverList "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderSliverList "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderSliverList "Deep Dive") |
| RenderSliverGrid | Lays out box children in a scrollable two-dimensional grid | Uses a grid layout to assign each child scroll and cross-axis geometry | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderSliverGrid "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderSliverGrid "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderSliverGrid "Deep Dive") |
| RenderAbstractViewport | Interface for viewports that reveal descendants at computed offsets | Lets scrolling code determine how to expose a target render object | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderAbstractViewport "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderAbstractViewport "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/RenderAbstractViewport "Deep Dive") |
| ParentData | Base storage attached to a child for information its parent needs | Owned conceptually by the parent protocol and stored on the child | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/ParentData "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/ParentData "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/ParentData "Deep Dive") |
| BoxParentData | Parent data that stores a box child's paint offset | Positions a `RenderBox` relative to its parent | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/BoxParentData "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/BoxParentData "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/BoxParentData "Deep Dive") |
| FlexParentData | Parent data for children of a flex layout | Adds flex factor and fit to container-box positioning data | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/FlexParentData "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/FlexParentData "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/FlexParentData "Deep Dive") |
| StackParentData | Parent data for children of a stack layout | Stores optional edge offsets and dimensions for positioned children | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/StackParentData "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/StackParentData "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/StackParentData "Deep Dive") |
| SliverPhysicalParentData | Parent data that gives a sliver child a physical paint offset | Positions sliver descendants in the parent's paint coordinate system | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/RenderObject-Tree/SliverPhysicalParentData "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/RenderObject-Tree/SliverPhysicalParentData "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/RenderObject-Tree/SliverPhysicalParentData "Deep Dive") |

## Questions

- [How does a render object differ from a widget and an element?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-does-a-render-object-differ-from-a-widget-and-an-element%3F)
- [How do constraints flow down and geometry flow back up during layout?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-do-constraints-flow-down-and-geometry-flow-back-up-during-layout%3F)
- [How do the box and sliver layout protocols differ?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-do-the-box-and-sliver-layout-protocols-differ%3F)
- [How does the platform view connect to the root render box?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-does-the-platform-view-connect-to-the-root-render-box%3F)
- [When is a proxy render box useful?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/When-is-a-proxy-render-box-useful%3F)
- [How does flex layout distribute remaining space?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-does-flex-layout-distribute-remaining-space%3F)
- [How are positioned and non-positioned stack children laid out?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-are-positioned-and-non-positioned-stack-children-laid-out%3F)
- [How do rendered paragraphs handle inline widget placeholders?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-do-rendered-paragraphs-handle-inline-widget-placeholders%3F)
- [Which responsibilities make editable text more complex than static text?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Which-responsibilities-make-editable-text-more-complex-than-static-text%3F)
- [How does a viewport decide which slivers are visible?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-does-a-viewport-decide-which-slivers-are-visible%3F)
- [How do sliver lists and grids create children lazily?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-do-sliver-lists-and-grids-create-children-lazily%3F)
- [How does a grid map child indices to scroll offsets?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-does-a-grid-map-child-indices-to-scroll-offsets%3F)
- [How is a descendant revealed inside a viewport?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-is-a-descendant-revealed-inside-a-viewport%3F)
- [Why is parent data stored on the child render object?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Why-is-parent-data-stored-on-the-child-render-object%3F)
- [What does a box child's paint offset represent?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/What-does-a-box-child's-paint-offset-represent%3F)
- [Where are a flex child's factor and fit stored?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Where-are-a-flex-child's-factor-and-fit-stored%3F)
- [How does stack parent data describe a positioned child?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-does-stack-parent-data-describe-a-positioned-child%3F)
- [How is a sliver child's physical paint position recorded?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/How-is-a-sliver-child's-physical-paint-position-recorded%3F)

## Best Practices

- [Keep render-object mutation inside the framework's rendering lifecycle](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Keep-render-object-mutation-inside-the-framework's-rendering-lifecycle)
- [Respect each layout protocol's constraint and geometry contracts](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Respect-each-layout-protocol's-constraint-and-geometry-contracts)
- [Call the appropriate invalidation method when layout, paint, or semantics changes](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Call-the-appropriate-invalidation-method-when-layout%2C-paint%2C-or-semantics-changes)
- [Keep `performLayout` focused on geometry and `paint` focused on visual output](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Keep-performLayout-focused-on-geometry-and-paint-focused-on-visual-output)
- [Use a proxy render box for a single-child effect that does not need a new child model](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Use-a-proxy-render-box-for-a-single-child-effect-that-does-not-need-a-new-child-model)
- [Avoid unbounded flex children along an unbounded main axis](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Avoid-unbounded-flex-children-along-an-unbounded-main-axis)
- [Use stack positioning only when overlap or edge-relative placement is intentional](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Use-stack-positioning-only-when-overlap-or-edge-relative-placement-is-intentional)
- [Prefer viewport and sliver protocols for lazily rendered scrolling content](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Prefer-viewport-and-sliver-protocols-for-lazily-rendered-scrolling-content)
- [Provide stable child identity when lazily laid-out list or grid items can reorder](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Provide-stable-child-identity-when-lazily-laid-out-list-or-grid-items-can-reorder)
- [Treat parent data as an implementation contract with the owning parent](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Treat-parent-data-as-an-implementation-contract-with-the-owning-parent)
- [Use the parent-data type expected by the parent render object](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Use-the-parent-data-type-expected-by-the-parent-render-object)
- [Detach listeners and owned resources when a custom render object is disposed](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Detach-listeners-and-owned-resources-when-a-custom-render-object-is-disposed)
- [Profile layout, paint, and compositing before optimizing a render-object subtree](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/RenderObject-Tree/Profile-layout%2C-paint%2C-and-compositing-before-optimizing-a-render-object-subtree)

[< Back to Core Trees](../README.md)
