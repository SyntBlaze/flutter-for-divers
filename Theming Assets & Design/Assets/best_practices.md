## Best Practices

- Keep asset declarations explicit, correctly indented, and validated in continuous integration
- Use stable semantic paths and preserve filename case across case-sensitive and case-insensitive systems
- Prefer the context-provided `AssetBundle` in widgets and injectable bundle dependencies in services
- Use `rootBundle` only for genuinely application-global, context-free reads
- Reserve layout space and provide meaningful semantics or deliberately exclude decorative images
- Size raster sources and decode targets for their rendered use rather than shipping one oversized image everywhere
- Declare font faces accurately, preserve licenses, and verify glyph fallback and text scaling
- Test SVG, Lottie, and Rive files with the exact package and runtime versions used by the application
- Pause offscreen animation and provide static or reduced-motion alternatives
- Centralize asset variant selection and define a deterministic fallback
- Preload a measured, bounded working set instead of the entire catalog
- Measure decoded image memory and cache behavior on constrained devices
- Fail asset lookups visibly during development and cover critical resources with tests
- Review package size, first-use latency, accessibility, and licensing before release
