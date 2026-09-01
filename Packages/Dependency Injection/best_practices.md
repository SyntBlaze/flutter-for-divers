## Best Practices

- Keep registrations in one explicit composition root
- Prefer constructor injection in business and data-layer classes
- Depend on focused abstractions at architectural boundaries
- Choose factory, singleton, and scoped lifetimes deliberately
- Keep mutable global singletons to a minimum
- Register dependencies in dependency order
- Await asynchronous setup before exposing dependent features
- Pair every owned resource with a disposal strategy
- Reset or isolate the container between tests
- Override external services with deterministic test doubles
- Avoid resolving dependencies deep inside domain logic
- Pass runtime values as method or factory parameters
- Use scopes for authenticated sessions and other bounded lifetimes
- Keep generated registration code out of hand-written edits
- Regenerate and verify configuration after annotation changes
- Fail fast when a required registration is missing
- Document registrations whose lifetime or initialization is surprising
- Test the assembled dependency graph as well as individual classes
