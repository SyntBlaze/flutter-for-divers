# Android Integration

Flutter's Android embedding connects a Dart application and Flutter engine to
Android's component, build, lifecycle, navigation, permission, and background
execution models. The generated runner is a useful starting point, but custom
integrations must still respect Android component ownership and the lifecycle
of every engine, activity, fragment, intent, and service they use.

```text
Android system / launcher / incoming link
                  |
                  v
        `AndroidManifest.xml`
                  |
        `Intent` + activity lifecycle
                  |
          +-------+--------+
          |                |
          v                v
 `FlutterActivity`   `FlutterFragment`
          |                |
          +-------+--------+
                  v
            Flutter engine
                  |
          Dart / Flutter application

Gradle -> Kotlin / Java sources -> Android application package
services, permissions, and `PendingIntent`s -> Android system APIs
```

`MainActivity` commonly specializes `FlutterActivity`, while add-to-app
architectures can place a `FlutterFragment` inside an existing Android UI.
`AndroidManifest.xml` declares the components and capabilities Android may
start; Gradle compiles and packages their Kotlin or Java implementation.
Intents, links, permissions, and services then cross boundaries where Android
version rules, process lifetime, and user-visible behavior matter.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration) — Focused, bite-sized article covering Android Integration
- [Learning Path](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration) — Step-by-step material that builds practical Android Integration knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration) — Structured, in-depth material for learning about Android Integration thoroughly

## Android Components and Tooling

| Topic | Primary role | Boundary or constraint | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `MainActivity` | Provides the application's Android entry activity in a typical Flutter project | Custom behavior should preserve the embedding's engine setup, lifecycle forwarding, and plugin expectations | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/MainActivity "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/MainActivity "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/MainActivity "Deep Dive") |
| `FlutterActivity` | Hosts a Flutter UI and coordinates an Android activity with a Flutter engine | Activity recreation, engine ownership, rendering mode, and intent delivery affect integration behavior | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/FlutterActivity "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/FlutterActivity "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/FlutterActivity "Deep Dive") |
| `FlutterFragment` | Embeds Flutter within a fragment-based Android screen | The host must coordinate fragment, view, activity, and engine lifecycles without duplicate ownership | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/FlutterFragment "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/FlutterFragment "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/FlutterFragment "Deep Dive") |
| `AndroidManifest.xml` | Declares application components, capabilities, intent filters, and platform metadata | Declarations are merged across the app and dependencies and must satisfy Android version and export rules | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/AndroidManifest.xml "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/AndroidManifest.xml "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/AndroidManifest.xml "Deep Dive") |
| Gradle | Configures Android builds, variants, dependencies, signing, and packaging | Plugin versions, SDK levels, repositories, and generated build inputs must remain compatible | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/Gradle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/Gradle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/Gradle "Deep Dive") |
| Kotlin | Implements Android integrations with Kotlin language and Android APIs | Nullability, coroutines, lifecycle scopes, and Java interoperability shape the host boundary | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/Kotlin "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/Kotlin "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/Kotlin "Deep Dive") |
| Java | Implements Android integrations with Java language and Android APIs | Threading, nullable contracts, resource ownership, and Kotlin interoperability require explicit handling | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/Java "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/Java "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/Java "Deep Dive") |
| Activity lifecycle | Describes creation, visibility, interaction, state saving, and destruction of an Android activity | Callbacks do not imply that the process, Flutter engine, or Dart state has the same lifetime | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/Activity-lifecycle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/Activity-lifecycle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/Activity-lifecycle "Deep Dive") |
| `Intent` | Carries an action and optional data to an Android component | All external data must be validated, and delivery differs between a new activity and an existing instance | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/Intent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/Intent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/Intent "Deep Dive") |
| `PendingIntent` | Grants another process permission to perform a predefined intent later | Mutability, identity, uniqueness, flags, and exposed data are security-sensitive | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/PendingIntent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/PendingIntent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/PendingIntent "Deep Dive") |
| App links | Routes verified HTTPS URLs into application content | Manifest filters, website association, verification, navigation, and cold-start handling must agree | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/App-links "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/App-links "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/App-links "Deep Dive") |
| Permissions | Controls access to protected Android capabilities and data | Manifest declarations, runtime requests, SDK version, denial state, and feature necessity are distinct concerns | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/Permissions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/Permissions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/Permissions "Deep Dive") |
| Foreground service | Runs user-visible ongoing work under Android's foreground-service rules | A declared service type, timely notification, start restrictions, and stop path may be required | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/Foreground-service "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/Foreground-service "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/Foreground-service "Deep Dive") |
| Background service | Performs service work without foreground execution | Modern Android sharply limits background starts and execution, so scheduled APIs may be more appropriate | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Android-Integration/Background-service "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Android-Integration/Background-service "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Android-Integration/Background-service "Deep Dive") |

## Questions

- [What should remain in `MainActivity`, and what belongs in a plugin or another Android component?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/What-should-remain-in-MainActivity%2C-and-what-belongs-in-a-plugin-or-another-Android-component%3F)
- [When should an app reuse a cached engine with `FlutterActivity`?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/When-should-an-app-reuse-a-cached-engine-with-FlutterActivity%3F)
- [When is `FlutterFragment` preferable to a full-screen Flutter activity?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/When-is-FlutterFragment-preferable-to-a-full-screen-Flutter-activity%3F)
- [How does manifest merging affect components, permissions, and metadata?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/How-does-manifest-merging-affect-components%2C-permissions%2C-and-metadata%3F)
- [Which Gradle files control SDK levels, dependencies, variants, and signing?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Which-Gradle-files-control-SDK-levels%2C-dependencies%2C-variants%2C-and-signing%3F)
- [How should Kotlin coroutines hand results back to Flutter safely?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/How-should-Kotlin-coroutines-hand-results-back-to-Flutter-safely%3F)
- [How should Java code express nullable values and asynchronous callbacks at the Flutter boundary?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/How-should-Java-code-express-nullable-values-and-asynchronous-callbacks-at-the-Flutter-boundary%3F)
- [How do activity recreation and process death differ?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/How-do-activity-recreation-and-process-death-differ%3F)
- [How should a new intent be delivered when an activity already exists?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/How-should-a-new-intent-be-delivered-when-an-activity-already-exists%3F)
- [When must a `PendingIntent` be immutable or explicitly mutable?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/When-must-a-PendingIntent-be-immutable-or-explicitly-mutable%3F)
- [How does Android verify an HTTPS app link, and what happens when verification fails?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/How-does-Android-verify-an-HTTPS-app-link%2C-and-what-happens-when-verification-fails%3F)
- [When does an Android permission require a runtime request?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/When-does-an-Android-permission-require-a-runtime-request%3F)
- [When is a foreground service justified, and which service type applies?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/When-is-a-foreground-service-justified%2C-and-which-service-type-applies%3F)
- [When should deferred background work use a scheduler instead of a service?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/When-should-deferred-background-work-use-a-scheduler-instead-of-a-service%3F)
- [How should native lifecycle and intent events be exposed to Dart without being lost or duplicated?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/How-should-native-lifecycle-and-intent-events-be-exposed-to-Dart-without-being-lost-or-duplicated%3F)

## Best Practices

- [Keep `MainActivity` thin and move reusable platform behavior behind a deliberate interface](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Keep-MainActivity-thin-and-move-reusable-platform-behavior-behind-a-deliberate-interface)
- [Decide and document whether the host or embedding owns each Flutter engine](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Decide-and-document-whether-the-host-or-embedding-owns-each-Flutter-engine)
- [Forward fragment and activity lifecycle changes without attaching the same engine twice](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Forward-fragment-and-activity-lifecycle-changes-without-attaching-the-same-engine-twice)
- [Review the merged manifest, including dependency-provided components and permissions](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Review-the-merged-manifest%2C-including-dependency-provided-components-and-permissions)
- [Pin compatible Android Gradle Plugin, Kotlin, Gradle, Java, and Flutter toolchain versions](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Pin-compatible-Android-Gradle-Plugin%2C-Kotlin%2C-Gradle%2C-Java%2C-and-Flutter-toolchain-versions)
- [Use lifecycle-aware coroutine scopes and dispatch Android UI work on the main thread](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Use-lifecycle-aware-coroutine-scopes-and-dispatch-Android-UI-work-on-the-main-thread)
- [Release listeners, executors, and native resources at their owning lifecycle boundary](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Release-listeners%2C-executors%2C-and-native-resources-at-their-owning-lifecycle-boundary)
- [Save only reconstructable UI state and design for Android process death](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Save-only-reconstructable-UI-state-and-design-for-Android-process-death)
- [Treat every externally supplied intent action, URI, extra, and MIME type as untrusted input](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Treat-every-externally-supplied-intent-action%2C-URI%2C-extra%2C-and-MIME-type-as-untrusted-input)
- [Use explicit intents and immutable `PendingIntent`s unless mutation is genuinely required](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Use-explicit-intents-and-immutable-PendingIntents-unless-mutation-is-genuinely-required)
- [Keep app-link declarations, website association files, and application routing in sync](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Keep-app-link-declarations%2C-website-association-files%2C-and-application-routing-in-sync)
- [Request the narrowest permission in context and preserve a useful denied-state experience](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Request-the-narrowest-permission-in-context-and-preserve-a-useful-denied-state-experience)
- [Show an accurate ongoing notification and stop foreground services promptly](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Show-an-accurate-ongoing-notification-and-stop-foreground-services-promptly)
- [Use platform-recommended scheduling for deferrable, persistent background work](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Use-platform-recommended-scheduling-for-deferrable%2C-persistent-background-work)
- [Test cold start, warm intent delivery, recreation, process death, denial, and supported Android API levels](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Android-Integration/Test-cold-start%2C-warm-intent-delivery%2C-recreation%2C-process-death%2C-denial%2C-and-supported-Android-API-levels)

[< Back to platform integration](../README.md)
