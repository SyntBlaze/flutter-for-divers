## Best Practices

- Leave children unkeyed when stable positional reconciliation expresses their identity
- Use stable domain identifiers for reorderable or insertable sibling collections
- Keep local keys unique among children of the same parent
- Choose `ObjectKey` only when object identity, rather than value equality, defines identity
- Do not recreate a `UniqueKey` on every build when state should survive
- Use `PageStorageKey` values that are unique within their storage path
- Create long-lived `GlobalKey` instances outside `build`
- Prefer local keys unless global access or cross-parent reparenting is required
- Never mount two widgets with the same `GlobalKey` at the same time
- Treat a global-key debug label as diagnostics, not identity
- Preserve both widget type and key when state is intended to survive an update
- Complete global-key moves within the same animation frame
