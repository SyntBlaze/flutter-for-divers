## Best Practices

- Classify data by sensitivity, ownership, lifetime, and access pattern
- Keep persistence behind a repository or dedicated storage boundary
- Use preferences only for small non-sensitive settings and flags
- Store only limited secret material in platform-backed secure storage
- Never treat cache or temporary directories as durable storage
- Use platform directory APIs instead of hard-coded file paths
- Keep stored representations separate from domain models when schemas can evolve
- Give every stored schema and serialized state an explicit version
- Make migrations incremental, deterministic, and safe to retry
- Back up valuable data before performing a risky migration when possible
- Use transactions for changes that must succeed or fail together
- Define indexes from measured query patterns and data volume
- Keep database work and large serialization tasks off latency-sensitive UI paths
- Treat local data as untrusted and handle corruption or partial writes
- Encrypt sensitive records and minimize the sensitive data retained on device
- Define cache expiration, invalidation, and eviction policies deliberately
- Persist only compact, safe, and reconstructable state with Hydrated Bloc
- Test clean installs, upgrades, migrations, failures, and recovery paths
