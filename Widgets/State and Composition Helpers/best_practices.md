## Best Practices

- Make inherited values immutable and keep `updateShouldNotify` aligned with observable changes
- Use stable, narrowly defined aspects and test that unrelated consumers do not rebuild
- Keep notifier ownership explicit and replace notifier instances intentionally
- Use `ValueListenableBuilder.child` for subtrees that do not depend on the current value
- Scope `AnimatedBuilder` around only the widgets affected by its listenable
- Use the innermost correct context for inherited lookup, navigation, themes, and scaffolds
- Reserve `StatefulBuilder` for small local interactions without complex lifecycle needs
- Choose stable restoration IDs and test state restoration from a killed application
- Keep state ownership close to its mutation logic and expose only what descendants need
