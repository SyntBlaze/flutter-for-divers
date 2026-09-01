## Best Practices

- Keep build methods free of side effects.
- Rebuild the smallest practical subtree.
- Respect parent constraints and return finite, valid sizes.
- Avoid changing application state from layout callbacks.
- Keep paint methods deterministic and based on computed geometry.
- Avoid unnecessary clipping, opacity layers, and offscreen buffers.
- Provide concise semantics labels, values, hints, and actions.
- Profile pipeline work in profile mode on representative hardware.
- Treat phase boundaries as one-way inputs for the current frame.
