## Best Practices

- Use `Navigator.maybePop` semantics for user-initiated back controls and choose the intended navigator context
- Derive `PopScope.canPop` synchronously from current state and treat `onPopInvokedWithResult` as a notification
- Migrate deprecated `WillPopScope` callbacks to ahead-of-time state instead of adding new legacy guards
- Define and test the at-root policy for system back, including nested flows and app exit
- Keep browser URL, history entries, router state, and the page stack consistent
- Test predictive-back commit, cancellation, blocked state, and custom transitions on supported Android devices
- Set an in-progress latch before awaiting confirmation and ignore later attempts until it resolves
- Return immediately for `didPop: true` and perform only one confirmed pop through the route's owning navigator
- Use `NavigatorPopHandler` for nested navigators and back-dispatcher priority for nested routers
- Test app-bar back, system buttons and gestures, browser back and forward, dialogs, dirty forms, and every nested-stack boundary
