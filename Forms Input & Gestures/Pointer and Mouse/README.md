# Pointer and Mouse

Flutter exposes pointer input at a lower level than semantic gestures. Raw
`PointerEvent` objects describe contact, movement, buttons, device kind, hover,
and discrete signals. Widgets such as `Listener` and `MouseRegion` expose these
details, while gesture recognizers interpret event streams as taps, drags,
scales, and other user intentions. Prefer gestures for ordinary interactions;
use raw events when the application genuinely needs device-level detail.

```text
touch, stylus, mouse, or trackpad
               |
               +-- contact: down -> move* -> up / cancel
               |                  |
               |                  +-> gesture recognizers
               |
               +-- hover / enter / exit -> hover state + cursor
               |
               +-- pointer signal -> wheel scroll or other discrete signal
               |
               +-- pan/zoom start -> update* -> end (trackpad)
                                  |
                                  v
                         hit testing and routing
                                  |
                         Listener / MouseRegion
```

A pointer-down event establishes the hit-test path used to route the rest of
that contact sequence, even if the pointer later moves outside the original
target. Raw events continue along that path and are not gesture-arena winners;
recognizers observe the stream separately and compete only when interpreting
it as a gesture. Hover, wheel, and trackpad behavior varies by device, operating
system, browser, and user settings, so mouse assumptions should not be applied
to every `PointerDeviceKind`.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse) — Focused, bite-sized article covering Pointer and Mouse
- [Learning Path](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse) — Step-by-step material that builds practical Pointer and Mouse knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse) — Structured, in-depth material for learning about Pointer and Mouse thoroughly

## Pointer and Mouse Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `PointerDownEvent` | Begins a pointer contact sequence and records position, device kind, buttons, and other raw details | The down-event hit test fixes the routing path for the subsequent contact stream; it does not mean a tap or drag has been recognized | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerDownEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerDownEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerDownEvent "Deep Dive") |
| `PointerMoveEvent` | Reports movement while a pointer remains in contact or has a pressed button | Use `localPosition` and `localDelta` in the receiver's coordinate space, and expect high-frequency events that should not trigger heavy synchronous work | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerMoveEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerMoveEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerMoveEvent "Deep Dive") |
| `PointerUpEvent` | Ends a pointer's contact after its final movement | Treat it as raw stream completion, not proof that a tap succeeded; a recognizer may already have accepted or rejected another gesture | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerUpEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerUpEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerUpEvent "Deep Dive") |
| `PointerCancelEvent` | Ends a stream when input is no longer directed to the application | Release transient state and resources just as reliably as on up, without interpreting cancellation as successful completion | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerCancelEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerCancelEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerCancelEvent "Deep Dive") |
| `PointerSignalEvent` | Base type for discrete signals such as scrolling and scroll-inertia cancellation | Signals are immediate and do not use the normal gesture arena; nested handlers may need `PointerSignalResolver` to select one consumer | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerSignalEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerSignalEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/PointerSignalEvent "Deep Dive") |
| Scroll wheel | Handles `PointerScrollEvent` data delivered through `Listener.onPointerSignal` | Prefer `Scrollable` for ordinary scrolling; custom code should use `scrollDelta`, resolve nested consumers, and test direction and magnitude on each platform | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Scroll-wheel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Scroll-wheel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Scroll-wheel "Deep Dive") |
| Hover state | Tracks enter, exit, and movement when a device can report a location without contact | Hover must remain an optional enhancement because touch devices usually have no persistent hover and accessibility input can produce atypical hover events | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Hover-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Hover-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Hover-state "Deep Dive") |
| Cursor | Selects a `MouseCursor` while a supported pointing device is over a region | Match the cursor to actual behavior, preserve usable non-pointer affordances, and understand how `MouseCursor.defer` and overlapping regions resolve | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Cursor "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Cursor "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Cursor "Deep Dive") |
| Trackpad gestures | Represents platform-provided pan, zoom, and rotation with pointer pan/zoom events or gesture recognizers | Do not assume a trackpad reports the same stream as a wheel or touch drag; support varies across desktop, web, hardware, and platform settings | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Trackpad-gestures "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Trackpad-gestures "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Trackpad-gestures "Deep Dive") |

## Questions

- [What information does a `PointerDownEvent` establish for the rest of a pointer sequence?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/What-information-does-a-PointerDownEvent-establish-for-the-rest-of-a-pointer-sequence%3F)
- [When should movement use global `delta` versus transformed `localDelta`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/When-should-movement-use-global-delta-versus-transformed-localDelta%3F)
- [Why is `PointerUpEvent` not equivalent to a recognized tap?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Why-is-PointerUpEvent-not-equivalent-to-a-recognized-tap%3F)
- [Which state must be cleared when a pointer stream is canceled?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Which-state-must-be-cleared-when-a-pointer-stream-is-canceled%3F)
- [How do immediate pointer signals differ from contact streams and gesture-arena recognition?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/How-do-immediate-pointer-signals-differ-from-contact-streams-and-gesture-arena-recognition%3F)
- [When should wheel input be left to a `Scrollable` instead of handled directly?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/When-should-wheel-input-be-left-to-a-Scrollable-instead-of-handled-directly%3F)
- [How should an interface behave when hover is unavailable?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/How-should-an-interface-behave-when-hover-is-unavailable%3F)
- [Which cursor communicates the control's real action without becoming its only affordance?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Which-cursor-communicates-the-control's-real-action-without-becoming-its-only-affordance%3F)
- [Why can a trackpad pan or pinch differ from both mouse-wheel input and a touchscreen gesture?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Why-can-a-trackpad-pan-or-pinch-differ-from-both-mouse-wheel-input-and-a-touchscreen-gesture%3F)

## Best Practices

- [Use gesture callbacks for semantic actions and raw pointer events only for device-level requirements](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Use-gesture-callbacks-for-semantic-actions-and-raw-pointer-events-only-for-device-level-requirements)
- [Track streams by pointer identifier when simultaneous pointers are possible](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Track-streams-by-pointer-identifier-when-simultaneous-pointers-are-possible)
- [Keep pointer callbacks lightweight and batch expensive visual work into the frame pipeline](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Keep-pointer-callbacks-lightweight-and-batch-expensive-visual-work-into-the-frame-pipeline)
- [Handle both up and cancel paths so pressed, dragged, or captured state cannot become stuck](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Handle-both-up-and-cancel-paths-so-pressed%2C-dragged%2C-or-captured-state-cannot-become-stuck)
- [Read local coordinates after transforms instead of applying global deltas blindly](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Read-local-coordinates-after-transforms-instead-of-applying-global-deltas-blindly)
- [Let standard scrollables handle wheel input unless custom behavior is essential](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Let-standard-scrollables-handle-wheel-input-unless-custom-behavior-is-essential)
- [Resolve competing pointer-signal consumers rather than allowing nested handlers to react twice](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Resolve-competing-pointer-signal-consumers-rather-than-allowing-nested-handlers-to-react-twice)
- [Treat hover and cursors as enhancements, never as the only way to discover or operate a control](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Treat-hover-and-cursors-as-enhancements%2C-never-as-the-only-way-to-discover-or-operate-a-control)
- [Use familiar platform cursors and verify overlapping `MouseRegion` behavior](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Use-familiar-platform-cursors-and-verify-overlapping-MouseRegion-behavior)
- [Test mouse, touch, stylus, wheel, and trackpad paths independently on supported platforms](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Test-mouse%2C-touch%2C-stylus%2C-wheel%2C-and-trackpad-paths-independently-on-supported-platforms)
- [Include keyboard and accessibility alternatives for every essential pointer-driven action](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Pointer-and-Mouse/Include-keyboard-and-accessibility-alternatives-for-every-essential-pointer-driven-action)

[< Back to forms input & gestures](../README.md)
