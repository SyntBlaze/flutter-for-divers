# Error Boundaries

Error boundaries decide where failures are captured, translated, reported, and
shown to users. A layered Flutter application distinguishes expected operational
failures from unexpected programming errors so each can receive an appropriate
response without leaking infrastructure details across the application.

```text
Framework error --------> FlutterError.onError --------------------+
Unhandled async error --> zone / PlatformDispatcher handler -------+--> report crash

Data source exception -> repository mapping -> domain failure -> UI error state
                                                     |              |
                                                     v              v
                                               retry policy   offline fallback
```

Global handlers are a final safety net for uncaught errors, not a replacement
for handling expected failures near their source. Repositories should translate
technical exceptions into application-owned failures; presentation code can then
choose an honest, actionable state for the user.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/App-Architecture/Error-Boundaries) — Focused, bite-sized article covering Error Boundaries
- [Learning Path](https://app.syntblaze.com/lt/flutter/App-Architecture/Error-Boundaries) — Step-by-step material that builds practical Error Boundaries knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/App-Architecture/Error-Boundaries) — Structured, in-depth material for learning about Error Boundaries thoroughly

## Error Handling Topics

| Topic | Boundary or role | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `runZonedGuarded` | Captures uncaught asynchronous errors in a guarded Dart zone | Install it around startup code and preserve the original error and stack trace | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Error-Boundaries/runZonedGuarded "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Error-Boundaries/runZonedGuarded "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Error-Boundaries/runZonedGuarded "Deep Dive") |
| `FlutterError.onError` | Receives errors caught by the Flutter framework | Preserve Flutter's diagnostic reporting while forwarding unexpected errors | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Error-Boundaries/FlutterError.onError "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Error-Boundaries/FlutterError.onError "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Error-Boundaries/FlutterError.onError "Deep Dive") |
| `PlatformDispatcher.instance.onError` | Handles otherwise unhandled errors on the root isolate | Return the correct handled status and avoid duplicate reporting | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Error-Boundaries/PlatformDispatcher.instance.onError "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Error-Boundaries/PlatformDispatcher.instance.onError "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Error-Boundaries/PlatformDispatcher.instance.onError "Deep Dive") |
| Repository error mapping | Translates provider, transport, and persistence errors | Expose stable application failures instead of vendor-specific exceptions | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Error-Boundaries/Repository-error-mapping "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Error-Boundaries/Repository-error-mapping "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Error-Boundaries/Repository-error-mapping "Deep Dive") |
| Domain failures | Represents expected failure in business language | Keep failure types meaningful, finite, and independent of infrastructure | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Error-Boundaries/Domain-failures "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Error-Boundaries/Domain-failures "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Error-Boundaries/Domain-failures "Deep Dive") |
| UI error states | Describes failure as presentation state | Give users clear feedback and only the actions that can help | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Error-Boundaries/UI-error-states "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Error-Boundaries/UI-error-states "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Error-Boundaries/UI-error-states "Deep Dive") |
| Retry policy | Controls repeated attempts after transient failure | Bound retries, use backoff, and consider whether the operation is idempotent | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Error-Boundaries/Retry-policy "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Error-Boundaries/Retry-policy "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Error-Boundaries/Retry-policy "Deep Dive") |
| Offline fallback | Provides useful behavior when remote access is unavailable | Define cache freshness, queued writes, and synchronization expectations | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Error-Boundaries/Offline-fallback "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Error-Boundaries/Offline-fallback "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Error-Boundaries/Offline-fallback "Deep Dive") |
| Crash reporting | Records unexpected failures for diagnosis | Remove sensitive data and attach only useful, bounded context | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Error-Boundaries/Crash-reporting "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Error-Boundaries/Crash-reporting "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Error-Boundaries/Crash-reporting "Deep Dive") |

## Questions

- [Which asynchronous errors can `runZonedGuarded` capture?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Which-asynchronous-errors-can-runZonedGuarded-capture%3F)
- [When is an error delivered to `FlutterError.onError`?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/When-is-an-error-delivered-to-FlutterError.onError%3F)
- [How does `PlatformDispatcher.instance.onError` complement Flutter's handler?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/How-does-PlatformDispatcher.instance.onError-complement-Flutter's-handler%3F)
- [Where should a network or database exception become an application failure?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Where-should-a-network-or-database-exception-become-an-application-failure%3F)
- [How should expected domain failures differ from programming errors?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/How-should-expected-domain-failures-differ-from-programming-errors%3F)
- [What information and recovery actions belong in a UI error state?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/What-information-and-recovery-actions-belong-in-a-UI-error-state%3F)
- [Which failures are safe to retry automatically?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Which-failures-are-safe-to-retry-automatically%3F)
- [What should the application show when cached data may be stale?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/What-should-the-application-show-when-cached-data-may-be-stale%3F)
- [Which context is useful and safe to send with a crash report?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Which-context-is-useful-and-safe-to-send-with-a-crash-report%3F)
- [How can global handlers avoid reporting the same error twice?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/How-can-global-handlers-avoid-reporting-the-same-error-twice%3F)
- [When should an error be handled locally instead of reaching a global boundary?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/When-should-an-error-be-handled-locally-instead-of-reaching-a-global-boundary%3F)

## Best Practices

- [Install top-level error handlers before starting application work](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Install-top-level-error-handlers-before-starting-application-work)
- [Always retain the original stack trace when forwarding an error](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Always-retain-the-original-stack-trace-when-forwarding-an-error)
- [Preserve Flutter framework diagnostics in `FlutterError.onError`](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Preserve-Flutter-framework-diagnostics-in-FlutterError.onError)
- [Coordinate root-isolate handlers to prevent duplicate crash reports](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Coordinate-root-isolate-handlers-to-prevent-duplicate-crash-reports)
- [Catch only exceptions a repository can translate or recover from](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Catch-only-exceptions-a-repository-can-translate-or-recover-from)
- [Map technical errors into stable application-owned failure types](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Map-technical-errors-into-stable-application-owned-failure-types)
- [Model expected business failure explicitly](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Model-expected-business-failure-explicitly)
- [Keep programmer errors visible during development](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Keep-programmer-errors-visible-during-development)
- [Represent loading, empty, unavailable, stale, and failed states deliberately](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Represent-loading%2C-empty%2C-unavailable%2C-stale%2C-and-failed-states-deliberately)
- [Offer retry only when it can change the outcome](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Offer-retry-only-when-it-can-change-the-outcome)
- [Use bounded exponential backoff with jitter for transient failures](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Use-bounded-exponential-backoff-with-jitter-for-transient-failures)
- [Check idempotency before retrying writes](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Check-idempotency-before-retrying-writes)
- [Define cache freshness and synchronization behavior for offline use](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Define-cache-freshness-and-synchronization-behavior-for-offline-use)
- [Redact secrets and personal data from crash reports](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Redact-secrets-and-personal-data-from-crash-reports)
- [Test each boundary with representative failures and stack traces](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Test-each-boundary-with-representative-failures-and-stack-traces)
- [Keep crash-reporting failures from causing another application failure](https://app.syntblaze.com/qsp/flutter/App-Architecture/Error-Boundaries/Keep-crash-reporting-failures-from-causing-another-application-failure)

[< Back to app architecture](../README.md)
