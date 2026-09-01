## Best Practices

- Group only closely related content and actions within a `Card`
- Use a plain `Chip` for compact information without specialized interaction
- Write action-chip labels as clear, immediate operations
- Keep `ChoiceChip` sets small and manage single-selection state explicitly
- Make active filters visible and easy to clear when using `FilterChip`
- Give `InputChip` press and delete actions distinct purposes and semantics
- Use determinate circular progress whenever the completed fraction is known
- Place linear progress close to the operation whose state it represents
- Reserve `DataTable` for genuinely tabular data and manageable row counts
- Keep one long-lived `DataTableSource` and notify listeners when paginated data changes
- Use dividers sparingly and theme their thickness, indent, and color consistently
- Keep list tiles scannable, accessible, and free of ambiguous competing actions
- Validate each step without discarding information users entered in other steps
- Use short tooltip messages and never make hover the only discovery path
- Mirror badge counts and status changes in accessible labels or surrounding content
- Test information displays with large text, high contrast, keyboard input, and screen readers
