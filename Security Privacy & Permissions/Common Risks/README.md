# Common Risks

Security failures in Flutter applications often come from assigning trust to
the wrong boundary: a mobile client runs on a device the application developer
does not control, consumes inputs an attacker can construct, and can be
inspected, instrumented, or modified. Client-side controls can protect users
and raise the cost of abuse, but trusted services must enforce authentication,
authorization, data integrity, business rules, session state, and abuse limits.

```text
untrusted sources
  deep link / WebView content / local state / modified client / device input
                                  |
                                  v
Flutter and native client -> parse, constrain, minimize, redact, request least privilege
          |                       |
          |                       +-> platform secure storage and reviewed crypto primitives
          v
HTTPS request carrying short-lived, narrowly scoped credentials
          |
          v
trusted service -> authenticate -> authorize -> validate -> recheck session -> commit
                         |              |              |
                         +--------------+--------------+-> audit, rate-limit, revoke
```

Hardcoded values and application binaries are recoverable by a motivated
analyst, so a distributed app cannot keep a privileged shared secret. Public
configuration such as an API identifier may be bundled when it is designed to
be public and constrained elsewhere; credentials that grant authority belong
on a trusted service or, for an appropriate protocol, should be generated as
non-exportable device-bound keys. Secret scanning helps find accidental
exposure, but a discovered credential must still be revoked and rotated.

Local encryption is only as strong as its algorithm, key generation, key
storage, nonce handling, integrity protection, and lifecycle. Prefer reviewed,
authenticated-encryption implementations and keys protected by Keychain or
Android Keystore facilities rather than custom ciphers, fixed keys, or keys
stored beside ciphertext. Even correctly encrypted local data may be available
after the user unlocks a compromised device, so minimize what is retained and
do not treat local encryption as a server authorization control.

Restored sessions require more than finding a cached token. Check local expiry
before use, revalidate with the server when freshness or account state matters,
handle revocation and refresh-token rotation, and clear user-scoped state when
authentication ends or accounts change. Permissions follow the same
least-privilege principle: request only the capability, scope, precision, and
duration needed for a user-initiated feature, and preserve safe behavior when
access is denied.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Common-Risks) — Focused, bite-sized article covering Common Risks
- [Learning Path](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Common-Risks) — Step-by-step material that builds practical Common Risks knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Common-Risks) — Structured, in-depth material for learning about Common Risks thoroughly

## Common Risk Topics

| Topic | Typical failure | Control or trust boundary | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Hardcoded secrets | A privileged API key, signing secret, or service credential is recoverable from source, assets, logs, or the released binary | Keep privileged credentials on trusted services; use constrained public identifiers or device-bound keys only where the protocol supports them | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Common-Risks/Hardcoded-secrets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Common-Risks/Hardcoded-secrets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Common-Risks/Hardcoded-secrets "Deep Dive") |
| Logging tokens | Access tokens, refresh tokens, authorization codes, cookies, or sensitive headers reach consoles, files, telemetry, or crash reports | Redact at the event source, allowlist diagnostic fields, and test error and retry paths as well as successful calls | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Common-Risks/Logging-tokens "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Common-Risks/Logging-tokens "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Common-Risks/Logging-tokens "Deep Dive") |
| Insecure deep links | Another app or crafted URL invokes a privileged route, injects parameters, or completes the wrong authentication transaction | Prefer verified links, validate origin and syntax, bind auth callbacks to state and nonce, and authorize the requested action independently | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Common-Risks/Insecure-deep-links "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Common-Risks/Insecure-deep-links "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Common-Risks/Insecure-deep-links "Deep Dive") |
| WebView injection | Untrusted HTML, URLs, script, or messages gain navigation, bridge, file, or application privileges | Avoid WebViews for sensitive flows where possible; constrain origins, navigation, scripting, bridges, storage, and mixed content | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Common-Risks/WebView-injection "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Common-Risks/WebView-injection "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Common-Risks/WebView-injection "Deep Dive") |
| Trusting client validation | A modified client bypasses UI checks, entitlements, prices, limits, workflow order, or ownership tests | Treat client validation as user feedback and repeat every security-relevant rule atomically at the trusted service boundary | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Common-Risks/Trusting-client-validation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Common-Risks/Trusting-client-validation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Common-Risks/Trusting-client-validation "Deep Dive") |
| Weak local encryption | Custom cryptography, static keys, nonce reuse, unauthenticated ciphertext, or poor key lifecycle exposes or corrupts local data | Use reviewed authenticated-encryption primitives, secure randomness, platform-protected keys, rotation, and explicit recovery or deletion behavior | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Common-Risks/Weak-local-encryption "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Common-Risks/Weak-local-encryption "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Common-Risks/Weak-local-encryption "Deep Dive") |
| Stale session reuse | Cached credentials restore access after expiry, revocation, logout, account change, or long inactivity | Enforce expiry and revocation on the server, revalidate at risk-sensitive boundaries, rotate refresh credentials, and clear scoped local state | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Common-Risks/Stale-session-reuse "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Common-Risks/Stale-session-reuse "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Common-Risks/Stale-session-reuse "Deep Dive") |
| Overbroad permissions | The app requests more device data or capability than a feature needs, too early, or for too long | Prefer selectors and narrow scopes, request in context, degrade safely on denial, and regularly remove unused declarations and SDK access | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Common-Risks/Overbroad-permissions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Common-Risks/Overbroad-permissions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Common-Risks/Overbroad-permissions "Deep Dive") |

## Questions

- [Which bundled values are public configuration, and which would grant authority if extracted?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Which-bundled-values-are-public-configuration%2C-and-which-would-grant-authority-if-extracted%3F)
- [How are exposed credentials revoked and rotated after secret scanning or incident discovery?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/How-are-exposed-credentials-revoked-and-rotated-after-secret-scanning-or-incident-discovery%3F)
- [Can tokens enter logs through HTTP interceptors, exception strings, breadcrumbs, analytics, or crash attachments?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Can-tokens-enter-logs-through-HTTP-interceptors%2C-exception-strings%2C-breadcrumbs%2C-analytics%2C-or-crash-attachments%3F)
- [Are incoming deep links verified where the platform permits and treated as untrusted input in every case?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Are-incoming-deep-links-verified-where-the-platform-permits-and-treated-as-untrusted-input-in-every-case%3F)
- [How are OAuth state, PKCE transactions, account context, and one-time actions bound to a callback?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/How-are-OAuth-state%2C-PKCE-transactions%2C-account-context%2C-and-one-time-actions-bound-to-a-callback%3F)
- [Which origins, navigation targets, JavaScript APIs, and native bridge methods can a WebView reach?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Which-origins%2C-navigation-targets%2C-JavaScript-APIs%2C-and-native-bridge-methods-can-a-WebView-reach%3F)
- [Can untrusted content invoke a bridge or navigate to a scheme that performs a privileged action?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Can-untrusted-content-invoke-a-bridge-or-navigate-to-a-scheme-that-performs-a-privileged-action%3F)
- [Which prices, roles, ownership rules, quotas, and workflow transitions are repeated on the server?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Which-prices%2C-roles%2C-ownership-rules%2C-quotas%2C-and-workflow-transitions-are-repeated-on-the-server%3F)
- [Is each sensitive write authorized and validated atomically against current server state?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Is-each-sensitive-write-authorized-and-validated-atomically-against-current-server-state%3F)
- [Which reviewed primitive provides both confidentiality and integrity for local ciphertext?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Which-reviewed-primitive-provides-both-confidentiality-and-integrity-for-local-ciphertext%3F)
- [Where are encryption keys generated, protected, rotated, invalidated, backed up, or deliberately made unrecoverable?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Where-are-encryption-keys-generated%2C-protected%2C-rotated%2C-invalidated%2C-backed-up%2C-or-deliberately-made-unrecoverable%3F)
- [When is a restored session checked for expiry, revocation, disabled accounts, changed roles, and current user identity?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/When-is-a-restored-session-checked-for-expiry%2C-revocation%2C-disabled-accounts%2C-changed-roles%2C-and-current-user-identity%3F)
- [How are refresh races, rotation failure, logout, and switching accounts prevented from reusing stale state?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/How-are-refresh-races%2C-rotation-failure%2C-logout%2C-and-switching-accounts-prevented-from-reusing-stale-state%3F)
- [Could a system picker, one-time grant, approximate location, foreground access, or narrower data query replace a broad permission?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Could-a-system-picker%2C-one-time-grant%2C-approximate-location%2C-foreground-access%2C-or-narrower-data-query-replace-a-broad-permission%3F)
- [Which transitive SDKs request permissions or collect data outside the feature's stated purpose?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Which-transitive-SDKs-request-permissions-or-collect-data-outside-the-feature's-stated-purpose%3F)
- [What remains secure if the device is rooted, jailbroken, instrumented, or running a modified client?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/What-remains-secure-if-the-device-is-rooted%2C-jailbroken%2C-instrumented%2C-or-running-a-modified-client%3F)

## Best Practices

- [Design as though application code, bundled assets, runtime memory, and local traffic metadata can be inspected](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Design-as-though-application-code%2C-bundled-assets%2C-runtime-memory%2C-and-local-traffic-metadata-can-be-inspected)
- [Keep privileged secrets and final authorization decisions on trusted services](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Keep-privileged-secrets-and-final-authorization-decisions-on-trusted-services)
- [Constrain public client identifiers by audience, platform, redirect URI, API scope, quota, and server policy where supported](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Constrain-public-client-identifiers-by-audience%2C-platform%2C-redirect-URI%2C-API-scope%2C-quota%2C-and-server-policy-where-supported)
- [Scan source, history, configuration, generated output, and release artifacts for secrets, then revoke real exposures](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Scan-source%2C-history%2C-configuration%2C-generated-output%2C-and-release-artifacts-for-secrets%2C-then-revoke-real-exposures)
- [Keep credentials and sensitive payloads out of logs by allowlisting fields and redacting before any sink receives an event](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Keep-credentials-and-sensitive-payloads-out-of-logs-by-allowlisting-fields-and-redacting-before-any-sink-receives-an-event)
- [Disable verbose network and authentication logging in release builds and test failure paths for leakage](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Disable-verbose-network-and-authentication-logging-in-release-builds-and-test-failure-paths-for-leakage)
- [Treat every deep-link route and parameter as attacker-controlled, even when the link is verified](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Treat-every-deep-link-route-and-parameter-as-attacker-controlled%2C-even-when-the-link-is-verified)
- [Require a current authenticated and authorized context before a link can perform a sensitive action](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Require-a-current-authenticated-and-authorized-context-before-a-link-can-perform-a-sensitive-action)
- [Prefer a system browser or platform authorization session over an embedded WebView for authentication](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Prefer-a-system-browser-or-platform-authorization-session-over-an-embedded-WebView-for-authentication)
- [Load only expected secure origins in WebViews and expose the smallest possible native bridge](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Load-only-expected-secure-origins-in-WebViews-and-expose-the-smallest-possible-native-bridge)
- [Repeat validation, authorization, entitlement, ownership, sequencing, and rate-limit checks on the server](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Repeat-validation%2C-authorization%2C-entitlement%2C-ownership%2C-sequencing%2C-and-rate-limit-checks-on-the-server)
- [Use reviewed authenticated encryption with secure random keys and nonces rather than designing a custom scheme](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Use-reviewed-authenticated-encryption-with-secure-random-keys-and-nonces-rather-than-designing-a-custom-scheme)
- [Protect encryption keys with platform facilities and keep keys separate from ciphertext and ordinary preferences](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Protect-encryption-keys-with-platform-facilities-and-keep-keys-separate-from-ciphertext-and-ordinary-preferences)
- [Minimize retained sensitive data because encryption does not eliminate exposure on an unlocked compromised device](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Minimize-retained-sensitive-data-because-encryption-does-not-eliminate-exposure-on-an-unlocked-compromised-device)
- [Use short-lived, narrowly scoped access credentials and enforce expiry and revocation on the server](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Use-short-lived%2C-narrowly-scoped-access-credentials-and-enforce-expiry-and-revocation-on-the-server)
- [Revalidate restored sessions after long inactivity and before high-risk actions, then fail closed on an authoritative rejection](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Revalidate-restored-sessions-after-long-inactivity-and-before-high-risk-actions%2C-then-fail-closed-on-an-authoritative-rejection)
- [Clear credentials, caches, WebView state, queued work, and user-scoped memory on logout or account change](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Clear-credentials%2C-caches%2C-WebView-state%2C-queued-work%2C-and-user-scoped-memory-on-logout-or-account-change)
- [Request permissions in context at the narrowest supported scope and retain only the data the feature needs](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Request-permissions-in-context-at-the-narrowest-supported-scope-and-retain-only-the-data-the-feature-needs)
- [Keep core behavior useful after denial and review manifests, entitlements, plugins, and SDKs for unused access](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Keep-core-behavior-useful-after-denial-and-review-manifests%2C-entitlements%2C-plugins%2C-and-SDKs-for-unused-access)
- [Test security controls against crafted inputs, modified client behavior, stale state, compromised-device assumptions, and server rejection](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Common-Risks/Test-security-controls-against-crafted-inputs%2C-modified-client-behavior%2C-stale-state%2C-compromised-device-assumptions%2C-and-server-rejection)

[< Back to security privacy & permissions](../README.md)
