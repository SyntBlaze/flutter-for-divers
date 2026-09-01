# Compositing Phase

The compositing phase turns Flutter's retained layer hierarchy into an engine
scene for a specific view. After layout, Flutter updates compositing bits so
each render object knows whether its descendants require composited content.
During painting, `PaintingContext` records drawing commands into picture layers
and inserts container layers for transforms, clips, opacity, and other effects.

```text
render tree
    |
    +--> update compositing bits --> needsCompositing decisions
    |
    `--> paint via PaintingContext
              |
              v
       retained layer tree
       +-- PictureLayer (recorded drawing commands)
       +-- Offset / Transform / Opacity / Clip layers
       `-- Texture / PlatformView layers
              |
              v
       addToScene() traversal
              |
              v
        SceneBuilder --> Scene --> FlutterView.render()
                                      |
                                      v
                           engine rasterization and presentation
```

The layer tree is related to, but does not mirror, the widget or render-object
tree. A repaint boundary normally owns a retained layer, while effect layers
can group or modify a subtree. When a layer subtree and its engine resources
remain reusable, Flutter can retain them across frames rather than emit every
operation again. A layer can also change properties such as an offset without
requiring its child pictures to be rerecorded, although the engine may still
need to composite or rasterize the result.

Scene construction is the framework-to-engine boundary for visual output.
Each layer contributes operations through `addToScene()`, `buildScene()` walks
the hierarchy with a `SceneBuilder`, and `FlutterView.render()` submits the
completed `Scene` to one view. Rasterization and display happen afterward in
the engine. External textures and embedded platform views participate through
specialized layers and have lifecycle, synchronization, and platform-specific
composition costs.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase) — Focused, bite-sized article covering Compositing Phase
- [Learning Path](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase) — Step-by-step material that builds practical Compositing Phase knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase) — Structured, in-depth material for learning about Compositing Phase thoroughly

## Compositing Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Layer | Represents retained scene content that can be reused across frames | A layer is compositing state, not a one-to-one copy of a widget or render object | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/Layer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/Layer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/Layer "Deep Dive") |
| ContainerLayer | Owns an ordered collection of child layers | Child order determines scene order, and descendants can form a reusable subtree | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/ContainerLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/ContainerLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/ContainerLayer "Deep Dive") |
| PictureLayer | Holds a recorded picture as a leaf in the layer tree | Reusing the layer avoids rerecording commands, but raster work or cache use can still change | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/PictureLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/PictureLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/PictureLayer "Deep Dive") |
| OffsetLayer | Translates a child layer subtree without rerecording its pictures | Updating the offset can move stable painted content while preserving its child layers | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/OffsetLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/OffsetLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/OffsetLayer "Deep Dive") |
| TransformLayer | Applies a transformation matrix to a child layer subtree | Complex or changing transforms can still increase compositing, sampling, and raster cost | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/TransformLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/TransformLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/TransformLayer "Deep Dive") |
| OpacityLayer | Applies group alpha to a child layer subtree | Group opacity may require intermediate rendering; prefer cheaper direct alpha when equivalent | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/OpacityLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/OpacityLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/OpacityLayer "Deep Dive") |
| ClipRectLayer | Clips a child layer subtree to an axis-aligned rectangle | Clipping is not free, and antialiasing or save-layer behavior can increase cost | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/ClipRectLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/ClipRectLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/ClipRectLayer "Deep Dive") |
| ClipPathLayer | Clips a child layer subtree to an arbitrary path | Complex, animated, or antialiased paths are generally more expensive than simple rectangular clips | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/ClipPathLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/ClipPathLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/ClipPathLayer "Deep Dive") |
| TextureLayer | Displays image content supplied by an external texture producer | Coordinate texture IDs, frame availability, sizing, and producer disposal across the Flutter and platform lifecycles | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/TextureLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/TextureLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/TextureLayer "Deep Dive") |
| PlatformViewLayer | Places an embedded native platform view in the scene | Composition behavior, overlap support, input, accessibility, and performance vary by platform and integration mode | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/PlatformViewLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/PlatformViewLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/PlatformViewLayer "Deep Dive") |
| SceneBuilder | Records compositing operations and content used to build an engine `Scene` | Push and pop operations must preserve the intended layer nesting, transforms, clips, and order | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/SceneBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/SceneBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/SceneBuilder "Deep Dive") |
| Scene | Encapsulates the completed engine layer tree for rendering | A scene is view-ready output; it is not the retained framework layer tree itself | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/Scene "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/Scene "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/Scene "Deep Dive") |
| `markNeedsCompositingBitsUpdate()` | Invalidates cached compositing requirements after the render tree changes | Use it when a render object's compositing requirement can change independently of ordinary layout or paint invalidation | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/markNeedsCompositingBitsUpdate-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/markNeedsCompositingBitsUpdate-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/markNeedsCompositingBitsUpdate-method "Deep Dive") |
| `alwaysNeedsCompositing` | Declares that a render object's paint method always creates a composited layer | Return true only when the render object invariably introduces composited content and keep the value consistent with painting behavior | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/alwaysNeedsCompositing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/alwaysNeedsCompositing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/alwaysNeedsCompositing "Deep Dive") |
| `pushLayer()` | Appends a container layer and records child painting into it | Reuse an eligible old layer when possible and pass the correct child offset to the painter callback | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/pushLayer-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/pushLayer-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/pushLayer-method "Deep Dive") |
| `addToScene()` | Emits a layer's scene operations into a `SceneBuilder` | Retained engine layers can bypass rebuilding unchanged subtrees, while changed layers must emit current properties and children | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/addToScene-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/addToScene-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/addToScene-method "Deep Dive") |
| `buildScene()` | Traverses the retained layer tree to produce a `Scene` | Scene construction must begin from the correct root layer after paint has produced a coherent hierarchy | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/buildScene-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/buildScene-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/buildScene-method "Deep Dive") |
| `FlutterView.render()` | Submits a completed `Scene` to a specific engine view | Submit to the intended view; engine rasterization and presentation occur after this framework call | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Compositing-Phase/FlutterView.render-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Compositing-Phase/FlutterView.render-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Compositing-Phase/FlutterView.render-method "Deep Dive") |

## Questions

- [How does Flutter decide whether a render subtree needs composited content?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/How-does-Flutter-decide-whether-a-render-subtree-needs-composited-content%3F)
- [Why does the retained layer tree differ from the widget and render-object trees?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Why-does-the-retained-layer-tree-differ-from-the-widget-and-render-object-trees%3F)
- [Which render objects create or own layers, and which only record into an existing picture?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Which-render-objects-create-or-own-layers%2C-and-which-only-record-into-an-existing-picture%3F)
- [How does a repaint boundary affect paint invalidation, layer ownership, and retained rendering?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/How-does-a-repaint-boundary-affect-paint-invalidation%2C-layer-ownership%2C-and-retained-rendering%3F)
- [When can Flutter reuse a layer subtree or retained engine layer across frames?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/When-can-Flutter-reuse-a-layer-subtree-or-retained-engine-layer-across-frames%3F)
- [What changes force picture commands to be rerecorded instead of merely recomposited?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/What-changes-force-picture-commands-to-be-rerecorded-instead-of-merely-recomposited%3F)
- [How can an `OffsetLayer` move stable child content without repainting that content?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/How-can-an-OffsetLayer-move-stable-child-content-without-repainting-that-content%3F)
- [When should an effect use a transform, opacity, or clip layer rather than modify drawing commands directly?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/When-should-an-effect-use-a-transform%2C-opacity%2C-or-clip-layer-rather-than-modify-drawing-commands-directly%3F)
- [When does group opacity require intermediate rendering, and what cheaper alternatives preserve the result?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/When-does-group-opacity-require-intermediate-rendering%2C-and-what-cheaper-alternatives-preserve-the-result%3F)
- [How do clip shape, antialiasing, and save-layer behavior affect raster cost?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/How-do-clip-shape%2C-antialiasing%2C-and-save-layer-behavior-affect-raster-cost%3F)
- [How do `TextureLayer` content updates differ from ordinary Flutter picture updates?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/How-do-TextureLayer-content-updates-differ-from-ordinary-Flutter-picture-updates%3F)
- [Which platform-view composition mode is active, and what limitations does it impose on transforms, clips, input, and performance?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Which-platform-view-composition-mode-is-active%2C-and-what-limitations-does-it-impose-on-transforms%2C-clips%2C-input%2C-and-performance%3F)
- [When must a render object call `markNeedsCompositingBitsUpdate()`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/When-must-a-render-object-call-markNeedsCompositingBitsUpdate()%3F)
- [What invariant must `alwaysNeedsCompositing` maintain with the render object's paint implementation?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/What-invariant-must-alwaysNeedsCompositing-maintain-with-the-render-object's-paint-implementation%3F)
- [How does `PaintingContext.pushLayer()` connect child painting to a reusable container layer?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/How-does-PaintingContext.pushLayer()-connect-child-painting-to-a-reusable-container-layer%3F)
- [What does each layer contribute during `addToScene()` traversal?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/What-does-each-layer-contribute-during-addToScene()-traversal%3F)
- [What is the difference among the framework layer tree, `SceneBuilder`, `Scene`, and rasterized pixels?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/What-is-the-difference-among-the-framework-layer-tree%2C-SceneBuilder%2C-Scene%2C-and-rasterized-pixels%3F)
- [How is a completed scene routed to the correct `FlutterView` in a multi-view application?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/How-is-a-completed-scene-routed-to-the-correct-FlutterView-in-a-multi-view-application%3F)
- [Does the measured frame miss originate in framework painting, scene construction, rasterization, GPU work, or platform-view composition?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Does-the-measured-frame-miss-originate-in-framework-painting%2C-scene-construction%2C-rasterization%2C-GPU-work%2C-or-platform-view-composition%3F)

## Best Practices

- [Keep compositing requirements consistent with the layers actually created during paint](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Keep-compositing-requirements-consistent-with-the-layers-actually-created-during-paint)
- [Call `markNeedsCompositingBitsUpdate()` when a render object's need for compositing can change](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Call-markNeedsCompositingBitsUpdate()-when-a-render-object's-need-for-compositing-can-change)
- [Use repaint boundaries where measured repaint isolation or retained-layer reuse justifies their memory and composition cost](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Use-repaint-boundaries-where-measured-repaint-isolation-or-retained-layer-reuse-justifies-their-memory-and-composition-cost)
- [Preserve stable layer identities and reuse eligible old layers across frames](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Preserve-stable-layer-identities-and-reuse-eligible-old-layers-across-frames)
- [Update layer properties instead of repainting unchanged child pictures when the visual result permits it](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Update-layer-properties-instead-of-repainting-unchanged-child-pictures-when-the-visual-result-permits-it)
- [Keep layer trees as simple as correctness allows and avoid unnecessary nesting](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Keep-layer-trees-as-simple-as-correctness-allows-and-avoid-unnecessary-nesting)
- [Prefer direct painting or direct alpha when it produces the same result as group opacity](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Prefer-direct-painting-or-direct-alpha-when-it-produces-the-same-result-as-group-opacity)
- [Use the simplest clip that satisfies the design and avoid avoidable antialias-with-save-layer clipping](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Use-the-simplest-clip-that-satisfies-the-design-and-avoid-avoidable-antialias-with-save-layer-clipping)
- [Balance retained content and raster-cache benefits against layer count and memory use](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Balance-retained-content-and-raster-cache-benefits-against-layer-count-and-memory-use)
- [Keep `SceneBuilder` push and pop operations balanced and preserve child ordering](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Keep-SceneBuilder-push-and-pop-operations-balanced-and-preserve-child-ordering)
- [Manage external texture producers, frame notifications, and disposal as one coordinated lifecycle](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Manage-external-texture-producers%2C-frame-notifications%2C-and-disposal-as-one-coordinated-lifecycle)
- [Test platform views on every supported platform and composition mode with overlap, transforms, input, and accessibility](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Test-platform-views-on-every-supported-platform-and-composition-mode-with-overlap%2C-transforms%2C-input%2C-and-accessibility)
- [Submit each scene to the intended `FlutterView`, especially in multi-view applications](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Submit-each-scene-to-the-intended-FlutterView%2C-especially-in-multi-view-applications)
- [Profile in profile mode on representative hardware before adding or removing compositing boundaries](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Profile-in-profile-mode-on-representative-hardware-before-adding-or-removing-compositing-boundaries)
- [Use frame traces and layer diagnostics to distinguish framework, raster, GPU, and platform-view costs](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Use-frame-traces-and-layer-diagnostics-to-distinguish-framework%2C-raster%2C-GPU%2C-and-platform-view-costs)
- [Verify visual correctness, memory use, and frame timing after every compositing optimization](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Compositing-Phase/Verify-visual-correctness%2C-memory-use%2C-and-frame-timing-after-every-compositing-optimization)

[< Back to Rendering Pipeline](../README.md)
