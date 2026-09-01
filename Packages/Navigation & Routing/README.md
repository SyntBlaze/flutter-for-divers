# Navigation & Routing

Navigation describes how users move between screens, while routing maps
locations and navigation intent to the page hierarchy shown by an application.
A sound routing design keeps URLs, redirects, nested stacks, and system back
behavior predictable whether navigation starts inside the UI or from a deep
link.

```text
User action or incoming URL
            |
            v
    Navigation intent
            |
            v
  Route match and parsing
            |
            v
 Guard, redirect, or middleware
            |
            v
 Navigator and nested page stacks
            |
            v
      Visible application UI
```

Start with Flutter's `Navigator` when an application has a small, linear flow
and does not need URLs to represent much state. A routing package becomes more
valuable when the app needs deep links, browser history, authentication
redirects, nested navigation, typed arguments, or a route tree shared across
multiple platforms.

Choose GoRouter for a configuration-driven, URL-oriented route tree and
redirects. Choose AutoRoute when generated, strongly typed route APIs are worth
adding a code-generation step. Beamer and Routemaster offer alternative
declarative, URL-first models for applications whose locations should determine
their page stacks. Fluro suits teams that prefer explicit route patterns and
handler-based imperative navigation. GetX routing is most natural when the
application already adopts GetX conventions such as middleware and bindings;
adopting its router alone also brings those ecosystem conventions into the
navigation layer.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Navigation-and-Routing) — Focused, bite-sized article covering Navigation & Routing
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Navigation-and-Routing) — Step-by-step material that builds practical Navigation & Routing knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Navigation-and-Routing) — Structured, in-depth material for learning about Navigation & Routing thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| GoRouter | Configuration-driven declarative routing with URL paths, redirects, and nested shell routes | Cross-platform apps that need deep links, browser history, and nested navigation from one route tree | [💡](https://app.syntblaze.com/qt/flutter/Packages/Navigation-and-Routing/GoRouter "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Navigation-and-Routing/GoRouter "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Navigation-and-Routing/GoRouter "Deep Dive") |
| AutoRoute | Code-generated, strongly typed routes, arguments, guards, and nested routers | Larger apps that value compile-time route APIs and are comfortable with generated code | [💡](https://app.syntblaze.com/qt/flutter/Packages/Navigation-and-Routing/AutoRoute "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Navigation-and-Routing/AutoRoute "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Navigation-and-Routing/AutoRoute "Deep Dive") |
| Beamer | Declarative URL-based navigation organized around locations, route information, and nested beamers | URL-first apps that need flexible location matching and independently managed navigation regions | [💡](https://app.syntblaze.com/qt/flutter/Packages/Navigation-and-Routing/Beamer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Navigation-and-Routing/Beamer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Navigation-and-Routing/Beamer "Deep Dive") |
| Routemaster | Declarative path-to-page maps with route-aware pages and nested navigation support | Apps that want URLs to drive a compact, page-based routing configuration | [💡](https://app.syntblaze.com/qt/flutter/Packages/Navigation-and-Routing/Routemaster "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Navigation-and-Routing/Routemaster "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Navigation-and-Routing/Routemaster "Deep Dive") |
| Fluro | Imperative router built from named patterns, parameters, transitions, and route handlers | Apps that prefer explicit handler-based navigation without generated route classes | [💡](https://app.syntblaze.com/qt/flutter/Packages/Navigation-and-Routing/Fluro "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Navigation-and-Routing/Fluro "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Navigation-and-Routing/Fluro "Deep Dive") |
| GetX | Named navigation APIs integrated with GetX middleware, dependency bindings, and navigation utilities | Applications already using GetX that want routing to follow the same ecosystem conventions | [💡](https://app.syntblaze.com/qt/flutter/Packages/Navigation-and-Routing/GetX "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Navigation-and-Routing/GetX "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Navigation-and-Routing/GetX "Deep Dive") |

## Questions

- [What is the difference between navigation and routing?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/What-is-the-difference-between-navigation-and-routing%3F)
- [When is Flutter's built-in `Navigator` enough?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/When-is-Flutter's-built-in-Navigator-enough%3F)
- [What is declarative routing?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/What-is-declarative-routing%3F)
- [How does an incoming URL become a page stack?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/How-does-an-incoming-URL-become-a-page-stack%3F)
- [What is the difference between a path, a route, and a page?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/What-is-the-difference-between-a-path%2C-a-route%2C-and-a-page%3F)
- [When should route arguments be path parameters, query parameters, or in-memory data?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/When-should-route-arguments-be-path-parameters%2C-query-parameters%2C-or-in-memory-data%3F)
- [What is a deep link, and how should an app handle one from a cold start?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/What-is-a-deep-link%2C-and-how-should-an-app-handle-one-from-a-cold-start%3F)
- [How do redirects differ from route guards and middleware?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/How-do-redirects-differ-from-route-guards-and-middleware%3F)
- [How should authentication state affect routing?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/How-should-authentication-state-affect-routing%3F)
- [What is a nested navigator, and when is one needed?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/What-is-a-nested-navigator%2C-and-when-is-one-needed%3F)
- [How should bottom tabs preserve independent navigation history?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/How-should-bottom-tabs-preserve-independent-navigation-history%3F)
- [How does routing interact with browser and system back behavior?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/How-does-routing-interact-with-browser-and-system-back-behavior%3F)
- [How should navigation results be returned to the previous screen?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/How-should-navigation-results-be-returned-to-the-previous-screen%3F)
- [How should unknown, malformed, or unauthorized locations be handled?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/How-should-unknown%2C-malformed%2C-or-unauthorized-locations-be-handled%3F)
- [Which routing package best fits the application's navigation model?](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Which-routing-package-best-fits-the-application's-navigation-model%3F)

## Best Practices

- [Treat navigable URLs as stable, user-facing application state](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Treat-navigable-URLs-as-stable%2C-user-facing-application-state)
- [Keep the route tree and navigation conventions easy to discover](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Keep-the-route-tree-and-navigation-conventions-easy-to-discover)
- [Choose the simplest routing abstraction that satisfies the requirements](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Choose-the-simplest-routing-abstraction-that-satisfies-the-requirements)
- [Prefer typed route arguments where practical](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Prefer-typed-route-arguments-where-practical)
- [Use path parameters for resource identity and query parameters for optional state](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Use-path-parameters-for-resource-identity-and-query-parameters-for-optional-state)
- [Parse and validate all route input at the navigation boundary](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Parse-and-validate-all-route-input-at-the-navigation-boundary)
- [Keep sensitive values and credentials out of URLs](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Keep-sensitive-values-and-credentials-out-of-URLs)
- [Make guards, redirects, and middleware deterministic](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Make-guards%2C-redirects%2C-and-middleware-deterministic)
- [Represent authentication loading before deciding where to redirect](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Represent-authentication-loading-before-deciding-where-to-redirect)
- [Preserve the intended destination through sign-in and onboarding](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Preserve-the-intended-destination-through-sign-in-and-onboarding)
- [Avoid triggering navigation as a side effect of widget builds](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Avoid-triggering-navigation-as-a-side-effect-of-widget-builds)
- [Give each major tab an independent stack only when its history must be preserved](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Give-each-major-tab-an-independent-stack-only-when-its-history-must-be-preserved)
- [Keep route paths independent from translated labels and screen titles](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Keep-route-paths-independent-from-translated-labels-and-screen-titles)
- [Use replacement navigation when users must not return to the previous flow](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Use-replacement-navigation-when-users-must-not-return-to-the-previous-flow)
- [Define an intentional policy for system back, browser back, and app exit](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Define-an-intentional-policy-for-system-back%2C-browser-back%2C-and-app-exit)
- [Restore enough route state for the user to resume meaningfully](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Restore-enough-route-state-for-the-user-to-resume-meaningfully)
- [Handle unknown and malformed locations with a useful recovery path](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Handle-unknown-and-malformed-locations-with-a-useful-recovery-path)
- [Test direct links, redirects, nested stacks, and back navigation](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Test-direct-links%2C-redirects%2C-nested-stacks%2C-and-back-navigation)
- [Verify routing behavior on every supported platform and window size](https://app.syntblaze.com/qsp/flutter/Packages/Navigation-and-Routing/Verify-routing-behavior-on-every-supported-platform-and-window-size)

[< Back to packages](../README.md)
