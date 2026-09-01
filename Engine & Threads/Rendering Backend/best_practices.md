## Best Practices

- Measure raster and GPU work in profile mode on representative devices
- Distinguish command recording, submission, execution, and presentation
- Confirm the active renderer before interpreting backend-specific traces
- Keep display lists focused and avoid recording invisible work
- Use stable layer boundaries only where retained rendering provides a measured benefit
- Reduce expensive effects and oversized draw bounds before adding caches
- Treat surface creation, resizing, loss, and teardown as lifecycle events
- Decode and upload textures close to the dimensions actually displayed
- Reuse GPU resources instead of recreating them every frame
- Avoid blocking application threads while waiting for GPU completion
- Exercise representative effects when evaluating shader compilation behavior
- Warm shaders or pipelines only when profiling shows a first-use problem
- Validate warm-up coverage on every supported backend and target class
- Use renderer-specific diagnostics to confirm the source of raster jank
