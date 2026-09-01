## Best Practices

- Install a coherent Cupertino theme near the application boundary and keep feature overrides local
- Read inherited theme values from context instead of duplicating them as fixed constants
- Create theme variations from a common CupertinoThemeData foundation
- Test every themed surface in light mode, dark mode, increased contrast, and relevant elevation contexts
- Use semantic dynamic colors and verify that foreground and background pairs remain legible
- Respect Dynamic Type, localization, bold text, and content reflow
- Preserve iOS navigation hierarchy, back gestures, title behavior, and safe areas
- Make form rows large enough to operate and flexible enough for accessibility-sized content
- Choose modal patterns by task consequence and make dismissal behavior explicit
- Keep destructive actions clearly labeled, separated, and confirmed when their impact warrants it
- Isolate platform selection from domain logic and expose consistent semantics on every platform
- Test adaptive widgets on real target platforms instead of relying only on a platform override
- Prefer native interaction expectations where they materially affect comprehension or control
- Treat Cupertino fidelity, product identity, and accessibility as complementary constraints
