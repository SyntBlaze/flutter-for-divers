## Best Practices

- Match the coordination primitive to the source's actual completion model
- Distinguish reading a dependency from subscribing to it
- Give listeners and subscriptions the same explicit lifecycle as their owner
- Expose immutable values or controlled mutations
- Name notifier operations after user or domain intent
- Represent stream connection and failure states explicitly
- Reject stale future results by request identity or generation
- Define event concurrency before concurrent inputs occur
- Create scoped owners at the narrowest boundary shared by all consumers
- Keep global state small, partitioned, and resettable
- Keep widget-specific objects out of controllers and presenters
- Inject repositories so coordination logic remains independently testable
