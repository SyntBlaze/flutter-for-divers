# Flex Layout

Flex layout arranges box children along one main axis and aligns them along the
perpendicular cross axis. `Row` uses a horizontal main axis, `Column` uses a
vertical main axis, and `Flex` exposes the direction directly. Their shared
rendering algorithm first measures non-flex children, then divides the remaining
main-axis space among `Expanded` and `Flexible` children according to their flex
factors and fits.

```text
incoming BoxConstraints
          |
          v
choose main axis -------- Row: horizontal / Column: vertical
          |
          v
lay out non-flex children
          |
          v
remaining bounded space --divide by flex factor--> flex allocations
          |                                      /            \
          |                          FlexFit.tight              FlexFit.loose
          |                         must fill share          may use less than share
          v
determine container size and cross-axis extent
          |
          v
position children with main- and cross-axis alignment
          |
          +---- negative remaining space ----> overflow warning stripes in debug mode
```

The flex algorithm can distribute space only when the incoming main-axis extent
is finite. A tight flex child such as `Expanded` therefore conflicts with an
unbounded main axis, which commonly occurs when a `Column` is placed inside a
vertical scroll view. In that situation, remove the tight flex, provide a finite
height, or choose a scrolling composition whose constraints match the intended
behavior.

Alignment happens after child sizes are known. `MainAxisAlignment` distributes
unused space along the main axis, while `CrossAxisAlignment` positions or
stretches children across it. `MainAxisSize` controls whether the flex attempts
to occupy the maximum available main-axis extent or shrink toward its children,
subject to the incoming constraints. These settings cannot repair children
whose combined minimum size is already larger than the available space.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout) — Focused, bite-sized article covering Flex Layout
- [Learning Path](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout) — Step-by-step material that builds practical Flex Layout knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout) — Structured, in-depth material for learning about Flex Layout thoroughly

## Flex Layout Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Row` | Arrange children horizontally using the flex layout protocol | Horizontal space must be negotiated deliberately when content can grow or wrap | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/Row "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/Row "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/Row "Deep Dive") |
| `Column` | Arrange children vertically using the flex layout protocol | Tight flex children require a bounded incoming height | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/Column "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/Column "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/Column "Deep Dive") |
| `Flex` | Configure a flex container with an explicit axis direction | Use it when the direction is dynamic or when a direct `Row` or `Column` would obscure intent | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/Flex "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/Flex "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/Flex "Deep Dive") |
| `MainAxisAlignment` | Position children and distribute unused space along the main axis | Spacing modes affect only remaining space after layout; they do not resize oversized children | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/MainAxisAlignment "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/MainAxisAlignment "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/MainAxisAlignment "Deep Dive") |
| `CrossAxisAlignment` | Align children along the axis perpendicular to layout | Stretching supplies tight cross-axis constraints, while baseline alignment has text-specific requirements | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/CrossAxisAlignment "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/CrossAxisAlignment "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/CrossAxisAlignment "Deep Dive") |
| `MainAxisSize` | Choose the flex container's preferred main-axis extent | `min` can shrink-wrap only within the incoming constraints and flex requirements | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/MainAxisSize "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/MainAxisSize "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/MainAxisSize "Deep Dive") |
| `Expanded` | Give a child a proportional share that it must fill | Do not use it on an unbounded main axis | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/Expanded "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/Expanded "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/Expanded "Deep Dive") |
| `Flexible` | Give a child a proportional maximum allocation that it may fill | Its default loose fit permits the child to be smaller than its allocated share | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/Flexible "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/Flexible "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/Flexible "Deep Dive") |
| `Spacer` | Insert proportional empty space through a flex child | Main-axis `spaceAround`, `spaceBetween`, and `spaceEvenly` cannot redistribute space already consumed by a spacer | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/Spacer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/Spacer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/Spacer "Deep Dive") |
| `FlexFit.tight` | Require a flex child to occupy its complete allocation | The allocation needs finite remaining main-axis space | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/FlexFit.tight "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/FlexFit.tight "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/FlexFit.tight "Deep Dive") |
| `FlexFit.loose` | Let a flex child choose any size up to its allocation | Loose fit limits the child without forcing it to fill the share | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/FlexFit.loose "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/FlexFit.loose "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/FlexFit.loose "Deep Dive") |
| Overflow stripes | Diagnose flex content that exceeds the available main-axis extent | The striped debug indicator identifies an error to fix; it is not clipping or scrolling behavior | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Flex-Layout/Overflow-stripes "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Flex-Layout/Overflow-stripes "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Flex-Layout/Overflow-stripes "Deep Dive") |

## Questions

- [When should a layout use `Row`, `Column`, or direction-configurable `Flex`?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/When-should-a-layout-use-Row%2C-Column%2C-or-direction-configurable-Flex%3F)
- [How does the flex algorithm measure non-flex children and allocate remaining space?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/How-does-the-flex-algorithm-measure-non-flex-children-and-allocate-remaining-space%3F)
- [Why does `Expanded` fail inside an unbounded main axis?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Why-does-Expanded-fail-inside-an-unbounded-main-axis%3F)
- [How do `Expanded` and `Flexible` differ?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/How-do-Expanded-and-Flexible-differ%3F)
- [What changes when a flexible child uses `FlexFit.tight` instead of `FlexFit.loose`?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/What-changes-when-a-flexible-child-uses-FlexFit.tight-instead-of-FlexFit.loose%3F)
- [How are multiple flex factors converted into child allocations?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/How-are-multiple-flex-factors-converted-into-child-allocations%3F)
- [When does `MainAxisSize.min` actually shrink a flex container?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/When-does-MainAxisSize.min-actually-shrink-a-flex-container%3F)
- [Why does `MainAxisAlignment` appear to have no effect?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Why-does-MainAxisAlignment-appear-to-have-no-effect%3F)
- [When does `CrossAxisAlignment.stretch` change a child's constraints?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/When-does-CrossAxisAlignment.stretch-change-a-child's-constraints%3F)
- [What is required for baseline alignment?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/What-is-required-for-baseline-alignment%3F)
- [When is `Spacer` clearer than padding or a fixed gap?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/When-is-Spacer-clearer-than-padding-or-a-fixed-gap%3F)
- [What causes yellow-and-black overflow stripes, and how should the layout be corrected?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/What-causes-yellow-and-black-overflow-stripes%2C-and-how-should-the-layout-be-corrected%3F)

## Best Practices

- [Use `Row` and `Column` when their axis communicates the layout clearly](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Use-Row-and-Column-when-their-axis-communicates-the-layout-clearly)
- [Reason about incoming main-axis constraints before adding a flex child](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Reason-about-incoming-main-axis-constraints-before-adding-a-flex-child)
- [Use `Expanded` only when the child must fill its proportional allocation](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Use-Expanded-only-when-the-child-must-fill-its-proportional-allocation)
- [Use `Flexible` with a loose fit when the child may remain smaller than its allocation](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Use-Flexible-with-a-loose-fit-when-the-child-may-remain-smaller-than-its-allocation)
- [Choose flex factors to express proportions rather than compensate for arbitrary child sizes](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Choose-flex-factors-to-express-proportions-rather-than-compensate-for-arbitrary-child-sizes)
- [Use `MainAxisAlignment` for distributing genuinely unused space](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Use-MainAxisAlignment-for-distributing-genuinely-unused-space)
- [Use `CrossAxisAlignment.stretch` only when every affected child should fill the cross axis](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Use-CrossAxisAlignment.stretch-only-when-every-affected-child-should-fill-the-cross-axis)
- [Provide the required text baseline explicitly when using baseline alignment](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Provide-the-required-text-baseline-explicitly-when-using-baseline-alignment)
- [Use `Spacer` for proportional empty space and ordinary spacing for fixed design-system gaps](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Use-Spacer-for-proportional-empty-space-and-ordinary-spacing-for-fixed-design-system-gaps)
- [Constrain, wrap, truncate, or make content scrollable according to product intent when overflow occurs](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Constrain%2C-wrap%2C-truncate%2C-or-make-content-scrollable-according-to-product-intent-when-overflow-occurs)
- [Test flex layouts with long localized text, large text scale, narrow widths, and dynamic content](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Test-flex-layouts-with-long-localized-text%2C-large-text-scale%2C-narrow-widths%2C-and-dynamic-content)
- [Inspect constraints and child sizes before changing alignment values to mask a layout problem](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Flex-Layout/Inspect-constraints-and-child-sizes-before-changing-alignment-values-to-mask-a-layout-problem)

[< Back to layout constraints](../README.md)
