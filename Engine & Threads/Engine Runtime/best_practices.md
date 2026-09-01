## Best Practices

- Use framework APIs for routine application behavior
- Keep embedder responsibilities separate from framework policy
- Respect the shell's task-runner and thread-affinity contracts
- Measure runtime behavior in the build mode used for the investigation
- Use isolates for work large enough to justify transfer and startup costs
- Keep root-isolate work responsive to frames and platform messages
- Pass explicit, bounded messages between isolates
- Break long synchronous work into appropriate asynchronous or isolated work
- Keep microtasks short and avoid self-perpetuating microtask chains
- Post native work to the task runner that owns the target resource
- Let Flutter's binding stack own low-level `PlatformDispatcher` callbacks
- Make engine startup and shutdown paths idempotent and ownership-aware
- Avoid assuming ordinary Dart objects are shared between isolates
- Treat engine callbacks as lifecycle-sensitive integration points
- Profile event-loop stalls before moving work to another isolate
- Release platform, graphics, and Dart resources in their required order
