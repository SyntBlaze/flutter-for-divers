## Best Practices

- Inspect the resulting semantics tree instead of assuming widget structure maps directly to accessibility output
- Prefer the semantics already supplied by standard Flutter controls, adding annotations only where meaning is missing
- Merge descendants only when users should perceive and operate them as a single element
- Exclude decorative and duplicate semantics while preserving names, values, state, and actions
- Block obscured background semantics when presenting a modal interaction
- Localize labels, hints, values, and custom action names with the rest of the interface
- Keep labels focused on identity and hints focused on non-obvious outcomes
- Update semantic state and values whenever the corresponding visual state changes
- Expose roles and actions that agree with what the control actually does
- Use standard semantics actions before defining a custom action
- Reserve live regions for important, time-sensitive changes and test their announcement behavior on target platforms
- Test traversal with real screen readers in every supported text direction, not only with visual inspection
