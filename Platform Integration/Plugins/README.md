# Plugins

Flutter plugins package platform capabilities behind a Dart API while keeping
host-specific code in dedicated implementations. A federated plugin separates
the app-facing package, the shared platform contract, and one or more platform
packages so each layer can evolve with a clear responsibility.

```text
Flutter application
        |
        v
app-facing plugin package
        |
        v
platform interface package
        |
        +----> Android implementation ----> Kotlin / Java APIs
        +----> iOS implementation --------> Swift / Objective-C APIs
        +----> Web implementation --------> browser APIs
        +----> macOS implementation ------> AppKit / native APIs
        +----> Windows implementation ----> Win32 / native APIs
        +----> Linux implementation ------> GTK / native APIs
                         ^
                         |
       plugin registration / `GeneratedPluginRegistrant`
```

Implementations usually communicate with Dart through platform channels or a
generated interface, but registration is what attaches the selected native or
web implementation to a Flutter engine. Package boundaries, endorsed defaults,
version compatibility, engine attachment, and per-platform lifecycle behavior
are therefore part of the plugin's public design rather than incidental build
details.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Platform-Integration/Plugins) — Focused, bite-sized article covering Plugins
- [Learning Path](https://app.syntblaze.com/lt/flutter/Platform-Integration/Plugins) — Step-by-step material that builds practical Plugins knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Platform-Integration/Plugins) — Structured, in-depth material for learning about Plugins thoroughly

## Plugin Structure and Implementations

| Topic | Primary responsibility | Boundary or constraint | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Federated plugin | Splits one plugin across an app-facing package, a platform interface, and platform implementations | Package ownership, endorsement, and compatible releases must be coordinated across the federation | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Plugins/Federated-plugin "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Plugins/Federated-plugin "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Plugins/Federated-plugin "Deep Dive") |
| Platform interface | Defines the contract that each platform package implements for the app-facing API | Changes must preserve compatibility and prevent implementations from silently bypassing required behavior | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Plugins/Platform-interface "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Plugins/Platform-interface "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Plugins/Platform-interface "Deep Dive") |
| Android implementation | Connects the plugin contract to Android APIs using Kotlin or Java | Engine, activity, context, threading, permission, and Android lifecycle boundaries must be explicit | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Plugins/Android-implementation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Plugins/Android-implementation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Plugins/Android-implementation "Deep Dive") |
| iOS implementation | Connects the plugin contract to iOS APIs using Swift or Objective-C | Registrar, application lifecycle, main-thread, entitlement, and deployment-target requirements apply | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Plugins/iOS-implementation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Plugins/iOS-implementation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Plugins/iOS-implementation "Deep Dive") |
| Web implementation | Connects the plugin contract to browser APIs through Dart and JavaScript interop | Browser capability, security, asynchronous loading, and conditional import constraints differ from native hosts | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Plugins/Web-implementation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Plugins/Web-implementation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Plugins/Web-implementation "Deep Dive") |
| macOS implementation | Connects the plugin contract to macOS frameworks and runner lifecycle | Desktop windows, AppKit thread affinity, entitlements, and sandbox rules shape the implementation | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Plugins/macOS-implementation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Plugins/macOS-implementation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Plugins/macOS-implementation "Deep Dive") |
| Windows implementation | Connects the plugin contract to Windows APIs and the desktop runner | Native build configuration, COM or Win32 lifetimes, thread affinity, and binary compatibility require care | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Plugins/Windows-implementation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Plugins/Windows-implementation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Plugins/Windows-implementation "Deep Dive") |
| Linux implementation | Connects the plugin contract to Linux desktop libraries and the GTK runner | Distribution dependencies, GLib or GTK ownership, packaging, and ABI availability vary across systems | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Plugins/Linux-implementation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Plugins/Linux-implementation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Plugins/Linux-implementation "Deep Dive") |
| Plugin registration | Associates an implementation with a Flutter engine or web plugin registry | Registration must occur for every engine that uses the plugin and must match the platform package metadata | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Plugins/Plugin-registration "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Plugins/Plugin-registration "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Plugins/Plugin-registration "Deep Dive") |
| `GeneratedPluginRegistrant` | Collects generated native registrations for the plugins resolved into an application | Generated output should stay aligned with dependencies and be invoked at the embedding's registration point | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Plugins/GeneratedPluginRegistrant "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Plugins/GeneratedPluginRegistrant "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Plugins/GeneratedPluginRegistrant "Deep Dive") |

## Questions

- [When should a plugin use a federated package structure?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/When-should-a-plugin-use-a-federated-package-structure%3F)
- [Which responsibilities belong in the app-facing package versus the platform interface?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Which-responsibilities-belong-in-the-app-facing-package-versus-the-platform-interface%3F)
- [How should a platform interface evolve without breaking implementations?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/How-should-a-platform-interface-evolve-without-breaking-implementations%3F)
- [How does an Android plugin attach to an engine and, when needed, an activity?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/How-does-an-Android-plugin-attach-to-an-engine-and%2C-when-needed%2C-an-activity%3F)
- [Where should an iOS plugin register channels and observe application lifecycle events?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Where-should-an-iOS-plugin-register-channels-and-observe-application-lifecycle-events%3F)
- [How does a web implementation register itself without a native runner?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/How-does-a-web-implementation-register-itself-without-a-native-runner%3F)
- [Which macOS sandbox permissions and entitlements affect a desktop plugin?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Which-macOS-sandbox-permissions-and-entitlements-affect-a-desktop-plugin%3F)
- [How should Windows native resources and callbacks be owned and released?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/How-should-Windows-native-resources-and-callbacks-be-owned-and-released%3F)
- [How do Linux system-library and packaging requirements affect plugin distribution?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/How-do-Linux-system-library-and-packaging-requirements-affect-plugin-distribution%3F)
- [What is the difference between plugin metadata and runtime registration?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/What-is-the-difference-between-plugin-metadata-and-runtime-registration%3F)
- [When is `GeneratedPluginRegistrant` created and invoked?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/When-is-GeneratedPluginRegistrant-created-and-invoked%3F)
- [How are plugins registered when an application hosts more than one Flutter engine?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/How-are-plugins-registered-when-an-application-hosts-more-than-one-Flutter-engine%3F)

## Best Practices

- [Use federation when platforms need independent ownership or release cadence](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Use-federation-when-platforms-need-independent-ownership-or-release-cadence)
- [Keep the app-facing API platform-neutral and cohesive](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Keep-the-app-facing-API-platform-neutral-and-cohesive)
- [Make the platform interface an explicit, versioned contract](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Make-the-platform-interface-an-explicit%2C-versioned-contract)
- [Prefer endorsed implementations when one package family owns the default](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Prefer-endorsed-implementations-when-one-package-family-owns-the-default)
- [Separate engine attachment from activity or view-controller attachment](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Separate-engine-attachment-from-activity-or-view-controller-attachment)
- [Respect each host platform's main-thread and lifecycle requirements](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Respect-each-host-platform's-main-thread-and-lifecycle-requirements)
- [Check browser capabilities and return explicit unsupported errors on the web](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Check-browser-capabilities-and-return-explicit-unsupported-errors-on-the-web)
- [Declare native dependencies, entitlements, and minimum platform versions explicitly](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Declare-native-dependencies%2C-entitlements%2C-and-minimum-platform-versions-explicitly)
- [Release native handles, listeners, and callbacks when a plugin detaches](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Release-native-handles%2C-listeners%2C-and-callbacks-when-a-plugin-detaches)
- [Test Linux integrations against representative distributions and library versions](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Test-Linux-integrations-against-representative-distributions-and-library-versions)
- [Register each plugin once per engine and make teardown safe](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Register-each-plugin-once-per-engine-and-make-teardown-safe)
- [Treat `GeneratedPluginRegistrant` as generated build output](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Treat-GeneratedPluginRegistrant-as-generated-build-output)
- [Test the public contract against every supported platform implementation](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Test-the-public-contract-against-every-supported-platform-implementation)
- [Return unavailable capabilities and native failures through deliberate error contracts](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Plugins/Return-unavailable-capabilities-and-native-failures-through-deliberate-error-contracts)

[< Back to platform integration](../README.md)
