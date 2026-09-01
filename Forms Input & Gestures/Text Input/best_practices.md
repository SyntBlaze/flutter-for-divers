## Best Practices

- Start with `TextField` and use `EditableText` only for deliberate custom behavior
- Keep owned controllers stable across rebuilds and dispose them deterministically
- Update the complete `TextEditingValue` when text and selection must change together
- Keep formatter transformations predictable, local, and safe for selection and composition
- Use formatters to improve entry, then validate the complete value separately
- Count and display length in user-perceived characters
- Choose keyboard type for entry convenience, never as a security boundary
- Match the action key to a real focus transition or submission operation
- Provide a safe reveal affordance when users need to verify obscured text
- Prevent secrets and personal data from leaking through logs, analytics, or unintended persistence
- Apply precise autofill hints and verify behavior on every supported platform
- Test with pasted text, emoji, combining marks, right-to-left text, and multiple IMEs
- Preserve selection and composing ranges during programmatic edits
- Test input behavior with hardware keyboards, software keyboards, autofill, and accessibility tools
