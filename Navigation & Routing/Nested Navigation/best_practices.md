## Best Practices

- Use tabs for stable peer destinations and define whether reselection pops, scrolls to top, or does nothing
- Drive bottom-navigation selection and branch visibility from the same state
- Treat shell routes as routing-package configuration and test the chosen package's branch semantics
- Create stable navigator keys outside rebuild paths and assign one key per independent stack
- Keep branch-local routes on the nearest navigator and reserve the root navigator for app-wide presentation
- Dismiss a root dialog through the root navigator that presented it
- Pop the active tab's history before applying the application's at-root back policy
- Measure memory and background work before preserving every tab with `IndexedStack`
- Test tab switching, deep links, state restoration, system and browser back, and process recreation together
