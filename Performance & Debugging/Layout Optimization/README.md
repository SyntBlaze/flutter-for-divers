# Layout Optimization

Flutter lays out a render tree by passing constraints down and returning sizes
up. Each render object normally needs one bounded layout pass, so deep trees are
not automatically slow. Layout becomes expensive when widgets request intrinsic
measurements, a scrolling viewport must determine the size of all its children,
or changing constraints repeatedly invalidate a large part of the render tree.

```text
parent constraints
       |
       v
  child layout ----> child size
       |                 |
       +-----------------+
              placement

Fast path: bounded constraints + lazy children + known extents
Extra work: intrinsic passes, shrink-wrapping, relayout, or eager children
```

Start with evidence from a profile build. Select a slow frame in DevTools and
confirm that layout work, rather than build, paint, rasterization, or unrelated
synchronous work, is consuming the frame budget. Then reduce the amount of
geometry Flutter must compute: keep large collections lazy, give the viewport
useful constraints, provide stable item extents when possible, and remove only
the wrappers or nested scrolling relationships that profiling shows are costly.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Layout-Optimization) — Focused, bite-sized article covering Layout Optimization
- [Learning Path](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Layout-Optimization) — Step-by-step material that builds practical Layout Optimization knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Layout-Optimization) — Structured, in-depth material for learning about Layout Optimization thoroughly

## Layout Optimization Topics

| Topic | Layout concern | Preferred direction | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Avoid `IntrinsicHeight` | Computing intrinsic height can require a speculative pass before the normal layout pass | Use constraints, alignment, or a known size when the intended geometry can be expressed directly | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-IntrinsicHeight "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-IntrinsicHeight "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-IntrinsicHeight "Deep Dive") |
| Avoid `IntrinsicWidth` | Intrinsic width queries can measure descendants in addition to their final layout | Constrain width explicitly or use a layout whose sizing rules do not require intrinsic measurement | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-IntrinsicWidth "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-IntrinsicWidth "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-IntrinsicWidth "Deep Dive") |
| Avoid unnecessary `shrinkWrap` | A shrink-wrapped scroll view must derive its own extent from its contents and may recompute it as scrolling changes | Give the scroll view a bounded viewport and leave `shrinkWrap` disabled unless content-sized scrolling is required | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-unnecessary-shrinkWrap "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-unnecessary-shrinkWrap "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-unnecessary-shrinkWrap "Deep Dive") |
| Prefer `SliverList` for large lists | Eagerly built children increase construction and layout work as a collection grows | Put a lazy sliver in a `CustomScrollView` when composing large scrolling regions | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Layout-Optimization/Prefer-SliverList-for-large-lists "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Layout-Optimization/Prefer-SliverList-for-large-lists "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Layout-Optimization/Prefer-SliverList-for-large-lists "Deep Dive") |
| Prefer `itemBuilder` constructors | Constructors that receive a complete child list create work even for off-screen items | Use builder-based list and grid constructors so visible children are created on demand | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Layout-Optimization/Prefer-itemBuilder-constructors "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Layout-Optimization/Prefer-itemBuilder-constructors "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Layout-Optimization/Prefer-itemBuilder-constructors "Deep Dive") |
| Cache item extents | Repeatedly discovering predictable child dimensions adds layout work and makes scroll estimation harder | Supply `itemExtent`, `prototypeItem`, or an extent builder when item geometry is known or cheaply derived | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Layout-Optimization/Cache-item-extents "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Layout-Optimization/Cache-item-extents "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Layout-Optimization/Cache-item-extents "Deep Dive") |
| Avoid nested scroll views | Multiple scrollables can duplicate layout work and create competing constraints or gesture behavior | Compose one sliver-based scrollable where the content should move as a single viewport | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-nested-scroll-views "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-nested-scroll-views "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-nested-scroll-views "Deep Dive") |
| Reduce layout depth | Every wrapper can add a render object or expand the subtree invalidated by a constraint change | Remove redundant layout layers after profiling while preserving clear constraints and widget ownership | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Layout-Optimization/Reduce-layout-depth "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Layout-Optimization/Reduce-layout-depth "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Layout-Optimization/Reduce-layout-depth "Deep Dive") |

## Questions

- [Is an intrinsic measurement pass occurring before the final layout?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Is-an-intrinsic-measurement-pass-occurring-before-the-final-layout%3F)
- [Can the required width be expressed with parent constraints instead of `IntrinsicWidth`?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Can-the-required-width-be-expressed-with-parent-constraints-instead-of-IntrinsicWidth%3F)
- [Does this scroll view need to size itself from all of its contents?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Does-this-scroll-view-need-to-size-itself-from-all-of-its-contents%3F)
- [Are off-screen list or grid children being built or laid out eagerly?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Are-off-screen-list-or-grid-children-being-built-or-laid-out-eagerly%3F)
- [Should several scrolling sections be represented as slivers in one viewport?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Should-several-scrolling-sections-be-represented-as-slivers-in-one-viewport%3F)
- [Are row heights predictable enough to provide an item extent or prototype?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Are-row-heights-predictable-enough-to-provide-an-item-extent-or-prototype%3F)
- [Do nested scrollables represent independent viewports, or are they compensating for missing constraints?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Do-nested-scrollables-represent-independent-viewports%2C-or-are-they-compensating-for-missing-constraints%3F)
- [Which render-object layers contribute measurable layout cost?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Which-render-object-layers-contribute-measurable-layout-cost%3F)
- [Is the slow frame caused by layout, or by build, paint, raster, or synchronous application work?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Is-the-slow-frame-caused-by-layout%2C-or-by-build%2C-paint%2C-raster%2C-or-synchronous-application-work%3F)
- [Does the optimization still behave correctly with long text, text scaling, localization, and different screen sizes?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Does-the-optimization-still-behave-correctly-with-long-text%2C-text-scaling%2C-localization%2C-and-different-screen-sizes%3F)

## Best Practices

- [Use bounded constraints to express geometry directly](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Use-bounded-constraints-to-express-geometry-directly)
- [Replace `IntrinsicHeight` with explicit constraints or a layout designed for the required relationship](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Replace-IntrinsicHeight-with-explicit-constraints-or-a-layout-designed-for-the-required-relationship)
- [Replace `IntrinsicWidth` when the parent can provide an appropriate width](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Replace-IntrinsicWidth-when-the-parent-can-provide-an-appropriate-width)
- [Enable `shrinkWrap` only when the viewport truly must derive its size from its children](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Enable-shrinkWrap-only-when-the-viewport-truly-must-derive-its-size-from-its-children)
- [Compose large heterogeneous scrolling pages with slivers](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Compose-large-heterogeneous-scrolling-pages-with-slivers)
- [Use builder constructors for collections whose children can extend beyond the viewport](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Use-builder-constructors-for-collections-whose-children-can-extend-beyond-the-viewport)
- [Provide stable item extents when the design makes them known](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Provide-stable-item-extents-when-the-design-makes-them-known)
- [Use one scrollable for content that should move as one continuous viewport](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Use-one-scrollable-for-content-that-should-move-as-one-continuous-viewport)
- [Keep independent nested scrolling only when the interaction explicitly requires separate viewports](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Keep-independent-nested-scrolling-only-when-the-interaction-explicitly-requires-separate-viewports)
- [Remove redundant layout wrappers based on measurements, not tree depth alone](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Remove-redundant-layout-wrappers-based-on-measurements%2C-not-tree-depth-alone)
- [Avoid invalidating large layout subtrees when only local geometry changes](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Avoid-invalidating-large-layout-subtrees-when-only-local-geometry-changes)
- [Profile realistic data volumes on representative devices](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Profile-realistic-data-volumes-on-representative-devices)
- [Compare slow-frame layout timings before and after each change](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Compare-slow-frame-layout-timings-before-and-after-each-change)
- [Test optimized layouts across accessibility, localization, orientation, and screen-size variants](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Layout-Optimization/Test-optimized-layouts-across-accessibility%2C-localization%2C-orientation%2C-and-screen-size-variants)

[< Back to Performance & Debugging](../README.md)
