## Best Practices

- Represent environment configuration with one typed, immutable object
- Keep environment, flavor, and build mode as distinct concepts
- Give each flavor consistent Dart and native configuration
- Validate required configuration before constructing the dependency graph
- Keep debug-only behavior behind explicit debug configuration
- Measure performance with representative profile configuration
- Make release defaults safe and fail fast on invalid production values
- Provide validated, cached defaults for remote configuration
- Give every feature flag an owner and a removal plan
- Use named, narrowly scoped constants instead of magic values
- Keep privileged secrets on trusted servers
- Centralize compile-time define parsing and type conversion
- Keep `--dart-define` inputs reproducible across local and CI builds
- Avoid logging credentials, tokens, and sensitive configuration
- Override configuration explicitly in tests
- Document precedence when defaults, compile-time values, and remote values coexist
