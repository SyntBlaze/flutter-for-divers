## Best Practices

- Define an owner, purpose, and decision for every analytics event
- Maintain a documented event taxonomy with stable names and property types
- Collect the minimum data needed for the stated purpose
- Gate collection and identity behavior through explicit consent and privacy policies
- Never record passwords, access tokens, authorization headers, or private keys
- Redact personal and sensitive values before they reach any telemetry SDK
- Separate development, staging, and production telemetry destinations
- Tag telemetry with environment, application release, and feature context
- Use structured log fields and consistent severity levels
- Keep high-volume debug logs disabled or tightly controlled in production
- Apply deterministic sampling while preserving rare and high-severity failures
- Capture breadcrumbs and operation context that make crashes reproducible
- Report expected failures separately from unexpected defects
- Group duplicate failures and alert on user impact rather than raw event volume
- Keep telemetry behind a typed application-owned interface
- Validate event schemas and redaction rules in automated tests
- Use test destinations or disabled transports outside production
- Review dashboards, alerts, retention, access, and unused events regularly
