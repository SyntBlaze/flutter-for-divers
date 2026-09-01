# Gesture Recognition

Gesture recognition turns low-level pointer sequences into semantic interactions
such as taps, long presses, drags, and scales. Recognizers track the pointers
they care about, interpret movement and timing, and compete in the gesture arena
when several interpretations are possible for the same input.

```text
PointerEvent sequence from hit-test dispatch
                    |
                    v
        GestureRecognizer adds pointer routes
                    |
                    v
      recognizers track movement and timing
                    |
                    v
              gesture arena
           / reject       accept \
          v                     v
losing recognizers       winning recognizer
clean up state           invokes gesture callbacks

Widgets: GestureDetector -> RawGestureDetector -> recognizers
```

`GestureDetector` provides convenient callbacks and constructs the usual set of
recognizers. `RawGestureDetector` exposes recognizer factories when an
interaction needs custom composition or lifecycle control. Recognizers normally
join an arena for each pointer sequence; the arena delays commitment until the
available evidence can disambiguate competing gestures, while a
`GestureArenaTeam` can coordinate recognizers that should compete together.
Child and ancestor detectors can both enter the same arena, and tree ancestry
does not grant the parent recognizer priority.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition) — Focused, bite-sized article covering Gesture Recognition
- [Learning Path](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition) — Step-by-step material that builds practical Gesture Recognition knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition) — Structured, in-depth material for learning about Gesture Recognition thoroughly

## Gesture Recognition Topics

| Topic | Primary role | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `GestureRecognizer` | Defines the base lifecycle for interpreting pointer events as gestures | Dispose recognizers so their routes and arena state do not outlive their owner | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureRecognizer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureRecognizer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureRecognizer "Deep Dive") |
| `OneSequenceGestureRecognizer` | Tracks one or more pointers that contribute to a single gesture sequence | Stop tracking every pointer and reset state when the sequence ends | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/OneSequenceGestureRecognizer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/OneSequenceGestureRecognizer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/OneSequenceGestureRecognizer "Deep Dive") |
| `PrimaryPointerGestureRecognizer` | Bases recognition on one primary pointer with movement and deadline checks | Configure tolerances and deadlines to match the intended interaction | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/PrimaryPointerGestureRecognizer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/PrimaryPointerGestureRecognizer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/PrimaryPointerGestureRecognizer "Deep Dive") |
| `TapGestureRecognizer` | Recognizes a short press-and-release without excessive movement | Final tap acceptance waits for competing gestures to be resolved | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/TapGestureRecognizer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/TapGestureRecognizer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/TapGestureRecognizer "Deep Dive") |
| `LongPressGestureRecognizer` | Recognizes a pointer held beyond a deadline | Preserve cancellation behavior when movement or another recognizer wins | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/LongPressGestureRecognizer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/LongPressGestureRecognizer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/LongPressGestureRecognizer "Deep Dive") |
| `DragGestureRecognizer` | Provides the shared machinery for directional and pan drags | Slop, velocity, axis, and multitouch strategy affect recognition | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/DragGestureRecognizer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/DragGestureRecognizer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/DragGestureRecognizer "Deep Dive") |
| `ScaleGestureRecognizer` | Recognizes scale, rotation, and multi-pointer translation | Handle pointer-count changes without introducing abrupt transform jumps | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/ScaleGestureRecognizer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/ScaleGestureRecognizer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/ScaleGestureRecognizer "Deep Dive") |
| Gesture arena | Arbitrates recognizers that compete for the same pointer sequence | Joining the arena does not mean the recognizer has won | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Gesture-arena "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Gesture-arena "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Gesture-arena "Deep Dive") |
| `GestureArenaManager` | Adds members and resolves, closes, holds, or sweeps arenas | Arena lifecycle must follow pointer routing and sequence completion | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureArenaManager "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureArenaManager "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureArenaManager "Deep Dive") |
| `GestureArenaMember` | Receives acceptance or rejection from arena arbitration | Both outcomes must leave the recognizer in a consistent state | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureArenaMember "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureArenaMember "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureArenaMember "Deep Dive") |
| `GestureArenaTeam` | Coordinates multiple recognizers as one competing group | Use teams only when recognizers are intended to cooperate | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureArenaTeam "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureArenaTeam "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureArenaTeam "Deep Dive") |
| Gesture disambiguation | Delays commitment until competing interpretations can be resolved | Design overlapping gestures so users receive predictable results | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Gesture-disambiguation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Gesture-disambiguation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Gesture-disambiguation "Deep Dive") |
| `GestureDetector` | Exposes common semantic gesture callbacks as a widget | Callback combinations determine which recognizers enter the arena | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureDetector "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureDetector "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/GestureDetector "Deep Dive") |
| `RawGestureDetector` | Builds a configurable set of recognizers from factories | Factories must update and dispose recognizer instances correctly | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/RawGestureDetector "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/RawGestureDetector "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/RawGestureDetector "Deep Dive") |

## Questions

- [What responsibilities belong to the `GestureRecognizer` base class?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/What-responsibilities-belong-to-the-GestureRecognizer-base-class%3F)
- [How does a `OneSequenceGestureRecognizer` know when to reset?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/How-does-a-OneSequenceGestureRecognizer-know-when-to-reset%3F)
- [Why does a primary-pointer recognizer use deadlines and movement tolerances?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Why-does-a-primary-pointer-recognizer-use-deadlines-and-movement-tolerances%3F)
- [When does `TapGestureRecognizer` invoke its callbacks?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/When-does-TapGestureRecognizer-invoke-its-callbacks%3F)
- [What can cause a pending long press to be rejected?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/What-can-cause-a-pending-long-press-to-be-rejected%3F)
- [How do drag slop and velocity influence drag recognition?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/How-do-drag-slop-and-velocity-influence-drag-recognition%3F)
- [How does scale recognition combine multiple pointer positions?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/How-does-scale-recognition-combine-multiple-pointer-positions%3F)
- [Why can several recognizers join the same gesture arena?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Why-can-several-recognizers-join-the-same-gesture-arena%3F)
- [When does `GestureArenaManager` close or sweep an arena?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/When-does-GestureArenaManager-close-or-sweep-an-arena%3F)
- [How should a `GestureArenaMember` respond to rejection?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/How-should-a-GestureArenaMember-respond-to-rejection%3F)
- [When should recognizers share a `GestureArenaTeam`?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/When-should-recognizers-share-a-GestureArenaTeam%3F)
- [How does Flutter disambiguate a tap from a drag or long press?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/How-does-Flutter-disambiguate-a-tap-from-a-drag-or-long-press%3F)
- [How do `GestureDetector` callbacks determine the installed recognizers?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/How-do-GestureDetector-callbacks-determine-the-installed-recognizers%3F)
- [When is `RawGestureDetector` preferable to `GestureDetector`?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/When-is-RawGestureDetector-preferable-to-GestureDetector%3F)
- [Why does a parent `GestureDetector` not automatically win over a child?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Why-does-a-parent-GestureDetector-not-automatically-win-over-a-child%3F)

## Best Practices

- [Prefer semantic gesture callbacks over raw pointer handling for application interactions](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Prefer-semantic-gesture-callbacks-over-raw-pointer-handling-for-application-interactions)
- [Dispose recognizers owned outside the normal widget-managed lifecycle](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Dispose-recognizers-owned-outside-the-normal-widget-managed-lifecycle)
- [Release pointer routes and reset sequence state on completion or cancellation](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Release-pointer-routes-and-reset-sequence-state-on-completion-or-cancellation)
- [Use movement tolerances and deadlines appropriate to the gesture](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Use-movement-tolerances-and-deadlines-appropriate-to-the-gesture)
- [Do not perform tap actions before the recognizer has won when they conflict with other gestures](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Do-not-perform-tap-actions-before-the-recognizer-has-won-when-they-conflict-with-other-gestures)
- [Provide immediate visual feedback without treating it as final gesture acceptance](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Provide-immediate-visual-feedback-without-treating-it-as-final-gesture-acceptance)
- [Keep high-frequency drag update callbacks lightweight](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Keep-high-frequency-drag-update-callbacks-lightweight)
- [Make scale updates robust to pointers joining or leaving the gesture](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Make-scale-updates-robust-to-pointers-joining-or-leaving-the-gesture)
- [Let the gesture arena resolve competition instead of manually racing callbacks](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Let-the-gesture-arena-resolve-competition-instead-of-manually-racing-callbacks)
- [Handle both acceptance and rejection as normal recognizer lifecycle outcomes](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Handle-both-acceptance-and-rejection-as-normal-recognizer-lifecycle-outcomes)
- [Use a `GestureArenaTeam` only for deliberate recognizer cooperation](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Use-a-GestureArenaTeam-only-for-deliberate-recognizer-cooperation)
- [Avoid overlapping gesture definitions whose outcome is surprising or inaccessible](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Avoid-overlapping-gesture-definitions-whose-outcome-is-surprising-or-inaccessible)
- [Use `GestureDetector` for standard tap, press, drag, and scale interactions](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Use-GestureDetector-for-standard-tap%2C-press%2C-drag%2C-and-scale-interactions)
- [Use `RawGestureDetector` when recognizer factories or custom recognizers are required](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Use-RawGestureDetector-when-recognizer-factories-or-custom-recognizers-are-required)
- [Test gesture competition, cancellation, multitouch, and supported device kinds](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Gesture-Recognition/Test-gesture-competition%2C-cancellation%2C-multitouch%2C-and-supported-device-kinds)

[< Back to hit testing & input dispatch](../README.md)
