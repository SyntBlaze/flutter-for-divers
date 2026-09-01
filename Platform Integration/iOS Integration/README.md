# iOS Integration

Flutter's iOS runner embeds a Flutter engine inside a native application and
connects Dart code to UIKit, application lifecycle events, system routing, and
Apple platform capabilities. The runner's delegates and view controllers own
the native host lifecycle, while Xcode build settings, CocoaPods, property-list
configuration, entitlements, and privacy declarations determine what the
installed application can load and request from iOS.

```text
iOS launch / scene connection / incoming URL
                    |
                    v
  `UIApplicationDelegate` ---- `AppDelegate`
                    |                 |
                    |                 +----> plugin registration
                    |
                    +---- `SceneDelegate` ----> window / scene lifecycle
                                      |
                                      v
                            `UIViewController`
                                      |
                                      v
                             Flutter engine / Dart

Build and capability inputs:
`Info.plist` + `Podfile` + entitlements + privacy descriptions
       |             |             |
       +-------------+-------------+----> signed iOS application
```

Swift or Objective-C runner code handles native callbacks and forwards only
the application-specific work that belongs at the Flutter boundary. Some
configuration is read at launch, some capabilities must be present in the
signed entitlements, and URL or Universal Link delivery can enter through
application- or scene-level callbacks. The correct integration point therefore
depends on the app's lifecycle configuration, supported iOS versions, enabled
scenes, and whether more than one Flutter engine or window is involved.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration) — Focused, bite-sized article covering iOS Integration
- [Learning Path](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration) — Step-by-step material that builds practical iOS Integration knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration) — Structured, in-depth material for learning about iOS Integration thoroughly

## iOS Host Components and Configuration

| Topic | Primary responsibility | Boundary or constraint | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `AppDelegate` | Customizes application startup and coordinates app-level callbacks in the iOS runner | Plugin registration, engine setup, callback forwarding, and superclass behavior must remain compatible with the Flutter embedding | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/AppDelegate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/AppDelegate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/AppDelegate "Deep Dive") |
| `SceneDelegate` | Manages the lifecycle of a UIKit scene and its window when the app uses scenes | Scene callbacks are distinct from process-wide application callbacks, and each connected scene has its own lifecycle | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/SceneDelegate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/SceneDelegate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/SceneDelegate "Deep Dive") |
| `Info.plist` | Declares bundle metadata and runtime configuration consumed by iOS and frameworks | Keys are packaged into the application bundle; missing, misspelled, or wrongly typed values can change launch and permission behavior | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/Info.plist "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/Info.plist "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/Info.plist "Deep Dive") |
| `Podfile` | Configures CocoaPods dependencies and build integration for the iOS host | Platform versions, targets, build settings, and plugin pods must stay aligned with Flutter's generated iOS configuration | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/Podfile "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/Podfile "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/Podfile "Deep Dive") |
| Swift | Implements strongly typed native runner or plugin code using Apple frameworks | Concurrency, Objective-C visibility, optionals, ownership, and deployment availability shape the Flutter boundary | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/Swift "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/Swift "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/Swift "Deep Dive") |
| Objective-C | Implements native runner or plugin code through the Objective-C runtime and Apple frameworks | Header visibility, selectors, nullability, ownership, and Swift interoperability require explicit contracts | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/Objective-C "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/Objective-C "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/Objective-C "Deep Dive") |
| `UIViewController` | Owns an iOS view hierarchy and participates in presentation, containment, rotation, and appearance lifecycles | Flutter view controllers must remain correctly contained and UIKit work must occur on the main thread | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/UIViewController "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/UIViewController "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/UIViewController "Deep Dive") |
| `UIApplicationDelegate` | Defines process-level application lifecycle and system callback hooks | Which callbacks fire depends on enabled scenes, application state, iOS version, and system delivery rules | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/UIApplicationDelegate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/UIApplicationDelegate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/UIApplicationDelegate "Deep Dive") |
| URL schemes | Registers custom schemes and routes matching URLs into the application | Schemes are not globally unique, input is untrusted, and callback forwarding must preserve plugin or framework handlers | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/URL-schemes "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/URL-schemes "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/URL-schemes "Deep Dive") |
| Universal Links | Associates verified HTTPS domains with the application for web-to-app navigation | The app entitlement, hosted association file, domain paths, signing, and installed build must agree | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/Universal-Links "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/Universal-Links "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/Universal-Links "Deep Dive") |
| Entitlements | Declare signed capabilities granted to the application by Apple and the operating system | Provisioning profiles, bundle identifiers, targets, and enabled capabilities must match the signed entitlement set | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/Entitlements "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/Entitlements "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/Entitlements "Deep Dive") |
| Privacy descriptions | Explain protected-resource access in system permission prompts | Required usage-description keys must exist before protected APIs are accessed and should accurately describe user-facing purpose | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/iOS-Integration/Privacy-descriptions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/iOS-Integration/Privacy-descriptions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/iOS-Integration/Privacy-descriptions "Deep Dive") |

## Questions

- [What belongs in `AppDelegate`, and when should setup move elsewhere?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/What-belongs-in-AppDelegate%2C-and-when-should-setup-move-elsewhere%3F)
- [How does `SceneDelegate` change window and lifecycle handling?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/How-does-SceneDelegate-change-window-and-lifecycle-handling%3F)
- [Which application settings belong in `Info.plist`?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Which-application-settings-belong-in-Info.plist%3F)
- [How does the `Podfile` connect Flutter plugins and native dependencies to the iOS target?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/How-does-the-Podfile-connect-Flutter-plugins-and-native-dependencies-to-the-iOS-target%3F)
- [When should iOS integration code be written in Swift or Objective-C?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/When-should-iOS-integration-code-be-written-in-Swift-or-Objective-C%3F)
- [How do Swift and Objective-C expose APIs to each other in a mixed runner or plugin?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/How-do-Swift-and-Objective-C-expose-APIs-to-each-other-in-a-mixed-runner-or-plugin%3F)
- [How should native screens be presented from a Flutter-backed `UIViewController`?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/How-should-native-screens-be-presented-from-a-Flutter-backed-UIViewController%3F)
- [Which lifecycle responsibilities remain on `UIApplicationDelegate` when scenes are enabled?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Which-lifecycle-responsibilities-remain-on-UIApplicationDelegate-when-scenes-are-enabled%3F)
- [How does an incoming custom URL scheme reach Flutter navigation or a plugin?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/How-does-an-incoming-custom-URL-scheme-reach-Flutter-navigation-or-a-plugin%3F)
- [Why can a Universal Link open a website instead of the installed application?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Why-can-a-Universal-Link-open-a-website-instead-of-the-installed-application%3F)
- [What is the difference between an entitlement and an `Info.plist` key?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/What-is-the-difference-between-an-entitlement-and-an-Info.plist-key%3F)
- [Which protected APIs require privacy usage descriptions?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Which-protected-APIs-require-privacy-usage-descriptions%3F)
- [Where should plugins be registered when the application creates a custom Flutter engine?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Where-should-plugins-be-registered-when-the-application-creates-a-custom-Flutter-engine%3F)
- [How should incoming URLs and user activities be forwarded without bypassing existing handlers?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/How-should-incoming-URLs-and-user-activities-be-forwarded-without-bypassing-existing-handlers%3F)

## Best Practices

- [Keep `AppDelegate` focused on process-level startup and callback coordination](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Keep-AppDelegate-focused-on-process-level-startup-and-callback-coordination)
- [Put per-window state and scene lifecycle work in `SceneDelegate` when scenes are enabled](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Put-per-window-state-and-scene-lifecycle-work-in-SceneDelegate-when-scenes-are-enabled)
- [Treat `Info.plist` values as reviewed, typed application configuration](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Treat-Info.plist-values-as-reviewed%2C-typed-application-configuration)
- [Keep the iOS deployment target consistent across Flutter, Xcode, CocoaPods, and dependencies](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Keep-the-iOS-deployment-target-consistent-across-Flutter%2C-Xcode%2C-CocoaPods%2C-and-dependencies)
- [Prefer small native adapters with explicit data and error contracts](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Prefer-small-native-adapters-with-explicit-data-and-error-contracts)
- [Annotate nullability and interoperability boundaries in mixed Swift and Objective-C code](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Annotate-nullability-and-interoperability-boundaries-in-mixed-Swift-and-Objective-C-code)
- [Perform UIKit presentation and view-controller containment on the main thread](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Perform-UIKit-presentation-and-view-controller-containment-on-the-main-thread)
- [Forward lifecycle callbacks to Flutter and plugins before adding app-specific branching](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Forward-lifecycle-callbacks-to-Flutter-and-plugins-before-adding-app-specific-branching)
- [Validate and normalize incoming URLs before using their parameters](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Validate-and-normalize-incoming-URLs-before-using-their-parameters)
- [Test Universal Links from a signed, installed build against the production association file](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Test-Universal-Links-from-a-signed%2C-installed-build-against-the-production-association-file)
- [Grant only the entitlements required by the target's actual capabilities](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Grant-only-the-entitlements-required-by-the-target's-actual-capabilities)
- [Write specific, user-facing privacy descriptions that match the feature requesting access](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Write-specific%2C-user-facing-privacy-descriptions-that-match-the-feature-requesting-access)
- [Test cold start, warm resume, backgrounding, scene reconnection, and terminated-state routing](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Test-cold-start%2C-warm-resume%2C-backgrounding%2C-scene-reconnection%2C-and-terminated-state-routing)
- [Verify release signing and archived application configuration, not only debug behavior](https://app.syntblaze.com/qsp/flutter/Platform-Integration/iOS-Integration/Verify-release-signing-and-archived-application-configuration%2C-not-only-debug-behavior)

[< Back to platform integration](../README.md)
