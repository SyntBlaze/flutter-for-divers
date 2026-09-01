## Best Practices

- Use profile mode and representative physical devices for paint and raster measurements
- Inspect individual slow frames and separate UI paint time from raster time
- Place `RepaintBoundary` only around independently changing, expensive regions
- Use repaint-rainbow diagnostics to validate repaint scope during investigation
- Implement `CustomPainter.shouldRepaint` from immutable visual inputs and test both changed and unchanged delegates
- Draw with the intended alpha directly when it is visually equivalent to wrapping a subtree in `Opacity`
- Prefer simple clip shapes and omit clips that do not affect visible output
- Treat `saveLayer` as an explicit rendering cost and retain it when correctness genuinely requires isolation
- Decode images near their required physical-pixel dimensions while preserving appropriate quality
- Measure heap usage, cache churn, and reload behavior before changing image-cache limits
- Rely on raster caching for stable, repeatedly reused content rather than constantly changing scenes
- Warm up only representative shaders or pipelines shown to cause first-use jank
- Reprofile after Flutter upgrades because renderer behavior and heuristics can change
- Compare identical interactions, assets, device state, and build configuration before and after each change
