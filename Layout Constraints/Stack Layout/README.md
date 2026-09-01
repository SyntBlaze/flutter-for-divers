# Stack Layout

Stack layout places box children in the same coordinate space so they can
overlap. A `Stack` first lays out its non-positioned children, uses them and its
incoming constraints to choose its own size, and only then resolves its
positioned children against that size. This makes a stack useful for overlays,
badges, anchored controls, and other designs where normal one-dimensional flow
is not enough.

```text
parent BoxConstraints
        |
        v
lay out non-positioned children ---- StackFit + alignment
        |
        v
choose the Stack's Size
        |
        v
lay out positioned children ------- edges / width / height
        |
        v
assign child offsets --------------- alignment / FractionalOffset
        |
        v
paint first child to last child ---- optional overflow clip
```

A child is positioned when it is wrapped in `Positioned`; its edge and size
values are written into stack parent data. Specifying both horizontal edges
derives the child's width, while specifying both vertical edges derives its
height. Any axis that is not fully determined by edges or an explicit dimension
uses the stack's alignment to resolve the remaining position.

`StackFit` controls the constraints given to non-positioned children, not the
positioned-child rules. Clipping is also separate from layout: it limits paint
outside the stack when child geometry overflows, but it does not change the
stack's size or make offstage content scrollable. Child order remains
significant because later children paint on top of earlier ones.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Stack-Layout) — Focused, bite-sized article covering Stack Layout
- [Learning Path](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Stack-Layout) — Step-by-step material that builds practical Stack Layout knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Stack-Layout) — Structured, in-depth material for learning about Stack Layout thoroughly

## Stack Layout Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Stack` | Lay out overlapping box children in one coordinate space | Non-positioned children help determine size; positioned children are resolved after that size is known | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Stack-Layout/Stack "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Stack-Layout/Stack "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Stack-Layout/Stack "Deep Dive") |
| `Positioned` | Supply edge and dimension values for a stack child | It must be a direct child of `Stack`, and over-specifying an axis with both edges and a size is invalid | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Stack-Layout/Positioned "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Stack-Layout/Positioned "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Stack-Layout/Positioned "Deep Dive") |
| `Positioned.fill` | Pin a child to all four stack edges, with optional insets | The resulting child is constrained by the stack's size minus the requested insets | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Stack-Layout/Positioned.fill "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Stack-Layout/Positioned.fill "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Stack-Layout/Positioned.fill "Deep Dive") |
| `Align` | Align and optionally size a non-positioned child | Use it when alignment is the intent; unlike `Positioned`, it can influence stack size as a non-positioned child | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Stack-Layout/Align "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Stack-Layout/Align "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Stack-Layout/Align "Deep Dive") |
| `FractionalOffset` | Express alignment using fractions of the available size | Values are not inherently clamped, so coordinates outside zero to one can place a child beyond the stack | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Stack-Layout/FractionalOffset "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Stack-Layout/FractionalOffset "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Stack-Layout/FractionalOffset "Deep Dive") |
| `StackFit.loose` | Loosen constraints for non-positioned children | Children may choose a size up to the stack's available maximum instead of being forced to fill it | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Stack-Layout/StackFit.loose "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Stack-Layout/StackFit.loose "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Stack-Layout/StackFit.loose "Deep Dive") |
| `StackFit.expand` | Tighten non-positioned children to the stack's available size | Every non-positioned child fills the stack on both axes; positioned children remain governed by their own values | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Stack-Layout/StackFit.expand "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Stack-Layout/StackFit.expand "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Stack-Layout/StackFit.expand "Deep Dive") |
| Clip behavior | Control whether geometrically overflowing children paint outside the stack | Clipping has a rendering cost and does not generally clip visual effects that exceed otherwise in-bounds child geometry | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Stack-Layout/Clip-behavior "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Stack-Layout/Clip-behavior "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Stack-Layout/Clip-behavior "Deep Dive") |
| Paint order | Determine which overlapping child appears on top | Children paint in list order, so the last painted child visually covers earlier siblings | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Stack-Layout/Paint-order "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Stack-Layout/Paint-order "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Stack-Layout/Paint-order "Deep Dive") |

## Questions

- [Which children determine the stack's size, and which are positioned only after that size is known?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Which-children-determine-the-stack's-size%2C-and-which-are-positioned-only-after-that-size-is-known%3F)
- [When should placement use `Positioned` instead of alignment, padding, or normal layout flow?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/When-should-placement-use-Positioned-instead-of-alignment%2C-padding%2C-or-normal-layout-flow%3F)
- [What constraints result from combining left, right, width, top, bottom, and height?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/What-constraints-result-from-combining-left%2C-right%2C-width%2C-top%2C-bottom%2C-and-height%3F)
- [Is a full-stack layer clearer as `Positioned.fill` than four repeated zero-valued edges?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Is-a-full-stack-layer-clearer-as-Positioned.fill-than-four-repeated-zero-valued-edges%3F)
- [Should an aligned child participate in sizing the stack or merely be placed inside an already established size?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Should-an-aligned-child-participate-in-sizing-the-stack-or-merely-be-placed-inside-an-already-established-size%3F)
- [How do fractional coordinates behave for children and containers of different sizes?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/How-do-fractional-coordinates-behave-for-children-and-containers-of-different-sizes%3F)
- [Should non-positioned children keep their natural size or expand to all available space?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Should-non-positioned-children-keep-their-natural-size-or-expand-to-all-available-space%3F)
- [Is overflow caused by intended placement, an incorrect constraint, or content that needs scrolling?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Is-overflow-caused-by-intended-placement%2C-an-incorrect-constraint%2C-or-content-that-needs-scrolling%3F)
- [Which sibling must paint last to be visible and receive interaction in an overlap?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Which-sibling-must-paint-last-to-be-visible-and-receive-interaction-in-an-overlap%3F)

## Best Practices

- [Use `Stack` when overlap is intrinsic to the design, not to compensate for an unclear parent layout](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Use-Stack-when-overlap-is-intrinsic-to-the-design%2C-not-to-compensate-for-an-unclear-parent-layout)
- [Keep each `Positioned` widget directly beneath the `Stack` whose parent data it configures](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Keep-each-Positioned-widget-directly-beneath-the-Stack-whose-parent-data-it-configures)
- [Specify only enough values to determine each axis and avoid contradictory edge-and-size combinations](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Specify-only-enough-values-to-determine-each-axis-and-avoid-contradictory-edge-and-size-combinations)
- [Prefer `Positioned.fill` for overlays and full-area interaction layers](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Prefer-Positioned.fill-for-overlays-and-full-area-interaction-layers)
- [Use `Align` when semantic alignment communicates the placement better than edge coordinates](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Use-Align-when-semantic-alignment-communicates-the-placement-better-than-edge-coordinates)
- [Choose `StackFit` deliberately based on whether non-positioned children should retain natural size or fill available space](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Choose-StackFit-deliberately-based-on-whether-non-positioned-children-should-retain-natural-size-or-fill-available-space)
- [Treat out-of-range fractional offsets as intentional overflow and test them across sizes and text directions](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Treat-out-of-range-fractional-offsets-as-intentional-overflow-and-test-them-across-sizes-and-text-directions)
- [Clip only when overflow must be hidden, and profile clipping in paint-heavy interfaces](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Clip-only-when-overflow-must-be-hidden%2C-and-profile-clipping-in-paint-heavy-interfaces)
- [Arrange children from visual background to foreground and verify hit behavior where they overlap](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Arrange-children-from-visual-background-to-foreground-and-verify-hit-behavior-where-they-overlap)
- [Use directional positioning and alignment when the interface must adapt to right-to-left text](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Use-directional-positioning-and-alignment-when-the-interface-must-adapt-to-right-to-left-text)
- [Test the stack with tight, loose, and small constraints rather than assuming one screen size](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Stack-Layout/Test-the-stack-with-tight%2C-loose%2C-and-small-constraints-rather-than-assuming-one-screen-size)

[< Back to layout constraints](../README.md)
