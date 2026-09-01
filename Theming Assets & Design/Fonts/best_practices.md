## Best Practices

- Set application-wide font choices through semantic TextTheme roles
- Use one stable family name consistently in pubspec.yaml and theme configuration
- Bundle and declare the weights the interface actually requests
- Use genuine italic faces and accurate style metadata
- Keep variable-axis values within the font's documented ranges
- Retain a tested static-font strategy when variable-font support is insufficient
- Define deliberate fallback families for every supported writing system
- Test mixed scripts, emoji, symbols, and user-generated content for missing glyphs
- Verify font licenses permit bundling and distribution
- Subset or omit unused faces only after validating all required glyph coverage
- Load application fonts explicitly before font-sensitive widget and golden assertions
- Pin golden-test rendering inputs and review expected platform-specific differences
- Exercise typography with long translations, bidirectional text, and large text scales
