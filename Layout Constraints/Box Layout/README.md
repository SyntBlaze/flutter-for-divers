# Box Layout

Box layout is Flutter's two-dimensional Cartesian layout protocol. A parent
passes `BoxConstraints` to each `RenderBox`; the child chooses a finite `Size`
that satisfies those constraints; then the parent records the child's position,
usually in parent data. Layout determines geometry, while painting, hit testing,
and semantics interpret that geometry for their own coordinate spaces.

```text
parent RenderBox
      |
      |  BoxConstraints
      v
child RenderBox
      |
      +-- performResize() ----- size determined from constraints alone
      |
      +-- performLayout() ----- lay out children and choose geometry
      |
      +-- computeDryLayout() -- predict a size without changing layout state
      |
      v
    Size
      |
      v
parent stores child Offset in ParentData

layout geometry
   +-- hit test bounds ---- pointer targeting
   +-- paint bounds ------- visual invalidation and culling
   +-- semantic bounds ---- accessibility geometry
   +-- baseline ----------- text-relative alignment
```

Every `RenderBox` must finish layout with a size allowed by its incoming
constraints. A box with `sizedByParent` set to `true` determines that size in
`performResize()`, while most boxes choose their size in `performLayout()` as
they measure and position children. `computeDryLayout()` answers a hypothetical
size query without mutating the render tree and supports APIs that need layout
information before a committed layout pass.

Intrinsic dimensions and baselines are additional queries, not substitutes for
the normal constraints protocol. They can trigger extra traversal or layout
work, so custom render boxes should implement them consistently and callers
should avoid requesting them speculatively. A box's `size` also does not define
every downstream boundary: content may paint outside it, hit testing commonly
uses the box's local bounds, and semantics can describe a distinct accessible
region.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Box-Layout) — Focused, bite-sized article covering Box Layout
- [Learning Path](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Box-Layout) — Step-by-step material that builds practical Box Layout knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Box-Layout) — Structured, in-depth material for learning about Box Layout thoroughly

## Box Layout Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `RenderBox` | Base class for render objects using Cartesian box constraints and sizes | Honor incoming constraints, establish a finite size, and keep child positioning in the parent | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Box-Layout/RenderBox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Box-Layout/RenderBox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Box-Layout/RenderBox "Deep Dive") |
| `performLayout()` | Commit a box's size and lay out and position its children | Read only layout-authorized child geometry and update parent data consistently | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Box-Layout/performLayout-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Box-Layout/performLayout-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Box-Layout/performLayout-method "Deep Dive") |
| `performResize()` | Choose a size from constraints when `sizedByParent` is true | Derive the size only from the box's constraints, without depending on child layout | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Box-Layout/performResize-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Box-Layout/performResize-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Box-Layout/performResize-method "Deep Dive") |
| `computeDryLayout()` | Predict the size a box would choose for hypothetical constraints | Keep the computation side-effect-free and consistent with committed layout | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Box-Layout/computeDryLayout-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Box-Layout/computeDryLayout-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Box-Layout/computeDryLayout-method "Deep Dive") |
| Intrinsic width | Report content-driven minimum and maximum width for a given height | Intrinsic queries may repeat work and must agree with the box's layout behavior | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Box-Layout/Intrinsic-width "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Box-Layout/Intrinsic-width "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Box-Layout/Intrinsic-width "Deep Dive") |
| Intrinsic height | Report content-driven minimum and maximum height for a given width | Avoid intrinsic passes in frequently changing or deeply nested layouts | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Box-Layout/Intrinsic-height "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Box-Layout/Intrinsic-height "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Box-Layout/Intrinsic-height "Deep Dive") |
| Baseline | Expose a typographic alignment line in the box's coordinate system | Baseline queries require a defined baseline type and may depend on completed layout | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Box-Layout/Baseline "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Box-Layout/Baseline "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Box-Layout/Baseline "Deep Dive") |
| Hit test bounds | Define where pointer hit testing considers the box and its descendants | Transform coordinates correctly and keep interactive regions aligned with visible intent | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Box-Layout/Hit-test-bounds "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Box-Layout/Hit-test-bounds "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Box-Layout/Hit-test-bounds "Deep Dive") |
| Paint bounds | Describe the region in which the box can produce pixels | Include intentional visual overflow so culling and repaint invalidation remain correct | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Box-Layout/Paint-bounds "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Box-Layout/Paint-bounds "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Box-Layout/Paint-bounds "Deep Dive") |
| Semantic bounds | Describe the accessibility geometry exposed by the render object | Keep the accessible region meaningful even when paint and interaction bounds differ | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Box-Layout/Semantic-bounds "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Box-Layout/Semantic-bounds "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Box-Layout/Semantic-bounds "Deep Dive") |

## Questions

- [What contract does `RenderBox` establish between a parent and a child?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/What-contract-does-RenderBox-establish-between-a-parent-and-a-child%3F)
- [When should a render box set its size in `performLayout()`?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/When-should-a-render-box-set-its-size-in-performLayout()%3F)
- [Which boxes should opt into `sizedByParent` and implement `performResize()`?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Which-boxes-should-opt-into-sizedByParent-and-implement-performResize()%3F)
- [How can `computeDryLayout()` predict geometry without mutating layout state?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/How-can-computeDryLayout()-predict-geometry-without-mutating-layout-state%3F)
- [Why can intrinsic-width queries require more than one traversal of a subtree?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Why-can-intrinsic-width-queries-require-more-than-one-traversal-of-a-subtree%3F)
- [When does requesting intrinsic height make a layout unnecessarily expensive?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/When-does-requesting-intrinsic-height-make-a-layout-unnecessarily-expensive%3F)
- [How is a child's baseline transformed into the parent's coordinate system?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/How-is-a-child's-baseline-transformed-into-the-parent's-coordinate-system%3F)
- [Can a box receive pointer events outside its own size?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Can-a-box-receive-pointer-events-outside-its-own-size%3F)
- [When should paint bounds extend beyond `Offset.zero & size`?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/When-should-paint-bounds-extend-beyond-Offset.zero-%26-size%3F)
- [Why might semantic bounds differ from visual or interactive bounds?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Why-might-semantic-bounds-differ-from-visual-or-interactive-bounds%3F)
- [Which geometry changes require layout, paint, or semantics invalidation?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Which-geometry-changes-require-layout%2C-paint%2C-or-semantics-invalidation%3F)
- [How should a parent record and use a child's layout offset?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/How-should-a-parent-record-and-use-a-child's-layout-offset%3F)

## Best Practices

- [Treat incoming constraints as the complete range of legal sizes](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Treat-incoming-constraints-as-the-complete-range-of-legal-sizes)
- [Always choose a finite size that satisfies the active `BoxConstraints`](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Always-choose-a-finite-size-that-satisfies-the-active-BoxConstraints)
- [Keep child measurement and positioning inside `performLayout()`](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Keep-child-measurement-and-positioning-inside-performLayout())
- [Use `performResize()` only when size depends solely on parent constraints](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Use-performResize()-only-when-size-depends-solely-on-parent-constraints)
- [Keep dry layout pure and consistent with the committed layout algorithm](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Keep-dry-layout-pure-and-consistent-with-the-committed-layout-algorithm)
- [Avoid intrinsic measurement when a single constraint-based layout pass is sufficient](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Avoid-intrinsic-measurement-when-a-single-constraint-based-layout-pass-is-sufficient)
- [Measure the cost of intrinsic sizing in deep or repeated child structures](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Measure-the-cost-of-intrinsic-sizing-in-deep-or-repeated-child-structures)
- [Expose a baseline only when it has stable meaning for the rendered content](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Expose-a-baseline-only-when-it-has-stable-meaning-for-the-rendered-content)
- [Apply the inverse paint transform when hit testing transformed children](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Apply-the-inverse-paint-transform-when-hit-testing-transformed-children)
- [Keep hit regions large enough for interaction without creating surprising overlap](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Keep-hit-regions-large-enough-for-interaction-without-creating-surprising-overlap)
- [Report all intentional visual overflow in paint bounds](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Report-all-intentional-visual-overflow-in-paint-bounds)
- [Keep semantic geometry aligned with the control or content users perceive](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Keep-semantic-geometry-aligned-with-the-control-or-content-users-perceive)
- [Invalidate only the rendering phase affected by a property change](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Invalidate-only-the-rendering-phase-affected-by-a-property-change)
- [Test custom render boxes under tight, loose, bounded, and unbounded constraints](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Box-Layout/Test-custom-render-boxes-under-tight%2C-loose%2C-bounded%2C-and-unbounded-constraints)

[< Back to layout constraints](../README.md)
