## Best Practices

- Give each piece of state one clear owner
- Keep state close to the widgets that need it
- Use immutable snapshots for non-trivial state
- Model asynchronous states explicitly
- Derive values instead of storing duplicate state
- Keep UI builders pure and move side effects elsewhere
- Separate presentation, business, and data-access responsibilities
- Inject repositories and services instead of creating them in state objects
- Expose user intent instead of arbitrary setters
- Select only the state a widget needs
- Create new collections instead of mutating shared ones
- Prevent stale asynchronous work from overwriting newer state
- Keep widgets, controllers, and `BuildContext` out of application state
- Persist only durable, safe, and versionable state
- Represent failures in terms the UI can act on
- Dispose state owners and subscriptions with the correct lifecycle
- Test transitions, failures, retries, and race conditions
- Choose the simplest suitable state-management primitive
