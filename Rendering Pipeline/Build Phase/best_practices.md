## Best Practices

- Keep `build` methods pure, synchronous, and free of externally visible side effects
- Move expensive computation and I/O out of `build`
- Call `setState` only for mutations that affect the rendered result
- Check that a `State` or context is still mounted after an asynchronous gap
- Split large widgets at stable responsibility boundaries to localize rebuild work
- Use `const` widgets where the configuration is compile-time constant
- Preserve widget runtime type and key when existing state should survive reconciliation
- Use stable keys for reorderable or insertable sibling collections
- Prefer local keys unless global access or cross-parent reparenting is required
- Create long-lived `GlobalKey` instances outside `build`
- Read inherited values as close as practical to the widgets that consume them
- Use non-listening lookup APIs when a dependency-driven rebuild is not required
- Avoid manually invoking framework build-scheduling internals in application code
- Profile build cost in profile mode before optimizing rebuild boundaries
- Verify rebuild behavior with DevTools instead of assuming every new widget is expensive
