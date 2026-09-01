# Gestures

Flutter turns device input into interaction in layers. Pointer events describe
physical contact or mouse movement, hit testing selects render objects under a
pointer, and gesture recognizers interpret an event sequence as a tap, drag,
scale, or other semantic gesture. Widgets such as `GestureDetector` and
`InkWell` configure recognizers; `Listener` stays at the lower pointer-event
layer.

```text
PointerDownEvent
       |
       v
hit test -> stable hit-test path for the pointer sequence
       |                         |
       |                         +-> Listener callbacks
       v
recognizers join the gesture arena
       |
 move / up / cancel events
       |
       v
accept or reject -> arena winner -> gesture callbacks
```

Hit testing and arena arbitration answer different questions. Hit testing
determines which targets receive a pointer sequence; the gesture arena resolves
competing interpretations of that sequence. Changing a detector's hit-test
behavior can change whether it participates, but it does not make its recognizer
automatically defeat an overlapping or ancestral recognizer. Hover events do not
form a contact sequence and therefore do not use the gesture arena in the same
way.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures) — Focused, bite-sized article covering Gestures
- [Learning Path](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures) — Step-by-step material that builds practical Gestures knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures) — Structured, in-depth material for learning about Gestures thoroughly

## Gesture Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `GestureDetector` | Configures semantic gesture recognizers from callback properties | Its `behavior` affects hit-test participation, while arena rules still decide which competing recognizer wins | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/GestureDetector "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/GestureDetector "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/GestureDetector "Deep Dive") |
| `InkWell` | Recognizes Material gestures and paints ink reactions | Provide a `Material` ancestor and use it when visual feedback and Material semantics are part of the interaction | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/InkWell "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/InkWell "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/InkWell "Deep Dive") |
| `Listener` | Receives low-level pointer down, move, up, cancel, and signal events | Use it only when raw pointer data matters; it does not recognize taps or arbitrate semantic gestures | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/Listener "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/Listener "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/Listener "Deep Dive") |
| `MouseRegion` | Tracks hover entry, exit, movement, and mouse cursor state | Hover has no pressed pointer sequence, so keep hover affordances separate from activation behavior | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/MouseRegion "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/MouseRegion "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/MouseRegion "Deep Dive") |
| `AbsorbPointer` | Makes itself a hit-test target while preventing its subtree from receiving pointer input | Use it to block interaction without removing the subtree from layout or paint | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/AbsorbPointer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/AbsorbPointer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/AbsorbPointer "Deep Dive") |
| `IgnorePointer` | Removes itself and its subtree from pointer hit testing | Input can reach eligible widgets visually behind the ignored subtree | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/IgnorePointer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/IgnorePointer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/IgnorePointer "Deep Dive") |
| Tap gesture | Recognizes a short press and release without disqualifying movement | Treat tap-down as provisional because cancellation or a competing recognizer can prevent tap completion | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/Tap-gesture "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/Tap-gesture "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/Tap-gesture "Deep Dive") |
| Double tap gesture | Recognizes two taps that satisfy timing and spatial constraints | Coordinate it deliberately with single-tap behavior so the first tap does not trigger an unintended action | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/Double-tap-gesture "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/Double-tap-gesture "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/Double-tap-gesture "Deep Dive") |
| Long press gesture | Recognizes a pointer held past a deadline without excessive movement | Provide cancellation-safe feedback because movement, pointer cancellation, or another recognizer can end the attempt | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/Long-press-gesture "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/Long-press-gesture "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/Long-press-gesture "Deep Dive") |
| Pan gesture | Tracks unconstrained two-dimensional movement from a pointer | Do not register pan together with horizontal or vertical drag callbacks on the same detector | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/Pan-gesture "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/Pan-gesture "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/Pan-gesture "Deep Dive") |
| Scale gesture | Reports focal-point movement, scale, and rotation across one or more pointers | Derive each frame from gesture-start state to avoid compounding scale or rotation errors | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/Scale-gesture "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/Scale-gesture "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/Scale-gesture "Deep Dive") |
| Drag gesture | Recognizes directional or unconstrained movement after a touch-slop threshold | Choose the recognizer whose axis matches the interaction and nearby scrollables | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/Drag-gesture "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/Drag-gesture "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/Drag-gesture "Deep Dive") |
| Gesture arena | Arbitrates when multiple recognizers track the same pointer | Recognizers must accept or reject cleanly; one winner prevents ambiguous gesture callbacks | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/Gesture-arena "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/Gesture-arena "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/Gesture-arena "Deep Dive") |
| Hit testing | Builds the ordered path of targets under a pointer | Size, position, paint transforms, clipping, and hit-test behavior determine participation before recognition begins | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Gestures/Hit-testing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Gestures/Hit-testing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Gestures/Hit-testing "Deep Dive") |

## Questions

- [When should an interaction use `GestureDetector` rather than `Listener`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/When-should-an-interaction-use-GestureDetector-rather-than-Listener%3F)
- [Why can an `InkWell` recognize taps but show no visible splash?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Why-can-an-InkWell-recognize-taps-but-show-no-visible-splash%3F)
- [Does receiving a pointer event through `Listener` mean a gesture recognizer will win?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Does-receiving-a-pointer-event-through-Listener-mean-a-gesture-recognizer-will-win%3F)
- [How should hover styling coexist with touch and keyboard activation?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/How-should-hover-styling-coexist-with-touch-and-keyboard-activation%3F)
- [When should blocked content use `AbsorbPointer` instead of `IgnorePointer`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/When-should-blocked-content-use-AbsorbPointer-instead-of-IgnorePointer%3F)
- [Can input pass through an `IgnorePointer` subtree to content behind it?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Can-input-pass-through-an-IgnorePointer-subtree-to-content-behind-it%3F)
- [Why can tap-down occur without a later tap callback?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Why-can-tap-down-occur-without-a-later-tap-callback%3F)
- [How do single-tap and double-tap recognition interact?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/How-do-single-tap-and-double-tap-recognition-interact%3F)
- [What cancels a pending long press?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/What-cancels-a-pending-long-press%3F)
- [How does a pan recognizer differ from horizontal and vertical drag recognizers?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/How-does-a-pan-recognizer-differ-from-horizontal-and-vertical-drag-recognizers%3F)
- [How should scale, focal-point translation, and rotation update a transform?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/How-should-scale%2C-focal-point-translation%2C-and-rotation-update-a-transform%3F)
- [Why can a drag conflict with a parent or child scrollable?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Why-can-a-drag-conflict-with-a-parent-or-child-scrollable%3F)
- [How does the gesture arena choose among recognizers tracking one pointer?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/How-does-the-gesture-arena-choose-among-recognizers-tracking-one-pointer%3F)
- [Why does changing `HitTestBehavior` not force a detector to win the arena?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Why-does-changing-HitTestBehavior-not-force-a-detector-to-win-the-arena%3F)

## Best Practices

- [Prefer semantic gesture callbacks over raw pointer handling for taps, presses, and drags](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Prefer-semantic-gesture-callbacks-over-raw-pointer-handling-for-taps%2C-presses%2C-and-drags)
- [Give every interactive target adequate size, semantics, focus behavior, and visible feedback](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Give-every-interactive-target-adequate-size%2C-semantics%2C-focus-behavior%2C-and-visible-feedback)
- [Keep pointer callbacks lightweight and release pointer-specific state on cancel](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Keep-pointer-callbacks-lightweight-and-release-pointer-specific-state-on-cancel)
- [Use hover as an enhancement, never as the only way to reveal or activate essential behavior](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Use-hover-as-an-enhancement%2C-never-as-the-only-way-to-reveal-or-activate-essential-behavior)
- [Choose `AbsorbPointer` and `IgnorePointer` from the desired hit-test result, not just their visual similarity](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Choose-AbsorbPointer-and-IgnorePointer-from-the-desired-hit-test-result%2C-not-just-their-visual-similarity)
- [Delay irreversible work until a tap is confirmed](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Delay-irreversible-work-until-a-tap-is-confirmed)
- [Make double-tap actions discoverable and provide a non-timing-dependent alternative](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Make-double-tap-actions-discoverable-and-provide-a-non-timing-dependent-alternative)
- [Expose progress or cancellation feedback for long-press interactions](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Expose-progress-or-cancellation-feedback-for-long-press-interactions)
- [Choose axis-specific drag recognition when the interaction has a single intended direction](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Choose-axis-specific-drag-recognition-when-the-interaction-has-a-single-intended-direction)
- [Preserve a transform's gesture-start values when applying scale and rotation updates](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Preserve-a-transform's-gesture-start-values-when-applying-scale-and-rotation-updates)
- [Let recognizers resolve ambiguity through the arena instead of duplicating behavior in raw pointer callbacks](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Let-recognizers-resolve-ambiguity-through-the-arena-instead-of-duplicating-behavior-in-raw-pointer-callbacks)
- [Test nested detectors, overlapping targets, scrollables, and cancelled pointer sequences](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Test-nested-detectors%2C-overlapping-targets%2C-scrollables%2C-and-cancelled-pointer-sequences)
- [Verify gestures with touch, mouse, trackpad, stylus, keyboard alternatives, and accessibility services](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Gestures/Verify-gestures-with-touch%2C-mouse%2C-trackpad%2C-stylus%2C-keyboard-alternatives%2C-and-accessibility-services)

[< Back to forms input & gestures](../README.md)
