## Best Practices

- Keep application wiring in one explicit composition root
- Prefer constructor injection for required dependencies
- Depend on application-owned interfaces at architectural boundaries
- Use factories for runtime values and deliberately short-lived objects
- Keep service location out of domain and business logic
- Validate the complete dependency graph during startup and in tests
- Choose singleton, factory, and scoped lifetimes deliberately
- Avoid mutable application-wide singletons
- Align dependency scopes with feature and session ownership
- Reset overrides and containers between tests
- Pair every owned resource with an explicit disposal strategy
- Fail fast when a required dependency is missing
