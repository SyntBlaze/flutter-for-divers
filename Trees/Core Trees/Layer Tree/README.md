# Layer Tree

The layer tree is Flutter's retained description of composited visual output.
During painting, render objects record drawing commands and introduce layers
where output needs independent transforms, clipping, filtering, opacity,
platform composition, or reuse. The engine consumes this tree to rasterize and
composite a frame.

```text
RenderObject.paint
        |
        v
      Layer
        +-- ContainerLayer --------> child layers
        |     +-- Offset / Transform / Opacity
        |     +-- Clip / Filter / ShaderMask
        |     +-- Leader / Follower
        +-- PictureLayer ----------> recorded drawing commands
        +-- Texture / PlatformView -> externally produced content
```

Layers are not widgets or render objects. They describe paint output and
compositing boundaries, and many can be retained or updated across frames so
unchanged work does not need to be recreated.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree) — Focused, bite-sized article covering Layer Tree
- [Learning Path](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree) — Step-by-step material that builds practical Layer Tree knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree) — Structured, in-depth material for learning about Layer Tree thoroughly

## Layer Tree Nodes

| Topic | Role in the layer tree | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| Layer | Base node for retained compositing state and engine scene construction | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/Layer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/Layer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/Layer "Deep Dive") |
| ContainerLayer | Layer that owns an ordered list of child layers | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/ContainerLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/ContainerLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/ContainerLayer "Deep Dive") |
| PictureLayer | Holds recorded drawing commands for a rectangular region | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/PictureLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/PictureLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/PictureLayer "Deep Dive") |
| OffsetLayer | Translates its children by an offset and supports subtree repainting | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/OffsetLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/OffsetLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/OffsetLayer "Deep Dive") |
| TransformLayer | Applies a transformation matrix to its child subtree | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/TransformLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/TransformLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/TransformLayer "Deep Dive") |
| OpacityLayer | Composites its child subtree with a shared alpha value | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/OpacityLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/OpacityLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/OpacityLayer "Deep Dive") |
| ClipRectLayer | Clips its child subtree to an axis-aligned rectangle | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/ClipRectLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/ClipRectLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/ClipRectLayer "Deep Dive") |
| ClipRRectLayer | Clips its child subtree to a rounded rectangle | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/ClipRRectLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/ClipRRectLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/ClipRRectLayer "Deep Dive") |
| ClipPathLayer | Clips its child subtree to an arbitrary path | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/ClipPathLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/ClipPathLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/ClipPathLayer "Deep Dive") |
| ColorFilterLayer | Applies a color filter while compositing its child subtree | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/ColorFilterLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/ColorFilterLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/ColorFilterLayer "Deep Dive") |
| ImageFilterLayer | Applies an image filter, such as blur, to its child subtree | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/ImageFilterLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/ImageFilterLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/ImageFilterLayer "Deep Dive") |
| ShaderMaskLayer | Blends a shader mask over its child subtree | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/ShaderMaskLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/ShaderMaskLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/ShaderMaskLayer "Deep Dive") |
| BackdropFilterLayer | Filters existing scene content behind its child subtree | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/BackdropFilterLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/BackdropFilterLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/BackdropFilterLayer "Deep Dive") |
| TextureLayer | Displays a rectangular region supplied by an external texture | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/TextureLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/TextureLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/TextureLayer "Deep Dive") |
| PlatformViewLayer | Composites an embedded platform view into the scene | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/PlatformViewLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/PlatformViewLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/PlatformViewLayer "Deep Dive") |
| PerformanceOverlayLayer | Adds engine performance graphs to the composited scene | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/PerformanceOverlayLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/PerformanceOverlayLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/PerformanceOverlayLayer "Deep Dive") |
| LeaderLayer | Establishes a linked transform target for follower layers | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/LeaderLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/LeaderLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/LeaderLayer "Deep Dive") |
| FollowerLayer | Positions its subtree relative to a linked leader layer | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Layer-Tree/FollowerLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Layer-Tree/FollowerLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Layer-Tree/FollowerLayer "Deep Dive") |

## Questions

- [How is a layer different from a widget or render object?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/How-is-a-layer-different-from-a-widget-or-render-object%3F)
- [When does painting create a new layer instead of recording into an existing one?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/When-does-painting-create-a-new-layer-instead-of-recording-into-an-existing-one%3F)
- [How does a container layer preserve the paint order of its children?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/How-does-a-container-layer-preserve-the-paint-order-of-its-children%3F)
- [What drawing data does a picture layer retain?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/What-drawing-data-does-a-picture-layer-retain%3F)
- [How does an offset layer support repaint boundaries and retained rendering?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/How-does-an-offset-layer-support-repaint-boundaries-and-retained-rendering%3F)
- [How are transforms and opacity represented during compositing?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/How-are-transforms-and-opacity-represented-during-compositing%3F)
- [When are clip layers needed, and what is the cost of complex clipping?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/When-are-clip-layers-needed%2C-and-what-is-the-cost-of-complex-clipping%3F)
- [How do color, image, shader-mask, and backdrop filters differ?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/How-do-color%2C-image%2C-shader-mask%2C-and-backdrop-filters-differ%3F)
- [How does a backdrop filter differ from filtering its own child subtree?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/How-does-a-backdrop-filter-differ-from-filtering-its-own-child-subtree%3F)
- [How do texture and platform-view layers introduce externally rendered content?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/How-do-texture-and-platform-view-layers-introduce-externally-rendered-content%3F)
- [What information does a performance overlay layer display?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/What-information-does-a-performance-overlay-layer-display%3F)
- [How do leader and follower layers keep separate subtrees visually aligned?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/How-do-leader-and-follower-layers-keep-separate-subtrees-visually-aligned%3F)

## Best Practices

- [Let the painting framework manage layer attachment and lifecycle](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/Let-the-painting-framework-manage-layer-attachment-and-lifecycle)
- [Retain and update compatible layers when custom painting can reuse them](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/Retain-and-update-compatible-layers-when-custom-painting-can-reuse-them)
- [Keep layer child order consistent with visual paint order](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/Keep-layer-child-order-consistent-with-visual-paint-order)
- [Use repaint boundaries only where isolating repaint work is beneficial](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/Use-repaint-boundaries-only-where-isolating-repaint-work-is-beneficial)
- [Avoid unnecessary save layers, opacity groups, and compositing effects](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/Avoid-unnecessary-save-layers%2C-opacity-groups%2C-and-compositing-effects)
- [Prefer the simplest clip shape that meets the visual requirement](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/Prefer-the-simplest-clip-shape-that-meets-the-visual-requirement)
- [Constrain filtered regions to limit offscreen rendering cost](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/Constrain-filtered-regions-to-limit-offscreen-rendering-cost)
- [Use backdrop filters deliberately because they read already-painted content](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/Use-backdrop-filters-deliberately-because-they-read-already-painted-content)
- [Manage external texture and platform-view lifecycles outside the layer itself](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/Manage-external-texture-and-platform-view-lifecycles-outside-the-layer-itself)
- [Reuse one `LayerLink` for each intended leader-follower relationship](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/Reuse-one-LayerLink-for-each-intended-leader-follower-relationship)
- [Profile real frames before optimizing the layer tree](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Layer-Tree/Profile-real-frames-before-optimizing-the-layer-tree)

[< Back to Core Trees](../README.md)
