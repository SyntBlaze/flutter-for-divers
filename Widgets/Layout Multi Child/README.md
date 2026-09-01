# Layout: Multi Child

Multi-child layout widgets arrange several children as a group. They cover
linear flex layouts, wrapping runs, overlapping layers, tables, delegate-driven
custom arrangements, constraint-aware composition, and scrollable lists and
grids. The right choice follows from the relationship among the children: a
single axis, multiple wrapping runs, shared coordinates, aligned columns, or a
potentially unbounded scrolling sequence.

Flutter still applies its constraint rule to every composition: parents pass
constraints down, children report sizes up, and parents assign positions. A
multi-child widget adds an allocation policy between those steps. Understand
which axes are bounded, whether children may flex or overflow, and whether all
children should be built eagerly before selecting the layout.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child) — Focused, bite-sized article covering Layout: Multi Child
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child) — Step-by-step material that builds practical Layout: Multi Child knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child) — Structured, in-depth material for learning about Layout: Multi Child thoroughly

## Selection and Composition Guidance

Use `Row`, `Column`, or the general `Flex` widget when children form one ordered
run and remaining space should be allocated with flex factors. Use `Wrap` when
children should continue onto additional runs instead of overflowing. Choose
`Stack` for overlapping children positioned in one coordinate space, or
`IndexedStack` when one child is visible at a time while the other child
subtrees remain mounted.

Use `Table` when cells must share column widths and row geometry; it is usually
better than manually coordinating several rows. `ListBody` is a simple
shrink-wrapped linear sequence, commonly placed inside a scrolling or dialog
composition. `LayoutBuilder` selects a subtree from the constraints available
at layout time, making it useful where a component's composition changes at a
meaningful width or height boundary.

Reach for `Flow` when a delegate must control child painting efficiently,
especially for animated transformations, and for `CustomMultiChildLayout` when
children must be measured and positioned in a dependency-aware custom layout.
For long or unknown collections, use lazy `ListView` or `GridView` constructors
so only visible content is built. Keep scrolling ownership, item identity,
cache behavior, and the constraints along both axes explicit.

## Multi-Child Layout Widgets

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Column` | Arranges children vertically using the flex layout algorithm | Nonzero-flex children require finite height, so avoid flexing directly inside an unbounded vertical scroll context | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/Column "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/Column "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/Column "Deep Dive") |
| `Row` | Arranges children horizontally using the flex layout algorithm | Non-flex children are measured before remaining width is divided, so wide content can overflow before flex allocation helps | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/Row "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/Row "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/Row "Deep Dive") |
| `Flex` | Arranges children along a configurable horizontal or vertical axis | Select the direction deliberately and use `Expanded` or `Flexible` only when the main-axis extent is bounded | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/Flex "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/Flex "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/Flex "Deep Dive") |
| `Wrap` | Places children in successive runs when the main axis fills | It does not assign flex shares across runs; configure run spacing and alignment separately from child spacing | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/Wrap "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/Wrap "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/Wrap "Deep Dive") |
| `Stack` | Overlaps children and optionally positions them relative to the stack's edges | Non-positioned children determine the stack's size, while positioned children need explicit constraints and intentional clipping | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/Stack "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/Stack "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/Stack "Deep Dive") |
| `IndexedStack` | Keeps a stack of children mounted while painting only the selected index | All child subtrees still carry build, state, and layout cost even though only one is visible | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/IndexedStack "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/IndexedStack "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/IndexedStack "Deep Dive") |
| `Flow` | Uses a delegate to transform and paint children in a custom arrangement | Child positions are primarily a paint-time concern, so semantics, hit testing, delegate repainting, and clipping require care | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/Flow "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/Flow "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/Flow "Deep Dive") |
| `CustomMultiChildLayout` | Measures and positions identified children through a layout delegate | Every child ID must be unique, dependencies must be laid out in a valid order, and the parent's size cannot depend on child layout results | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/CustomMultiChildLayout "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/CustomMultiChildLayout "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/CustomMultiChildLayout "Deep Dive") |
| `Table` | Aligns cells into rows with shared column widths | Intrinsic column sizing and repeated measurement can be expensive, and every row must contain the same number of cells | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/Table "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/Table "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/Table "Deep Dive") |
| `ListBody` | Places children sequentially along one axis without scrolling them itself | It expects room to grow along its main axis, so place it in an appropriate scrollable or otherwise unbounded context | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/ListBody "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/ListBody "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/ListBody "Deep Dive") |
| `LayoutBuilder` | Builds a subtree from the parent constraints available during layout | Base decisions on local constraints rather than screen size, and avoid rebuilding a needlessly large subtree | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/LayoutBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/LayoutBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/LayoutBuilder "Deep Dive") |
| `GridView` | Presents a scrollable two-dimensional arrangement of children | Choose a grid delegate and lazy constructor appropriate to the collection, and avoid unnecessary `shrinkWrap` work | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/GridView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/GridView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/GridView "Deep Dive") |
| `ListView` | Presents a scrollable linear sequence of children | Use builder or separated constructors for long collections, preserve item identity, and avoid nesting competing scrollables | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Layout-Multi-Child/ListView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Layout-Multi-Child/ListView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Layout-Multi-Child/ListView "Deep Dive") |

## Questions

- [How does `Column` divide finite height among flex and non-flex children?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/How-does-Column-divide-finite-height-among-flex-and-non-flex-children%3F)
- [Why can a `Row` overflow before its flex children receive space?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Why-can-a-Row-overflow-before-its-flex-children-receive-space%3F)
- [When is the configurable axis of `Flex` preferable to `Row` or `Column`?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/When-is-the-configurable-axis-of-Flex-preferable-to-Row-or-Column%3F)
- [How do alignment, spacing, and run spacing interact in a `Wrap`?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/How-do-alignment%2C-spacing%2C-and-run-spacing-interact-in-a-Wrap%3F)
- [How do positioned and non-positioned children affect a `Stack`'s size?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/How-do-positioned-and-non-positioned-children-affect-a-Stack's-size%3F)
- [Which work continues for children that are not selected in an `IndexedStack`?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Which-work-continues-for-children-that-are-not-selected-in-an-IndexedStack%3F)
- [When does a paint-time `Flow` delegate fit better than a layout-time custom delegate?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/When-does-a-paint-time-Flow-delegate-fit-better-than-a-layout-time-custom-delegate%3F)
- [How should IDs and child layout dependencies be managed in `CustomMultiChildLayout`?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/How-should-IDs-and-child-layout-dependencies-be-managed-in-CustomMultiChildLayout%3F)
- [How does a `Table` resolve shared column widths and vertical alignment?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/How-does-a-Table-resolve-shared-column-widths-and-vertical-alignment%3F)
- [Which constraints make `ListBody` suitable for a scrolling composition?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Which-constraints-make-ListBody-suitable-for-a-scrolling-composition%3F)
- [When should a component use `LayoutBuilder` instead of global screen dimensions?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/When-should-a-component-use-LayoutBuilder-instead-of-global-screen-dimensions%3F)
- [How should a `GridView` choose its delegate, constructor, and child aspect ratio?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/How-should-a-GridView-choose-its-delegate%2C-constructor%2C-and-child-aspect-ratio%3F)
- [Which `ListView` constructor provides the right laziness and separation behavior?](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Which-ListView-constructor-provides-the-right-laziness-and-separation-behavior%3F)

## Best Practices

- [Use `Column` for bounded vertical flex composition and diagnose unbounded-height conflicts before adding flex children](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Use-Column-for-bounded-vertical-flex-composition-and-diagnose-unbounded-height-conflicts-before-adding-flex-children)
- [Wrap adaptable `Row` content in flexible children and test it with narrow widths and scaled text](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Wrap-adaptable-Row-content-in-flexible-children-and-test-it-with-narrow-widths-and-scaled-text)
- [Use `Flex` when the direction itself is configurable; otherwise prefer the axis-specific widget](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Use-Flex-when-the-direction-itself-is-configurable%3B-otherwise-prefer-the-axis-specific-widget)
- [Choose `Wrap` when discrete items may move between runs and define both item and run spacing](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Choose-Wrap-when-discrete-items-may-move-between-runs-and-define-both-item-and-run-spacing)
- [Keep `Stack` overlap intentional, constrain positioned children, and set clipping explicitly](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Keep-Stack-overlap-intentional%2C-constrain-positioned-children%2C-and-set-clipping-explicitly)
- [Use `IndexedStack` for a small set of stateful alternatives whose retained cost is acceptable](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Use-IndexedStack-for-a-small-set-of-stateful-alternatives-whose-retained-cost-is-acceptable)
- [Keep `FlowDelegate` painting deterministic and repaint from an animation without rebuilding the subtree](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Keep-FlowDelegate-painting-deterministic-and-repaint-from-an-animation-without-rebuilding-the-subtree)
- [Give custom-layout children stable IDs and keep delegate sizing, ordering, and relayout rules precise](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Give-custom-layout-children-stable-IDs-and-keep-delegate-sizing%2C-ordering%2C-and-relayout-rules-precise)
- [Specify practical column-width strategies and avoid expensive intrinsic tables in large repeated content](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Specify-practical-column-width-strategies-and-avoid-expensive-intrinsic-tables-in-large-repeated-content)
- [Use `ListBody` only when another widget owns scrolling and the main axis may grow](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Use-ListBody-only-when-another-widget-owns-scrolling-and-the-main-axis-may-grow)
- [Make `LayoutBuilder` decisions from local constraints at meaningful composition breakpoints](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Make-LayoutBuilder-decisions-from-local-constraints-at-meaningful-composition-breakpoints)
- [Build large grids lazily, preserve child identity, and keep each tile's geometry predictable](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Build-large-grids-lazily%2C-preserve-child-identity%2C-and-keep-each-tile's-geometry-predictable)
- [Build long lists lazily, provide stable keys where order changes, and assign clear scroll ownership](https://app.syntblaze.com/qsp/flutter/Widgets/Layout-Multi-Child/Build-long-lists-lazily%2C-provide-stable-keys-where-order-changes%2C-and-assign-clear-scroll-ownership)

[< Back to widgets](../README.md)
