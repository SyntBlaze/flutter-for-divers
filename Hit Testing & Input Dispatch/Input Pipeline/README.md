# Input Pipeline

Flutter's input pipeline turns device-level pointer samples from the engine into
framework `PointerEvent` objects that can be hit tested and dispatched. The
pipeline preserves pointer identity, device kind, buttons, positions, deltas,
timestamps, and signal data while converting physical-pixel input into the
logical coordinate system used by the render tree.

```text
platform input
      |
      v
engine -> PointerDataPacket -> PointerData
      |
      v
PointerEvent conversion
      |
      +-> PointerAddedEvent / PointerHoverEvent / PointerSignalEvent
      +-> PointerDownEvent -> PointerMoveEvent -> PointerUpEvent
      +-> PointerCancelEvent
      |
      v
GestureBinding.handlePointerEvent()
      |
      +-> hit test and retain the pointer's hit-test path
      |
      v
GestureBinding.dispatchEvent()
      |
      +-> hit-test targets, pointer routes, and gesture recognition
```

`GestureBinding` is the framework bridge for pointer input. It expands a
`PointerDataPacket` into typed events, queues them when event processing is
locked, performs or reuses the appropriate hit test, and dispatches each event
to the targets on the resulting path. Down events establish the path used by
later move and up events for that pointer, so dispatch stays coherent even when
the pointer moves outside the originally hit render object.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline) — Focused, bite-sized article covering Input Pipeline
- [Learning Path](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline) — Step-by-step material that builds practical Input Pipeline knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline) — Structured, in-depth material for learning about Input Pipeline thoroughly

## Input Pipeline Topics

| Topic | Place in the pipeline | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `PointerDataPacket` | Carries a batch of raw pointer records from the engine | A packet can contain multiple changes that must be processed in order | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerDataPacket "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerDataPacket "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerDataPacket "Deep Dive") |
| `PointerData` | Describes one engine-level pointer change | Coordinates arrive in physical pixels and require view-aware conversion | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerData "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerData "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerData "Deep Dive") |
| `PointerEvent` | Provides the immutable base representation for framework pointer input | Pointer, device, view, kind, buttons, and transform data give an event its context | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerEvent "Deep Dive") |
| `PointerAddedEvent` | Announces that a pointing device has become available | Device availability does not mean that a button is pressed | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerAddedEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerAddedEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerAddedEvent "Deep Dive") |
| `PointerDownEvent` | Starts contact or a pressed-button sequence | The down event establishes the hit-test path for the pointer sequence | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerDownEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerDownEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerDownEvent "Deep Dive") |
| `PointerMoveEvent` | Reports position or button-state changes during an active sequence | Consume logical deltas without assuming every hardware sample becomes one event | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerMoveEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerMoveEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerMoveEvent "Deep Dive") |
| `PointerUpEvent` | Ends an active contact or pressed-button sequence | Dispatch completes along the path retained from the down event | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerUpEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerUpEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerUpEvent "Deep Dive") |
| `PointerCancelEvent` | Terminates a sequence that cannot complete normally | Receivers should release transient state just as reliably as on pointer up | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerCancelEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerCancelEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerCancelEvent "Deep Dive") |
| `PointerSignalEvent` | Represents a discrete signal rather than a contact sequence | Signal events use arbitration that is separate from the gesture arena | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerSignalEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerSignalEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerSignalEvent "Deep Dive") |
| `PointerScrollEvent` | Carries scroll-wheel or trackpad scroll deltas | Scroll delta direction and magnitude should remain platform-appropriate | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerScrollEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerScrollEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerScrollEvent "Deep Dive") |
| `PointerHoverEvent` | Reports movement without an active contact or pressed button | Hover-capable devices can update targets without starting a gesture | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerHoverEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerHoverEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/PointerHoverEvent "Deep Dive") |
| `GestureBinding` | Connects engine pointer packets to framework hit testing and dispatch | Applications normally use widgets and recognizers instead of invoking binding internals | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/GestureBinding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/GestureBinding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/GestureBinding "Deep Dive") |
| `handlePointerEvent()` | Accepts a framework event into the binding's processing pipeline | Pointer-event locking can defer handling while preserving event order | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/handlePointerEvent-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/handlePointerEvent-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/handlePointerEvent-method "Deep Dive") |
| `dispatchEvent()` | Delivers an event through its hit-test result and pointer routing | Dispatch order and transforms come from the recorded hit-test path | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/dispatchEvent-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/dispatchEvent-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/dispatchEvent-method "Deep Dive") |

## Questions

- [How does a platform pointer sample enter the Flutter framework?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/How-does-a-platform-pointer-sample-enter-the-Flutter-framework%3F)
- [Why can one packet contain several pointer changes?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Why-can-one-packet-contain-several-pointer-changes%3F)
- [Which raw fields are carried by `PointerData`?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Which-raw-fields-are-carried-by-PointerData%3F)
- [When are physical coordinates converted to logical coordinates?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/When-are-physical-coordinates-converted-to-logical-coordinates%3F)
- [Which properties are shared by all pointer events?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Which-properties-are-shared-by-all-pointer-events%3F)
- [How are pointer identifiers different from device identifiers?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/How-are-pointer-identifiers-different-from-device-identifiers%3F)
- [What does device addition mean before a pointer goes down?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/What-does-device-addition-mean-before-a-pointer-goes-down%3F)
- [Why does a down event establish a hit-test path?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Why-does-a-down-event-establish-a-hit-test-path%3F)
- [How are move events delivered after the pointer leaves its original target?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/How-are-move-events-delivered-after-the-pointer-leaves-its-original-target%3F)
- [When is a sequence finished by up rather than cancel?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/When-is-a-sequence-finished-by-up-rather-than-cancel%3F)
- [How should transient interaction state respond to cancellation?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/How-should-transient-interaction-state-respond-to-cancellation%3F)
- [How do pointer signals differ from pointer contact sequences?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/How-do-pointer-signals-differ-from-pointer-contact-sequences%3F)
- [Where are scroll deltas represented?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Where-are-scroll-deltas-represented%3F)
- [How does hover input reach the object currently under a mouse?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/How-does-hover-input-reach-the-object-currently-under-a-mouse%3F)
- [What input responsibilities belong to `GestureBinding`?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/What-input-responsibilities-belong-to-GestureBinding%3F)
- [What happens when pointer-event processing is locked?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/What-happens-when-pointer-event-processing-is-locked%3F)
- [How does dispatch use transforms stored in hit-test entries?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/How-does-dispatch-use-transforms-stored-in-hit-test-entries%3F)
- [Which events reuse the hit-test result created on pointer down?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Which-events-reuse-the-hit-test-result-created-on-pointer-down%3F)

## Best Practices

- [Use `Listener` or gesture widgets instead of subscribing to engine packets directly](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Use-Listener-or-gesture-widgets-instead-of-subscribing-to-engine-packets-directly)
- [Preserve packet and event ordering throughout custom input integrations](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Preserve-packet-and-event-ordering-throughout-custom-input-integrations)
- [Convert physical coordinates with the correct view configuration](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Convert-physical-coordinates-with-the-correct-view-configuration)
- [Use event positions and deltas in their documented coordinate spaces](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Use-event-positions-and-deltas-in-their-documented-coordinate-spaces)
- [Do not treat device addition as the start of a gesture](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Do-not-treat-device-addition-as-the-start-of-a-gesture)
- [Initialize pointer-sequence state on down](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Initialize-pointer-sequence-state-on-down)
- [Keep high-frequency move handling lightweight](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Keep-high-frequency-move-handling-lightweight)
- [Release pressed and drag state on both up and cancel](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Release-pressed-and-drag-state-on-both-up-and-cancel)
- [Do not send additional sequence work after a pointer has ended](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Do-not-send-additional-sequence-work-after-a-pointer-has-ended)
- [Handle signal events independently from contact gestures](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Handle-signal-events-independently-from-contact-gestures)
- [Respect platform conventions when interpreting scroll deltas](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Respect-platform-conventions-when-interpreting-scroll-deltas)
- [Avoid making hover the only way to reveal essential actions](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Avoid-making-hover-the-only-way-to-reveal-essential-actions)
- [Let `GestureBinding` retain and reuse hit-test paths for active pointers](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Let-GestureBinding-retain-and-reuse-hit-test-paths-for-active-pointers)
- [Avoid calling pointer lifecycle handlers directly in normal application code](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Avoid-calling-pointer-lifecycle-handlers-directly-in-normal-application-code)
- [Keep hit-test target event handlers fast and free of reentrant dispatch](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Keep-hit-test-target-event-handlers-fast-and-free-of-reentrant-dispatch)
- [Test touch, mouse, stylus, trackpad, and cancellation paths as applicable](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Input-Pipeline/Test-touch%2C-mouse%2C-stylus%2C-trackpad%2C-and-cancellation-paths-as-applicable)

[< Back to hit testing & input dispatch](../README.md)
