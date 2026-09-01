# Layout Phase

The layout phase turns parent-provided constraints into concrete geometry for
the render tree. A parent lays out each child with the protocol-appropriate
constraints, the child computes a size or sliver geometry that satisfies that
contract, and the parent records child placement in `ParentData`. Box render
objects exchange `BoxConstraints` and `Size`; slivers exchange viewport-aware
`SliverConstraints` and `SliverGeometry`.

Layout is incremental rather than a full-tree pass on every frame. When
geometry-affecting state changes, `markNeedsLayout()` propagates invalidation
toward the nearest relayout boundary. `PipelineOwner` later flushes dirty
layout roots in dependency order. Each render object then runs its applicable
resize and layout work, potentially laying out descendants and positioning
them before painting can use the resulting geometry.

```text
geometry changes
      |
      v
markNeedsLayout() -> nearest relayout boundary -> PipelineOwner layout queue
                                                     |
                                                     v
parent constraints -> performResize()/performLayout() -> child geometry
                                                          |
                                                          v
                                    parent records child position in ParentData
                                                          |
                                                          v
                                             paint uses resolved geometry

box:    BoxConstraints    -> Size
sliver: SliverConstraints -> SliverGeometry
```

Speculative APIs serve related but separate needs. Dry layout asks for a
prospective size without mutating layout state, intrinsic sizing asks for
content-based dimensions, and baseline queries support alignment such as text
baselines. These queries can cause extra traversal or repeated measurement, so
they should not replace the normal one-pass constraint negotiation without a
clear layout requirement.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase) — Focused, bite-sized article covering Layout Phase
- [Learning Path](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase) — Step-by-step material that builds practical Layout Phase knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase) — Structured, in-depth material for learning about Layout Phase thoroughly

## Layout Phase Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `RenderObject` | Defines mutable layout, painting, hit-testing, and semantics behavior | Keep geometry mutations inside the render pipeline and invalidate the specific phase affected by a change | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/RenderObject "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/RenderObject "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/RenderObject "Deep Dive") |
| `RenderBox` | Uses box constraints and Cartesian sizes for box-protocol layout | Set a `Size` that satisfies the received `BoxConstraints`, and let the parent own the box's position | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/RenderBox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/RenderBox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/RenderBox "Deep Dive") |
| `RenderSliver` | Uses viewport-aware sliver constraints and scroll geometry | Return `SliverGeometry` whose scroll, paint, layout, hit-test, and cache extents remain internally consistent | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/RenderSliver "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/RenderSliver "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/RenderSliver "Deep Dive") |
| `PipelineOwner` | Owns dirty render-object queues and flushes pipeline phases in order | Layout must settle before paint and semantics consume geometry; application code normally relies on the binding to flush it | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/PipelineOwner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/PipelineOwner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/PipelineOwner "Deep Dive") |
| `BoxConstraints` | Carries minimum and maximum width and height limits through box layout | Treat width and height independently, and distinguish tightness from boundedness | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/BoxConstraints "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/BoxConstraints "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/BoxConstraints "Deep Dive") |
| `SliverConstraints` | Carries scroll offset, viewport extent, axis, and cache information to slivers | Interpret main-axis and cross-axis values with the active axis and growth directions | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/SliverConstraints "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/SliverConstraints "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/SliverConstraints "Deep Dive") |
| `ParentData` | Stores parent-specific layout metadata on a child render object | Use the exact subtype expected by the parent and let that parent write placement fields such as offsets | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/ParentData "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/ParentData "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/ParentData "Deep Dive") |
| `markNeedsLayout()` | Invalidates geometry and schedules layout from the nearest relayout boundary | Call it when layout output can change; redundant calls are coalesced while the render object remains dirty | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/markNeedsLayout-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/markNeedsLayout-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/markNeedsLayout-method "Deep Dive") |
| `performLayout()` | Computes a render object's layout output and lays out or positions its children | Pass accurate `parentUsesSize` intent when laying out a child so invalidation boundaries preserve dependencies | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/performLayout-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/performLayout-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/performLayout-method "Deep Dive") |
| `performResize()` | Computes a parent-determined size before full child layout | Use it only for render objects whose size is determined solely by incoming constraints | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/performResize-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/performResize-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/performResize-method "Deep Dive") |
| `sizedByParent` | Declares that size depends only on incoming constraints | If this contract changes, ensure resize and layout invalidation are updated so stale geometry cannot survive | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/sizedByParent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/sizedByParent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/sizedByParent "Deep Dive") |
| Relayout boundary | Stops layout invalidation from propagating farther up the render tree | A boundary is dependency-driven; it is not automatically created by every visually isolated or repaint-boundary subtree | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/Relayout-boundary "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/Relayout-boundary "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/Relayout-boundary "Deep Dive") |
| Intrinsic sizing | Queries a render object for content-based minimum or maximum dimensions | Intrinsic measurement may add speculative passes and can become expensive in deep or repeated layouts | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/Intrinsic-sizing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/Intrinsic-sizing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/Intrinsic-sizing "Deep Dive") |
| Baseline calculation | Computes a text baseline used to align children across a layout | Not every render object provides a baseline, and baseline queries can require additional child measurement | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/Baseline-calculation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/Baseline-calculation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/Baseline-calculation "Deep Dive") |
| Dry layout | Computes a prospective size without mutating layout state | Keep dry computation side-effect-free and consistent with the size that real layout would choose for the same constraints | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Layout-Phase/Dry-layout "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Layout-Phase/Dry-layout "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Layout-Phase/Dry-layout "Deep Dive") |

## Questions

- [What work belongs to a `RenderObject` during the layout phase?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/What-work-belongs-to-a-RenderObject-during-the-layout-phase%3F)
- [How do `RenderBox` and `RenderSliver` layout protocols differ?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/How-do-RenderBox-and-RenderSliver-layout-protocols-differ%3F)
- [How does a box child choose a valid `Size` from `BoxConstraints`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/How-does-a-box-child-choose-a-valid-Size-from-BoxConstraints%3F)
- [Which `SliverConstraints` values describe the viewport, scroll position, and cache region?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Which-SliverConstraints-values-describe-the-viewport%2C-scroll-position%2C-and-cache-region%3F)
- [What guarantees must a `RenderSliver` maintain when returning `SliverGeometry`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/What-guarantees-must-a-RenderSliver-maintain-when-returning-SliverGeometry%3F)
- [How does `PipelineOwner` coordinate dirty layout work before painting?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/How-does-PipelineOwner-coordinate-dirty-layout-work-before-painting%3F)
- [Why is child placement stored in parent-specific `ParentData`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Why-is-child-placement-stored-in-parent-specific-ParentData%3F)
- [When should a render object call `markNeedsLayout()` instead of marking paint or semantics dirty?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/When-should-a-render-object-call-markNeedsLayout()-instead-of-marking-paint-or-semantics-dirty%3F)
- [How does layout invalidation travel to the nearest relayout boundary?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/How-does-layout-invalidation-travel-to-the-nearest-relayout-boundary%3F)
- [What does `parentUsesSize` communicate when a parent lays out a child?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/What-does-parentUsesSize-communicate-when-a-parent-lays-out-a-child%3F)
- [What responsibilities belong in `performLayout()`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/What-responsibilities-belong-in-performLayout()%3F)
- [When are `performResize()` and `sizedByParent` appropriate?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/When-are-performResize()-and-sizedByParent-appropriate%3F)
- [Why is a relayout boundary different from a repaint boundary?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Why-is-a-relayout-boundary-different-from-a-repaint-boundary%3F)
- [When can intrinsic sizing introduce repeated layout work?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/When-can-intrinsic-sizing-introduce-repeated-layout-work%3F)
- [How are baselines obtained for baseline-aligned children, and what happens when none is available?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/How-are-baselines-obtained-for-baseline-aligned-children%2C-and-what-happens-when-none-is-available%3F)
- [How does dry layout predict a size without mutating render-object state?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/How-does-dry-layout-predict-a-size-without-mutating-render-object-state%3F)
- [Why must dry-layout and real-layout results agree for the same constraints?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Why-must-dry-layout-and-real-layout-results-agree-for-the-same-constraints%3F)
- [How can DevTools reveal excessive or repeated layout work?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/How-can-DevTools-reveal-excessive-or-repeated-layout-work%3F)

## Best Practices

- [Trace constraints down, geometry up, and parent-owned offsets when diagnosing layout](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Trace-constraints-down%2C-geometry-up%2C-and-parent-owned-offsets-when-diagnosing-layout)
- [Return box sizes and sliver geometry that satisfy every active constraint](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Return-box-sizes-and-sliver-geometry-that-satisfy-every-active-constraint)
- [Keep width and height reasoning independent when handling `BoxConstraints`](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Keep-width-and-height-reasoning-independent-when-handling-BoxConstraints)
- [Interpret sliver extents in the correct axis and growth directions](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Interpret-sliver-extents-in-the-correct-axis-and-growth-directions)
- [Use the precise `ParentData` subtype required by the parent render object](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Use-the-precise-ParentData-subtype-required-by-the-parent-render-object)
- [Call `markNeedsLayout()` only for changes that can affect geometry](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Call-markNeedsLayout()-only-for-changes-that-can-affect-geometry)
- [Pass `parentUsesSize: true` only when the parent's layout actually depends on the child's size](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Pass-parentUsesSize%3A-true-only-when-the-parent's-layout-actually-depends-on-the-child's-size)
- [Keep child positioning under the ownership of the parent render object](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Keep-child-positioning-under-the-ownership-of-the-parent-render-object)
- [Reserve `sizedByParent` and `performResize()` for sizes determined entirely by incoming constraints](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Reserve-sizedByParent-and-performResize()-for-sizes-determined-entirely-by-incoming-constraints)
- [Avoid assuming that a repaint boundary also isolates layout invalidation](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Avoid-assuming-that-a-repaint-boundary-also-isolates-layout-invalidation)
- [Prefer a direct constraint-based layout over intrinsic passes when both satisfy the design](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Prefer-a-direct-constraint-based-layout-over-intrinsic-passes-when-both-satisfy-the-design)
- [Keep dry-layout calculations pure and consistent with real layout](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Keep-dry-layout-calculations-pure-and-consistent-with-real-layout)
- [Handle unavailable baselines explicitly instead of assuming every child provides one](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Handle-unavailable-baselines-explicitly-instead-of-assuming-every-child-provides-one)
- [Avoid reading stale geometry before the pipeline has completed layout](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Avoid-reading-stale-geometry-before-the-pipeline-has-completed-layout)
- [Profile on representative content before optimizing relayout boundaries or measurement logic](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Layout-Phase/Profile-on-representative-content-before-optimizing-relayout-boundaries-or-measurement-logic)

[< Back to Rendering Pipeline](../README.md)
