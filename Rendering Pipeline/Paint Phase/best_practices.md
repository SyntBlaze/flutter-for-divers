## Best Practices

- Keep `paint()` focused on recording visuals from already resolved layout state
- Use the offset supplied to `paint()` when positioning every local drawing operation
- Paint children through `PaintingContext` in the intended visual stacking order
- Keep hit testing consistent with the paint order of overlapping children
- Balance all canvas state changes with `save()` and `restore()`
- Limit clips to places where overflow must actually be discarded
- Choose the least expensive clip behavior that meets the required edge quality
- Avoid `saveLayer()` and group-opacity effects unless their offscreen composition is visually necessary
- Prefer direct alpha on independently drawable content when it produces the same result
- Make `CustomPainter.shouldRepaint` compare every input that changes recorded output
- Use a repaint `Listenable` for animation-driven custom painting that does not need build or layout
- Place repaint boundaries around measured paint hotspots with independently changing content
- Avoid adding repaint boundaries indiscriminately because each boundary can add retained-layer and memory cost
- Keep cache candidates visually stable across frames instead of expecting frequently changing pictures to be reused
- Treat raster caching as an engine optimization rather than an application-level guarantee
- Profile paint and raster work in profile mode on representative hardware before optimizing
