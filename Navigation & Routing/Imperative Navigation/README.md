# Imperative Navigation

Imperative navigation changes a `Navigator` route stack in direct response to
an event. A caller pushes a route, pops the current route, replaces an entry,
or removes entries until a predicate identifies the stack state to keep. The
API is a natural fit for local, sequential flows such as opening a detail page,
showing an editor, and awaiting the value returned when that editor closes.

```text
home --push--> details --push--> editor
  ^                 ^               |
  |                 +---- pop ------+  result
  +---------- pop / popUntil -------+

pushReplacement:        old -> new
pushAndRemoveUntil:  [a, b, c] -> [kept entries, new]
```

Navigation is asynchronous even when the stack mutation is initiated
immediately: push methods return a `Future` that completes when the new route
is later popped. Keep route construction and argument ownership explicit,
choose predicates carefully for multi-route operations, and prevent rapid user
input from starting the same transition more than once.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Imperative-Navigation) — Focused, bite-sized article covering Imperative Navigation
- [Learning Path](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Imperative-Navigation) — Step-by-step material that builds practical Imperative Navigation knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Imperative-Navigation) — Structured, in-depth material for learning about Imperative Navigation thoroughly

## Imperative Navigation Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Navigator.push()` | Adds a route and returns a future for its eventual result | Use a typed `Route<T>` and await only when the caller needs the value produced by the destination | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.push-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.push-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.push-method "Deep Dive") |
| `Navigator.pop()` | Removes the current route, optionally with a result | Pop through the intended navigator and supply a result compatible with the route's type | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pop-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pop-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pop-method "Deep Dive") |
| `Navigator.pushNamed()` | Pushes a route resolved by its registered name | Keep names centralized and validate `RouteSettings.arguments` at the route boundary | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pushNamed-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pushNamed-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pushNamed-method "Deep Dive") |
| `Navigator.pushReplacement()` | Replaces the current route with a new route | Use it when returning to the old screen should no longer be possible, while handling old and new result types deliberately | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pushReplacement-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pushReplacement-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pushReplacement-method "Deep Dive") |
| `Navigator.pushAndRemoveUntil()` | Pushes a route and removes earlier routes until a predicate succeeds | Make the retained boundary explicit; a predicate that always returns false clears the preceding stack | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pushAndRemoveUntil-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pushAndRemoveUntil-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.pushAndRemoveUntil-method "Deep Dive") |
| `Navigator.popUntil()` | Pops routes until a predicate matches the current route | Ensure a matching route can exist and use stable route names when calling `ModalRoute.withName` | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.popUntil-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.popUntil-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Imperative-Navigation/Navigator.popUntil-method "Deep Dive") |
| Returning route results | Sends a typed value from a popped route back to its caller | Match the generic push type with the value passed to `pop`, and handle cancellation as `null` | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Imperative-Navigation/Returning-route-results "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Imperative-Navigation/Returning-route-results "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Imperative-Navigation/Returning-route-results "Deep Dive") |
| Passing route arguments | Supplies destination input through constructors or route settings | Prefer typed, required constructor parameters; validate untyped named-route arguments before building UI | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Imperative-Navigation/Passing-route-arguments "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Imperative-Navigation/Passing-route-arguments "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Imperative-Navigation/Passing-route-arguments "Deep Dive") |
| Guarding double navigation | Prevents repeated taps or callbacks from starting duplicate transitions | Disable or lock the initiating action for the whole async operation and release the guard in `finally` | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Imperative-Navigation/Guarding-double-navigation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Imperative-Navigation/Guarding-double-navigation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Imperative-Navigation/Guarding-double-navigation "Deep Dive") |

## Questions

- [When should a screen call `Navigator.push()` and await its result?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/When-should-a-screen-call-Navigator.push()-and-await-its-result%3F)
- [Which navigator will `Navigator.pop()` affect when navigators are nested?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/Which-navigator-will-Navigator.pop()-affect-when-navigators-are-nested%3F)
- [How are a named route and its arguments resolved?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/How-are-a-named-route-and-its-arguments-resolved%3F)
- [How does replacement differ from pushing and then popping the old route?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/How-does-replacement-differ-from-pushing-and-then-popping-the-old-route%3F)
- [Which routes remain after `Navigator.pushAndRemoveUntil()`?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/Which-routes-remain-after-Navigator.pushAndRemoveUntil()%3F)
- [How should a safe stopping predicate for `Navigator.popUntil()` be chosen?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/How-should-a-safe-stopping-predicate-for-Navigator.popUntil()-be-chosen%3F)
- [How does a destination return a typed value or signal cancellation?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/How-does-a-destination-return-a-typed-value-or-signal-cancellation%3F)
- [When are constructor arguments safer than `RouteSettings.arguments`?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/When-are-constructor-arguments-safer-than-RouteSettings.arguments%3F)
- [How can rapid taps be prevented from pushing the same route twice?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/How-can-rapid-taps-be-prevented-from-pushing-the-same-route-twice%3F)

## Best Practices

- [Push typed routes and await their futures only where their results are consumed](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/Push-typed-routes-and-await-their-futures-only-where-their-results-are-consumed)
- [Pop from the correct navigator and return values that match the route's result type](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/Pop-from-the-correct-navigator-and-return-values-that-match-the-route's-result-type)
- [Keep named-route identifiers centralized and reject malformed arguments early](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/Keep-named-route-identifiers-centralized-and-reject-malformed-arguments-early)
- [Use replacement for completed steps that users must not revisit with Back](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/Use-replacement-for-completed-steps-that-users-must-not-revisit-with-Back)
- [Write removal predicates that clearly document the stack boundary to retain](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/Write-removal-predicates-that-clearly-document-the-stack-boundary-to-retain)
- [Prefer stable route identity over assumptions about a stack's current depth](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/Prefer-stable-route-identity-over-assumptions-about-a-stack's-current-depth)
- [Treat a `null` route result as cancellation unless `null` is a meaningful domain value](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/Treat-a-null-route-result-as-cancellation-unless-null-is-a-meaningful-domain-value)
- [Pass required destination data through typed constructors whenever practical](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/Pass-required-destination-data-through-typed-constructors-whenever-practical)
- [Guard navigation at the event source, use `try`/`finally`, and check `context.mounted` after awaiting](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Imperative-Navigation/Guard-navigation-at-the-event-source%2C-use-try%2Ffinally%2C-and-check-context.mounted-after-awaiting)

[< Back to navigation & routing](../README.md)
