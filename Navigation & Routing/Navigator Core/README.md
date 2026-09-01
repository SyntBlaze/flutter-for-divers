# Navigator Core

Flutter's `Navigator` presents routes as a managed history stack. Each `Route`
owns the content and transition for one entry, while `NavigatorState` performs
mutations such as push, pop, replace, and remove. Page routes usually fill the
screen; modal and popup routes can instead place transient content over the
current route.

```text
push C                                  pop(result)
   |                                        |
   v                                        v
[Route A] -> [Route B] -> [Route C]    [Route A] -> [Route B]
  oldest                    current       oldest        current
                                  result completes C's push future
```

Route ownership and navigator selection matter as much as the operation itself.
A nested navigator has its own stack, a route remains active until its lifecycle
finishes, and a push returns a future that completes only when that route is
popped. Keep route identity, arguments, result types, and observer subscriptions
explicit so navigation behavior stays predictable during transitions and
rebuilds.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core) — Focused, bite-sized article covering Navigator Core
- [Learning Path](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core) — Step-by-step material that builds practical Navigator Core knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core) — Structured, in-depth material for learning about Navigator Core thoroughly

## Navigator Core Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Navigator` | Displays and coordinates a stack of routes | Resolve the intended navigator when contexts can belong to nested navigation trees | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/Navigator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/Navigator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/Navigator "Deep Dive") |
| `NavigatorState` | Exposes imperative operations and current navigator state | Access it from an appropriate context or a stable key, and avoid retaining stale state references | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/NavigatorState "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/NavigatorState "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/NavigatorState "Deep Dive") |
| `Route` | Represents one navigator history entry and its lifecycle | Choose result and argument types deliberately, and release route-owned resources when disposed | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/Route "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/Route "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/Route "Deep Dive") |
| `PageRoute` | Models a modal route whose content replaces the full screen | Configure opacity, state maintenance, and transitions according to the screen's lifecycle needs | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/PageRoute "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/PageRoute "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/PageRoute "Deep Dive") |
| `MaterialPageRoute` | Builds a Material screen with platform-adaptive transitions | Use it for standard Material navigation while keeping the builder free of navigation side effects | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/MaterialPageRoute "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/MaterialPageRoute "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/MaterialPageRoute "Deep Dive") |
| `CupertinoPageRoute` | Builds an iOS-style page route with Cupertino transitions | Preserve expected back-swipe behavior and platform navigation semantics | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/CupertinoPageRoute "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/CupertinoPageRoute "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/CupertinoPageRoute "Deep Dive") |
| `ModalRoute` | Supplies modal route state and lookup APIs to descendants | Treat `ModalRoute.of(context)` as nullable and use a context below the route | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/ModalRoute "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/ModalRoute "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/ModalRoute "Deep Dive") |
| `PopupRoute` | Defines a non-opaque modal route for popup content | Specify barrier behavior, dismissal semantics, color, and accessibility label together | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/PopupRoute "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/PopupRoute "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/PopupRoute "Deep Dive") |
| `RouteSettings` | Carries a route name and optional arguments | Prefer typed boundaries around untyped arguments and keep names stable when observers or restoration use them | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/RouteSettings "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/RouteSettings "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/RouteSettings "Deep Dive") |
| `RouteObserver` | Observes route changes and notifies subscribed route-aware objects | Register it with the correct navigator and unsubscribe every subscriber during disposal | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/RouteObserver "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/RouteObserver "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/RouteObserver "Deep Dive") |
| `RouteAware` | Receives callbacks when another route covers or reveals its route | Subscribe only after the route is available and use callbacks for visibility-sensitive work | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/RouteAware "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/RouteAware "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/RouteAware "Deep Dive") |
| `Navigator` key | Provides context-free access to a particular `NavigatorState` | Create one stable `GlobalKey<NavigatorState>` and reserve it for boundaries that cannot receive context | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/Navigator-key "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/Navigator-key "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/Navigator-key "Deep Dive") |
| Route stack | Defines visible history and the destination of back navigation | Model stack changes intentionally, especially across nested navigators and restorable flows | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/Route-stack "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/Route-stack "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/Route-stack "Deep Dive") |
| Push | Adds a route above the current route | Await the returned future when the caller needs the route's result, and guard repeated triggers | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/Push "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/Push "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/Push "Deep Dive") |
| Pop | Removes the current route and optionally returns a result | Check whether the intended navigator can pop and keep the result type consistent with the push | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/Pop "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/Pop "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/Pop "Deep Dive") |
| Replace | Exchanges an existing route without preserving it in back history | Use replacement for genuine history semantics, not merely to hide an unwanted back button | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/Replace "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/Replace "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/Replace "Deep Dive") |
| Remove | Deletes a route from the stack without making it the active pop target | Retain an exact route reference and account for lifecycle and pending-result completion behavior | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Navigator-Core/Remove "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Navigator-Core/Remove "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Navigator-Core/Remove "Deep Dive") |

## Questions

- [How does a `Navigator` choose which route to display when multiple entries are present?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/How-does-a-Navigator-choose-which-route-to-display-when-multiple-entries-are-present%3F)
- [When should code obtain `NavigatorState` through context rather than through a key?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/When-should-code-obtain-NavigatorState-through-context-rather-than-through-a-key%3F)
- [Which lifecycle and result responsibilities belong to a `Route`?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Which-lifecycle-and-result-responsibilities-belong-to-a-Route%3F)
- [When is a custom `PageRoute` preferable to a framework-provided page route?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/When-is-a-custom-PageRoute-preferable-to-a-framework-provided-page-route%3F)
- [Which transition and lifecycle defaults does `MaterialPageRoute` provide?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Which-transition-and-lifecycle-defaults-does-MaterialPageRoute-provide%3F)
- [How does `CupertinoPageRoute` preserve iOS navigation expectations?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/How-does-CupertinoPageRoute-preserve-iOS-navigation-expectations%3F)
- [What information can descendants safely obtain from `ModalRoute.of(context)`?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/What-information-can-descendants-safely-obtain-from-ModalRoute.of(context)%3F)
- [Which barrier and dismissal decisions make a `PopupRoute` accessible and predictable?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Which-barrier-and-dismissal-decisions-make-a-PopupRoute-accessible-and-predictable%3F)
- [How should names and arguments be represented with `RouteSettings`?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/How-should-names-and-arguments-be-represented-with-RouteSettings%3F)
- [How is a `RouteObserver` connected to the navigator it should observe?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/How-is-a-RouteObserver-connected-to-the-navigator-it-should-observe%3F)
- [When do the `RouteAware` cover and reveal callbacks run?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/When-do-the-RouteAware-cover-and-reveal-callbacks-run%3F)
- [When does a global `Navigator` key solve a real boundary problem, and when does it hide ownership?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/When-does-a-global-Navigator-key-solve-a-real-boundary-problem%2C-and-when-does-it-hide-ownership%3F)
- [How do nested navigators change the meaning of the current route stack?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/How-do-nested-navigators-change-the-meaning-of-the-current-route-stack%3F)
- [Why does pushing a route return a future, and when should that future be awaited?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Why-does-pushing-a-route-return-a-future%2C-and-when-should-that-future-be-awaited%3F)
- [How can a pop return a typed value to the route that initiated navigation?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/How-can-a-pop-return-a-typed-value-to-the-route-that-initiated-navigation%3F)
- [How does replacing a route differ from pushing and then removing history?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/How-does-replacing-a-route-differ-from-pushing-and-then-removing-history%3F)
- [When is direct route removal appropriate, and which route reference should be removed?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/When-is-direct-route-removal-appropriate%2C-and-which-route-reference-should-be-removed%3F)

## Best Practices

- [Use the closest intended `Navigator` and make root-versus-nested selection explicit](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Use-the-closest-intended-Navigator-and-make-root-versus-nested-selection-explicit)
- [Keep imperative navigation calls at clear interaction or coordination boundaries](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Keep-imperative-navigation-calls-at-clear-interaction-or-coordination-boundaries)
- [Treat route lifecycle, arguments, and returned results as part of the route's contract](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Treat-route-lifecycle%2C-arguments%2C-and-returned-results-as-part-of-the-route's-contract)
- [Customize `PageRoute` only when transition, opacity, or state-retention behavior truly differs](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Customize-PageRoute-only-when-transition%2C-opacity%2C-or-state-retention-behavior-truly-differs)
- [Use `MaterialPageRoute` for conventional Material screen transitions](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Use-MaterialPageRoute-for-conventional-Material-screen-transitions)
- [Preserve gesture-driven back navigation when using `CupertinoPageRoute`](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Preserve-gesture-driven-back-navigation-when-using-CupertinoPageRoute)
- [Use a descendant context and handle a missing `ModalRoute` safely](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Use-a-descendant-context-and-handle-a-missing-ModalRoute-safely)
- [Give dismissible popup barriers clear semantics and accessible labels](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Give-dismissible-popup-barriers-clear-semantics-and-accessible-labels)
- [Keep route names stable and decode untyped `RouteSettings.arguments` at one boundary](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Keep-route-names-stable-and-decode-untyped-RouteSettings.arguments-at-one-boundary)
- [Register each `RouteObserver` with the navigator whose changes it must report](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Register-each-RouteObserver-with-the-navigator-whose-changes-it-must-report)
- [Balance every `RouteAware` subscription with an unsubscribe call](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Balance-every-RouteAware-subscription-with-an-unsubscribe-call)
- [Create a navigator key once and avoid using it as a general substitute for context](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Create-a-navigator-key-once-and-avoid-using-it-as-a-general-substitute-for-context)
- [Design stack mutations around the back-navigation history users should experience](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Design-stack-mutations-around-the-back-navigation-history-users-should-experience)
- [Guard pushes against repeated taps and await them only when their results matter](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Guard-pushes-against-repeated-taps-and-await-them-only-when-their-results-matter)
- [Pop from the intended navigator and return values that match the route's result type](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Pop-from-the-intended-navigator-and-return-values-that-match-the-route's-result-type)
- [Replace routes only when the outgoing destination should no longer exist in history](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Replace-routes-only-when-the-outgoing-destination-should-no-longer-exist-in-history)
- [Remove routes by exact identity and verify the effects on lifecycle and awaiting callers](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Navigator-Core/Remove-routes-by-exact-identity-and-verify-the-effects-on-lifecycle-and-awaiting-callers)

[< Back to navigation & routing](../README.md)
