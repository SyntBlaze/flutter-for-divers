# Deep Links

Deep links let an external URI open a specific destination in a Flutter
application. The operating system first decides whether the app may handle the
URI; the app then validates and parses it, updates navigation state, and shows
the corresponding screen. The same route may arrive when the app is not
running, while it is in the background, or while it is already active, so link
delivery and route handling need one coordinated, idempotent pipeline.

```text
HTTPS URL or custom URI
          |
          v
OS association / intent resolution
          |
    +-----+------+
    |            |
    v            v
cold start   runtime delivery
initial URI   link event stream
    |            |
    +-----+------+
          |
          v
 validate -> parse -> authorize -> deduplicate
          |
          v
 app state / Router / Navigator -> destination
```

iOS Universal Links and Android App Links both use ordinary `https` URLs, but
their trust configuration is platform-specific. Universal Links associate an
iOS app with a domain through the app's associated-domains entitlement and the
domain's `apple-app-site-association` file. Android App Links use an Android
intent filter and the domain's `assetlinks.json` statement to verify the app's
signing identity. Failed or missing association normally leaves the web URL to
the browser or an operating-system chooser rather than making it a trusted app
route.

Custom URI schemes such as `com.example.app://callback` do not prove domain
ownership and another installed app may be able to claim the same scheme. They
remain useful where HTTPS association is unavailable, but must be treated as
untrusted input. Validate the scheme, host, path, parameters, and permitted
destination before changing navigation state; never interpret an arbitrary
incoming URI as authority to access protected content.

A cold-start URI belongs in the application's initial routing decision, while
links received after startup arrive through a runtime event source. Platform
and plugin behavior can cause the same URI to be observed through more than one
path, so establish one owner, subscribe early, cancel subscriptions during
disposal, and deduplicate handled events. Deferred deep linking across an app
installation is not guaranteed by standard Universal Links or App Links alone;
it usually depends on store, attribution, or provider infrastructure and must
have a privacy-conscious fallback when attribution is unavailable.

Authentication callbacks need stricter handling than ordinary content links.
Prefer a claimed HTTPS redirect when the identity provider and platform support
it, use an exact allowlisted redirect URI, and bind the response to the
initiating session with `state` and PKCE (plus `nonce` for OpenID Connect where
applicable). Treat callback parameters as untrusted, reject replays and
unexpected issuers, avoid secrets in URLs, and navigate only after the trusted
authentication component has validated the response.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Deep-Links) — Focused, bite-sized article covering Deep Links
- [Learning Path](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Deep-Links) — Step-by-step material that builds practical Deep Links knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Deep-Links) — Structured, in-depth material for learning about Deep Links thoroughly

## Deep Link Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Universal Links | Opens claimed HTTPS destinations in an iOS app | Keep the associated-domains entitlement and `apple-app-site-association` paths, app identifiers, and deployed domains aligned | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Deep-Links/Universal-Links "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Deep-Links/Universal-Links "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Deep-Links/Universal-Links "Deep Dive") |
| Android App Links | Opens verified HTTPS destinations in an Android app | Match intent-filter hosts and paths to `assetlinks.json`, including every production signing certificate identity | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Deep-Links/Android-App-Links "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Deep-Links/Android-App-Links "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Deep-Links/Android-App-Links "Deep Dive") |
| Custom schemes | Routes non-HTTP URIs to the app | Scheme claims are not verified ownership; allowlist and validate every URI component | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Deep-Links/Custom-schemes "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Deep-Links/Custom-schemes "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Deep-Links/Custom-schemes "Deep Dive") |
| App link verification | Establishes the app-to-domain trust relationship | Serve association files over HTTPS with correct content, identifiers, paths, and no fragile redirect chain | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Deep-Links/App-link-verification "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Deep-Links/App-link-verification "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Deep-Links/App-link-verification "Deep Dive") |
| Initial link | Handles a link that launches an app which was not running | Resolve startup dependencies before committing one deterministic initial route | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Deep-Links/Initial-link "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Deep-Links/Initial-link "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Deep-Links/Initial-link "Deep Dive") |
| Runtime link stream | Handles links delivered after the application has started | Subscribe once, manage lifecycle, serialize navigation, and suppress duplicate events | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Deep-Links/Runtime-link-stream "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Deep-Links/Runtime-link-stream "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Deep-Links/Runtime-link-stream "Deep Dive") |
| Deferred deep links | Attempts to restore destination context after installation | Availability and attribution are provider-dependent; obtain consent where needed and provide a safe fallback | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Deep-Links/Deferred-deep-links "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Deep-Links/Deferred-deep-links "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Deep-Links/Deferred-deep-links "Deep Dive") |
| Authentication callbacks | Returns control from a browser or identity provider to the app | Validate the full protocol response with exact redirects, `state`, PKCE, issuer checks, and replay protection before navigation | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Deep-Links/Authentication-callbacks "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Deep-Links/Authentication-callbacks "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Deep-Links/Authentication-callbacks "Deep Dive") |

## Questions

- [How does an iOS Universal Link prove that an app is associated with a website?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/How-does-an-iOS-Universal-Link-prove-that-an-app-is-associated-with-a-website%3F)
- [Which intent filters and signing identities must an Android App Link verify?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Which-intent-filters-and-signing-identities-must-an-Android-App-Link-verify%3F)
- [Why is a custom URI scheme weaker than a claimed HTTPS link?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Why-is-a-custom-URI-scheme-weaker-than-a-claimed-HTTPS-link%3F)
- [How can association files and installed builds be tested independently of Flutter routing?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/How-can-association-files-and-installed-builds-be-tested-independently-of-Flutter-routing%3F)
- [When should the initial URI become part of declarative app state?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/When-should-the-initial-URI-become-part-of-declarative-app-state%3F)
- [How should an active app serialize and deduplicate incoming link events?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/How-should-an-active-app-serialize-and-deduplicate-incoming-link-events%3F)
- [What should happen when deferred attribution is unavailable, stale, or denied?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/What-should-happen-when-deferred-attribution-is-unavailable%2C-stale%2C-or-denied%3F)
- [Which checks must complete before an OAuth or OpenID Connect callback can navigate?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Which-checks-must-complete-before-an-OAuth-or-OpenID-Connect-callback-can-navigate%3F)
- [How should one URI-to-route parser be shared by cold-start and runtime delivery?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/How-should-one-URI-to-route-parser-be-shared-by-cold-start-and-runtime-delivery%3F)
- [Which deep-link destinations require authentication or authorization before display?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Which-deep-link-destinations-require-authentication-or-authorization-before-display%3F)

## Best Practices

- [Use verified HTTPS links for web-to-app navigation when the domain is under your control](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Use-verified-HTTPS-links-for-web-to-app-navigation-when-the-domain-is-under-your-control)
- [Keep iOS and Android association files versioned, deployed, and tested with release identities](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Keep-iOS-and-Android-association-files-versioned%2C-deployed%2C-and-tested-with-release-identities)
- [Treat every inbound URI and every parameter as untrusted input](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Treat-every-inbound-URI-and-every-parameter-as-untrusted-input)
- [Allowlist schemes, hosts, paths, parameter shapes, and supported route versions](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Allowlist-schemes%2C-hosts%2C-paths%2C-parameter-shapes%2C-and-supported-route-versions)
- [Use one typed URI parser and route mapping for initial and runtime links](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Use-one-typed-URI-parser-and-route-mapping-for-initial-and-runtime-links)
- [Make link handling idempotent so duplicate delivery cannot push duplicate routes](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Make-link-handling-idempotent-so-duplicate-delivery-cannot-push-duplicate-routes)
- [Wait for required startup, authentication, and restoration state before applying an initial route](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Wait-for-required-startup%2C-authentication%2C-and-restoration-state-before-applying-an-initial-route)
- [Keep protected destinations behind authorization checks, not merely hard-to-guess URLs](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Keep-protected-destinations-behind-authorization-checks%2C-not-merely-hard-to-guess-URLs)
- [Give deferred links an explicit expiry, consent model, and non-attributed fallback](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Give-deferred-links-an-explicit-expiry%2C-consent-model%2C-and-non-attributed-fallback)
- [Use exact registered authentication redirects and bind callbacks with `state` and PKCE](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Use-exact-registered-authentication-redirects-and-bind-callbacks-with-state-and-PKCE)
- [Remove tokens and sensitive values from logs, analytics, clipboard flows, and browser-visible URLs](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Remove-tokens-and-sensitive-values-from-logs%2C-analytics%2C-clipboard-flows%2C-and-browser-visible-URLs)
- [Test browser fallback, fresh install, terminated, background, foreground, duplicate, malformed, and unauthorized cases](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Deep-Links/Test-browser-fallback%2C-fresh-install%2C-terminated%2C-background%2C-foreground%2C-duplicate%2C-malformed%2C-and-unauthorized-cases)

[< Back to navigation & routing](../README.md)
