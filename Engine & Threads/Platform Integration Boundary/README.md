# Platform Integration Boundary

Flutter's platform integration boundary connects the engine and Dart framework
to the host operating system and application. The embedder supplies platform
services and lifecycle signals, while platform channels, messengers, and
plugins carry typed or binary requests across the Dart-native boundary.
Engine callbacks then deliver input, accessibility, text, view, and other host
events back toward the framework.

```text
host application / operating system
             |
             v
      embedder API -> Flutter Engine -> engine-to-framework callbacks
             |              ^                       |
             |              |                       v
             +-> platform views               Dart framework
             +-> text input                         ^
             +-> accessibility                      |
             +-> native plugins <-> BinaryMessenger / platform channels
```

The boundary is asynchronous and ownership-sensitive. A platform-channel call
does not imply that Dart and native code share memory, and a plugin callback is
not automatically safe on every thread. Integrations must respect platform
thread requirements, engine and view lifecycles, message ordering, codec
contracts, and the possibility that an engine detaches before pending work
completes.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Platform-Integration-Boundary) — Focused, bite-sized article covering Platform Integration Boundary
- [Learning Path](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Platform-Integration-Boundary) — Step-by-step material that builds practical Platform Integration Boundary knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Platform-Integration-Boundary) — Structured, in-depth material for learning about Platform Integration Boundary thoroughly

## Integration Components

| Topic | Primary responsibility | Boundary or constraint | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Embedder API | Lets a host application create, configure, drive, and destroy a Flutter engine | Surface, task-runner, locale, input, lifecycle, and callback contracts must match the embedding platform | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Embedder-API "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Embedder-API "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Embedder-API "Deep Dive") |
| Platform views | Compose native platform UI with Flutter-rendered content | Composition mode, clipping, transforms, input, accessibility, and lifecycle behavior vary by platform | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Platform-views "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Platform-views "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Platform-views "Deep Dive") |
| Text input bridge | Translates framework editing requests and host input-method events | Editing state, selection, composing ranges, focus, and keyboard visibility must stay synchronized | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Text-input-bridge "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Text-input-bridge "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Text-input-bridge "Deep Dive") |
| Accessibility bridge | Maps Flutter semantics to native accessibility services and returns accessibility actions | Semantics updates and actions must preserve identity, focus, geometry, and platform expectations | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Accessibility-bridge "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Accessibility-bridge "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Accessibility-bridge "Deep Dive") |
| Platform channels | Provide named, codec-based request, reply, and event conventions across Dart and native code | Both sides must agree on channel names, codecs, payload schemas, errors, and lifecycle behavior | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Platform-channels "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Platform-channels "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Platform-channels "Deep Dive") |
| `BinaryMessenger` | Routes raw byte messages and asynchronous replies between Dart and the platform side | Handler registration, reply completion, ordering, and isolate availability define the messaging contract | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Platform-Integration-Boundary/BinaryMessenger "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Platform-Integration-Boundary/BinaryMessenger "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Platform-Integration-Boundary/BinaryMessenger "Deep Dive") |
| Native plugin calls | Expose host APIs to Flutter through registered native implementations | Calls may require permissions, platform-thread affinity, lifecycle attachment, and explicit error mapping | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Native-plugin-calls "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Native-plugin-calls "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Native-plugin-calls "Deep Dive") |
| Engine-to-framework callbacks | Deliver engine-originated events such as frames, metrics, lifecycle, input, and platform messages to Dart | The binding stack normally owns low-level callbacks and translates them into framework behavior | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Engine-to-framework-callbacks "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Engine-to-framework-callbacks "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Platform-Integration-Boundary/Engine-to-framework-callbacks "Deep Dive") |

## Questions

- [What responsibilities are exposed through the embedder API?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/What-responsibilities-are-exposed-through-the-embedder-API%3F)
- [How does a host application create and shut down a Flutter engine safely?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/How-does-a-host-application-create-and-shut-down-a-Flutter-engine-safely%3F)
- [How are native platform views composed with Flutter content?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/How-are-native-platform-views-composed-with-Flutter-content%3F)
- [Why do platform views have platform-specific performance and composition tradeoffs?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Why-do-platform-views-have-platform-specific-performance-and-composition-tradeoffs%3F)
- [How do editing state and input-method events cross the text input bridge?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/How-do-editing-state-and-input-method-events-cross-the-text-input-bridge%3F)
- [How are Flutter semantics represented to native accessibility services?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/How-are-Flutter-semantics-represented-to-native-accessibility-services%3F)
- [What is the relationship between platform channels and `BinaryMessenger`?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/What-is-the-relationship-between-platform-channels-and-BinaryMessenger%3F)
- [How do method, event, and basic message channels differ?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/How-do-method%2C-event%2C-and-basic-message-channels-differ%3F)
- [Where are platform-channel codecs applied?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Where-are-platform-channel-codecs-applied%3F)
- [On which thread does a native plugin handler run?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/On-which-thread-does-a-native-plugin-handler-run%3F)
- [How should native failures be returned to Dart callers?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/How-should-native-failures-be-returned-to-Dart-callers%3F)
- [Which engine events become framework callbacks?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Which-engine-events-become-framework-callbacks%3F)
- [Can a background isolate use platform channels?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Can-a-background-isolate-use-platform-channels%3F)
- [What happens to an outstanding reply when an engine or plugin detaches?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/What-happens-to-an-outstanding-reply-when-an-engine-or-plugin-detaches%3F)

## Best Practices

- [Keep embedder policy thin and make ownership explicit](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Keep-embedder-policy-thin-and-make-ownership-explicit)
- [Treat engine, view, surface, and plugin attachment as separate lifecycles](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Treat-engine%2C-view%2C-surface%2C-and-plugin-attachment-as-separate-lifecycles)
- [Choose platform-view composition only after measuring on supported devices](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Choose-platform-view-composition-only-after-measuring-on-supported-devices)
- [Keep native view creation and disposal paired with Flutter widget lifecycle](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Keep-native-view-creation-and-disposal-paired-with-Flutter-widget-lifecycle)
- [Preserve selection and composing ranges when synchronizing text state](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Preserve-selection-and-composing-ranges-when-synchronizing-text-state)
- [Test text input with real keyboards, input methods, focus changes, and autofill](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Test-text-input-with-real-keyboards%2C-input-methods%2C-focus-changes%2C-and-autofill)
- [Keep semantics identifiers and focus behavior stable across updates](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Keep-semantics-identifiers-and-focus-behavior-stable-across-updates)
- [Test accessibility with each platform's native assistive technologies](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Test-accessibility-with-each-platform's-native-assistive-technologies)
- [Use stable channel names and version payload schemas deliberately](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Use-stable-channel-names-and-version-payload-schemas-deliberately)
- [Keep messages small and avoid unnecessary serialization across the boundary](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Keep-messages-small-and-avoid-unnecessary-serialization-across-the-boundary)
- [Complete every reply exactly once and handle engine detachment](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Complete-every-reply-exactly-once-and-handle-engine-detachment)
- [Move blocking native work off frame-critical threads while returning results on the required runner](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Move-blocking-native-work-off-frame-critical-threads-while-returning-results-on-the-required-runner)
- [Map permissions, cancellation, unavailable APIs, and native failures explicitly](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Map-permissions%2C-cancellation%2C-unavailable-APIs%2C-and-native-failures-explicitly)
- [Let Flutter's binding stack own low-level engine callbacks in ordinary applications](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Let-Flutter's-binding-stack-own-low-level-engine-callbacks-in-ordinary-applications)
- [Avoid overwriting global callback handlers installed by framework bindings](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Avoid-overwriting-global-callback-handlers-installed-by-framework-bindings)
- [Exercise integration tests on every supported host platform](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Platform-Integration-Boundary/Exercise-integration-tests-on-every-supported-host-platform)

[< Back to engine & threads](../README.md)
