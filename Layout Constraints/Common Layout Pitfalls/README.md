# Common Layout Pitfalls

Flutter layout failures usually come from a mismatch between the constraints a
parent supplies and the sizing behavior a child expects. The most familiar
symptoms—yellow-and-black overflow stripes, "unbounded height" exceptions,
content hidden by system UI, and sluggish scrolling—are evidence of different
problems and need different fixes.

```text
layout symptom
     |
     +-- exception about unbounded constraints
     |       |
     |       +-- flex in scroll direction? ---- remove Expanded / add a bound
     |       +-- scrollable in Column? -------- constrain it or use Expanded
     |
     +-- overflow stripes
     |       |
     |       +-- content forced to fixed size?  adapt, wrap, or allow scrolling
     |
     +-- correct result, slow layout/scrolling
     |       |
     |       +-- IntrinsicHeight? -------------- avoid speculative extra passes
     |       +-- shrinkWrap? ------------------- prefer a bounded lazy viewport
     |
     +-- obscured or over-padded content
     |       |
     |       +-- SafeArea / insets? ------------ identify the inset owner
     |
     +-- gestures or scrolling feel conflicted
             |
             +-- nested scrollables? ----------- coordinate or simplify them
```

Start diagnosis at the nearest failing render object and inspect the constraints
it received, not just the widget where the symptom became visible. A `Column`
offers non-flex children unbounded space along its main axis, while a vertical
scroll view deliberately exposes an unbounded scroll extent to its child. A
flex child that is required to fill "remaining" infinite space therefore has no
finite size to choose. Introduce a real bound, remove the incompatible flex
requirement, or compose the screen as one coordinated scrollable.

Some layouts are valid but unnecessarily expensive. `IntrinsicHeight` can add
speculative measurement passes, and `shrinkWrap: true` may repeatedly recompute
the scrollable's extent as the scroll position changes. Likewise, broad
`LayoutBuilder` placement can rebuild much more of the interface than the
constraint-dependent region. Treat these APIs as targeted tools whose cost and
scope should be visible in profiling.

Insets and nested scrolling are ownership problems as much as geometry
problems. Apply `SafeArea` only at the layer responsible for avoiding system
obstructions, distinguish persistent padding from transient keyboard insets,
and avoid having multiple scrollables compete for the same gesture unless
their positions are deliberately coordinated.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Common-Layout-Pitfalls) — Focused, bite-sized article covering Common Layout Pitfalls
- [Learning Path](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Common-Layout-Pitfalls) — Step-by-step material that builds practical Common Layout Pitfalls knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Common-Layout-Pitfalls) — Structured, in-depth material for learning about Common Layout Pitfalls thoroughly

## Common Layout Pitfall Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Unbounded height in `Column` | Diagnose children that cannot choose a finite height inside vertical flex layout | Identify which ancestor removed the height bound before adding wrappers or fixed dimensions | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Unbounded-height-in-Column "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Unbounded-height-in-Column "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Unbounded-height-in-Column "Deep Dive") |
| `ListView` inside `Column` | Combine a vertical scrollable with other vertically arranged content | Give the list a finite viewport with `Expanded`, `Flexible`, or an explicit bound, or compose one scroll view | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Common-Layout-Pitfalls/ListView-inside-Column "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Common-Layout-Pitfalls/ListView-inside-Column "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Common-Layout-Pitfalls/ListView-inside-Column "Deep Dive") |
| `Expanded` inside scroll view | Resolve flex allocation when the scroll axis has infinite available extent | Do not ask a tight flex child to fill infinite remaining space; remove the flex or establish a finite bound | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Expanded-inside-scroll-view "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Expanded-inside-scroll-view "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Expanded-inside-scroll-view "Deep Dive") |
| `IntrinsicHeight` cost | Understand the additional measurement work caused by intrinsic sizing | Avoid intrinsic passes in deep, repeated, or frequently changing subtrees unless their value is measured | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Common-Layout-Pitfalls/IntrinsicHeight-cost "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Common-Layout-Pitfalls/IntrinsicHeight-cost "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Common-Layout-Pitfalls/IntrinsicHeight-cost "Deep Dive") |
| `ShrinkWrap` cost | Understand the work required for a scrollable to derive its size from its contents | Prefer a bounded lazy viewport for large or dynamic collections and use `shrinkWrap` only when composition requires it | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Common-Layout-Pitfalls/ShrinkWrap-cost "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Common-Layout-Pitfalls/ShrinkWrap-cost "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Common-Layout-Pitfalls/ShrinkWrap-cost "Deep Dive") |
| Overflow from fixed width | Prevent content from exceeding a width chosen without regard to available space | Adapt to constraints and text scale instead of relying on a device-specific constant | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Overflow-from-fixed-width "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Overflow-from-fixed-width "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Overflow-from-fixed-width "Deep Dive") |
| Incorrect `SafeArea` usage | Avoid missing, duplicated, or misplaced system inset handling | Assign one clear inset owner and decide which edges each region must avoid | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Incorrect-SafeArea-usage "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Incorrect-SafeArea-usage "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Incorrect-SafeArea-usage "Deep Dive") |
| Nested scrolling conflicts | Prevent competing scroll positions, physics, and gesture handling | Prefer one scrollable or explicitly coordinate nested viewports and their controllers | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Nested-scrolling-conflicts "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Nested-scrolling-conflicts "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Common-Layout-Pitfalls/Nested-scrolling-conflicts "Deep Dive") |
| `LayoutBuilder` rebuild scope | Limit constraint-driven rebuilds to the subtree that actually adapts | Place the builder near the decision boundary and keep unrelated expensive work outside its builder | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Common-Layout-Pitfalls/LayoutBuilder-rebuild-scope "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Common-Layout-Pitfalls/LayoutBuilder-rebuild-scope "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Common-Layout-Pitfalls/LayoutBuilder-rebuild-scope "Deep Dive") |

## Questions

- [Which ancestor first introduces an unbounded height, and does the affected child require a finite one?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Which-ancestor-first-introduces-an-unbounded-height%2C-and-does-the-affected-child-require-a-finite-one%3F)
- [Should the `ListView` occupy the remaining screen, a fixed region, or participate in one larger scrollable?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Should-the-ListView-occupy-the-remaining-screen%2C-a-fixed-region%2C-or-participate-in-one-larger-scrollable%3F)
- [What does "remaining space" mean when an `Expanded` child is inside an unbounded scroll axis?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/What-does-%22remaining-space%22-mean-when-an-Expanded-child-is-inside-an-unbounded-scroll-axis%3F)
- [How many extra layout or measurement passes does `IntrinsicHeight` trigger in this subtree?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/How-many-extra-layout-or-measurement-passes-does-IntrinsicHeight-trigger-in-this-subtree%3F)
- [Does shrink-wrapping preserve laziness, and how often must the viewport extent be recomputed?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Does-shrink-wrapping-preserve-laziness%2C-and-how-often-must-the-viewport-extent-be-recomputed%3F)
- [Will fixed-width content still fit with narrow constraints, large text, localization, and split-screen use?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Will-fixed-width-content-still-fit-with-narrow-constraints%2C-large-text%2C-localization%2C-and-split-screen-use%3F)
- [Which widget owns avoidance of status bars, cutouts, navigation areas, and the keyboard?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Which-widget-owns-avoidance-of-status-bars%2C-cutouts%2C-navigation-areas%2C-and-the-keyboard%3F)
- [Which scrollable should consume a drag, and how are inner and outer scroll positions coordinated?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Which-scrollable-should-consume-a-drag%2C-and-how-are-inner-and-outer-scroll-positions-coordinated%3F)
- [Which constraints does this responsive decision depend on, and how small can its rebuild scope be?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Which-constraints-does-this-responsive-decision-depend-on%2C-and-how-small-can-its-rebuild-scope-be%3F)
- [Is the visible symptom a constraint violation, painted overflow, inset error, or performance cost?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Is-the-visible-symptom-a-constraint-violation%2C-painted-overflow%2C-inset-error%2C-or-performance-cost%3F)

## Best Practices

- [Trace constraints from the failing render object toward its ancestors before changing widget structure](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Trace-constraints-from-the-failing-render-object-toward-its-ancestors-before-changing-widget-structure)
- [Give a scrollable a finite viewport when it shares a `Column` with non-scrolling content](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Give-a-scrollable-a-finite-viewport-when-it-shares-a-Column-with-non-scrolling-content)
- [Avoid tight flex allocation along an unbounded scroll axis](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Avoid-tight-flex-allocation-along-an-unbounded-scroll-axis)
- [Prefer ordinary one-pass constraint layout over speculative intrinsic measurement](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Prefer-ordinary-one-pass-constraint-layout-over-speculative-intrinsic-measurement)
- [Keep large collections in bounded lazy viewports rather than shrink-wrapping their full extent](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Keep-large-collections-in-bounded-lazy-viewports-rather-than-shrink-wrapping-their-full-extent)
- [Derive width decisions from current constraints and content requirements](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Derive-width-decisions-from-current-constraints-and-content-requirements)
- [Test narrow windows, large text, long translations, and landscape or split-screen layouts](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Test-narrow-windows%2C-large-text%2C-long-translations%2C-and-landscape-or-split-screen-layouts)
- [Apply system insets once at the correct composition boundary](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Apply-system-insets-once-at-the-correct-composition-boundary)
- [Handle keyboard insets separately from persistent safe-area padding when their behavior differs](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Handle-keyboard-insets-separately-from-persistent-safe-area-padding-when-their-behavior-differs)
- [Use one primary scrollable when slivers can express the whole composition](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Use-one-primary-scrollable-when-slivers-can-express-the-whole-composition)
- [Coordinate nested scrolling explicitly when independent viewports are genuinely required](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Coordinate-nested-scrolling-explicitly-when-independent-viewports-are-genuinely-required)
- [Keep `LayoutBuilder` close to the widgets whose structure depends on its constraints](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Keep-LayoutBuilder-close-to-the-widgets-whose-structure-depends-on-its-constraints)
- [Use Flutter Inspector constraint information and performance profiling to confirm the diagnosis](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Common-Layout-Pitfalls/Use-Flutter-Inspector-constraint-information-and-performance-profiling-to-confirm-the-diagnosis)

[< Back to layout constraints](../README.md)
