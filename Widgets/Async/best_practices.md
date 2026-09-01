## Best Practices

- Keep a `Future` stable across unrelated builds and render all meaningful snapshot states
- Subscribe to a stable `Stream` and handle data, errors, and completion explicitly
- Use `ValueListenableBuilder.child` to avoid rebuilding value-independent subtrees
- Scope `AnimatedBuilder` narrowly and hoist invariant widgets into its `child`
- Listen for the narrowest notification type and stop propagation only intentionally
- Cancel or dispose resources you own even when a builder manages its own subscription
