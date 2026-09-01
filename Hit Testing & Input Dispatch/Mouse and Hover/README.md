# Mouse and Hover

Mouse and hover handling turns pointer locations into region transitions,
hover callbacks, and cursor updates. `MouseTracker` compares the annotations
under each connected mouse with those found previously, while `MouseRegion`
provides the widget-level API for reacting to that state.

```text
mouse position or rendered-region change
                  |
                  v
             MouseTracker
                  |
          hit-test annotations
                  |
       +----------+-----------+
       |          |           |
       v          v           v
 PointerExit  hover update  PointerEnter
       |          |           |
       +----------+-----------+
                  |
                  v
       choose the active Cursor
                  |
                  v
         platform mouse cursor
```

Unlike a touch sequence, hover can change without a button press. Moving the
mouse, adding or removing a device, or changing the rendered regions beneath a
stationary pointer can alter the active annotation path. Enter and exit events
describe changes to that path; hover callbacks describe movement within it;
and cursor candidates are resolved from the annotations under the pointer.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover) — Focused, bite-sized article covering Mouse and Hover
- [Learning Path](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover) — Step-by-step material that builds practical Mouse and Hover knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover) — Structured, in-depth material for learning about Mouse and Hover thoroughly

## Mouse and Hover Topics

| Topic | Primary role | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `MouseTracker` | Tracks connected mouse devices and the annotations beneath each pointer | Region changes can follow pointer movement or a changed render tree | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/MouseTracker "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/MouseTracker "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/MouseTracker "Deep Dive") |
| `MouseTrackerAnnotation` | Describes mouse enter, exit, and cursor behavior attached to a render region | Annotation identity and validity affect transition and cursor resolution | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/MouseTrackerAnnotation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/MouseTrackerAnnotation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/MouseTrackerAnnotation "Deep Dive") |
| `MouseRegion` | Exposes hover, enter, exit, cursor, opacity, and hit-test behavior as a widget | Use it for mouse-specific region behavior rather than gesture competition | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/MouseRegion "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/MouseRegion "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/MouseRegion "Deep Dive") |
| Hover state | Represents whether and where a pointer is moving without an active contact sequence | Keep visual hover feedback synchronized with enter, hover, and exit events | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Hover-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Hover-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Hover-state "Deep Dive") |
| `Cursor` | Defines the cursor request contributed by a mouse-tracked region | Nested regions may contribute competing cursor candidates | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Cursor "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Cursor "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Cursor "Deep Dive") |
| `SystemMouseCursor` | Names a cursor shape supplied by the host platform | Choose a shape that communicates the interaction consistently | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/SystemMouseCursor "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/SystemMouseCursor "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/SystemMouseCursor "Deep Dive") |
| `PointerEnterEvent` | Reports that a pointer has entered a tracked region | It is synthesized from changes in the tracked annotation path | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/PointerEnterEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/PointerEnterEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/PointerEnterEvent "Deep Dive") |
| `PointerExitEvent` | Reports that a pointer has left a tracked region | Cleanup must also handle exits caused by region removal or invalidation | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/PointerExitEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/PointerExitEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/PointerExitEvent "Deep Dive") |

## Questions

- [How does `MouseTracker` detect changes beneath a stationary pointer?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/How-does-MouseTracker-detect-changes-beneath-a-stationary-pointer%3F)
- [What information does a `MouseTrackerAnnotation` contribute?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/What-information-does-a-MouseTrackerAnnotation-contribute%3F)
- [When should `MouseRegion` be used instead of a gesture recognizer?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/When-should-MouseRegion-be-used-instead-of-a-gesture-recognizer%3F)
- [How should hover state be entered, updated, and cleared?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/How-should-hover-state-be-entered%2C-updated%2C-and-cleared%3F)
- [How is the cursor selected when mouse regions overlap?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/How-is-the-cursor-selected-when-mouse-regions-overlap%3F)
- [Which `SystemMouseCursor` best communicates a clickable or resizable region?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Which-SystemMouseCursor-best-communicates-a-clickable-or-resizable-region%3F)
- [Why can a `PointerEnterEvent` occur without a button press?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Why-can-a-PointerEnterEvent-occur-without-a-button-press%3F)
- [When can a `PointerExitEvent` be caused by a render-tree change?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/When-can-a-PointerExitEvent-be-caused-by-a-render-tree-change%3F)
- [How do opacity and hit testing affect nested mouse regions?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/How-do-opacity-and-hit-testing-affect-nested-mouse-regions%3F)
- [How are hover callbacks related to pointer enter and exit transitions?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/How-are-hover-callbacks-related-to-pointer-enter-and-exit-transitions%3F)

## Best Practices

- [Use `MouseRegion` for hover feedback and cursor selection](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Use-MouseRegion-for-hover-feedback-and-cursor-selection)
- [Treat hover as optional enhancement rather than the only way to reveal an action](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Treat-hover-as-optional-enhancement-rather-than-the-only-way-to-reveal-an-action)
- [Keep hover callbacks lightweight because pointer movement can be frequent](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Keep-hover-callbacks-lightweight-because-pointer-movement-can-be-frequent)
- [Clear transient visual state when a tracked region receives an exit](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Clear-transient-visual-state-when-a-tracked-region-receives-an-exit)
- [Expect geometry and render-tree changes to update the annotation path](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Expect-geometry-and-render-tree-changes-to-update-the-annotation-path)
- [Choose cursors that match the interaction users can actually perform](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Choose-cursors-that-match-the-interaction-users-can-actually-perform)
- [Prefer platform cursor constants for familiar interaction cues](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Prefer-platform-cursor-constants-for-familiar-interaction-cues)
- [Keep overlapping regions' opacity behavior deliberate](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Keep-overlapping-regions'-opacity-behavior-deliberate)
- [Avoid using mouse-only behavior as a substitute for keyboard and touch access](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Avoid-using-mouse-only-behavior-as-a-substitute-for-keyboard-and-touch-access)
- [Test enter, hover, exit, cursor, and region-removal behavior on desktop and web](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Mouse-and-Hover/Test-enter%2C-hover%2C-exit%2C-cursor%2C-and-region-removal-behavior-on-desktop-and-web)

[< Back to hit testing & input dispatch](../README.md)
