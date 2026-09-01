# Authentication

Authentication establishes who a user or client is; authorization determines
what that identity may do. In a Flutter application, authentication usually
coordinates a system browser or provider SDK, a trusted identity service, an
application backend, and platform-protected storage. The mobile client should
not be the authority that grants itself access.

```text
User intent
  -> provider SDK or system browser
  -> identity provider authenticates and obtains consent
  -> redirect or provider result returns to the app
  -> backend validates or exchanges the result
  -> backend creates an application session
  -> app stores only the session material it needs
  -> access token authorizes API calls
  -> refresh, expiry, sign-out, or revocation changes session state
```

OAuth 2.0 is an authorization framework, while OpenID Connect adds an identity
layer for sign-in. Flutter AppAuth drives standards-based OAuth and OpenID
Connect flows through platform authorization facilities; the OAuth 2.0 package
provides lower-level protocol support. Google Sign-In and Sign in with Apple
integrate particular identity providers. JWT Decoder can inspect JWT claims and
expiry information, but decoding a token does not verify its signature, issuer,
audience, or trustworthiness.

Firebase Auth and Supabase Flutter provide client integrations for managed
authentication backends and broader backend services. Local Auth proves that a
person accepted a device-level biometric or credential challenge; it can guard
an in-app action or release locally protected data, but it does not create or
replace a server-authenticated account session.

## Selection Guidance

Start with the system that will own identities and sessions. Choose Firebase
Auth or Supabase Flutter when the application uses that backend's user model,
provider integrations, session lifecycle, and access controls. Choose a
provider-specific package when direct Google or Apple sign-in is required and
the resulting credential will be validated by a trusted backend or exchanged
for an application session.

Use Flutter AppAuth for a standards-based OAuth 2.0 or OpenID Connect provider
when Authorization Code with PKCE, browser-based authorization, redirects, and
token exchange need native-app integration. Use the lower-level OAuth 2.0
package when application code must compose a protocol flow directly and can
take responsibility for discovery, redirects, PKCE, token persistence,
refresh, errors, and provider-specific behavior. Avoid embedded web views for
credentials when a system browser or platform authorization session is
available.

Add Local Auth only when a sensitive local action needs step-up confirmation;
keep the underlying server-side authorization check intact. Use JWT Decoder for
non-authoritative presentation or expiry hints, never as the security decision
point. Before selecting any approach, confirm the provider's redirect model,
supported platforms, backend validation requirements, account-linking rules,
revocation behavior, and privacy obligations.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Authentication) — Focused, bite-sized article covering Authentication
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Authentication) — Step-by-step material that builds practical Authentication knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Authentication) — Structured, in-depth material for learning about Authentication thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Google Sign-In | Provider SDK integration for Google account authentication and authorization | Starting a Google identity flow before trusted backend validation or session exchange | [💡](https://app.syntblaze.com/qt/flutter/Packages/Authentication/Google-Sign-In "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Authentication/Google-Sign-In "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Authentication/Google-Sign-In "Deep Dive") |
| Sign in with Apple | Native integration with Apple's account authorization flow | Offering Apple account sign-in and handling its credential and account lifecycle | [💡](https://app.syntblaze.com/qt/flutter/Packages/Authentication/Sign-in-with-Apple "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Authentication/Sign-in-with-Apple "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Authentication/Sign-in-with-Apple "Deep Dive") |
| Flutter AppAuth | Native-app OAuth 2.0 and OpenID Connect client built around platform authorization services | Standards-based browser sign-in, Authorization Code with PKCE, token exchange, and refresh | [💡](https://app.syntblaze.com/qt/flutter/Packages/Authentication/Flutter-AppAuth "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Authentication/Flutter-AppAuth "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Authentication/Flutter-AppAuth "Deep Dive") |
| OAuth 2.0 | General-purpose Dart support for OAuth 2.0 client credentials and authorized requests | Custom protocol integrations that need lower-level control over OAuth clients and credentials | [💡](https://app.syntblaze.com/qt/flutter/Packages/Authentication/OAuth-2.0 "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Authentication/OAuth-2.0 "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Authentication/OAuth-2.0 "Deep Dive") |
| JWT Decoder | Local decoding of JWT payload claims with expiry helpers | Reading non-sensitive display claims or estimating expiry after a token has been obtained | [💡](https://app.syntblaze.com/qt/flutter/Packages/Authentication/JWT-Decoder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Authentication/JWT-Decoder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Authentication/JWT-Decoder "Deep Dive") |
| Local Auth | Platform biometric and device-credential challenge | Confirming user presence before a sensitive local action or access to protected app data | [💡](https://app.syntblaze.com/qt/flutter/Packages/Authentication/Local-Auth "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Authentication/Local-Auth "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Authentication/Local-Auth "Deep Dive") |
| Firebase Auth | Firebase-managed user authentication with provider and session integrations | Applications using Firebase identities and access control across Firebase-backed services | [💡](https://app.syntblaze.com/qt/flutter/Packages/Authentication/Firebase-Auth "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Authentication/Firebase-Auth "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Authentication/Firebase-Auth "Deep Dive") |
| Supabase Flutter | Flutter client for Supabase authentication, sessions, and related backend services | Applications using Supabase Auth with its database, storage, and row-level access policies | [💡](https://app.syntblaze.com/qt/flutter/Packages/Authentication/Supabase-Flutter "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Authentication/Supabase-Flutter "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Authentication/Supabase-Flutter "Deep Dive") |

## Questions

- [How are authentication, authorization, and session management different?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/How-are-authentication%2C-authorization%2C-and-session-management-different%3F)
- [When should an application use OAuth 2.0 versus OpenID Connect?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/When-should-an-application-use-OAuth-2.0-versus-OpenID-Connect%3F)
- [Why should native applications use Authorization Code with PKCE?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Why-should-native-applications-use-Authorization-Code-with-PKCE%3F)
- [Should sign-in happen in a system browser or an embedded web view?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Should-sign-in-happen-in-a-system-browser-or-an-embedded-web-view%3F)
- [What must a backend validate after Google or Apple sign-in?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/What-must-a-backend-validate-after-Google-or-Apple-sign-in%3F)
- [How should redirect URIs and incoming authentication links be handled?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/How-should-redirect-URIs-and-incoming-authentication-links-be-handled%3F)
- [Where should access and refresh tokens be stored?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Where-should-access-and-refresh-tokens-be-stored%3F)
- [How should token expiry and refresh races be coordinated?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/How-should-token-expiry-and-refresh-races-be-coordinated%3F)
- [Does decoding a JWT prove that it is valid or trustworthy?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Does-decoding-a-JWT-prove-that-it-is-valid-or-trustworthy%3F)
- [What should happen when a session is revoked on another device?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/What-should-happen-when-a-session-is-revoked-on-another-device%3F)
- [How are provider accounts linked without creating account-takeover risks?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/How-are-provider-accounts-linked-without-creating-account-takeover-risks%3F)
- [Is local biometric authentication equivalent to account sign-in?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Is-local-biometric-authentication-equivalent-to-account-sign-in%3F)
- [When should a sensitive action require recent or step-up authentication?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/When-should-a-sensitive-action-require-recent-or-step-up-authentication%3F)
- [How should sign-out differ from account deletion?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/How-should-sign-out-differ-from-account-deletion%3F)
- [How can authentication flows be tested without using production accounts?](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/How-can-authentication-flows-be-tested-without-using-production-accounts%3F)

## Best Practices

- [Keep identity verification and authorization decisions on trusted services](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Keep-identity-verification-and-authorization-decisions-on-trusted-services)
- [Use OpenID Connect when sign-in requires identity claims on top of OAuth 2.0](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Use-OpenID-Connect-when-sign-in-requires-identity-claims-on-top-of-OAuth-2.0)
- [Use Authorization Code with PKCE for public native clients](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Use-Authorization-Code-with-PKCE-for-public-native-clients)
- [Prefer system browsers or platform authorization sessions for provider credentials](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Prefer-system-browsers-or-platform-authorization-sessions-for-provider-credentials)
- [Register exact redirect URIs and validate every returned state and nonce](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Register-exact-redirect-URIs-and-validate-every-returned-state-and-nonce)
- [Never ship client secrets that are expected to remain confidential in a mobile app](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Never-ship-client-secrets-that-are-expected-to-remain-confidential-in-a-mobile-app)
- [Validate token signature, issuer, audience, expiry, and intended use on the backend](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Validate-token-signature%2C-issuer%2C-audience%2C-expiry%2C-and-intended-use-on-the-backend)
- [Treat decoded JWT claims as untrusted until cryptographic validation succeeds](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Treat-decoded-JWT-claims-as-untrusted-until-cryptographic-validation-succeeds)
- [Keep access tokens short-lived and narrowly scoped](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Keep-access-tokens-short-lived-and-narrowly-scoped)
- [Store only necessary session secrets in platform-backed secure storage](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Store-only-necessary-session-secrets-in-platform-backed-secure-storage)
- [Keep tokens, authorization codes, and personal claims out of logs and analytics](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Keep-tokens%2C-authorization-codes%2C-and-personal-claims-out-of-logs-and-analytics)
- [Serialize refresh operations so concurrent failures do not rotate credentials repeatedly](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Serialize-refresh-operations-so-concurrent-failures-do-not-rotate-credentials-repeatedly)
- [Model signed-out, authenticating, authenticated, refreshing, expired, and failed states explicitly](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Model-signed-out%2C-authenticating%2C-authenticated%2C-refreshing%2C-expired%2C-and-failed-states-explicitly)
- [Recheck session state after resume, deep-link return, and connectivity changes](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Recheck-session-state-after-resume%2C-deep-link-return%2C-and-connectivity-changes)
- [Clear local credentials and user-specific caches when a session ends](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Clear-local-credentials-and-user-specific-caches-when-a-session-ends)
- [Support server-side revocation and react promptly to rejected or disabled sessions](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Support-server-side-revocation-and-react-promptly-to-rejected-or-disabled-sessions)
- [Require recent or step-up authentication for high-risk actions](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Require-recent-or-step-up-authentication-for-high-risk-actions)
- [Use local authentication to guard local access, not to replace backend authorization](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Use-local-authentication-to-guard-local-access%2C-not-to-replace-backend-authorization)
- [Minimize identity data collection and define retention and account-deletion behavior](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Minimize-identity-data-collection-and-define-retention-and-account-deletion-behavior)
- [Test cancellation, denial, expiry, refresh failure, revocation, account linking, and redirect attacks](https://app.syntblaze.com/qsp/flutter/Packages/Authentication/Test-cancellation%2C-denial%2C-expiry%2C-refresh-failure%2C-revocation%2C-account-linking%2C-and-redirect-attacks)

[< Back to packages](../README.md)
