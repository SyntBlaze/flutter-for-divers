## Best Practices

- Keep `MainActivity` thin and move reusable platform behavior behind a deliberate interface
- Decide and document whether the host or embedding owns each Flutter engine
- Forward fragment and activity lifecycle changes without attaching the same engine twice
- Review the merged manifest, including dependency-provided components and permissions
- Pin compatible Android Gradle Plugin, Kotlin, Gradle, Java, and Flutter toolchain versions
- Use lifecycle-aware coroutine scopes and dispatch Android UI work on the main thread
- Release listeners, executors, and native resources at their owning lifecycle boundary
- Save only reconstructable UI state and design for Android process death
- Treat every externally supplied intent action, URI, extra, and MIME type as untrusted input
- Use explicit intents and immutable `PendingIntent`s unless mutation is genuinely required
- Keep app-link declarations, website association files, and application routing in sync
- Request the narrowest permission in context and preserve a useful denied-state experience
- Show an accurate ongoing notification and stop foreground services promptly
- Use platform-recommended scheduling for deferrable, persistent background work
- Test cold start, warm intent delivery, recreation, process death, denial, and supported Android API levels
