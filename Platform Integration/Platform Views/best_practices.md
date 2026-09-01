## Best Practices

- Use a platform view only when the native or browser surface provides capability worth the integration cost
- Keep platform-view type identifiers and creation-parameter schemas stable and explicitly versioned
- Create the native view lazily and release controllers, handlers, observers, and resources when it is disposed
- Choose the Android composition mode from documented functional requirements and measured performance
- Test texture-backed composition with the exact native view types the application embeds
- Declare gesture recognizers narrowly so embedded views and surrounding Flutter controls cooperate predictably
- Test taps, drags, long presses, multi-touch, nested scrolling, and gesture cancellation
- Avoid placing many simultaneously active platform views in scrolling or frequently rebuilt collections
- Keep platform-view widgets stable across rebuilds and avoid unnecessary native view recreation
- Measure build, raster, platform-thread, memory, and input behavior on representative physical devices
- Verify clipping, opacity, transforms, overlays, keyboard focus, and text input on every supported platform
- Provide coherent semantics and focus traversal across Flutter and native accessibility trees
- Sanitize and constrain data passed into browser elements or native view factories
- Exercise creation failure, backgrounding, route removal, hot restart, and engine detachment
