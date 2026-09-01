# Dialogs and Overlays

Flutter can place transient UI above a page through several ownership models.
Dialogs, modal bottom sheets, and popup menus are route-backed surfaces: their
helpers push specialized routes onto a selected `Navigator`. A persistent bottom
sheet belongs to a `Scaffold`, a `SnackBar` is coordinated by a
`ScaffoldMessenger`, and a raw `OverlayEntry` belongs to the `Overlay` into which
it was inserted. Choosing the correct owner determines stacking, dismissal,
back-button behavior, focus, and whether the surface survives navigation.

```text
app
|
+-- root Navigator
|   \-- Overlay
|       +-- page route
|       +-- modal barrier
|       \-- dialog / modal sheet / popup route
|
+-- nested Navigator
|   \-- Overlay ---- route-backed surface shown in the nested flow
|
+-- ScaffoldMessenger ---- queues SnackBars for descendant Scaffolds
|   \-- Scaffold ---------- renders SnackBar and owns persistent bottom sheet
|
\-- selected Overlay ------ owns manually inserted OverlayEntry instances
```

The `BuildContext` passed to a helper selects an ancestor. For route-backed
surfaces, choose deliberately between the nearest navigator and the root
navigator with `useRootNavigator`; this is especially important inside tabs,
shells, and other nested navigation. For scaffold-backed surfaces, the context
must be below the intended `Scaffold` or `ScaffoldMessenger`. A context does not
own the surface itself, and it must not be used after its widget has unmounted.

Modal surfaces normally combine content with a barrier that blocks interaction
with routes underneath. Dismissal by tapping that barrier is separate from
system-back dismissal and from an explicit result returned by `Navigator.pop`.
Define each path intentionally, preserve or restore focus, label barriers and
controls for assistive technology, and test keyboard traversal, large text,
screen readers, and nested-navigator behavior.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Dialogs-and-Overlays) — Focused, bite-sized article covering Dialogs and Overlays
- [Learning Path](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Dialogs-and-Overlays) — Step-by-step material that builds practical Dialogs and Overlays knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Dialogs-and-Overlays) — Structured, in-depth material for learning about Dialogs and Overlays thoroughly

## Dialogs and Overlays Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `showDialog` | Pushes a dialog route and returns a future completed with its result | It uses the root navigator by default; choose `useRootNavigator`, barrier dismissal, focus traversal, safe-area behavior, and accessible labels deliberately | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showDialog "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showDialog "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showDialog "Deep Dive") |
| `showModalBottomSheet` | Pushes a modal bottom-sheet route above the current flow | It uses the nearest navigator by default; configure the target navigator, dismiss and drag behavior, height and scrolling, focus, and barrier semantics together | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showModalBottomSheet "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showModalBottomSheet "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showModalBottomSheet "Deep Dive") |
| `showBottomSheet` | Shows a persistent bottom sheet owned by the nearest `Scaffold` | Its `PersistentBottomSheetController` controls updates and closing; it is scaffold-backed and participates in local route history rather than pushing a new navigator route | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showBottomSheet "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showBottomSheet "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showBottomSheet "Deep Dive") |
| `showMenu` | Pushes an anchored popup-menu route and returns the selected value | Compute a stable position, select the correct navigator, restore focus to the opener, and distinguish cancellation from selection | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showMenu "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showMenu "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/showMenu "Deep Dive") |
| `Overlay` | Hosts entries painted above ordinary descendants | Resolve the intended overlay—root or nearest—and remember that clipping, lookup scope, and nested navigators affect where an entry can appear | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Overlay "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Overlay "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Overlay "Deep Dive") |
| `OverlayEntry` | Describes manually inserted overlay content | Keep explicit ownership of insertion, rebuilds, removal, and disposal; prevent orphaned entries and avoid `maintainState` unless hidden content truly must stay alive | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/OverlayEntry "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/OverlayEntry "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/OverlayEntry "Deep Dive") |
| `SnackBar` routing context | Routes transient messages through a `ScaffoldMessenger` to an eligible descendant `Scaffold` | Use the intended messenger scope so messages survive the right navigation transitions, and avoid presenting through stale or unrelated contexts | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/SnackBar-routing-context "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/SnackBar-routing-context "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/SnackBar-routing-context "Deep Dive") |
| Modal barrier | Blocks and optionally dismisses interaction behind modal content | Pair visual obscuring with correct pointer blocking, dismissal semantics, labels, and focus containment; never rely on opacity alone | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Modal-barrier "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Modal-barrier "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Modal-barrier "Deep Dive") |

## Questions

- [Which `Navigator` receives a dialog inside a nested navigation flow?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Which-Navigator-receives-a-dialog-inside-a-nested-navigation-flow%3F)
- [How do modal and persistent bottom sheets differ in ownership and back-stack behavior?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/How-do-modal-and-persistent-bottom-sheets-differ-in-ownership-and-back-stack-behavior%3F)
- [When should a modal bottom sheet target the root navigator?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/When-should-a-modal-bottom-sheet-target-the-root-navigator%3F)
- [How should an anchored menu handle positioning, cancellation, and focus restoration?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/How-should-an-anchored-menu-handle-positioning%2C-cancellation%2C-and-focus-restoration%3F)
- [When is a raw `OverlayEntry` more appropriate than a route-backed surface?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/When-is-a-raw-OverlayEntry-more-appropriate-than-a-route-backed-surface%3F)
- [Which overlay should host an entry inside nested navigators?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Which-overlay-should-host-an-entry-inside-nested-navigators%3F)
- [Why can the same `SnackBar` call appear in a different scaffold or fail after navigation?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Why-can-the-same-SnackBar-call-appear-in-a-different-scaffold-or-fail-after-navigation%3F)
- [What is the difference between barrier-tap dismissal, system back, and an explicit pop result?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/What-is-the-difference-between-barrier-tap-dismissal%2C-system-back%2C-and-an-explicit-pop-result%3F)
- [How should modal content trap, traverse, and restore keyboard focus?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/How-should-modal-content-trap%2C-traverse%2C-and-restore-keyboard-focus%3F)
- [Which semantics must remain available when content behind a modal is blocked?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Which-semantics-must-remain-available-when-content-behind-a-modal-is-blocked%3F)

## Best Practices

- [Choose the nearest or root navigator explicitly for every route-backed transient surface in nested navigation](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Choose-the-nearest-or-root-navigator-explicitly-for-every-route-backed-transient-surface-in-nested-navigation)
- [Treat barrier dismissal, drag dismissal, system back, and programmatic dismissal as separate decisions](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Treat-barrier-dismissal%2C-drag-dismissal%2C-system-back%2C-and-programmatic-dismissal-as-separate-decisions)
- [Return typed results from dialogs, sheets, and menus and handle cancellation as a valid outcome](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Return-typed-results-from-dialogs%2C-sheets%2C-and-menus-and-handle-cancellation-as-a-valid-outcome)
- [Use `showBottomSheet` only when the sheet should remain owned by the current `Scaffold`](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Use-showBottomSheet-only-when-the-sheet-should-remain-owned-by-the-current-Scaffold)
- [Insert raw entries into the intended overlay and keep one clear owner responsible for removing and disposing them](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Insert-raw-entries-into-the-intended-overlay-and-keep-one-clear-owner-responsible-for-removing-and-disposing-them)
- [Prefer route-backed APIs when navigation history, modal semantics, focus scope, and result futures are desired](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Prefer-route-backed-APIs-when-navigation-history%2C-modal-semantics%2C-focus-scope%2C-and-result-futures-are-desired)
- [Use a deliberately scoped `ScaffoldMessenger` for messages that should survive route transitions](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Use-a-deliberately-scoped-ScaffoldMessenger-for-messages-that-should-survive-route-transitions)
- [Check `context.mounted` after asynchronous gaps before finding a navigator, scaffold, or messenger](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Check-context.mounted-after-asynchronous-gaps-before-finding-a-navigator%2C-scaffold%2C-or-messenger)
- [Provide meaningful barrier labels, accessible names, adequate contrast, and reachable dismissal controls](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Provide-meaningful-barrier-labels%2C-accessible-names%2C-adequate-contrast%2C-and-reachable-dismissal-controls)
- [Contain focus within modal surfaces, support keyboard dismissal where appropriate, and restore focus to the trigger](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Contain-focus-within-modal-surfaces%2C-support-keyboard-dismissal-where-appropriate%2C-and-restore-focus-to-the-trigger)
- [Test overlays with nested navigators, safe areas, keyboards, display features, large text, screen readers, and rapid repeated presentation](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Dialogs-and-Overlays/Test-overlays-with-nested-navigators%2C-safe-areas%2C-keyboards%2C-display-features%2C-large-text%2C-screen-readers%2C-and-rapid-repeated-presentation)

[< Back to navigation & routing](../README.md)
