# Paint Phase

The paint phase turns resolved render-object geometry into recorded drawing
commands. After layout has established sizes and positions, `PipelineOwner`
flushes render objects whose visual output is dirty. Render objects override
`paint()` to draw themselves and delegate descendant painting through a
`PaintingContext`, passing offsets that place children in the parent's
coordinate system.

Painting records work; it does not normally rasterize pixels immediately.
`Canvas` operations are captured into pictures, while painting operations that
need independent transforms, clips, opacity, or reuse can introduce retained
layers. Compositing later assembles those layers into a scene, and the engine
rasterizes the scene for presentation.

```text
visual state changes
        |
        v
markNeedsPaint() -> nearest repaint boundary -> dirty paint queue
                                                    |
                                                    v
                                             flush paint work
                                                    |
                                                    v
PaintingContext -> RenderObject.paint(context, offset) -> Canvas commands
        |                                                   |
        +---------------- pictures and layers <-------------+
                                    |
                                    v
                         compositing -> rasterization
```

Paint invalidation is incremental. `markNeedsPaint()` propagates toward the
nearest repaint boundary, where scheduled repaint work can be isolated from
the surrounding render tree. A boundary can preserve and reuse a subtree's
layer when only another part of the scene changes, but it also adds layer and
memory overhead. Raster caching is likewise heuristic: a stable, expensive
picture may be cached, but a repaint boundary does not guarantee that the
engine will cache it.

Drawing order defines visual stacking. Clips, transforms, blend modes, and
group opacity also affect the amount of offscreen and raster work required.
Canvas state must remain balanced, and custom painters should report repaint
dependencies precisely so that visual changes neither leave stale output nor
trigger unnecessary work.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase) — Focused, bite-sized article covering Paint Phase
- [Learning Path](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase) — Step-by-step material that builds practical Paint Phase knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase) — Structured, in-depth material for learning about Paint Phase thoroughly

## Paint Phase Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `PaintingContext` | Records a render subtree into pictures and composited layers | Paint descendants through the context so it can preserve ordering, choose recording boundaries, and manage retained layers | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/PaintingContext "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/PaintingContext "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/PaintingContext "Deep Dive") |
| `Canvas` | Receives drawing, transform, clip, and save/restore commands | Treat it as a stateful command recorder: pair every `save()` or `saveLayer()` with `restore()` and keep coordinates consistent with the supplied offset | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/Canvas "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/Canvas "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/Canvas "Deep Dive") |
| `Paint` | Configures color, stroke, shader, filtering, and blend behavior for drawing | Reuse configuration deliberately and understand that shaders, filters, and blend modes can increase raster cost | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/Paint "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/Paint "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/Paint "Deep Dive") |
| `PictureRecorder` | Captures canvas commands into a reusable picture | End recording before consuming the picture, and remember that recorded commands still incur raster work when drawn | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/PictureRecorder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/PictureRecorder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/PictureRecorder "Deep Dive") |
| `markNeedsPaint()` | Invalidates visual output and schedules repaint from the nearest repaint boundary | Call it when appearance changes without requiring new geometry; layout changes already cause the necessary paint invalidation | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/markNeedsPaint-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/markNeedsPaint-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/markNeedsPaint-method "Deep Dive") |
| `paint()` | Records a render object's visual representation into the painting context | Use the provided offset, paint children explicitly in the intended order, and avoid mutating layout state during painting | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/paint-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/paint-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/paint-method "Deep Dive") |
| `CustomPainter` | Lets application code paint custom graphics and decide when to repaint | Make `shouldRepaint` reflect every visual input, or supply a `Listenable` to repaint without rebuilding or laying out the widget subtree again | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/CustomPainter "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/CustomPainter "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/CustomPainter "Deep Dive") |
| RenderObject painting order | Determines visual stacking as render objects paint themselves and their children | Later drawing appears over earlier drawing; keep hit-test ordering consistent with the visual stacking model | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/RenderObject-painting-order "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/RenderObject-painting-order "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/RenderObject-painting-order "Deep Dive") |
| Clip behavior | Controls whether and how content outside a clip is discarded | Clip only when required, select the least expensive acceptable edge behavior, and verify whether the clip introduces a layer or offscreen pass | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/Clip-behavior "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/Clip-behavior "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/Clip-behavior "Deep Dive") |
| Opacity and `saveLayer()` | Uses an offscreen buffer to apply group opacity when direct alpha is insufficient | Offscreen buffers add allocation, rendering, and compositing work; prefer direct alpha when it preserves the intended result | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/Opacity-saveLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/Opacity-saveLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/Opacity-saveLayer "Deep Dive") |
| Repaint boundary | Isolates a subtree so its repaint work and retained layer can be managed separately | Add boundaries around stable, costly siblings of frequently changing content, not around every subtree | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/Repaint-boundary "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/Repaint-boundary "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/Repaint-boundary "Deep Dive") |
| `isRepaintBoundary` | Declares that a render object establishes a repaint boundary | Call `markNeedsCompositingBitsUpdate()` whenever this value can change so the layer requirements are recomputed | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/isRepaintBoundary "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/isRepaintBoundary "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/isRepaintBoundary "Deep Dive") |
| Raster cache | Reuses rasterized content for stable pictures that are expensive to redraw | Cache admission is engine-controlled and device-dependent; stable content benefits more than content that changes every frame | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Paint-Phase/Raster-cache "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Paint-Phase/Raster-cache "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Paint-Phase/Raster-cache "Deep Dive") |

## Questions

- [What work happens during Flutter's paint phase, and what remains for compositing and rasterization?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/What-work-happens-during-Flutter's-paint-phase%2C-and-what-remains-for-compositing-and-rasterization%3F)
- [How does `PipelineOwner` select and flush dirty paint roots?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/How-does-PipelineOwner-select-and-flush-dirty-paint-roots%3F)
- [How does `markNeedsPaint()` propagate invalidation to a repaint boundary?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/How-does-markNeedsPaint()-propagate-invalidation-to-a-repaint-boundary%3F)
- [When should a render object request paint instead of layout?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/When-should-a-render-object-request-paint-instead-of-layout%3F)
- [What responsibilities belong to `RenderObject.paint()`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/What-responsibilities-belong-to-RenderObject.paint()%3F)
- [Why does `paint()` receive both a `PaintingContext` and an offset?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Why-does-paint()-receive-both-a-PaintingContext-and-an-offset%3F)
- [How does `PaintingContext.paintChild()` preserve child painting and layer behavior?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/How-does-PaintingContext.paintChild()-preserve-child-painting-and-layer-behavior%3F)
- [How do `Canvas`, `Paint`, and `PictureRecorder` cooperate to record drawing commands?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/How-do-Canvas%2C-Paint%2C-and-PictureRecorder-cooperate-to-record-drawing-commands%3F)
- [Why must canvas `save()`, `saveLayer()`, and `restore()` calls remain balanced?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Why-must-canvas-save()%2C-saveLayer()%2C-and-restore()-calls-remain-balanced%3F)
- [How does render-object painting order determine visual stacking?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/How-does-render-object-painting-order-determine-visual-stacking%3F)
- [Why should hit-testing order agree with the reverse of visual painting order for overlapping children?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Why-should-hit-testing-order-agree-with-the-reverse-of-visual-painting-order-for-overlapping-children%3F)
- [When should a `CustomPainter` return true from `shouldRepaint`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/When-should-a-CustomPainter-return-true-from-shouldRepaint%3F)
- [How can a `Listenable` repaint a `CustomPainter` without repeating build and layout?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/How-can-a-Listenable-repaint-a-CustomPainter-without-repeating-build-and-layout%3F)
- [Which clip behaviors can add antialiasing or offscreen-buffer cost?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Which-clip-behaviors-can-add-antialiasing-or-offscreen-buffer-cost%3F)
- [Why can group opacity or `saveLayer()` be expensive?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Why-can-group-opacity-or-saveLayer()-be-expensive%3F)
- [What work does a repaint boundary isolate, and what work does it leave unchanged?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/What-work-does-a-repaint-boundary-isolate%2C-and-what-work-does-it-leave-unchanged%3F)
- [When can too many repaint boundaries increase memory and compositing overhead?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/When-can-too-many-repaint-boundaries-increase-memory-and-compositing-overhead%3F)
- [Why does a repaint boundary not guarantee raster-cache reuse?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Why-does-a-repaint-boundary-not-guarantee-raster-cache-reuse%3F)
- [How do stable content and per-frame changes affect raster-cache effectiveness?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/How-do-stable-content-and-per-frame-changes-affect-raster-cache-effectiveness%3F)
- [Which DevTools signals help distinguish excessive repainting from slow rasterization?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Which-DevTools-signals-help-distinguish-excessive-repainting-from-slow-rasterization%3F)

## Best Practices

- [Keep `paint()` focused on recording visuals from already resolved layout state](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Keep-paint()-focused-on-recording-visuals-from-already-resolved-layout-state)
- [Use the offset supplied to `paint()` when positioning every local drawing operation](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Use-the-offset-supplied-to-paint()-when-positioning-every-local-drawing-operation)
- [Paint children through `PaintingContext` in the intended visual stacking order](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Paint-children-through-PaintingContext-in-the-intended-visual-stacking-order)
- [Keep hit testing consistent with the paint order of overlapping children](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Keep-hit-testing-consistent-with-the-paint-order-of-overlapping-children)
- [Balance all canvas state changes with `save()` and `restore()`](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Balance-all-canvas-state-changes-with-save()-and-restore())
- [Limit clips to places where overflow must actually be discarded](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Limit-clips-to-places-where-overflow-must-actually-be-discarded)
- [Choose the least expensive clip behavior that meets the required edge quality](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Choose-the-least-expensive-clip-behavior-that-meets-the-required-edge-quality)
- [Avoid `saveLayer()` and group-opacity effects unless their offscreen composition is visually necessary](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Avoid-saveLayer()-and-group-opacity-effects-unless-their-offscreen-composition-is-visually-necessary)
- [Prefer direct alpha on independently drawable content when it produces the same result](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Prefer-direct-alpha-on-independently-drawable-content-when-it-produces-the-same-result)
- [Make `CustomPainter.shouldRepaint` compare every input that changes recorded output](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Make-CustomPainter.shouldRepaint-compare-every-input-that-changes-recorded-output)
- [Use a repaint `Listenable` for animation-driven custom painting that does not need build or layout](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Use-a-repaint-Listenable-for-animation-driven-custom-painting-that-does-not-need-build-or-layout)
- [Place repaint boundaries around measured paint hotspots with independently changing content](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Place-repaint-boundaries-around-measured-paint-hotspots-with-independently-changing-content)
- [Avoid adding repaint boundaries indiscriminately because each boundary can add retained-layer and memory cost](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Avoid-adding-repaint-boundaries-indiscriminately-because-each-boundary-can-add-retained-layer-and-memory-cost)
- [Keep cache candidates visually stable across frames instead of expecting frequently changing pictures to be reused](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Keep-cache-candidates-visually-stable-across-frames-instead-of-expecting-frequently-changing-pictures-to-be-reused)
- [Treat raster caching as an engine optimization rather than an application-level guarantee](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Treat-raster-caching-as-an-engine-optimization-rather-than-an-application-level-guarantee)
- [Profile paint and raster work in profile mode on representative hardware before optimizing](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Paint-Phase/Profile-paint-and-raster-work-in-profile-mode-on-representative-hardware-before-optimizing)

[< Back to Rendering Pipeline](../README.md)
