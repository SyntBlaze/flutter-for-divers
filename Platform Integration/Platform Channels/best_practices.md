## Best Practices

- Use stable, uniquely scoped channel names
- Version method names and payload schemas deliberately
- Choose the narrowest channel pattern that matches calls, streams, or peer messages
- Keep codecs identical on both sides of a channel
- Represent payloads with small, explicit, backwards-compatible value shapes
- Use Pigeon when a typed generated contract reduces protocol drift
- Regenerate and commit all Pigeon outputs after changing a schema
- Map expected native failures to stable error codes and useful details
- Handle unavailable implementations, cancellation, and engine detachment explicitly
- Complete each method or message reply exactly once
- Stop native event producers when an `EventChannel` subscription is cancelled
- Keep handlers short and move blocking work off platform and frame-critical threads
- Return to the required thread before touching thread-affine platform APIs
- Exercise channel contracts in integration tests on every supported platform
