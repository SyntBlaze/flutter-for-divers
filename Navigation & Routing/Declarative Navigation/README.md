# Declarative Navigation

Declarative navigation derives the visible route stack from application state.
Flutter's Router API coordinates incoming route information, parsing, page
creation, back-button handling, and URL reporting so that navigation remains
consistent across mobile, desktop, and web.

```text
platform URL / route information
              |
              v
RouteInformationProvider -> RouteInformationParser -> app route state
                                                        |
                                                        v
                                              RouterDelegate
                                                        |
                                                        v
                                                Navigator(pages)

system or browser back -> BackButtonDispatcher -> app route state
app route state changes -> RouterDelegate -> RouteInformationProvider -> URL
```

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Declarative-Navigation) — Focused, bite-sized article covering Declarative Navigation
- [Learning Path](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Declarative-Navigation) — Step-by-step material that builds practical Declarative Navigation knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Declarative-Navigation) — Structured, in-depth material for learning about Declarative Navigation thoroughly

## Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Router` | Coordinates route information, parsing, delegation, and back navigation | Keep the router configuration stable across rebuilds | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Declarative-Navigation/Router "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Declarative-Navigation/Router "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Declarative-Navigation/Router "Deep Dive") |
| `RouterDelegate` | Builds the navigator from current route state and applies restored routes | Notify listeners whenever state changes alter the page stack or reported URL | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Declarative-Navigation/RouterDelegate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Declarative-Navigation/RouterDelegate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Declarative-Navigation/RouterDelegate "Deep Dive") |
| `RouteInformationParser` | Converts external route information into an application route configuration | Make parsing deterministic and handle malformed or unknown locations explicitly | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Declarative-Navigation/RouteInformationParser "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Declarative-Navigation/RouteInformationParser "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Declarative-Navigation/RouteInformationParser "Deep Dive") |
| `RouteInformationProvider` | Supplies platform route changes and receives route reports from the app | Avoid feedback loops between state updates and URL updates | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Declarative-Navigation/RouteInformationProvider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Declarative-Navigation/RouteInformationProvider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Declarative-Navigation/RouteInformationProvider "Deep Dive") |
| `BackButtonDispatcher` | Routes back-button intent to the active router or nested router | Give the currently active navigation branch priority | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Declarative-Navigation/BackButtonDispatcher "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Declarative-Navigation/BackButtonDispatcher "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Declarative-Navigation/BackButtonDispatcher "Deep Dive") |
| `Page` | Describes an immutable route entry used to construct and update the navigator stack | Use stable keys and identity so Flutter can match pages across state changes | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Declarative-Navigation/Page "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Declarative-Navigation/Page "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Declarative-Navigation/Page "Deep Dive") |
| Navigator 2.0 | Uses pages and Router APIs to represent navigation declaratively | Adopt only the pieces needed for deep links, web URLs, or complex state-driven stacks | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Declarative-Navigation/Navigator-2.0 "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Declarative-Navigation/Navigator-2.0 "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Declarative-Navigation/Navigator-2.0 "Deep Dive") |
| Browser URL sync | Keeps browser history, address bar, and visible pages aligned | Define one canonical mapping between URLs and route state | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Declarative-Navigation/Browser-URL-sync "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Declarative-Navigation/Browser-URL-sync "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Declarative-Navigation/Browser-URL-sync "Deep Dive") |
| App state driven routes | Projects authentication, onboarding, and feature state into a page list | Preserve a single source of truth and keep route derivation free of side effects | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Declarative-Navigation/App-state-driven-routes "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Declarative-Navigation/App-state-driven-routes "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Declarative-Navigation/App-state-driven-routes "Deep Dive") |

## Questions

- [When should an app use Router APIs instead of imperative Navigator calls?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/When-should-an-app-use-Router-APIs-instead-of-imperative-Navigator-calls%3F)
- [How do `Router`, `RouterDelegate`, and `RouteInformationParser` divide responsibilities?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/How-do-Router%2C-RouterDelegate%2C-and-RouteInformationParser-divide-responsibilities%3F)
- [What should an application route configuration contain?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/What-should-an-application-route-configuration-contain%3F)
- [When should a custom `RouteInformationProvider` be implemented?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/When-should-a-custom-RouteInformationProvider-be-implemented%3F)
- [How does a delegate restore state from a deep link or browser history entry?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/How-does-a-delegate-restore-state-from-a-deep-link-or-browser-history-entry%3F)
- [How do `Page` keys affect route reuse, transitions, and state preservation?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/How-do-Page-keys-affect-route-reuse%2C-transitions%2C-and-state-preservation%3F)
- [How should nested routers decide which branch handles back navigation?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/How-should-nested-routers-decide-which-branch-handles-back-navigation%3F)
- [How can URL updates avoid creating duplicate browser history entries?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/How-can-URL-updates-avoid-creating-duplicate-browser-history-entries%3F)
- [How should authentication state add or remove pages from the stack?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/How-should-authentication-state-add-or-remove-pages-from-the-stack%3F)

## Best Practices

- [Make route state the single source of truth for the page stack](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/Make-route-state-the-single-source-of-truth-for-the-page-stack)
- [Keep parsing and URL generation inverse and deterministic](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/Keep-parsing-and-URL-generation-inverse-and-deterministic)
- [Represent unknown, invalid, and unavailable routes explicitly](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/Represent-unknown%2C-invalid%2C-and-unavailable-routes-explicitly)
- [Use stable page keys that express route identity](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/Use-stable-page-keys-that-express-route-identity)
- [Notify the router only when navigation-relevant state changes](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/Notify-the-router-only-when-navigation-relevant-state-changes)
- [Keep router delegates and providers alive across ordinary widget rebuilds](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/Keep-router-delegates-and-providers-alive-across-ordinary-widget-rebuilds)
- [Assign back-button priority to the visible nested branch](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/Assign-back-button-priority-to-the-visible-nested-branch)
- [Choose push versus replace browser-history behavior deliberately](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/Choose-push-versus-replace-browser-history-behavior-deliberately)
- [Test deep links, refreshes, back/forward navigation, and state restoration](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/Test-deep-links%2C-refreshes%2C-back%2Fforward-navigation%2C-and-state-restoration)
- [Keep page-list derivation pure; perform navigation side effects elsewhere](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Declarative-Navigation/Keep-page-list-derivation-pure%3B-perform-navigation-side-effects-elsewhere)

[< Back to navigation and routing](../README.md)
