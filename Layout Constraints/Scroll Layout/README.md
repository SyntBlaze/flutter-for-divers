# Scroll Layout

Flutter scroll layout separates the interaction that changes a scroll offset
from the rendering protocol that turns that offset into visible geometry. A
`Scrollable` owns gesture handling, scroll position, and scroll physics, while
a `Viewport` gives one or more slivers a visible extent. Each `RenderSliver`
receives `SliverConstraints` and reports a `SliverGeometry` describing how much
content it spans, paints, caches, and can reveal.

```text
drag / wheel / keyboard / programmatic command
                     |
                     v
                Scrollable
          position + physics + activity
                     |
                     v
                 Viewport
       scroll offset + paint/cache extent
                     |
                     v
             SliverConstraints
                     |
                     v
     RenderSliverList / Grid / Header / Adapter
                     |
                     v
              SliverGeometry
       scroll extent + paint extent + layout extent
                     |
                     v
        visible, painted, and cached children
```

`ScrollView` widgets package a `Scrollable`, viewport, controller, physics, and
sliver composition into convenient configurations. `ListView` and `GridView`
are box-widget conveniences backed by sliver lists and grids; a
`CustomScrollView` exposes the sliver sequence directly. A
`SliverToBoxAdapter` bridges one box child into that sequence, while
`SliverPersistentHeader` coordinates header extent with the current scroll
state.

Lazy slivers should create, lay out, and retain only the children justified by
the visible and cache regions. `KeepAlive` can preserve selected off-screen
subtrees, but retained state consumes memory and should be deliberate.
Shrink-wrapping makes a viewport measure its content extent instead of
expanding to the available scroll-axis space; that extra work is useful only
when the surrounding constraints require it. Nested scrolling likewise needs
one explicit coordination model so competing positions do not consume the
same gesture or offset independently.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout) — Focused, bite-sized article covering Scroll Layout
- [Learning Path](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout) — Step-by-step material that builds practical Scroll Layout knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout) — Structured, in-depth material for learning about Scroll Layout thoroughly

## Scroll Layout Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Viewport` | Display the visible portion of a sequence of slivers | Give the viewport a bounded cross axis and a usable extent on its scroll axis | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/Viewport "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/Viewport "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/Viewport "Deep Dive") |
| `Scrollable` | Coordinate input, scroll position, physics, and viewport construction | Treat it as the scrolling interaction owner rather than the widget that lays out a list of children | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/Scrollable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/Scrollable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/Scrollable "Deep Dive") |
| `ScrollView` | Configure a scrollable viewport through a higher-level widget abstraction | Choose the box-child convenience or sliver composition that matches the content model | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/ScrollView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/ScrollView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/ScrollView "Deep Dive") |
| `Sliver` | Represent scroll-aware content composed inside a viewport | Slivers participate in the sliver protocol and cannot be placed directly where a box child is expected | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/Sliver "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/Sliver "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/Sliver "Deep Dive") |
| `RenderSliver` | Base render object for scroll-axis layout | Convert `SliverConstraints` into valid `SliverGeometry` without assuming all content is visible | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/RenderSliver "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/RenderSliver "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/RenderSliver "Deep Dive") |
| `SliverGeometry` | Report a sliver's scroll, paint, layout, hit-test, and cache geometry | Keep every extent internally consistent and within the active paint and cache limits | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/SliverGeometry "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/SliverGeometry "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/SliverGeometry "Deep Dive") |
| `SliverList` | Lazily arrange box children sequentially along the main axis | Use stable child identity and avoid forcing construction or measurement of the entire list | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/SliverList "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/SliverList "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/SliverList "Deep Dive") |
| `SliverGrid` | Lazily arrange box children using a grid delegate | Define cross-axis placement and main-axis extents predictably across available widths | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/SliverGrid "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/SliverGrid "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/SliverGrid "Deep Dive") |
| `SliverToBoxAdapter` | Insert one ordinary box child into a sliver sequence | Prefer a lazy multi-child sliver when adapting many repeated box children | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/SliverToBoxAdapter "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/SliverToBoxAdapter "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/SliverToBoxAdapter "Deep Dive") |
| `SliverPersistentHeader` | Build a header whose extent responds to scrolling | Keep minimum and maximum extents coherent and rebuild only from relevant scroll state | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/SliverPersistentHeader "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/SliverPersistentHeader "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/SliverPersistentHeader "Deep Dive") |
| `NestedScrollView` | Coordinate outer and inner scroll positions as one scrolling experience | Use it only when header and body offsets genuinely need linked behavior | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/NestedScrollView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/NestedScrollView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/NestedScrollView "Deep Dive") |
| ShrinkWrap | Size a viewport from its content along the scroll axis | Expect repeated extent computation as the scroll position changes | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/ShrinkWrap "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/ShrinkWrap "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/ShrinkWrap "Deep Dive") |
| `KeepAlive` | Retain selected lazy children when they move outside the active layout region | Preserve only state that must survive eviction and account for the memory cost | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Scroll-Layout/KeepAlive "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Scroll-Layout/KeepAlive "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Scroll-Layout/KeepAlive "Deep Dive") |

## Questions

- [What responsibilities belong to a viewport rather than a scrollable?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/What-responsibilities-belong-to-a-viewport-rather-than-a-scrollable%3F)
- [How do gesture input, physics, activity, and scroll position cooperate inside `Scrollable`?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/How-do-gesture-input%2C-physics%2C-activity%2C-and-scroll-position-cooperate-inside-Scrollable%3F)
- [When should a screen use a box-based scroll view or compose slivers directly?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/When-should-a-screen-use-a-box-based-scroll-view-or-compose-slivers-directly%3F)
- [Why are slivers incompatible with ordinary box-child slots?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Why-are-slivers-incompatible-with-ordinary-box-child-slots%3F)
- [How does a `RenderSliver` translate viewport state into geometry?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/How-does-a-RenderSliver-translate-viewport-state-into-geometry%3F)
- [Which `SliverGeometry` extents affect scrolling, painting, caching, and hit testing?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Which-SliverGeometry-extents-affect-scrolling%2C-painting%2C-caching%2C-and-hit-testing%3F)
- [How does `SliverList` materialize only children near the active region?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/How-does-SliverList-materialize-only-children-near-the-active-region%3F)
- [How does a `SliverGrid` delegate map indices to scroll and cross-axis positions?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/How-does-a-SliverGrid-delegate-map-indices-to-scroll-and-cross-axis-positions%3F)
- [When is `SliverToBoxAdapter` the right bridge between box and sliver layout?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/When-is-SliverToBoxAdapter-the-right-bridge-between-box-and-sliver-layout%3F)
- [How do pinned and floating persistent headers respond to scroll state?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/How-do-pinned-and-floating-persistent-headers-respond-to-scroll-state%3F)
- [When does nested scrolling require linked outer and inner positions?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/When-does-nested-scrolling-require-linked-outer-and-inner-positions%3F)
- [Why can shrink-wrapping become more expensive while the viewport scrolls?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Why-can-shrink-wrapping-become-more-expensive-while-the-viewport-scrolls%3F)
- [Which off-screen child state is valuable enough to retain with `KeepAlive`?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Which-off-screen-child-state-is-valuable-enough-to-retain-with-KeepAlive%3F)
- [How do paint extent, cache extent, and total scroll extent differ?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/How-do-paint-extent%2C-cache-extent%2C-and-total-scroll-extent-differ%3F)
- [How can a lazy child's identity survive insertion, removal, or reordering?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/How-can-a-lazy-child's-identity-survive-insertion%2C-removal%2C-or-reordering%3F)

## Best Practices

- [Give a viewport finite cross-axis constraints and an intentional scroll-axis extent](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Give-a-viewport-finite-cross-axis-constraints-and-an-intentional-scroll-axis-extent)
- [Keep scroll ownership explicit when controllers or positions are shared](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Keep-scroll-ownership-explicit-when-controllers-or-positions-are-shared)
- [Use the simplest `ScrollView` that preserves lazy construction and composition needs](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Use-the-simplest-ScrollView-that-preserves-lazy-construction-and-composition-needs)
- [Compose mixed scrolling sections as slivers inside one viewport](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Compose-mixed-scrolling-sections-as-slivers-inside-one-viewport)
- [Honor every field of `SliverConstraints` in a custom render sliver](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Honor-every-field-of-SliverConstraints-in-a-custom-render-sliver)
- [Return finite, normalized, and mutually consistent `SliverGeometry`](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Return-finite%2C-normalized%2C-and-mutually-consistent-SliverGeometry)
- [Use builder delegates for long or unbounded lists and grids](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Use-builder-delegates-for-long-or-unbounded-lists-and-grids)
- [Provide stable keys or index lookup when lazy children can reorder](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Provide-stable-keys-or-index-lookup-when-lazy-children-can-reorder)
- [Choose grid delegates from content sizing and available cross-axis space](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Choose-grid-delegates-from-content-sizing-and-available-cross-axis-space)
- [Avoid wrapping every list item in a separate `SliverToBoxAdapter`](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Avoid-wrapping-every-list-item-in-a-separate-SliverToBoxAdapter)
- [Keep persistent-header extent calculations cheap and deterministic](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Keep-persistent-header-extent-calculations-cheap-and-deterministic)
- [Reach for `NestedScrollView` only when separate scrollables need coordinated offsets](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Reach-for-NestedScrollView-only-when-separate-scrollables-need-coordinated-offsets)
- [Avoid shrink-wrapping when the viewport can expand to a bounded parent extent](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Avoid-shrink-wrapping-when-the-viewport-can-expand-to-a-bounded-parent-extent)
- [Retain off-screen children selectively rather than keeping the entire lazy collection alive](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Retain-off-screen-children-selectively-rather-than-keeping-the-entire-lazy-collection-alive)
- [Profile scrolling with representative item counts, images, and device performance](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Profile-scrolling-with-representative-item-counts%2C-images%2C-and-device-performance)
- [Test reverse, horizontal, overscroll, large-text, and dynamic-content cases](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Scroll-Layout/Test-reverse%2C-horizontal%2C-overscroll%2C-large-text%2C-and-dynamic-content-cases)

[< Back to layout constraints](../README.md)
