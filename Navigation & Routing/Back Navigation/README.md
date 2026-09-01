# Back Navigation

Back navigation is a request to reveal an earlier destination, but the source
and owner of that request vary. A Material `BackButton` asks the nearest
`Navigator` to maybe pop, Android sends a system back intent, and a browser
back action changes the browser history entry presented to a `Router`. An app
must direct the request to the correct navigator, decide whether the current
route may leave, and keep route state and platform history synchronized.

```text
back request: app bar / system gesture / browser history
                         |
                         v
             active nested navigator or router?
                 | yes                 | no
                 v                     v
       nested stack / dispatcher    root stack
                 \                     /
                  v                   v
            current route pop disposition
                 |
        +--------+---------+
        |                  |
   may pop             blocked in advance
        |                  |
        v                  v
 pop current route    `PopScope` reports `didPop: false`
        |                  |
        |          clean up / show one confirmation
        |                  |
        |          confirmed -> perform one pop or
        |                       update declarative state
        v
 no local route -> bubble to parent, browser history, or app exit
```

`PopScope<T>` is the current framework mechanism for participating in a
route's pop decision. Its synchronous `canPop` value must describe whether the
route is allowed to pop before a gesture begins. Its
`onPopInvokedWithResult` callback runs after an attempted pop is handled;
`didPop` reports whether the pop succeeded, and `result` carries the route
result. The callback cannot retroactively cancel a successful pop. If several
`PopScope` widgets are registered in one route, every `canPop` must be true for
that route to pop. The older `WillPopScope` performs an asynchronous,
just-in-time veto and is deprecated because it cannot support Android
predictive back; maintain it only while migrating legacy code.

System and browser back are related but not interchangeable. A mobile system
back request is normally offered to the active Flutter navigation hierarchy;
when the current route declines to handle it, the request can bubble toward a
parent navigator or the platform, which may leave the app. On the web, back and
forward traverse browser history. `Router`-based applications must convert the
new route information into application state and rebuild the page stack, while
also reporting app-initiated route changes back to the browser. An imperative
`Navigator.pop` that is not reflected in URL state can leave the visible stack
and browser history disagreeing.

Android predictive back starts animating a preview before the user commits the
gesture, so pop eligibility cannot wait for an asynchronous callback. Keep
`canPop` accurate ahead of time, use transitions that support predictive back,
complete the required Android manifest and platform setup, and test both
commit and cancellation on supported Android versions. Setting `canPop` to
false blocks the predictive animation; `onPopInvokedWithResult` can then report
the blocked attempt, but it is too late to enable that same gesture.

Nested navigation adds an ownership decision before the pop decision. Back
should usually reach the visible child stack first and fall through to the
parent only when the child cannot handle it. `NavigatorPopHandler` is designed
for a nested `Navigator`, while nested Router configurations coordinate
priority with `BackButtonDispatcher`. Disable handlers for inactive tab stacks
that remain mounted so a hidden branch does not consume the request.

An unsaved-changes guard should expose a stable ahead-of-time state, such as
`canPop: !hasUnsavedChanges`, and show confirmation only after receiving a
blocked attempt. Guard the asynchronous confirmation with an in-progress flag,
return immediately when `didPop` is true, and check that the state is still
mounted before acting on the result. On confirmation, either issue exactly one
pop through the navigator that owns the guarded route or update the
declarative route source of truth. Do not call pop again for a successful
`didPop` notification, and do not allow repeated back attempts to open stacked
dialogs; both mistakes can create recursive pop callbacks or duplicate
navigation. For page-backed or package-managed routing, express the guard in
the router's page state or guard API rather than relying on a child widget to
contradict the declarative stack.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Back-Navigation) — Focused, bite-sized article covering Back Navigation
- [Learning Path](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Back-Navigation) — Step-by-step material that builds practical Back Navigation knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Back-Navigation) — Structured, in-depth material for learning about Back Navigation thoroughly

## Back Navigation Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `BackButton` | Provides an explicit, platform-appropriate Material back control | Its default action calls `Navigator.maybePop` on the nearest navigator, so show and place it only where that stack can go back | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Back-Navigation/BackButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Back-Navigation/BackButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Back-Navigation/BackButton "Deep Dive") |
| `PopScope` | Declares pop eligibility and observes completed or blocked pop attempts | Keep `canPop` current before a gesture starts and inspect `didPop` before performing follow-up work | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Back-Navigation/PopScope "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Back-Navigation/PopScope "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Back-Navigation/PopScope "Deep Dive") |
| `WillPopScope` | Represents the legacy asynchronous pop-veto mechanism | It is deprecated and prevents Android predictive back; migrate to ahead-of-time pop state | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Back-Navigation/WillPopScope "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Back-Navigation/WillPopScope "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Back-Navigation/WillPopScope "Deep Dive") |
| System back | Routes a platform back request through Flutter's active navigation hierarchy | Let the active child handle it first, then define clearly when it bubbles to a parent or exits the app | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Back-Navigation/System-back "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Back-Navigation/System-back "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Back-Navigation/System-back "Deep Dive") |
| Browser back | Traverses browser history and supplies route information to the app | Keep URL, router state, and visible pages bidirectionally synchronized | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Back-Navigation/Browser-back "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Back-Navigation/Browser-back "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Back-Navigation/Browser-back "Deep Dive") |
| Predictive back | Previews the destination during an Android back gesture | Eligibility must be known synchronously in advance; async vetoes and incompatible transitions cannot participate correctly | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Back-Navigation/Predictive-back "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Back-Navigation/Predictive-back "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Back-Navigation/Predictive-back "Deep Dive") |
| Unsaved changes guard | Prevents accidental departure while preserving a safe confirmation flow | Deduplicate dialogs, distinguish blocked from successful pops, and pop or update route state only once after confirmation | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Back-Navigation/Unsaved-changes-guard "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Back-Navigation/Unsaved-changes-guard "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Back-Navigation/Unsaved-changes-guard "Deep Dive") |

## Questions

- [When should an app display a `BackButton`, and which `Navigator` will it target?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/When-should-an-app-display-a-BackButton%2C-and-which-Navigator-will-it-target%3F)
- [How do `canPop`, `didPop`, and a typed route result interact in `PopScope<T>`?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/How-do-canPop%2C-didPop%2C-and-a-typed-route-result-interact-in-PopScope%3CT%3E%3F)
- [Why does `WillPopScope` prevent Android predictive back, and how should legacy code migrate?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Why-does-WillPopScope-prevent-Android-predictive-back%2C-and-how-should-legacy-code-migrate%3F)
- [When does system back pop a route, bubble to a parent, or leave the application?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/When-does-system-back-pop-a-route%2C-bubble-to-a-parent%2C-or-leave-the-application%3F)
- [How do browser history changes become application route state, and vice versa?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/How-do-browser-history-changes-become-application-route-state%2C-and-vice-versa%3F)
- [Why must predictive-back eligibility be known before the gesture begins?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Why-must-predictive-back-eligibility-be-known-before-the-gesture-begins%3F)
- [How can an unsaved-changes dialog avoid duplicate dialogs and recursive pop callbacks?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/How-can-an-unsaved-changes-dialog-avoid-duplicate-dialogs-and-recursive-pop-callbacks%3F)
- [How should the active nested navigator receive priority over mounted but inactive branches?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/How-should-the-active-nested-navigator-receive-priority-over-mounted-but-inactive-branches%3F)

## Best Practices

- [Use `Navigator.maybePop` semantics for user-initiated back controls and choose the intended navigator context](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Use-Navigator.maybePop-semantics-for-user-initiated-back-controls-and-choose-the-intended-navigator-context)
- [Derive `PopScope.canPop` synchronously from current state and treat `onPopInvokedWithResult` as a notification](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Derive-PopScope.canPop-synchronously-from-current-state-and-treat-onPopInvokedWithResult-as-a-notification)
- [Migrate deprecated `WillPopScope` callbacks to ahead-of-time state instead of adding new legacy guards](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Migrate-deprecated-WillPopScope-callbacks-to-ahead-of-time-state-instead-of-adding-new-legacy-guards)
- [Define and test the at-root policy for system back, including nested flows and app exit](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Define-and-test-the-at-root-policy-for-system-back%2C-including-nested-flows-and-app-exit)
- [Keep browser URL, history entries, router state, and the page stack consistent](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Keep-browser-URL%2C-history-entries%2C-router-state%2C-and-the-page-stack-consistent)
- [Test predictive-back commit, cancellation, blocked state, and custom transitions on supported Android devices](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Test-predictive-back-commit%2C-cancellation%2C-blocked-state%2C-and-custom-transitions-on-supported-Android-devices)
- [Set an in-progress latch before awaiting confirmation and ignore later attempts until it resolves](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Set-an-in-progress-latch-before-awaiting-confirmation-and-ignore-later-attempts-until-it-resolves)
- [Return immediately for `didPop: true` and perform only one confirmed pop through the route's owning navigator](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Return-immediately-for-didPop%3A-true-and-perform-only-one-confirmed-pop-through-the-route's-owning-navigator)
- [Use `NavigatorPopHandler` for nested navigators and back-dispatcher priority for nested routers](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Use-NavigatorPopHandler-for-nested-navigators-and-back-dispatcher-priority-for-nested-routers)
- [Test app-bar back, system buttons and gestures, browser back and forward, dialogs, dirty forms, and every nested-stack boundary](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Back-Navigation/Test-app-bar-back%2C-system-buttons-and-gestures%2C-browser-back-and-forward%2C-dialogs%2C-dirty-forms%2C-and-every-nested-stack-boundary)

[< Back to navigation & routing](../README.md)
