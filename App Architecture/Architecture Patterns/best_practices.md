## Best Practices

- Choose patterns to protect real change boundaries
- Keep dependencies pointing toward business policy
- Give each abstraction one clear reason to exist
- Keep widgets focused on rendering and forwarding user intent
- Expose immutable, complete presentation states
- Make state transitions deterministic where practical
- Keep view models independent of concrete data providers
- Express application actions with explicit inputs and outcomes
- Hide API, database, and cache selection behind repositories
- Keep each data source focused on one provider
- Translate representations explicitly at layer boundaries
- Wrap third-party and platform APIs behind application-owned contracts
- Keep services and facades cohesive rather than universal
- Test contracts and boundary behavior, not only implementations
- Remove abstractions that add indirection without protecting variation
