# Pointer Dispatch

Pointer dispatch delivers an already-normalized `PointerEvent` to interested
framework and widget-layer consumers. Flutter first walks the event's stored hit
test path, giving each target an opportunity to handle the event, while the
`PointerRouter` separately notifies routes registered for a pointer identifier
and any global routes. Pointer signals use an additional resolver so competing
handlers can agree which one consumes a signal such as a scroll-wheel event.

```text
PointerEvent + hit test path
             |
             +-> dispatch along path -> target handlers
             |                          (Listener, render objects)
             |
             +-> PointerRouter -> pointer-specific routes
             |                 -> global routes
             |
             +-> pointer signal handlers -> PointerSignalResolver -> winner

Widget participation: Listener / AbsorbPointer / IgnorePointer
```

Dispatch along a hit test path is often described as bubbling, but Flutter does
not implement DOM-style capture and bubble phases: entries are visited in path
order and return values do not stop propagation. `AbsorbPointer` and
`IgnorePointer` influence which objects enter the hit test path, while pointer
cancellation closes an active sequence when normal completion is no longer
possible.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch) — Focused, bite-sized article covering Pointer Dispatch
- [Learning Path](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch) — Step-by-step material that builds practical Pointer Dispatch knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch) — Structured, in-depth material for learning about Pointer Dispatch thoroughly

## Pointer Dispatch Topics

| Topic | Primary role | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `PointerRouter` | Maintains pointer-specific and global callback routes | Add and remove routes with matching pointer identifiers and callbacks | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/PointerRouter "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/PointerRouter "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/PointerRouter "Deep Dive") |
| Pointer route | Receives events associated with one pointer identifier | A route observes a sequence without replacing hit-test-path dispatch | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-route "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-route "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-route "Deep Dive") |
| Global pointer route | Receives routed events regardless of pointer identifier | Keep global observation lightweight and unregister it when no longer needed | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Global-pointer-route "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Global-pointer-route "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Global-pointer-route "Deep Dive") |
| Pointer event bubbling | Delivers an event to every target recorded in its hit test path | Flutter's path traversal is not a cancellable DOM bubbling phase | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-event-bubbling "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-event-bubbling "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-event-bubbling "Deep Dive") |
| Pointer event cancellation | Terminates a pointer sequence that cannot finish with a normal up event | Release pointer-specific state and gesture resources on cancellation | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-event-cancellation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-event-cancellation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-event-cancellation "Deep Dive") |
| Pointer signal resolution | Selects one handler when multiple hit targets respond to a signal | Register a candidate during dispatch and resolve only the accepted handler | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-signal-resolution "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-signal-resolution "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Pointer-signal-resolution "Deep Dive") |
| `PointerSignalResolver` | Coordinates competing pointer-signal callbacks | Resolution applies to signals such as scrolling rather than contact sequences | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/PointerSignalResolver "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/PointerSignalResolver "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/PointerSignalResolver "Deep Dive") |
| `Listener` | Exposes low-level pointer callbacks in the widget tree | Use it when raw pointer events are required instead of semantic gestures | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Listener "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Listener "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Listener "Deep Dive") |
| `AbsorbPointer` | Hit-tests itself while preventing its subtree from receiving pointer events | Use it to block interaction without removing the subtree from layout and paint | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/AbsorbPointer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/AbsorbPointer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/AbsorbPointer "Deep Dive") |
| `IgnorePointer` | Removes itself and its subtree from pointer hit testing | Events may reach content visually behind the ignored subtree | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/IgnorePointer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/IgnorePointer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/IgnorePointer "Deep Dive") |

## Questions

- [How does `PointerRouter` differ from dispatch through a hit test path?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/How-does-PointerRouter-differ-from-dispatch-through-a-hit-test-path%3F)
- [When is a pointer-specific route called?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/When-is-a-pointer-specific-route-called%3F)
- [What events does a global pointer route observe?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/What-events-does-a-global-pointer-route-observe%3F)
- [Does a handler stop Flutter's pointer event bubbling by returning a value?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Does-a-handler-stop-Flutter's-pointer-event-bubbling-by-returning-a-value%3F)
- [Why can an active pointer sequence end with cancellation instead of an up event?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Why-can-an-active-pointer-sequence-end-with-cancellation-instead-of-an-up-event%3F)
- [Why do pointer signals need resolution between competing handlers?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Why-do-pointer-signals-need-resolution-between-competing-handlers%3F)
- [How does `PointerSignalResolver` choose the callback that handles a signal?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/How-does-PointerSignalResolver-choose-the-callback-that-handles-a-signal%3F)
- [When should a widget use `Listener` instead of `GestureDetector`?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/When-should-a-widget-use-Listener-instead-of-GestureDetector%3F)
- [How does `AbsorbPointer` affect hit testing and its descendants?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/How-does-AbsorbPointer-affect-hit-testing-and-its-descendants%3F)
- [How does `IgnorePointer` allow targets behind it to be hit?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/How-does-IgnorePointer-allow-targets-behind-it-to-be-hit%3F)
- [Which dispatch mechanisms operate on the hit test path and which use registered routes?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Which-dispatch-mechanisms-operate-on-the-hit-test-path-and-which-use-registered-routes%3F)
- [Why should cancellation cleanup be idempotent?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Why-should-cancellation-cleanup-be-idempotent%3F)

## Best Practices

- [Prefer gesture recognizers when application behavior is expressed as taps, drags, or scales](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Prefer-gesture-recognizers-when-application-behavior-is-expressed-as-taps%2C-drags%2C-or-scales)
- [Use `Listener` only for behavior that genuinely needs raw pointer events](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Use-Listener-only-for-behavior-that-genuinely-needs-raw-pointer-events)
- [Remove pointer routes when their owner is disposed or the sequence ends](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Remove-pointer-routes-when-their-owner-is-disposed-or-the-sequence-ends)
- [Keep global pointer routes short-lived, lightweight, and side-effect aware](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Keep-global-pointer-routes-short-lived%2C-lightweight%2C-and-side-effect-aware)
- [Do not assume that handling an event stops delivery to later hit test entries](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Do-not-assume-that-handling-an-event-stops-delivery-to-later-hit-test-entries)
- [Clear pressed, dragging, and capture-like state when a pointer is cancelled](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Clear-pressed%2C-dragging%2C-and-capture-like-state-when-a-pointer-is-cancelled)
- [Register pointer-signal candidates through the resolver instead of making every target act](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Register-pointer-signal-candidates-through-the-resolver-instead-of-making-every-target-act)
- [Use `AbsorbPointer` when the blocking widget should remain the hit-test target](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Use-AbsorbPointer-when-the-blocking-widget-should-remain-the-hit-test-target)
- [Use `IgnorePointer` when the subtree should be absent from pointer hit testing](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Use-IgnorePointer-when-the-subtree-should-be-absent-from-pointer-hit-testing)
- [Test overlapping targets, cancellation, and scroll signals on representative input devices](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Pointer-Dispatch/Test-overlapping-targets%2C-cancellation%2C-and-scroll-signals-on-representative-input-devices)

[< Back to hit testing & input dispatch](../README.md)
