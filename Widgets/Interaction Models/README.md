# Interaction Models

Flutter interaction widgets connect pointer input, gestures, drag-and-drop,
scrolling, and route transitions to application behavior. Some widgets compete
in the gesture arena to recognize an interaction, while lower-level listeners
report raw pointer events without recognizing gestures. Others control whether
a subtree can be hit tested, add Material ink reactions, or coordinate an
interaction that spans distant parts of the widget tree.

```text
pointer event
    |
    +-- Listener / MouseRegion ---------> raw pointer or hover callbacks
    +-- GestureDetector ----------------> gesture recognizers
    +-- InkWell / InkResponse ----------> gestures + Material ink reaction
    +-- Draggable ----------------------> DragTarget
    +-- Scrollable ---------------------> scroll position and viewport
    +-- Navigator <---------------------> routes, overlays, and Hero flights
```

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models) — Focused, bite-sized article covering Interaction Models
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models) — Step-by-step material that builds practical Interaction Models knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models) — Structured, in-depth material for learning about Interaction Models thoroughly

## Selection and Composition Guidance

Start with the highest-level widget that expresses the intended behavior. Use
`GestureDetector` for semantic gestures such as taps, long presses, pans, and
scales; use `Listener` only when raw pointer phases, buttons, or device details
matter. In a Material surface, prefer `InkWell` for a rectangular ripple and
`InkResponse` for a more configurable ink response. The ink widget must have a
`Material` ancestor, and opaque content between it and that ancestor can hide
the splash.

Use `AbsorbPointer` when the subtree itself should win hit testing but neither
it nor widgets behind it should receive pointer events. Use `IgnorePointer`
when the subtree should be absent from pointer hit testing, which can allow an
eligible widget behind it to receive the event. Compose `Draggable` or
`LongPressDraggable` with `DragTarget` for application-level drag-and-drop;
keep payload types specific and provide clear visual feedback for every drag
state. `Dismissible` is the specialized choice for swipe-to-remove behavior,
and `InteractiveViewer` is the specialized choice for pan-and-zoom content.

Use `Scrollable` only when building custom scrolling behavior; `ListView`,
`GridView`, and `CustomScrollView` are usually better starting points. Use
`Navigator` to manage route history and overlays, and place matching `Hero`
widgets on source and destination routes for shared-element transitions. Avoid
stacking several gesture recognizers for the same interaction unless their
gesture-arena behavior is deliberate.

## Interaction Model Widgets

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `AbsorbPointer` | Prevents its subtree from receiving pointer events while still participating in hit testing | It also prevents hit-tested widgets behind the absorbing region from receiving the pointer | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/AbsorbPointer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/AbsorbPointer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/AbsorbPointer "Deep Dive") |
| `IgnorePointer` | Removes its subtree from pointer hit testing | Events may reach eligible widgets visually behind the ignored subtree, so confirm that pass-through is intended | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/IgnorePointer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/IgnorePointer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/IgnorePointer "Deep Dive") |
| `GestureDetector` | Recognizes high-level taps, presses, drags, pans, and scales | Competing recognizers resolve through the gesture arena; choose callbacks and hit-test behavior deliberately | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/GestureDetector "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/GestureDetector "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/GestureDetector "Deep Dive") |
| `InkWell` | Adds rectangular Material touch feedback and gesture callbacks | Provide a `Material` ancestor and ensure intervening painting does not obscure the ink reaction | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/InkWell "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/InkWell "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/InkWell "Deep Dive") |
| `InkResponse` | Adds configurable Material ink reactions that need not be rectangular | Configure containment, radius, shape, and highlight behavior to match the interactive surface | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/InkResponse "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/InkResponse "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/InkResponse "Deep Dive") |
| `Listener` | Reports low-level pointer down, move, up, hover, signal, and cancellation events | Prefer gesture recognizers for semantic interactions and avoid treating pointer sequences as device-independent gestures yourself | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/Listener "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/Listener "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/Listener "Deep Dive") |
| `MouseRegion` | Tracks mouse and stylus hover, enter, exit, and cursor state | Hover is not available on every device, so never make it the only path to essential behavior | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/MouseRegion "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/MouseRegion "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/MouseRegion "Deep Dive") |
| `Dismissible` | Lets a list item be dismissed by dragging it along an allowed axis | Give items stable unique keys and coordinate confirmation, removal, undo, and list-state updates | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/Dismissible "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/Dismissible "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/Dismissible "Deep Dive") |
| `Draggable` | Starts drag-and-drop immediately from a pointer gesture | Keep the typed payload minimal and design `feedback` and `childWhenDragging` for clear state communication | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/Draggable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/Draggable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/Draggable "Deep Dive") |
| `LongPressDraggable` | Starts drag-and-drop after a long press | Use it when immediate dragging would conflict with scrolling or ordinary taps, and make activation discoverable | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/LongPressDraggable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/LongPressDraggable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/LongPressDraggable "Deep Dive") |
| `DragTarget` | Accepts typed payloads from compatible draggable widgets | Validate candidates before acceptance and keep hover feedback distinct from the committed drop result | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/DragTarget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/DragTarget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/DragTarget "Deep Dive") |
| `InteractiveViewer` | Enables panning, scaling, and optional boundary-constrained exploration of a child | Set scale and boundary limits intentionally and provide alternatives when gestures are not discoverable or accessible | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/InteractiveViewer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/InteractiveViewer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/InteractiveViewer "Deep Dive") |
| `Scrollable` | Coordinates gesture-driven scrolling with a scroll position and viewport builder | It is a low-level primitive; use a scroll view unless custom viewport composition or physics are required | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/Scrollable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/Scrollable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/Scrollable "Deep Dive") |
| `Navigator` | Manages a stack of routes and presents route transitions and overlays | Keep route ownership, nested navigator boundaries, back behavior, and state restoration explicit | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/Navigator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/Navigator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/Navigator "Deep Dive") |
| `Hero` | Animates a shared visual element between routes | Source and destination tags must match and be unique within each route's relevant navigator subtree | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Interaction-Models/Hero "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Interaction-Models/Hero "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Interaction-Models/Hero "Deep Dive") |

## Questions

- [When should blocked input be absorbed instead of allowed to pass through the subtree?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/When-should-blocked-input-be-absorbed-instead-of-allowed-to-pass-through-the-subtree%3F)
- [When is pointer pass-through behind a disabled or decorative region desirable?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/When-is-pointer-pass-through-behind-a-disabled-or-decorative-region-desirable%3F)
- [How do nested gesture recognizers compete in Flutter's gesture arena?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/How-do-nested-gesture-recognizers-compete-in-Flutter's-gesture-arena%3F)
- [Why can a Material ink splash be missing or clipped unexpectedly?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Why-can-a-Material-ink-splash-be-missing-or-clipped-unexpectedly%3F)
- [When does an interactive surface need `InkResponse` rather than `InkWell`?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/When-does-an-interactive-surface-need-InkResponse-rather-than-InkWell%3F)
- [Which interactions genuinely require raw pointer events instead of recognized gestures?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Which-interactions-genuinely-require-raw-pointer-events-instead-of-recognized-gestures%3F)
- [How should hover affordances degrade on touch-only and keyboard-driven devices?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/How-should-hover-affordances-degrade-on-touch-only-and-keyboard-driven-devices%3F)
- [How should dismissal confirmation, item removal, and undo stay consistent?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/How-should-dismissal-confirmation%2C-item-removal%2C-and-undo-stay-consistent%3F)
- [What feedback should an immediately draggable item show during a drag?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/What-feedback-should-an-immediately-draggable-item-show-during-a-drag%3F)
- [When does long-press activation avoid conflicts with tapping or scrolling?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/When-does-long-press-activation-avoid-conflicts-with-tapping-or-scrolling%3F)
- [How should a drop target distinguish candidate, rejected, and accepted payloads?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/How-should-a-drop-target-distinguish-candidate%2C-rejected%2C-and-accepted-payloads%3F)
- [Which pan, zoom, boundary, and accessibility constraints fit interactive content?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Which-pan%2C-zoom%2C-boundary%2C-and-accessibility-constraints-fit-interactive-content%3F)
- [When is the low-level `Scrollable` primitive warranted instead of a scroll view?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/When-is-the-low-level-Scrollable-primitive-warranted-instead-of-a-scroll-view%3F)
- [Where should route history and nested navigation state be owned?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Where-should-route-history-and-nested-navigation-state-be-owned%3F)
- [What tag and subtree rules make a shared-element transition unambiguous?](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/What-tag-and-subtree-rules-make-a-shared-element-transition-unambiguous%3F)

## Best Practices

- [Absorb input only when both the subtree and content behind it must be unavailable](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Absorb-input-only-when-both-the-subtree-and-content-behind-it-must-be-unavailable)
- [Use ignored hit testing only when pointer pass-through is safe and intentional](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Use-ignored-hit-testing-only-when-pointer-pass-through-is-safe-and-intentional)
- [Recognize semantic gestures at the narrowest useful subtree and account for gesture-arena competition](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Recognize-semantic-gestures-at-the-narrowest-useful-subtree-and-account-for-gesture-arena-competition)
- [Place Material ink responses on a visible `Material` surface with appropriate shape and clipping](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Place-Material-ink-responses-on-a-visible-Material-surface-with-appropriate-shape-and-clipping)
- [Use `InkResponse` when the response shape, containment, or radius needs explicit control](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Use-InkResponse-when-the-response-shape%2C-containment%2C-or-radius-needs-explicit-control)
- [Keep raw pointer handling device-aware and prefer gesture recognizers for common interactions](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Keep-raw-pointer-handling-device-aware-and-prefer-gesture-recognizers-for-common-interactions)
- [Treat hover as enhancement and pair it with touch, keyboard, and semantic access](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Treat-hover-as-enhancement-and-pair-it-with-touch%2C-keyboard%2C-and-semantic-access)
- [Give every dismissible item a stable key and update the backing collection when dismissal completes](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Give-every-dismissible-item-a-stable-key-and-update-the-backing-collection-when-dismissal-completes)
- [Use strongly typed, minimal drag payloads and provide clear drag feedback](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Use-strongly-typed%2C-minimal-drag-payloads-and-provide-clear-drag-feedback)
- [Choose long-press dragging where immediate drag recognition would conflict with another gesture](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Choose-long-press-dragging-where-immediate-drag-recognition-would-conflict-with-another-gesture)
- [Validate drag candidates before accepting them and expose useful target-state feedback](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Validate-drag-candidates-before-accepting-them-and-expose-useful-target-state-feedback)
- [Bound pan and scale behavior, and test it with touch, mouse, trackpad, and accessibility settings](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Bound-pan-and-scale-behavior%2C-and-test-it-with-touch%2C-mouse%2C-trackpad%2C-and-accessibility-settings)
- [Prefer established scroll views and reach for `Scrollable` only for custom mechanics](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Prefer-established-scroll-views-and-reach-for-Scrollable-only-for-custom-mechanics)
- [Define navigator boundaries and back behavior deliberately, including for nested navigation](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Define-navigator-boundaries-and-back-behavior-deliberately%2C-including-for-nested-navigation)
- [Use stable, route-local unique hero tags and keep source and destination visuals compatible](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Use-stable%2C-route-local-unique-hero-tags-and-keep-source-and-destination-visuals-compatible)
- [Make every interaction reachable without relying exclusively on pointer precision, hover, dragging, or animation](https://app.syntblaze.com/qsp/flutter/Widgets/Interaction-Models/Make-every-interaction-reachable-without-relying-exclusively-on-pointer-precision%2C-hover%2C-dragging%2C-or-animation)

[< Back to widgets](../README.md)
