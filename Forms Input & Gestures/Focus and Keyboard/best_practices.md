## Best Practices

- Create long-lived focus nodes outside `build` and dispose nodes you own
- Use focus scopes to contain navigation and restore focus within a region
- Request focus in response to deliberate lifecycle or user events
- Keep traversal order aligned with visual order and accessibility reading order
- Test forward, reverse, and directional traversal across group boundaries
- Handle direct key events only while the intended node has focus
- Migrate deprecated raw-key listeners instead of introducing new ones
- Represent commands with shortcuts, intents, and actions rather than scattered key checks
- Let multiple interaction surfaces invoke the same semantic action
- Avoid overriding established platform and text-editing shortcuts without a clear reason
- Use `HardwareKeyboard` state only as part of a well-defined event flow
- Test focus visibility, keyboard-only operation, key repeat, and platform-specific bindings
