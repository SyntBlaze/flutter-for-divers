# Painting and Effects

Painting and effects widgets change how a child is drawn without necessarily
changing the space assigned to it during layout. They cover clipping, opacity,
filters, decoration, transforms, custom drawing, and physical elevation. Most
of them are compositional: place the effect around the smallest subtree that
needs it so the visual intent and rendering cost remain easy to understand.

Choose the most specialized widget that expresses the result. Use `ClipRect`,
`ClipRRect`, or `ClipOval` for common clipping shapes before reaching for a
custom `ClipPath`; use `DecoratedBox` for a decoration rather than a general
`Container`; and use `RotatedBox` when quarter-turn rotation should participate
in layout instead of applying a paint-only `Transform`. `CustomPaint` is the
escape hatch for drawing that is easier to describe with canvas commands than
with ordinary widgets.

Effects can introduce clipping work, offscreen layers, shader compilation, and
extra compositing. Keep filtered, translucent, shadowed, or custom-painted
regions as small as practical, avoid repainting static work, and profile on the
devices that matter. Also remember that paint transforms and opacity can leave
layout, hit testing, and semantics intact even when the visual result has moved
or disappeared.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects) — Focused, bite-sized article covering Painting and Effects
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects) — Step-by-step material that builds practical Painting and Effects knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects) — Structured, in-depth material for learning about Painting and Effects thoroughly

## Painting and Effects Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `BackdropFilter` | Applies an image filter to content already painted behind its child | Bound the filtered region with a clip when possible; large blur areas and repeated backdrop reads can be expensive | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/BackdropFilter "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/BackdropFilter "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/BackdropFilter "Deep Dive") |
| `ClipOval` | Clips a child to an oval inscribed in its bounds | Non-square bounds produce an ellipse, and clipping does not change the child's layout size | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/ClipOval "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/ClipOval "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/ClipOval "Deep Dive") |
| `ClipPath` | Clips a child with a path supplied by a custom clipper | Prefer simpler clip widgets when possible and implement `shouldReclip` accurately to avoid unnecessary path work | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/ClipPath "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/ClipPath "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/ClipPath "Deep Dive") |
| `ClipRect` | Clips painting to an axis-aligned rectangle | Use a custom clipper only when the default widget bounds are not the desired rectangle | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/ClipRect "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/ClipRect "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/ClipRect "Deep Dive") |
| `ClipRRect` | Clips a child to a rounded rectangle | Match the clip's radius and bounds to the painted decoration to avoid visible edge mismatches | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/ClipRRect "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/ClipRRect "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/ClipRRect "Deep Dive") |
| `ColorFiltered` | Applies a `ColorFilter` to a child's composited output | The filter affects the entire child subtree, so scope it tightly and choose blend behavior deliberately | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/ColorFiltered "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/ColorFiltered "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/ColorFiltered "Deep Dive") |
| `CustomPaint` | Invokes custom painters before or after an optional child | Supply stable repaint signals and correct paint bounds; canvas drawing outside those bounds can be clipped or undefined | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/CustomPaint "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/CustomPaint "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/CustomPaint "Deep Dive") |
| `DecoratedBox` | Paints a `Decoration` behind or in front of a child | Decoration does not add padding automatically, and foreground painting can obscure child content | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/DecoratedBox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/DecoratedBox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/DecoratedBox "Deep Dive") |
| `FractionalTranslation` | Translates a child by a fraction of its own size | It changes painting rather than layout allocation, and hit-test transformation should be chosen intentionally | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/FractionalTranslation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/FractionalTranslation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/FractionalTranslation "Deep Dive") |
| `Opacity` | Paints a child with uniform alpha | Intermediate opacity commonly uses an offscreen buffer, while transparent content can still receive hit tests | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/Opacity "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/Opacity "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/Opacity "Deep Dive") |
| `PhysicalModel` | Clips and paints a rectangular or circular physical shape with elevation | Shadows, elevation, and anti-aliased clipping add rendering cost; configure shape and border radius consistently | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/PhysicalModel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/PhysicalModel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/PhysicalModel "Deep Dive") |
| `PhysicalShape` | Clips to a custom shape and paints its color and elevation shadow | The custom clipper defines both the visible boundary and shadow outline, so avoid needless reclipping | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/PhysicalShape "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/PhysicalShape "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/PhysicalShape "Deep Dive") |
| `RotatedBox` | Rotates a child by an integer number of quarter turns during layout | Unlike a paint transform, its rotated dimensions participate in layout | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/RotatedBox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/RotatedBox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/RotatedBox "Deep Dive") |
| `ShaderMask` | Applies a shader to a child through a blend mode | Shader bounds and blend mode determine the result, and broad animated masks may be costly | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/ShaderMask "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/ShaderMask "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/ShaderMask "Deep Dive") |
| `Transform` | Applies a matrix to a child during painting | It does not alter the layout space reserved for the child, so transformed content may overlap nearby widgets | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Painting-and-Effects/Transform "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Painting-and-Effects/Transform "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Painting-and-Effects/Transform "Deep Dive") |

## Questions

- [How can a clip constrain the work performed by a `BackdropFilter`?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/How-can-a-clip-constrain-the-work-performed-by-a-BackdropFilter%3F)
- [How does a `ClipOval` behave when its width and height differ?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/How-does-a-ClipOval-behave-when-its-width-and-height-differ%3F)
- [When is `ClipPath` worth using instead of a specialized clip widget?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/When-is-ClipPath-worth-using-instead-of-a-specialized-clip-widget%3F)
- [When should `ClipRect` use a custom clipper?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/When-should-ClipRect-use-a-custom-clipper%3F)
- [Why can mismatched radii produce artifacts around a `ClipRRect`?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Why-can-mismatched-radii-produce-artifacts-around-a-ClipRRect%3F)
- [Which portion of a subtree is affected by `ColorFiltered`?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Which-portion-of-a-subtree-is-affected-by-ColorFiltered%3F)
- [In what order do `CustomPaint`, its child, and `foregroundPainter` paint?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/In-what-order-do-CustomPaint%2C-its-child%2C-and-foregroundPainter-paint%3F)
- [What is the difference between foreground and background painting in `DecoratedBox`?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/What-is-the-difference-between-foreground-and-background-painting-in-DecoratedBox%3F)
- [How is a `FractionalTranslation` offset calculated from child size?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/How-is-a-FractionalTranslation-offset-calculated-from-child-size%3F)
- [Why can an invisible `Opacity` child still respond to input?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Why-can-an-invisible-Opacity-child-still-respond-to-input%3F)
- [How do shape, border radius, clip behavior, and elevation interact in `PhysicalModel`?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/How-do-shape%2C-border-radius%2C-clip-behavior%2C-and-elevation-interact-in-PhysicalModel%3F)
- [How does a `PhysicalShape` clipper determine both the clip and its shadow?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/How-does-a-PhysicalShape-clipper-determine-both-the-clip-and-its-shadow%3F)
- [Why does `RotatedBox` affect layout differently from `Transform.rotate`?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Why-does-RotatedBox-affect-layout-differently-from-Transform.rotate%3F)
- [How do shader bounds and blend mode affect a `ShaderMask`?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/How-do-shader-bounds-and-blend-mode-affect-a-ShaderMask%3F)
- [When should movement use layout rather than a paint-only `Transform`?](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/When-should-movement-use-layout-rather-than-a-paint-only-Transform%3F)

## Best Practices

- [Clip `BackdropFilter` to the smallest region that actually needs filtering](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Clip-BackdropFilter-to-the-smallest-region-that-actually-needs-filtering)
- [Use `ClipOval` when an oval or circular boundary is the intended visible shape](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Use-ClipOval-when-an-oval-or-circular-boundary-is-the-intended-visible-shape)
- [Cache stable paths and implement `shouldReclip` carefully for `ClipPath`](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Cache-stable-paths-and-implement-shouldReclip-carefully-for-ClipPath)
- [Prefer `ClipRect` for rectangular clipping instead of a more complex custom path](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Prefer-ClipRect-for-rectangular-clipping-instead-of-a-more-complex-custom-path)
- [Keep `ClipRRect` geometry consistent with the decoration beneath it](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Keep-ClipRRect-geometry-consistent-with-the-decoration-beneath-it)
- [Scope `ColorFiltered` around only the content that needs color processing](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Scope-ColorFiltered-around-only-the-content-that-needs-color-processing)
- [Keep `CustomPainter.paint` bounded and drive repaints with a focused `Listenable`](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Keep-CustomPainter.paint-bounded-and-drive-repaints-with-a-focused-Listenable)
- [Use explicit padding alongside `DecoratedBox` when decoration content needs inset space](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Use-explicit-padding-alongside-DecoratedBox-when-decoration-content-needs-inset-space)
- [Account for unchanged layout bounds when positioning with `FractionalTranslation`](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Account-for-unchanged-layout-bounds-when-positioning-with-FractionalTranslation)
- [Avoid wrapping large subtrees in changing `Opacity` values and manage interaction at zero alpha](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Avoid-wrapping-large-subtrees-in-changing-Opacity-values-and-manage-interaction-at-zero-alpha)
- [Use `PhysicalModel` elevation and clipping only where the physical surface contributes meaning](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Use-PhysicalModel-elevation-and-clipping-only-where-the-physical-surface-contributes-meaning)
- [Keep `PhysicalShape` clippers stable and paths no more complex than necessary](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Keep-PhysicalShape-clippers-stable-and-paths-no-more-complex-than-necessary)
- [Use `RotatedBox` for quarter turns that must influence the surrounding layout](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Use-RotatedBox-for-quarter-turns-that-must-influence-the-surrounding-layout)
- [Choose `ShaderMask` blend modes explicitly and keep animated shader regions focused](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Choose-ShaderMask-blend-modes-explicitly-and-keep-animated-shader-regions-focused)
- [Use `Transform` for visual geometry changes and a layout widget when neighbors must move](https://app.syntblaze.com/qsp/flutter/Widgets/Painting-and-Effects/Use-Transform-for-visual-geometry-changes-and-a-layout-widget-when-neighbors-must-move)

[< Back to widgets](../README.md)
