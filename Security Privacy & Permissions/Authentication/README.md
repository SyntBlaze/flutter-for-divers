# Authentication

Authentication establishes who is using an application; authorization decides
what that identity may access. In a Flutter application, the client coordinates
the user experience, redirects, and local session state, but an authorization
server, identity provider, or application backend remains the trusted authority.
OAuth 2.0 delegates access to protected resources, while OpenID Connect adds an
identity layer for authenticating the user.

```text
user -> system browser -> authorization server / identity provider
                            |  authenticate and obtain consent
app <- redirect with code --+
 |    validate state; redeem code with PKCE verifier
 v
token endpoint -> access token + optional ID token + optional refresh token
                      |                            |
                      v                            v
                resource server            session renewal
                validates access           rotation / expiry
                token and policy
```

A native mobile application is a public client: anything packaged in the app
can be extracted, so it cannot safely hold a client secret. Authorization Code
with PKCE binds the returned authorization code to the initiating app instance.
`state` protects the authorization response, and an OpenID Connect `nonce`
binds an ID token to the sign-in request; these values solve different problems
and none makes the client a trusted enforcement point.

Access, refresh, and ID tokens are not interchangeable. An access token is
presented to a resource server, a refresh token is presented only to the token
endpoint to obtain new tokens, and an ID token tells an OpenID Connect client
about an authentication event. A token's JWT shape does not determine its use.
Every service must validate the token intended for it and enforce authorization
server-side rather than trusting validation or claims reported by the app.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Authentication) — Focused, bite-sized article covering Authentication
- [Learning Path](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Authentication) — Step-by-step material that builds practical Authentication knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Authentication) — Structured, in-depth material for learning about Authentication thoroughly

## Authentication Topics

| Topic | Role | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| OAuth 2.0 | Delegates authorization to access protected resources | It is an authorization framework, not by itself a user-authentication protocol | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Authentication/OAuth-2.0 "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Authentication/OAuth-2.0 "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Authentication/OAuth-2.0 "Deep Dive") |
| OpenID Connect | Adds authentication and identity claims on top of OAuth 2.0 | Validate the ID token and bind it to the authorization request | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Authentication/OpenID-Connect "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Authentication/OpenID-Connect "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Authentication/OpenID-Connect "Deep Dive") |
| PKCE | Binds an authorization code to a one-time verifier held by the initiating client | Native public clients should use a fresh verifier and S256 challenge for every flow | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Authentication/PKCE "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Authentication/PKCE "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Authentication/PKCE "Deep Dive") |
| Access token | Authorizes a caller to invoke a protected resource | Treat it as an opaque credential unless the resource server is specified to validate its format | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Authentication/Access-token "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Authentication/Access-token "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Authentication/Access-token "Deep Dive") |
| Refresh token | Obtains replacement tokens without another interactive sign-in | Restrict its audience, protect it at rest, and handle rotation and reuse detection | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Authentication/Refresh-token "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Authentication/Refresh-token "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Authentication/Refresh-token "Deep Dive") |
| ID token | Communicates an OpenID Connect authentication event to its client | Never send it to an API as a substitute for an access token | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Authentication/ID-token "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Authentication/ID-token "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Authentication/ID-token "Deep Dive") |
| JWT validation | Establishes whether a signed token is authentic, current, and intended for the validator | Verify the algorithm, signature, issuer, audience, time claims, and token-specific requirements | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Authentication/JWT-validation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Authentication/JWT-validation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Authentication/JWT-validation "Deep Dive") |
| Session expiration | Ends or renews authenticated state according to token and application-session policy | Model access-token expiry, inactivity, maximum lifetime, refresh failure, and revocation separately | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Authentication/Session-expiration "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Authentication/Session-expiration "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Authentication/Session-expiration "Deep Dive") |
| Logout cleanup | Terminates the usable session and removes identity-specific local state | Clear credentials and caches, attempt server revocation, and define whether provider sign-out is required | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Authentication/Logout-cleanup "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Authentication/Logout-cleanup "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Authentication/Logout-cleanup "Deep Dive") |
| Account deletion | Permanently removes or de-identifies the account and governed data | Require recent authentication and execute deletion through an authoritative backend workflow | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Authentication/Account-deletion "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Authentication/Account-deletion "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Authentication/Account-deletion "Deep Dive") |

## Questions

- [How are authentication and authorization different?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/How-are-authentication-and-authorization-different%3F)
- [Why is OAuth 2.0 not, by itself, a sign-in protocol?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Why-is-OAuth-2.0-not%2C-by-itself%2C-a-sign-in-protocol%3F)
- [Why must a native application be treated as a public client?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Why-must-a-native-application-be-treated-as-a-public-client%3F)
- [How does Authorization Code with PKCE protect code redemption?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/How-does-Authorization-Code-with-PKCE-protect-code-redemption%3F)
- [What are `state`, PKCE, and an OpenID Connect `nonce` each intended to protect?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/What-are-state%2C-PKCE%2C-and-an-OpenID-Connect-nonce-each-intended-to-protect%3F)
- [Which token should be sent to an API?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Which-token-should-be-sent-to-an-API%3F)
- [May an application assume that an access token is a JWT?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/May-an-application-assume-that-an-access-token-is-a-JWT%3F)
- [Where may a refresh token be sent and how should rotation be handled?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Where-may-a-refresh-token-be-sent-and-how-should-rotation-be-handled%3F)
- [Who is the intended audience of an ID token?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Who-is-the-intended-audience-of-an-ID-token%3F)
- [What must be checked before trusting JWT claims?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/What-must-be-checked-before-trusting-JWT-claims%3F)
- [Why must an API validate authorization independently of the Flutter client?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Why-must-an-API-validate-authorization-independently-of-the-Flutter-client%3F)
- [How should clock skew, expiry, inactivity, and revocation affect session state?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/How-should-clock-skew%2C-expiry%2C-inactivity%2C-and-revocation-affect-session-state%3F)
- [What should happen when refresh fails or reuse is detected?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/What-should-happen-when-refresh-fails-or-reuse-is-detected%3F)
- [Does logging out of the app also log the user out of the identity provider?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Does-logging-out-of-the-app-also-log-the-user-out-of-the-identity-provider%3F)
- [Which credentials, user caches, and in-memory state must logout remove?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Which-credentials%2C-user-caches%2C-and-in-memory-state-must-logout-remove%3F)
- [How does account deletion differ from logout, revocation, and provider unlinking?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/How-does-account-deletion-differ-from-logout%2C-revocation%2C-and-provider-unlinking%3F)

## Best Practices

- [Use Authorization Code with PKCE for public native clients](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Use-Authorization-Code-with-PKCE-for-public-native-clients)
- [Open authorization requests in the system browser or a platform authorization session](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Open-authorization-requests-in-the-system-browser-or-a-platform-authorization-session)
- [Never embed a client secret that is expected to remain confidential](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Never-embed-a-client-secret-that-is-expected-to-remain-confidential)
- [Register exact redirect URIs and validate the returned `state`](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Register-exact-redirect-URIs-and-validate-the-returned-state)
- [Use OpenID Connect rather than ad hoc OAuth claims when authenticating a user](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Use-OpenID-Connect-rather-than-ad-hoc-OAuth-claims-when-authenticating-a-user)
- [Generate and validate a fresh `nonce` for each OpenID Connect authorization request](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Generate-and-validate-a-fresh-nonce-for-each-OpenID-Connect-authorization-request)
- [Keep access tokens short-lived, least-privileged, and out of logs](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Keep-access-tokens-short-lived%2C-least-privileged%2C-and-out-of-logs)
- [Send tokens only to their intended issuer or resource audience](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Send-tokens-only-to-their-intended-issuer-or-resource-audience)
- [Store refresh tokens only when silent renewal is necessary and protect them with platform-backed secure storage](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Store-refresh-tokens-only-when-silent-renewal-is-necessary-and-protect-them-with-platform-backed-secure-storage)
- [Rotate refresh tokens and treat detected reuse as a session-compromise signal](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Rotate-refresh-tokens-and-treat-detected-reuse-as-a-session-compromise-signal)
- [Use ID tokens only at the client for which they were issued](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Use-ID-tokens-only-at-the-client-for-which-they-were-issued)
- [Validate JWTs against trusted issuer metadata and an explicit algorithm allowlist](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Validate-JWTs-against-trusted-issuer-metadata-and-an-explicit-algorithm-allowlist)
- [Verify signature, issuer, audience, expiry, not-before time, and token-specific claims server-side](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Verify-signature%2C-issuer%2C-audience%2C-expiry%2C-not-before-time%2C-and-token-specific-claims-server-side)
- [Never use client-decoded claims as the authority for API access](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Never-use-client-decoded-claims-as-the-authority-for-API-access)
- [Serialize token refresh and fail closed when renewal or validation fails](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Serialize-token-refresh-and-fail-closed-when-renewal-or-validation-fails)
- [Model signed-out, authenticating, authenticated, refreshing, expired, and revoked states explicitly](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Model-signed-out%2C-authenticating%2C-authenticated%2C-refreshing%2C-expired%2C-and-revoked-states-explicitly)
- [Revoke server-side credentials when supported and always clear local session material on logout](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Revoke-server-side-credentials-when-supported-and-always-clear-local-session-material-on-logout)
- [Remove identity-scoped caches, database rows, web-view state, and pending work during logout](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Remove-identity-scoped-caches%2C-database-rows%2C-web-view-state%2C-and-pending-work-during-logout)
- [Require recent authentication and explicit confirmation before account deletion](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Require-recent-authentication-and-explicit-confirmation-before-account-deletion)
- [Make deletion idempotent, auditable, and complete across authoritative services and retained backups](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Authentication/Make-deletion-idempotent%2C-auditable%2C-and-complete-across-authoritative-services-and-retained-backups)

[< Back to security privacy & permissions](../README.md)
