## Best Practices

- Profile first and reserve isolates for CPU work that materially affects responsiveness
- Use `Isolate.run()` for finite one-shot computations with a single result
- Use `compute()` only with an explicit understanding of its native and web behavior
- Reuse a long-lived worker only when repeated work justifies its lifecycle and protocol complexity
- Keep isolate entry points, arguments, return values, and captured state small and sendable
- Close receive ports and terminate workers through an intentional shutdown path
- Define structured request, success, failure, progress, and shutdown messages
- Add request identifiers when more than one operation may be in flight
- Use `TransferableTypedData` for measured large-byte transfer bottlenecks and respect ownership transfer
- Combine decoding and expensive transformation in the worker to avoid unnecessary intermediate messages
- Keep widget, render, and UI state access on the root isolate
- Initialize background platform messaging correctly and confirm that every plugin supports the intended isolate
- Handle worker errors, exits, cancellation intent, and stale results as part of the calling lifecycle
- Benchmark isolate startup, computation, message transfer, and end-to-end latency on representative devices
