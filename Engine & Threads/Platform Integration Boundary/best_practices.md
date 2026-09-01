## Best Practices

- Keep embedder policy thin and make ownership explicit
- Treat engine, view, surface, and plugin attachment as separate lifecycles
- Choose platform-view composition only after measuring on supported devices
- Keep native view creation and disposal paired with Flutter widget lifecycle
- Preserve selection and composing ranges when synchronizing text state
- Test text input with real keyboards, input methods, focus changes, and autofill
- Keep semantics identifiers and focus behavior stable across updates
- Test accessibility with each platform's native assistive technologies
- Use stable channel names and version payload schemas deliberately
- Keep messages small and avoid unnecessary serialization across the boundary
- Complete every reply exactly once and handle engine detachment
- Move blocking native work off frame-critical threads while returning results on the required runner
- Map permissions, cancellation, unavailable APIs, and native failures explicitly
- Let Flutter's binding stack own low-level engine callbacks in ordinary applications
- Avoid overwriting global callback handlers installed by framework bindings
- Exercise integration tests on every supported host platform
