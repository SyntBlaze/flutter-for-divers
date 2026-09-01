## Best Practices

- Use verified HTTPS links for web-to-app navigation when the domain is under your control
- Keep iOS and Android association files versioned, deployed, and tested with release identities
- Treat every inbound URI and every parameter as untrusted input
- Allowlist schemes, hosts, paths, parameter shapes, and supported route versions
- Use one typed URI parser and route mapping for initial and runtime links
- Make link handling idempotent so duplicate delivery cannot push duplicate routes
- Wait for required startup, authentication, and restoration state before applying an initial route
- Keep protected destinations behind authorization checks, not merely hard-to-guess URLs
- Give deferred links an explicit expiry, consent model, and non-attributed fallback
- Use exact registered authentication redirects and bind callbacks with `state` and PKCE
- Remove tokens and sensitive values from logs, analytics, clipboard flows, and browser-visible URLs
- Test browser fallback, fresh install, terminated, background, foreground, duplicate, malformed, and unauthorized cases
