## Best Practices

- Carry a small domain identifier or value as typed drag data instead of deriving meaning from the feedback widget
- Use one intentional generic payload type across each source-target contract and avoid null drag data
- Keep target eligibility checks fast, deterministic, and free of model mutations
- Commit changes only after acceptance, and make rejected or cancelled drags leave the model unchanged
- Use lightweight feedback that remains visible across the intended overlay and does not accidentally intercept hit tests
- Test transformed, differently sized, nested-overlay, and root-overlay feedback with the intended anchor and hit-test offset
- Use stable item keys and test upward, downward, first, and last reorders
- Confirm destructive dismissals when appropriate and provide undo for recoverable actions
- Limit simultaneous drags when the interface or data model cannot represent concurrent operations safely
- Provide non-drag equivalents, visible focus, useful semantics, and clear accepted/rejected state
- Test touch, mouse, trackpad, keyboard, screen reader, cancellation, and drag-versus-scroll behavior
