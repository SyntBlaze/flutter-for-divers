## Best Practices

- Make each `Form` represent one cohesive validation and submission boundary
- Use `FormField` when a custom input must participate in the standard form lifecycle
- Keep `TextEditingController` and `FocusNode` ownership explicit and dispose locally owned instances
- Create `GlobalKey<FormState>` once and keep it stable across rebuilds
- Keep validation rules deterministic, localized, and easy to test
- Delay automatic error display until user interaction unless the workflow requires immediate guidance
- Return concise corrective messages from `validator` and `null` for valid values
- Validate before calling `save`, then construct a typed submission model
- Keep `onChanged` work inexpensive and debounce remote lookups or other costly effects
- Define reset behavior for form fields, controllers, focus, and external state together
- Guard against duplicate submissions and keep entered values recoverable after failure
- Test focus order, keyboard actions, validation messages, reset, and submission with assistive technology
