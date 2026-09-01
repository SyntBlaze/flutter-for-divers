# Platform Views

Platform views embed host-platform UI inside a Flutter interface. Flutter
creates and lays out a Dart-side widget, while the Android, iOS, or web
embedding owns the corresponding native view or HTML element. That boundary
lets an application reuse platform controls and third-party SDK views, but it
also introduces another lifecycle, composition path, input system, and
accessibility tree.

```text
Flutter widget tree
        |
        +--> `AndroidView` / `UiKitView` / `HtmlElementView`
        |                    or `PlatformViewLink`
        |                              |
        v                              v
 layout, paint order, semantics   create / resize / dispose
        |                              |
        +----------> platform-view controller
                              |
                              v
                   engine and platform embedding
                              |
              +---------------+----------------+
              |                                |
              v                                v
       native host view                 browser element
              |
       hybrid composition or texture-backed composition

Pointer events -> Flutter gesture arena -> accepted gestures -> host view
```

The embedded surface is not an ordinary Flutter render object. Its pixels may
be composited through a native hierarchy or an intermediate texture, and its
gestures may compete with surrounding Flutter recognizers before reaching the
host control. Creation, resizing, clipping, transforms, focus, semantics, and
disposal therefore need to be tested on each target platform and composition
mode rather than inferred from a visually similar Flutter widget.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Views) — Focused, bite-sized article covering Platform Views
- [Learning Path](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Views) — Step-by-step material that builds practical Platform Views knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Views) — Structured, in-depth material for learning about Platform Views thoroughly

## Embedding APIs and Composition

| Topic | Primary responsibility | Boundary or constraint | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `AndroidView` | Embeds a view produced by an Android platform-view factory in the Flutter widget tree | The registered view type, creation parameters, composition mode, Android API support, gestures, and native lifecycle must agree | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Views/AndroidView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Views/AndroidView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Views/AndroidView "Deep Dive") |
| `UiKitView` | Embeds a UIKit view produced by an iOS platform-view factory | UIKit view creation and interaction remain native, while Flutter controls layout and participates in gesture arbitration | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Views/UiKitView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Views/UiKitView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Views/UiKitView "Deep Dive") |
| `PlatformViewLink` | Connects a platform-view controller to a Flutter surface with explicit creation and surface-factory callbacks | The caller must coordinate controller initialization, surface construction, focus, gestures, and disposal | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Views/PlatformViewLink "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Views/PlatformViewLink "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Views/PlatformViewLink "Deep Dive") |
| `HtmlElementView` | Inserts a registered HTML element into a Flutter web interface | DOM lifecycle, CSS, browser events, accessibility, stacking, and renderer behavior cross the Flutter/DOM boundary | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Views/HtmlElementView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Views/HtmlElementView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Views/HtmlElementView "Deep Dive") |
| Hybrid composition | Places an Android platform view in the native view hierarchy and composes Flutter around it | Native fidelity improves, but Flutter rendering and platform-view composition can add copying, synchronization, and frame costs | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Views/Hybrid-composition "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Views/Hybrid-composition "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Views/Hybrid-composition "Deep Dive") |
| Texture layer | Presents a platform view through a texture-backed composition path | Transforms and Flutter composition can be more flexible, while surface types, accessibility, scrolling, and frame delivery may impose limitations | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Views/Texture-layer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Views/Texture-layer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Views/Texture-layer "Deep Dive") |
| Gesture recognizers | Decide which pointer sequences Flutter claims and which are forwarded to an embedded platform view | Gesture-arena timing, recognizer sets, native event handling, and parent scrollables determine the interaction users observe | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Views/Gesture-recognizers "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Views/Gesture-recognizers "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Views/Gesture-recognizers "Deep Dive") |
| Performance tradeoffs | Balance native-view capability against creation, composition, rasterization, memory, and interaction costs | Results vary by platform, OS version, renderer, view type, layout, animation, and composition mode, so representative measurement is required | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Views/Performance-tradeoffs "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Views/Performance-tradeoffs "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Views/Performance-tradeoffs "Deep Dive") |

## Questions

- [When should an Android integration use `AndroidView`?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/When-should-an-Android-integration-use-AndroidView%3F)
- [How is a `UiKitView` created, laid out, and disposed on iOS?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/How-is-a-UiKitView-created%2C-laid-out%2C-and-disposed-on-iOS%3F)
- [When is `PlatformViewLink` preferable to a platform-specific convenience widget?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/When-is-PlatformViewLink-preferable-to-a-platform-specific-convenience-widget%3F)
- [How does `HtmlElementView` interact with the DOM and Flutter's web renderer?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/How-does-HtmlElementView-interact-with-the-DOM-and-Flutter's-web-renderer%3F)
- [What does hybrid composition change in the Android view hierarchy and rendering path?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/What-does-hybrid-composition-change-in-the-Android-view-hierarchy-and-rendering-path%3F)
- [How does a texture-backed platform view differ from one composed in the native hierarchy?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/How-does-a-texture-backed-platform-view-differ-from-one-composed-in-the-native-hierarchy%3F)
- [Which gestures should be claimed by Flutter and which should reach the embedded view?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Which-gestures-should-be-claimed-by-Flutter-and-which-should-reach-the-embedded-view%3F)
- [Why can a platform view affect frame time even when its Dart widget does not rebuild?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Why-can-a-platform-view-affect-frame-time-even-when-its-Dart-widget-does-not-rebuild%3F)
- [Can Flutter widgets paint, clip, or receive input above an embedded platform view?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Can-Flutter-widgets-paint%2C-clip%2C-or-receive-input-above-an-embedded-platform-view%3F)
- [How should creation parameters and platform-view type identifiers be versioned?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/How-should-creation-parameters-and-platform-view-type-identifiers-be-versioned%3F)
- [What happens to focus, semantics, and accessibility at the Flutter/native boundary?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/What-happens-to-focus%2C-semantics%2C-and-accessibility-at-the-Flutter%2Fnative-boundary%3F)
- [How should platform views behave inside scrolling, transformed, or animated layouts?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/How-should-platform-views-behave-inside-scrolling%2C-transformed%2C-or-animated-layouts%3F)
- [When is a Flutter-rendered alternative a better choice than embedding native UI?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/When-is-a-Flutter-rendered-alternative-a-better-choice-than-embedding-native-UI%3F)

## Best Practices

- [Use a platform view only when the native or browser surface provides capability worth the integration cost](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Use-a-platform-view-only-when-the-native-or-browser-surface-provides-capability-worth-the-integration-cost)
- [Keep platform-view type identifiers and creation-parameter schemas stable and explicitly versioned](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Keep-platform-view-type-identifiers-and-creation-parameter-schemas-stable-and-explicitly-versioned)
- [Create the native view lazily and release controllers, handlers, observers, and resources when it is disposed](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Create-the-native-view-lazily-and-release-controllers%2C-handlers%2C-observers%2C-and-resources-when-it-is-disposed)
- [Choose the Android composition mode from documented functional requirements and measured performance](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Choose-the-Android-composition-mode-from-documented-functional-requirements-and-measured-performance)
- [Test texture-backed composition with the exact native view types the application embeds](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Test-texture-backed-composition-with-the-exact-native-view-types-the-application-embeds)
- [Declare gesture recognizers narrowly so embedded views and surrounding Flutter controls cooperate predictably](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Declare-gesture-recognizers-narrowly-so-embedded-views-and-surrounding-Flutter-controls-cooperate-predictably)
- [Test taps, drags, long presses, multi-touch, nested scrolling, and gesture cancellation](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Test-taps%2C-drags%2C-long-presses%2C-multi-touch%2C-nested-scrolling%2C-and-gesture-cancellation)
- [Avoid placing many simultaneously active platform views in scrolling or frequently rebuilt collections](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Avoid-placing-many-simultaneously-active-platform-views-in-scrolling-or-frequently-rebuilt-collections)
- [Keep platform-view widgets stable across rebuilds and avoid unnecessary native view recreation](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Keep-platform-view-widgets-stable-across-rebuilds-and-avoid-unnecessary-native-view-recreation)
- [Measure build, raster, platform-thread, memory, and input behavior on representative physical devices](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Measure-build%2C-raster%2C-platform-thread%2C-memory%2C-and-input-behavior-on-representative-physical-devices)
- [Verify clipping, opacity, transforms, overlays, keyboard focus, and text input on every supported platform](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Verify-clipping%2C-opacity%2C-transforms%2C-overlays%2C-keyboard-focus%2C-and-text-input-on-every-supported-platform)
- [Provide coherent semantics and focus traversal across Flutter and native accessibility trees](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Provide-coherent-semantics-and-focus-traversal-across-Flutter-and-native-accessibility-trees)
- [Sanitize and constrain data passed into browser elements or native view factories](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Sanitize-and-constrain-data-passed-into-browser-elements-or-native-view-factories)
- [Exercise creation failure, backgrounding, route removal, hot restart, and engine detachment](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Views/Exercise-creation-failure%2C-backgrounding%2C-route-removal%2C-hot-restart%2C-and-engine-detachment)

[< Back to platform integration](../README.md)
