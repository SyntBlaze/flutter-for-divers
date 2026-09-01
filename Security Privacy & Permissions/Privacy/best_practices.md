## Best Practices

- Maintain a versioned inventory of data fields, purposes, sources, recipients, regions, and retention
- Review every Flutter plugin and native SDK for collection that occurs automatically
- Collect the least precise data at the lowest frequency that still supports the feature
- Centralize consent state and make optional SDK startup depend on it
- Keep acceptance and withdrawal equally understandable and accessible
- Do not treat operating-system permission as consent for unrelated analytics or tracking
- Redact tokens, message contents, form values, URLs, and personal identifiers before crash upload
- Separate essential diagnostics from optional diagnostic enrichment where the product requires different choices
- Request tracking authorization only in context and preserve full non-tracking functionality after denial
- Authenticate rights requests proportionately and prevent exports or deletions from becoming account-takeover paths
- Map deletion and export workflows across application services, processors, derived datasets, and backups
- Define retention periods and enforce them with automated deletion rather than policy text alone
- Keep processor contracts, SDK configuration, and production behavior aligned with documented purposes
- Inspect Apple privacy manifests from the release dependency graph and retain required-reason evidence
- Revalidate Google Play Data safety answers for every material data-flow or SDK change
- Revalidate App Store privacy details against the archived application and server-side behavior
- Test first launch, consent withdrawal, offline queues, account deletion, export, reinstall, and upgrade paths
- Record privacy decisions and obtain qualified review for jurisdiction-specific obligations
