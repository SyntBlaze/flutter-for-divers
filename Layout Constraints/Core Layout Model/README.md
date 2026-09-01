# Core Layout Model

Flutter layout is a negotiation between a parent and its children. The parent
sends constraints down, each child chooses geometry that satisfies those
constraints, and the child reports that geometry back up. The parent then
decides where each child is positioned; a child does not choose its own
location in the parent's coordinate system.

```text
parent
  |
  | constraints go down
  v
child chooses geometry within those constraints
  |
  | size or geometry goes up
  v
parent records child position in parent data
  |
  v
layout result: constrained size + parent-controlled offset

box protocol:    BoxConstraints    -> Size
sliver protocol: SliverConstraints -> SliverGeometry
```

The box protocol describes minimum and maximum width and height with
`BoxConstraints`. A tight axis allows exactly one size, while a loose axis
allows the child to be smaller than its maximum. Bounded and unbounded describe
whether an axis has a finite maximum; they are independent of whether its
constraints are tight or loose.

Scrollable regions use a different contract. `SliverConstraints` describe the
viewport, scroll position, axes, and remaining paint and cache extents that a
sliver must account for. In both protocols, constraints are the parent's input,
not a request the child may ignore. Values such as `Size`, `Offset`, and
`ParentData` carry the geometry and parent-specific placement information that
the rest of rendering relies on.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model) — Focused, bite-sized article covering Core Layout Model
- [Learning Path](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model) — Step-by-step material that builds practical Core Layout Model knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model) — Structured, in-depth material for learning about Core Layout Model thoroughly

## Core Layout Model Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Constraints go down | How a parent communicates the geometry its child is allowed to choose | Every child must return geometry that satisfies the active layout protocol | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/Constraints-go-down "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/Constraints-go-down "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/Constraints-go-down "Deep Dive") |
| Sizes go up | How child geometry becomes input to the parent's own layout decision | A parent may use child sizes to choose its size, but its result must still satisfy its own constraints | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/Sizes-go-up "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/Sizes-go-up "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/Sizes-go-up "Deep Dive") |
| Parent sets position | How a parent places children after or during layout | A child selects its size, while its parent owns its offset in the parent's coordinate system | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/Parent-sets-position "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/Parent-sets-position "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/Parent-sets-position "Deep Dive") |
| `BoxConstraints` | Minimum and maximum widths and heights in box layout | Normalize constraint ranges and distinguish per-axis tightness, boundedness, and infinity | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/BoxConstraints "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/BoxConstraints "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/BoxConstraints "Deep Dive") |
| `SliverConstraints` | Viewport and scroll-state input to sliver layout | Interpret scroll, paint, cache, growth, and cross-axis values in the correct axis directions | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/SliverConstraints "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/SliverConstraints "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/SliverConstraints "Deep Dive") |
| `Size` | Two-dimensional width and height reported by box layout | Keep size within the received constraints and avoid treating it as a position | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/Size "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/Size "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/Size "Deep Dive") |
| `Offset` | A displacement in a two-dimensional coordinate system | Know which local, parent, global, paint, or hit-test coordinate space an offset belongs to | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/Offset "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/Offset "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/Offset "Deep Dive") |
| `ParentData` | Child-attached storage for information required by its parent | Use the exact parent-data type expected by the owning render object | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/ParentData "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/ParentData "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/ParentData "Deep Dive") |
| Tight constraints | Constraints that permit exactly one size on an axis | Tightness fixes size; it does not imply that the size is large or that every axis is tight | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/Tight-constraints "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/Tight-constraints "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/Tight-constraints "Deep Dive") |
| Loose constraints | Constraints whose minimum is zero while retaining a maximum | A loose child may choose less space, but it may not exceed the finite maximum | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/Loose-constraints "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/Loose-constraints "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/Loose-constraints "Deep Dive") |
| Bounded constraints | Constraints with a finite maximum on an axis | Bounded space gives size-dependent layouts a finite upper limit | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/Bounded-constraints "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/Bounded-constraints "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/Bounded-constraints "Deep Dive") |
| Unbounded constraints | Constraints with an infinite maximum on an axis | A child needing a finite available extent must obtain one without guessing from infinity | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Core-Layout-Model/Unbounded-constraints "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Core-Layout-Model/Unbounded-constraints "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Core-Layout-Model/Unbounded-constraints "Deep Dive") |

## Questions

- [Why do constraints flow from parent to child rather than from child to parent?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Why-do-constraints-flow-from-parent-to-child-rather-than-from-child-to-parent%3F)
- [How can a parent use its children's sizes while still obeying its own constraints?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/How-can-a-parent-use-its-children's-sizes-while-still-obeying-its-own-constraints%3F)
- [Why can a child choose its size but not its position?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Why-can-a-child-choose-its-size-but-not-its-position%3F)
- [How are minimum and maximum dimensions represented by `BoxConstraints`?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/How-are-minimum-and-maximum-dimensions-represented-by-BoxConstraints%3F)
- [What viewport and scroll information does a sliver receive during layout?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/What-viewport-and-scroll-information-does-a-sliver-receive-during-layout%3F)
- [When does a render box report its `Size`?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/When-does-a-render-box-report-its-Size%3F)
- [Which coordinate space does an `Offset` describe?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Which-coordinate-space-does-an-Offset-describe%3F)
- [Why is parent-owned layout information stored on the child as `ParentData`?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Why-is-parent-owned-layout-information-stored-on-the-child-as-ParentData%3F)
- [Can a constraint be tight and still describe a small or zero size?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Can-a-constraint-be-tight-and-still-describe-a-small-or-zero-size%3F)
- [What does it mean to loosen a constraint without removing its maximum?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/What-does-it-mean-to-loosen-a-constraint-without-removing-its-maximum%3F)
- [Are width and height bounded independently?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Are-width-and-height-bounded-independently%3F)
- [Where do unbounded constraints commonly come from, and how should children respond?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Where-do-unbounded-constraints-commonly-come-from%2C-and-how-should-children-respond%3F)
- [How do tightness and boundedness differ?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/How-do-tightness-and-boundedness-differ%3F)
- [How do box and sliver layout contracts differ?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/How-do-box-and-sliver-layout-contracts-differ%3F)

## Best Practices

- [Read the incoming constraints before reasoning about any widget's eventual size](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Read-the-incoming-constraints-before-reasoning-about-any-widget's-eventual-size)
- [Return only geometry that satisfies the active layout protocol](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Return-only-geometry-that-satisfies-the-active-layout-protocol)
- [Let the parent own child offsets and placement policy](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Let-the-parent-own-child-offsets-and-placement-policy)
- [Evaluate width and height constraints independently](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Evaluate-width-and-height-constraints-independently)
- [Use constraint helpers instead of duplicating normalization and enforcement logic](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Use-constraint-helpers-instead-of-duplicating-normalization-and-enforcement-logic)
- [Interpret sliver extents in terms of scroll, paint, cache, and cross axes](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Interpret-sliver-extents-in-terms-of-scroll%2C-paint%2C-cache%2C-and-cross-axes)
- [Keep size and position as separate concepts](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Keep-size-and-position-as-separate-concepts)
- [Document or preserve the coordinate space when transforming offsets](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Document-or-preserve-the-coordinate-space-when-transforming-offsets)
- [Use only the `ParentData` subtype required by the parent render object](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Use-only-the-ParentData-subtype-required-by-the-parent-render-object)
- [Use tight constraints when an exact dimension is a deliberate part of the parent policy](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Use-tight-constraints-when-an-exact-dimension-is-a-deliberate-part-of-the-parent-policy)
- [Use loose constraints when a child may choose less than the available maximum](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Use-loose-constraints-when-a-child-may-choose-less-than-the-available-maximum)
- [Check boundedness before dividing, expanding, or deriving a size from the available extent](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Check-boundedness-before-dividing%2C-expanding%2C-or-deriving-a-size-from-the-available-extent)
- [Give children a finite extent when their layout algorithm cannot operate with an unbounded maximum](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Give-children-a-finite-extent-when-their-layout-algorithm-cannot-operate-with-an-unbounded-maximum)
- [Diagnose layout failures by tracing constraints down, geometry up, and offsets back to the parent](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Core-Layout-Model/Diagnose-layout-failures-by-tracing-constraints-down%2C-geometry-up%2C-and-offsets-back-to-the-parent)

[< Back to layout constraints](../README.md)
