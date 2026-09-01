## Best Practices

- Keep compositing requirements consistent with the layers actually created during paint
- Call `markNeedsCompositingBitsUpdate()` when a render object's need for compositing can change
- Use repaint boundaries where measured repaint isolation or retained-layer reuse justifies their memory and composition cost
- Preserve stable layer identities and reuse eligible old layers across frames
- Update layer properties instead of repainting unchanged child pictures when the visual result permits it
- Keep layer trees as simple as correctness allows and avoid unnecessary nesting
- Prefer direct painting or direct alpha when it produces the same result as group opacity
- Use the simplest clip that satisfies the design and avoid avoidable antialias-with-save-layer clipping
- Balance retained content and raster-cache benefits against layer count and memory use
- Keep `SceneBuilder` push and pop operations balanced and preserve child ordering
- Manage external texture producers, frame notifications, and disposal as one coordinated lifecycle
- Test platform views on every supported platform and composition mode with overlap, transforms, input, and accessibility
- Submit each scene to the intended `FlutterView`, especially in multi-view applications
- Profile in profile mode on representative hardware before adding or removing compositing boundaries
- Use frame traces and layer diagnostics to distinguish framework, raster, GPU, and platform-view costs
- Verify visual correctness, memory use, and frame timing after every compositing optimization
