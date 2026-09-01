# Transport Security

Transport security protects data while a Flutter application exchanges it with
remote services. HTTPS uses TLS to authenticate the server and provide
confidentiality and integrity in transit, but secure delivery depends on more
than the Dart request call: the app, each host platform, and the server own
different parts of the connection and protocol.

```text
Flutter request code
  -> uses an HTTPS endpoint and sends authorized application data
  -> Android or iOS networking stack applies trust and cleartext policy
  -> TLS authenticates the server and protects bytes in transit
  -> server terminates TLS and validates identity, signature, freshness, and input

Browser-hosted Flutter
  -> browser owns TLS validation, HSTS behavior, and most connection policy
```

Flutter code should start with HTTPS URLs, bounded timeouts, safe redirect
handling, and no certificate-validation bypass. Android network security
configuration and Apple App Transport Security can tighten platform policy or
declare narrowly scoped exceptions; they do not repair an insecure server.
Servers must present a valid certificate chain, support an appropriate TLS
configuration, redirect or reject cleartext traffic where applicable, and
enforce any request-signing or anti-replay protocol.

Certificate pinning adds a second trust rule beyond normal public-key
infrastructure validation. It can reduce exposure to a compromised or
unexpected certificate authority, but it also creates certificate-rotation,
backup-pin, incident-response, observability, and client-update risks. Use it
only for a justified threat model and with a tested recovery path. It is not a
substitute for normal hostname and certificate-chain validation, and Flutter
web cannot override the browser's certificate decisions.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Transport-Security) — Focused, bite-sized article covering Transport Security
- [Learning Path](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Transport-Security) — Step-by-step material that builds practical Transport Security knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Transport-Security) — Structured, in-depth material for learning about Transport Security thoroughly

## Transport Security Topics

| Topic | Primary role | Ownership or constraint | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| HTTPS | Carries HTTP over an authenticated, confidential, integrity-protected TLS connection | Flutter selects secure endpoints; the platform validates the connection; the server serves HTTPS correctly | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Transport-Security/HTTPS "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Transport-Security/HTTPS "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Transport-Security/HTTPS "Deep Dive") |
| TLS | Establishes protocol versions, cipher negotiation, server identity, and session keys | Server policy and certificates meet the platform trust stack; applications must not bypass validation | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Transport-Security/TLS "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Transport-Security/TLS "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Transport-Security/TLS "Deep Dive") |
| Certificate pinning | Restricts acceptable server certificates or public keys beyond ordinary trust validation | Requires a specific threat model, overlapping pins, rotation planning, telemetry, and a recovery path | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Transport-Security/Certificate-pinning "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Transport-Security/Certificate-pinning "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Transport-Security/Certificate-pinning "Deep Dive") |
| Network security config | Defines Android trust anchors, cleartext policy, certificate pinning, and debug-only overrides | Lives in Android resources and applies according to Android version and domain configuration | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Transport-Security/Network-security-config "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Transport-Security/Network-security-config "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Transport-Security/Network-security-config "Deep Dive") |
| App Transport Security | Applies Apple platform requirements to application network loads | Lives in Apple app configuration; exceptions should be narrow, documented, and reviewed | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Transport-Security/App-Transport-Security "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Transport-Security/App-Transport-Security "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Transport-Security/App-Transport-Security "Deep Dive") |
| HSTS | Tells supporting user agents to use HTTPS for a host for a declared period | Set by the HTTPS server; browser enforcement should not be assumed for every native HTTP client | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Transport-Security/HSTS "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Transport-Security/HSTS "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Transport-Security/HSTS "Deep Dive") |
| Request signing | Authenticates selected request fields and detects modification at the application protocol layer | The signer needs an appropriate key model and the server must reconstruct and verify a canonical message | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Transport-Security/Request-signing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Transport-Security/Request-signing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Transport-Security/Request-signing "Deep Dive") |
| Replay protection | Prevents a previously valid request from being accepted again | The server enforces bounded timestamps, unique nonces or request IDs, and atomic single-use semantics | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Transport-Security/Replay-protection "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Transport-Security/Replay-protection "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Transport-Security/Replay-protection "Deep Dive") |

## Questions

- [What does HTTPS protect, and what remains visible outside the encrypted connection?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/What-does-HTTPS-protect%2C-and-what-remains-visible-outside-the-encrypted-connection%3F)
- [Which TLS and certificate settings belong to the server rather than Flutter code?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Which-TLS-and-certificate-settings-belong-to-the-server-rather-than-Flutter-code%3F)
- [Why must hostname and certificate-chain validation never be disabled in production?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Why-must-hostname-and-certificate-chain-validation-never-be-disabled-in-production%3F)
- [When does certificate pinning address a realistic threat model?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/When-does-certificate-pinning-address-a-realistic-threat-model%3F)
- [How can pins be rotated without locking released clients out of the service?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/How-can-pins-be-rotated-without-locking-released-clients-out-of-the-service%3F)
- [How should Android block cleartext traffic and limit custom trust anchors?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/How-should-Android-block-cleartext-traffic-and-limit-custom-trust-anchors%3F)
- [When is an App Transport Security exception necessary, and how narrowly can it be scoped?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/When-is-an-App-Transport-Security-exception-necessary%2C-and-how-narrowly-can-it-be-scoped%3F)
- [Does HSTS protect native Flutter clients in the same way it protects browsers?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Does-HSTS-protect-native-Flutter-clients-in-the-same-way-it-protects-browsers%3F)
- [What must be canonicalized before a request is signed?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/What-must-be-canonicalized-before-a-request-is-signed%3F)
- [Can a shared request-signing secret remain confidential inside a distributed mobile app?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Can-a-shared-request-signing-secret-remain-confidential-inside-a-distributed-mobile-app%3F)
- [How should a server reject stale or duplicate signed requests?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/How-should-a-server-reject-stale-or-duplicate-signed-requests%3F)
- [How do redirects, proxies, and certificate rotation affect transport-security tests?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/How-do-redirects%2C-proxies%2C-and-certificate-rotation-affect-transport-security-tests%3F)

## Best Practices

- [Use HTTPS directly for every production API and asset endpoint](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Use-HTTPS-directly-for-every-production-API-and-asset-endpoint)
- [Reject cleartext traffic instead of depending on an HTTP-to-HTTPS redirect](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Reject-cleartext-traffic-instead-of-depending-on-an-HTTP-to-HTTPS-redirect)
- [Keep hostname and certificate-chain validation enabled in every release build](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Keep-hostname-and-certificate-chain-validation-enabled-in-every-release-build)
- [Configure supported TLS versions, certificates, and cipher policy at the server or edge](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Configure-supported-TLS-versions%2C-certificates%2C-and-cipher-policy-at-the-server-or-edge)
- [Treat certificate-validation callbacks and debug trust anchors as development-only tools](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Treat-certificate-validation-callbacks-and-debug-trust-anchors-as-development-only-tools)
- [Use Android network security configuration to express deliberate per-domain trust policy](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Use-Android-network-security-configuration-to-express-deliberate-per-domain-trust-policy)
- [Keep App Transport Security exceptions narrow and remove them when their dependency is retired](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Keep-App-Transport-Security-exceptions-narrow-and-remove-them-when-their-dependency-is-retired)
- [Adopt certificate pinning only after documenting its threat model and operational cost](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Adopt-certificate-pinning-only-after-documenting-its-threat-model-and-operational-cost)
- [Ship overlapping backup pins and rehearse certificate rotation and emergency recovery](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Ship-overlapping-backup-pins-and-rehearse-certificate-rotation-and-emergency-recovery)
- [Set and maintain HSTS on eligible HTTPS web origins, with careful subdomain and preload decisions](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Set-and-maintain-HSTS-on-eligible-HTTPS-web-origins%2C-with-careful-subdomain-and-preload-decisions)
- [Use request signing as an application-layer control, not as a replacement for TLS](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Use-request-signing-as-an-application-layer-control%2C-not-as-a-replacement-for-TLS)
- [Prefer server-held credentials or device-bound asymmetric keys over a shared secret embedded in the app](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Prefer-server-held-credentials-or-device-bound-asymmetric-keys-over-a-shared-secret-embedded-in-the-app)
- [Bind signatures to the method, authority, path, relevant headers, body digest, timestamp, and nonce](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Bind-signatures-to-the-method%2C-authority%2C-path%2C-relevant-headers%2C-body-digest%2C-timestamp%2C-and-nonce)
- [Enforce replay windows and single-use identifiers atomically on the server](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Enforce-replay-windows-and-single-use-identifiers-atomically-on-the-server)
- [Keep credentials and sensitive request or response data out of logs and diagnostics](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Keep-credentials-and-sensitive-request-or-response-data-out-of-logs-and-diagnostics)
- [Test expired certificates, hostname mismatches, redirects, clock skew, rotation, offline recovery, and replay attempts](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Test-expired-certificates%2C-hostname-mismatches%2C-redirects%2C-clock-skew%2C-rotation%2C-offline-recovery%2C-and-replay-attempts)
- [Verify release behavior on supported Android and Apple versions and separately in browsers](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Transport-Security/Verify-release-behavior-on-supported-Android-and-Apple-versions-and-separately-in-browsers)

[< Back to security privacy & permissions](../README.md)
