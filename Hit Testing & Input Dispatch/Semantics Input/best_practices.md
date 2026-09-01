## Best Practices

- Keep semantic bounds and transforms aligned with the visible interactive area
- Preserve a predictable accessibility traversal and hit-test order
- Advertise only actions that the control can currently perform
- Use standard semantics actions whenever they accurately describe the operation
- Give custom actions short, localized, verb-oriented labels
- Avoid duplicating a standard action with a custom action
- Make accessibility tap invoke the same underlying command as ordinary activation
- Do not require gesture timing or pointer precision for semantics activation
- Expose scroll actions only in directions where meaningful movement is possible
- Update scroll position and semantics promptly after a successful action
- Test with the platform screen reader and other supported accessibility services
- Verify merged, excluded, hidden, disabled, and dynamically changing semantics states
