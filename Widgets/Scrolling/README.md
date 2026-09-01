# Scrolling

Flutter's scrolling APIs range from ready-made lists and grids to controllers,
notifications, inherited configuration, and sliver-based composition. Choosing
among them starts with the shape and size of the content: a small single child,
a long linear or grid collection, pages that snap to the viewport, or several
scroll effects that must share one coordinated surface.

A scroll view combines a gesture-driven `Scrollable`, a scroll position, and a
viewport that reveals only part of its content. Lazy delegates keep large
collections efficient by creating children near the visible region, while
controllers provide imperative access to positions and notifications report
scroll activity up the widget tree. Keep ownership of each position explicit,
especially when nesting scrollables or adding a scrollbar.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling) — Focused, bite-sized article covering Scrolling
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling) — Step-by-step material that builds practical Scrolling knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling) — Structured, in-depth material for learning about Scrolling thoroughly

## Selection and Composition Guidance

Use `ListView` for a linear collection and `GridView` for a two-dimensional
collection. Prefer their builder constructors for long or unbounded data sets.
Use `SingleChildScrollView` for one relatively small child that is normally able
to fit but occasionally needs to scroll; it eagerly builds the entire child and
is therefore not a replacement for a lazy list. Use `PageView` when content
should advance in viewport-sized pages and coordinate it with a
`PageController` when code must select, animate, or observe the current page.

Choose `CustomScrollView` when one viewport must combine heterogeneous slivers,
such as a collapsible header, list, and grid. `NestedScrollView` is specialized
for linking an outer scroll view with inner scrollables, commonly for a flexible
header above tabbed content; account for overlap deliberately rather than
placing arbitrary scroll views inside each other. `DraggableScrollableSheet`
coordinates a sheet's extent with scrolling in the child built from its
provided controller.

Use `PrimaryScrollController` to expose a route-level controller to eligible
descendant scroll views, and pass the same explicit controller to a `Scrollbar`
and its scrollable when their association must be unambiguous.
`ScrollConfiguration` changes inherited scroll behavior for a subtree, while
`NotificationListener` observes bubbling scroll notifications without owning a
position. `RefreshIndicator` adds pull-to-refresh to a vertical scrollable, and
`ReorderableListView` handles interactive item movement when every item has a
stable key and the backing collection is updated correctly.

## Scrolling Widgets and APIs

| Widget or API | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `CustomScrollView` | Composes multiple slivers into one coordinated scrollable viewport | Its children must be slivers; use adapters for ordinary boxes and preserve semantic indexes when accessibility needs collection counts | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/CustomScrollView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/CustomScrollView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/CustomScrollView "Deep Dive") |
| `DraggableScrollableSheet` | Lets a scrollable sheet resize between configured extents before its content scrolls | The builder's scrollable must use the supplied controller or dragging and scrolling will not coordinate correctly | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/DraggableScrollableSheet "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/DraggableScrollableSheet "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/DraggableScrollableSheet "Deep Dive") |
| `GridView` | Displays children in a scrollable two-dimensional arrangement | Choose a grid delegate and lazy constructor that fit the data, and avoid unnecessary `shrinkWrap` measurement | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/GridView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/GridView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/GridView "Deep Dive") |
| `ListView` | Displays children in a scrollable linear sequence | Build large collections lazily, preserve item identity, and avoid competing primary scroll positions in nested layouts | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/ListView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/ListView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/ListView "Deep Dive") |
| `NestedScrollView` | Coordinates an outer scroll view with one or more inner scroll positions | Header overlap, pinned or floating slivers, tab switching, and inner position persistence require deliberate composition | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/NestedScrollView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/NestedScrollView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/NestedScrollView "Deep Dive") |
| `NotificationListener` | Observes notifications bubbling from descendant widgets | Filter by notification type and depth, and return `true` only when propagation to ancestors should stop | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/NotificationListener "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/NotificationListener "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/NotificationListener "Deep Dive") |
| `PageController` | Controls and observes the page selected by a `PageView` | Match viewport fraction and initial page to the intended experience, and dispose controllers owned by state objects | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/PageController "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/PageController "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/PageController "Deep Dive") |
| `PageView` | Presents a page-by-page scrollable sequence | Keep page identity stable, choose the axis and physics intentionally, and avoid rebuilding expensive offscreen pages without need | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/PageView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/PageView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/PageView "Deep Dive") |
| `PrimaryScrollController` | Makes a primary `ScrollController` available to descendant scroll views | Scope it carefully so eligible scrollables do not attach unexpectedly to the same controller | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/PrimaryScrollController "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/PrimaryScrollController "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/PrimaryScrollController "Deep Dive") |
| `RefreshIndicator` | Triggers an asynchronous refresh gesture from an overscrolled vertical descendant | The descendant must produce vertical scroll notifications, and short content may need always-scrollable physics to enable the gesture | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/RefreshIndicator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/RefreshIndicator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/RefreshIndicator "Deep Dive") |
| `ReorderableListView` | Provides a list whose keyed items can be interactively reordered | Every child needs a stable key, and `onReorder` must update the source collection with correct index handling | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/ReorderableListView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/ReorderableListView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/ReorderableListView "Deep Dive") |
| `Scrollbar` | Visualizes scroll position and can optionally support direct interaction | Associate it with the intended scroll position, keep controller ownership clear, and consider whether a permanently visible thumb is appropriate | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/Scrollbar "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/Scrollbar "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/Scrollbar "Deep Dive") |
| `ScrollConfiguration` | Supplies inherited `ScrollBehavior` to a subtree | Change behavior at the narrowest useful scope and preserve platform-appropriate physics, input devices, and overscroll effects | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/ScrollConfiguration "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/ScrollConfiguration "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/ScrollConfiguration "Deep Dive") |
| `SingleChildScrollView` | Makes one box child scrollable along a single axis | It lays out and builds the whole child, so use a lazy list or sliver view for large repeated content | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Scrolling/SingleChildScrollView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Scrolling/SingleChildScrollView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Scrolling/SingleChildScrollView "Deep Dive") |

## Questions

- [When should heterogeneous content share one `CustomScrollView` instead of using nested box scroll views?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/When-should-heterogeneous-content-share-one-CustomScrollView-instead-of-using-nested-box-scroll-views%3F)
- [How does the controller supplied by `DraggableScrollableSheet` coordinate resizing with child scrolling?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/How-does-the-controller-supplied-by-DraggableScrollableSheet-coordinate-resizing-with-child-scrolling%3F)
- [Which `GridView` constructor and grid delegate fit the collection's size and tile geometry?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Which-GridView-constructor-and-grid-delegate-fit-the-collection's-size-and-tile-geometry%3F)
- [Which `ListView` constructor provides the right laziness, separators, and extent behavior?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Which-ListView-constructor-provides-the-right-laziness%2C-separators%2C-and-extent-behavior%3F)
- [How should outer headers, inner positions, and overlap be coordinated in a `NestedScrollView`?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/How-should-outer-headers%2C-inner-positions%2C-and-overlap-be-coordinated-in-a-NestedScrollView%3F)
- [How can notification type, depth, and propagation be filtered with `NotificationListener`?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/How-can-notification-type%2C-depth%2C-and-propagation-be-filtered-with-NotificationListener%3F)
- [When should a `PageController` jump, animate, or only observe a `PageView`?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/When-should-a-PageController-jump%2C-animate%2C-or-only-observe-a-PageView%3F)
- [How should a `PageView` retain page state and respond to user versus programmatic navigation?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/How-should-a-PageView-retain-page-state-and-respond-to-user-versus-programmatic-navigation%3F)
- [Which descendant scrollable should inherit a controller from `PrimaryScrollController`?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Which-descendant-scrollable-should-inherit-a-controller-from-PrimaryScrollController%3F)
- [Why might a `RefreshIndicator` fail to appear for short or horizontally scrolling content?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Why-might-a-RefreshIndicator-fail-to-appear-for-short-or-horizontally-scrolling-content%3F)
- [How should `onReorder` translate old and new indexes before updating the backing list?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/How-should-onReorder-translate-old-and-new-indexes-before-updating-the-backing-list%3F)
- [How should a `Scrollbar` and its scrollable resolve the same `ScrollPosition`?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/How-should-a-Scrollbar-and-its-scrollable-resolve-the-same-ScrollPosition%3F)
- [Which scrolling behavior belongs in a local `ScrollConfiguration` rather than an individual view?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Which-scrolling-behavior-belongs-in-a-local-ScrollConfiguration-rather-than-an-individual-view%3F)
- [When is eager single-child scrolling appropriate instead of a lazy list or sliver composition?](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/When-is-eager-single-child-scrolling-appropriate-instead-of-a-lazy-list-or-sliver-composition%3F)

## Best Practices

- [Compose mixed scroll effects as slivers in one `CustomScrollView` and adapt box children explicitly](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Compose-mixed-scroll-effects-as-slivers-in-one-CustomScrollView-and-adapt-box-children-explicitly)
- [Attach the supplied sheet controller to the built scrollable and keep minimum, initial, and maximum extents coherent](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Attach-the-supplied-sheet-controller-to-the-built-scrollable-and-keep-minimum%2C-initial%2C-and-maximum-extents-coherent)
- [Build large grids lazily and define predictable tile geometry with the appropriate grid delegate](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Build-large-grids-lazily-and-define-predictable-tile-geometry-with-the-appropriate-grid-delegate)
- [Build long lists lazily, preserve item identity, and give each scrollable a clear owner](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Build-long-lists-lazily%2C-preserve-item-identity%2C-and-give-each-scrollable-a-clear-owner)
- [Use `NestedScrollView` for genuinely linked outer and inner positions and handle sliver overlap intentionally](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Use-NestedScrollView-for-genuinely-linked-outer-and-inner-positions-and-handle-sliver-overlap-intentionally)
- [Listen for the narrowest notification type and depth, and stop bubbling only when another listener must not receive it](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Listen-for-the-narrowest-notification-type-and-depth%2C-and-stop-bubbling-only-when-another-listener-must-not-receive-it)
- [Own and dispose a `PageController` with the state that owns programmatic page navigation](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Own-and-dispose-a-PageController-with-the-state-that-owns-programmatic-page-navigation)
- [Keep `PageView` pages stable and make page snapping, direction, and state retention deliberate](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Keep-PageView-pages-stable-and-make-page-snapping%2C-direction%2C-and-state-retention-deliberate)
- [Scope `PrimaryScrollController` so only the intended primary scrollable inherits and attaches to it](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Scope-PrimaryScrollController-so-only-the-intended-primary-scrollable-inherits-and-attaches-to-it)
- [Await refresh work, support vertical overscroll, and expose clear loading and failure feedback](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Await-refresh-work%2C-support-vertical-overscroll%2C-and-expose-clear-loading-and-failure-feedback)
- [Give reorderable children stable keys and update the model immediately and correctly in `onReorder`](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Give-reorderable-children-stable-keys-and-update-the-model-immediately-and-correctly-in-onReorder)
- [Connect `Scrollbar` to the intended position and test thumb visibility and interaction on each target platform](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Connect-Scrollbar-to-the-intended-position-and-test-thumb-visibility-and-interaction-on-each-target-platform)
- [Override scroll behavior locally while retaining expected platform input, physics, and visual affordances](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Override-scroll-behavior-locally-while-retaining-expected-platform-input%2C-physics%2C-and-visual-affordances)
- [Reserve `SingleChildScrollView` for bounded, relatively small content and avoid expensive intrinsic work inside it](https://app.syntblaze.com/qsp/flutter/Widgets/Scrolling/Reserve-SingleChildScrollView-for-bounded%2C-relatively-small-content-and-avoid-expensive-intrinsic-work-inside-it)

[< Back to widgets](../README.md)
