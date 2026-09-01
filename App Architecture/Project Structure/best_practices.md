## Best Practices

- Choose a structure that reflects the application's real boundaries
- Keep code that changes together close together
- Use layers inside a feature only when the feature needs them
- Avoid empty architectural folders added only for symmetry
- Keep internal implementation beneath `lib/src`
- Keep application composition separate from feature behavior
- Give every feature a clear owner and public surface
- Reserve `core` for stable, broadly used foundations
- Move code to `shared` only after genuine reuse appears
- Keep domain code independent of Flutter and infrastructure
- Contain transport and persistence details in the data boundary
- Keep presentation code focused on rendering and user interaction
- Limit `main.dart` to configuration, bootstrap, and error setup
- Keep the root app widget declarative
- Use small, intentional barrel files instead of exporting entire directory trees
- Expose only supported types through public API files
- Make dependency direction clear from imports and module boundaries
- Evolve the folder structure as the application grows
