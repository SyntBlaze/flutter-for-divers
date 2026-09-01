## Best Practices

- Create long-lived focus nodes outside `build` and dispose nodes you own
- Use focus scopes to contain navigation and preserve local focus history
- Request focus only in response to deliberate lifecycle or user events
- Keep traversal order aligned with visual and accessibility reading order
- Test forward, reverse, and directional traversal
- Handle direct key events only while the intended node has focus
- Treat pressed-key state as event-time state rather than application state
- Handle key repeat deliberately for commands that must run only once
- Do not depend on raw key events for editable text
- Represent commands with shortcuts, intents, and actions
- Keep physical key bindings separate from semantic command behavior
- Let multiple interaction surfaces invoke the same semantic action
- Avoid overriding established platform and text-editing shortcuts
- Test focus visibility, keyboard-only use, modifier combinations, and key repeat
