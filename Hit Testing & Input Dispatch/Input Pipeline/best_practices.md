## Best Practices

- Use `Listener` or gesture widgets instead of subscribing to engine packets directly
- Preserve packet and event ordering throughout custom input integrations
- Convert physical coordinates with the correct view configuration
- Use event positions and deltas in their documented coordinate spaces
- Do not treat device addition as the start of a gesture
- Initialize pointer-sequence state on down
- Keep high-frequency move handling lightweight
- Release pressed and drag state on both up and cancel
- Do not send additional sequence work after a pointer has ended
- Handle signal events independently from contact gestures
- Respect platform conventions when interpreting scroll deltas
- Avoid making hover the only way to reveal essential actions
- Let `GestureBinding` retain and reuse hit-test paths for active pointers
- Avoid calling pointer lifecycle handlers directly in normal application code
- Keep hit-test target event handlers fast and free of reentrant dispatch
- Test touch, mouse, stylus, trackpad, and cancellation paths as applicable
