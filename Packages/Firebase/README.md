# Firebase

Firebase packages connect a Flutter application to managed backend services for
identity, data, files, messaging, configuration, analytics, diagnostics, and
server-side work. They provide client SDKs and platform bindings, but they do
not remove the need to design application boundaries, authorization, data
ownership, failure handling, or operational controls.

```text
Flutter UI -> feature or repository boundary -> Firebase client SDK
                                                   |
                                                   v
                                             Firebase service
                                                   |
                     security rules, App Check,    v
Trusted backend or Cloud Functions <------- events and protected operations
                     |
                     v
        logs, crashes, performance, and analytics signals
```

Firebase Core establishes the application-to-project connection used by other
Firebase plugins. Product packages then address distinct concerns: Firebase
Auth and Firebase UI Auth cover identity flows; Cloud Firestore and Firebase
Realtime Database store synchronized data; Cloud Storage handles files; and
Cloud Functions runs trusted backend code. Cloud Messaging, Remote Config,
Analytics, Crashlytics, and Performance Monitoring support engagement,
experimentation, and observability. App Check adds an application-attestation
signal, but it is not a substitute for authentication or authorization.

Client code must be treated as untrusted. Security Rules should enforce which
authenticated users may access each record or object, while privileged actions
and secret-bearing integrations belong on trusted infrastructure. Keep
Firebase-specific objects behind feature, repository, or service boundaries so
the rest of the application can work with domain models and test doubles.

## Selection Guidance

Start with Firebase Core, then add only the services the product requires. Use
Firebase Auth for authentication state and provider sign-in flows; add Firebase
UI Auth when a configurable prebuilt authentication interface is appropriate.
App Check can complement supported services by helping reject traffic that
does not carry valid app-attestation tokens.

Choose Cloud Firestore for collection-and-document data with indexed queries,
realtime listeners, and offline client behavior. Consider Firebase Realtime
Database when a JSON tree, presence-style coordination, or its synchronization
model better matches the feature. Use Cloud Storage for user-generated and
other binary content rather than embedding large files in a database. Put
privileged workflows, third-party secrets, scheduled work, and cross-service
coordination in Cloud Functions or another trusted backend.

Add Cloud Messaging for remote notification delivery, and combine it with an
appropriate local-notification solution when foreground presentation or local
scheduling is needed. Use Remote Config for remotely managed parameters and
rollouts, not as a secret store or an authorization mechanism. Adopt Analytics,
Crashlytics, and Performance Monitoring only with an explicit observability
plan, consent model, data-retention policy, and environment separation.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Firebase) — Focused, bite-sized article covering Firebase
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Firebase) — Step-by-step material that builds practical Firebase knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Firebase) — Structured, in-depth material for learning about Firebase thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Firebase Core | Initializes named Firebase applications and exposes shared project configuration to other Firebase plugins | Establishing the required connection before using Firebase product SDKs | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Firebase-Core "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Firebase-Core "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Firebase-Core "Deep Dive") |
| Firebase Auth | Client authentication with session state and supported identity providers | Signing users in, observing authentication state, and obtaining identity tokens | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Firebase-Auth "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Firebase-Auth "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Firebase-Auth "Deep Dive") |
| Firebase Cloud Messaging | Push-message registration, token handling, and message callbacks across supported platforms | Remote notifications and data messages sent from trusted infrastructure | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Firebase-Cloud-Messaging "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Firebase-Cloud-Messaging "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Firebase-Cloud-Messaging "Deep Dive") |
| Cloud Firestore | Document database with indexed queries, realtime listeners, transactions, and client-side offline behavior | Structured application data organized into collections and documents | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Cloud-Firestore "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Cloud-Firestore "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Cloud-Firestore "Deep Dive") |
| Firebase Crashlytics | Crash and non-fatal error reporting with diagnostic context | Investigating production stability problems and prioritizing failures | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Firebase-Crashlytics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Firebase-Crashlytics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Firebase-Crashlytics "Deep Dive") |
| Cloud Storage for Firebase | Object storage with upload, download, metadata, and security-rule integration | Images, videos, documents, and other user or application files | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Cloud-Storage-for-Firebase "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Cloud-Storage-for-Firebase "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Cloud-Storage-for-Firebase "Deep Dive") |
| Google Analytics for Firebase | Event and user-property collection integrated with Firebase reporting and audiences | Measuring product behavior through a deliberately designed analytics taxonomy | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Google-Analytics-for-Firebase "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Google-Analytics-for-Firebase "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Google-Analytics-for-Firebase "Deep Dive") |
| Firebase Remote Config | Remotely managed parameter values with client fetching, activation, and conditions | Feature configuration, staged behavior changes, and experiments that have safe defaults | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Firebase-Remote-Config "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Firebase-Remote-Config "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Firebase-Remote-Config "Deep Dive") |
| Cloud Functions for Firebase | Event-driven and callable backend functions running in a trusted environment | Privileged operations, service events, scheduled work, and third-party integrations | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Cloud-Functions-for-Firebase "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Cloud-Functions-for-Firebase "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Cloud-Functions-for-Firebase "Deep Dive") |
| Firebase Realtime Database | Synchronized JSON tree with realtime listeners, transactions, and offline support | Presence, live coordination, and data that naturally fits its tree-shaped model | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Firebase-Realtime-Database "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Firebase-Realtime-Database "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Firebase-Realtime-Database "Deep Dive") |
| Firebase Performance Monitoring | Collection of application startup, screen, network, and custom trace measurements | Finding latency and performance regressions in real application usage | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Firebase-Performance-Monitoring "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Firebase-Performance-Monitoring "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Firebase-Performance-Monitoring "Deep Dive") |
| Firebase UI Auth | Prebuilt and configurable Flutter authentication screens backed by Firebase Auth | Standard sign-in flows where a maintained UI layer reduces custom form work | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Firebase-UI-Auth "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Firebase-UI-Auth "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Firebase-UI-Auth "Deep Dive") |
| Firebase App Check | App-attestation tokens verified by supported Firebase services and protected backends | Reducing abuse by requiring an additional signal that requests originate from an attested app instance | [💡](https://app.syntblaze.com/qt/flutter/Packages/Firebase/Firebase-App-Check "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Firebase/Firebase-App-Check "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Firebase/Firebase-App-Check "Deep Dive") |

## Questions

- [Which Firebase services does this application actually need?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Which-Firebase-services-does-this-application-actually-need%3F)
- [How should Firebase be initialized before dependent features start?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/How-should-Firebase-be-initialized-before-dependent-features-start%3F)
- [How should development, staging, and production Firebase projects be separated?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/How-should-development%2C-staging%2C-and-production-Firebase-projects-be-separated%3F)
- [When should I choose Cloud Firestore or Firebase Realtime Database?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/When-should-I-choose-Cloud-Firestore-or-Firebase-Realtime-Database%3F)
- [Which work belongs in client code and which requires a trusted backend?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Which-work-belongs-in-client-code-and-which-requires-a-trusted-backend%3F)
- [How should Security Rules be designed and tested?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/How-should-Security-Rules-be-designed-and-tested%3F)
- [How do Firebase Auth, Security Rules, and App Check differ?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/How-do-Firebase-Auth%2C-Security-Rules%2C-and-App-Check-differ%3F)
- [How should offline writes, retries, and conflicting updates be handled?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/How-should-offline-writes%2C-retries%2C-and-conflicting-updates-be-handled%3F)
- [How should push-notification permissions, tokens, and message states be managed?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/How-should-push-notification-permissions%2C-tokens%2C-and-message-states-be-managed%3F)
- [When is Remote Config appropriate, and what needs a safe local default?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/When-is-Remote-Config-appropriate%2C-and-what-needs-a-safe-local-default%3F)
- [How should analytics events and user properties be named?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/How-should-analytics-events-and-user-properties-be-named%3F)
- [What user data may be collected for analytics, crash, and performance reporting?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/What-user-data-may-be-collected-for-analytics%2C-crash%2C-and-performance-reporting%3F)
- [How should Firebase dependencies be replaced in unit and widget tests?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/How-should-Firebase-dependencies-be-replaced-in-unit-and-widget-tests%3F)
- [When should Firebase emulators be used in integration tests?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/When-should-Firebase-emulators-be-used-in-integration-tests%3F)
- [How should service failures, quotas, and partial outages affect the user experience?](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/How-should-service-failures%2C-quotas%2C-and-partial-outages-affect-the-user-experience%3F)

## Best Practices

- [Initialize Firebase once and make startup dependencies explicit](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Initialize-Firebase-once-and-make-startup-dependencies-explicit)
- [Use separate Firebase projects and configuration files for each environment](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Use-separate-Firebase-projects-and-configuration-files-for-each-environment)
- [Add only the Firebase plugins and platform capabilities the application needs](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Add-only-the-Firebase-plugins-and-platform-capabilities-the-application-needs)
- [Keep Firebase SDK types behind repository or service boundaries](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Keep-Firebase-SDK-types-behind-repository-or-service-boundaries)
- [Treat every client, including an authenticated client, as untrusted](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Treat-every-client%2C-including-an-authenticated-client%2C-as-untrusted)
- [Grant the minimum access required in Firestore, Realtime Database, and Storage Rules](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Grant-the-minimum-access-required-in-Firestore%2C-Realtime-Database%2C-and-Storage-Rules)
- [Test Security Rules for permitted and rejected requests before deployment](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Test-Security-Rules-for-permitted-and-rejected-requests-before-deployment)
- [Keep service credentials, signing secrets, and privileged operations off the client](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Keep-service-credentials%2C-signing-secrets%2C-and-privileged-operations-off-the-client)
- [Use App Check as defense in depth rather than as authentication or authorization](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Use-App-Check-as-defense-in-depth-rather-than-as-authentication-or-authorization)
- [Minimize personal data collection and document consent, retention, and deletion behavior](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Minimize-personal-data-collection-and-document-consent%2C-retention%2C-and-deletion-behavior)
- [Avoid placing secrets or authorization decisions in Remote Config](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Avoid-placing-secrets-or-authorization-decisions-in-Remote-Config)
- [Model database documents, indexes, and paths around measured access patterns](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Model-database-documents%2C-indexes%2C-and-paths-around-measured-access-patterns)
- [Design writes to be idempotent and handle retries, offline state, and conflicts](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Design-writes-to-be-idempotent-and-handle-retries%2C-offline-state%2C-and-conflicts)
- [Validate file type, size, ownership, and metadata for Cloud Storage uploads](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Validate-file-type%2C-size%2C-ownership%2C-and-metadata-for-Cloud-Storage-uploads)
- [Manage messaging tokens across refresh, sign-out, account changes, and device replacement](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Manage-messaging-tokens-across-refresh%2C-sign-out%2C-account-changes%2C-and-device-replacement)
- [Handle foreground, background, and terminated message paths explicitly](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Handle-foreground%2C-background%2C-and-terminated-message-paths-explicitly)
- [Use emulators and test projects to exercise integrations without production data](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Use-emulators-and-test-projects-to-exercise-integrations-without-production-data)
- [Filter expected errors and remove sensitive values from logs, crash reports, and traces](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Filter-expected-errors-and-remove-sensitive-values-from-logs%2C-crash-reports%2C-and-traces)
- [Define actionable dashboards and alerts for crashes, latency, delivery, and backend failures](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Define-actionable-dashboards-and-alerts-for-crashes%2C-latency%2C-delivery%2C-and-backend-failures)
- [Dispose listeners, cancel subscriptions, and bound realtime data retained in memory](https://app.syntblaze.com/qsp/flutter/Packages/Firebase/Dispose-listeners%2C-cancel-subscriptions%2C-and-bound-realtime-data-retained-in-memory)

[< Back to packages](../README.md)
