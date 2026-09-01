## Best Practices

- Obfuscate supported release builds when the added analysis cost serves the threat model
- Never treat obfuscation as encryption or embed a privileged shared secret in the application
- Generate split debug information in the same build as the distributed artifact
- Store symbols under restricted access with release, platform, architecture, and source-revision metadata
- Exercise the production crash-symbolication path before shipping and retain symbols for the supported release lifetime
- Treat root and jailbreak checks as bypassable, fallible risk signals
- Keep high-value authorization, entitlement, rate-limit, and fraud decisions on trusted services
- Use proportionate responses and recovery paths instead of crashing or revealing detection details
- Minimize sensitive information on screen and apply platform capture controls only where they provide useful coverage
- Protect app-switcher snapshots and clear sensitive UI when the session locks or the app backgrounds
- Avoid copying passwords, tokens, recovery codes, and private keys to the system clipboard
- Redact at the event source and use allowlists for diagnostic fields carrying user or request context
- Disable verbose diagnostics in release builds and test that failure paths do not expose sensitive values
- Run secret scanning before commit and in CI, then scan history and release artifacts at appropriate boundaries
- Revoke and rotate exposed credentials immediately; deleting the matching text is not remediation
- Layer signing, least privilege, short-lived credentials, server validation, abuse detection, and revocation around client controls
- Test hardening on real release builds for every supported platform and document unsupported behavior
