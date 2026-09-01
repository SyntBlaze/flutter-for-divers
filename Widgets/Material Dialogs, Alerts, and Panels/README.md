# Material: Dialogs, Alerts, and Panels

Material dialogs and panels temporarily bring decisions, details, status, or
supporting content to the user's attention. Choose the least disruptive surface
that matches the task: a dialog for a focused decision, a bottom sheet for
contextual content or actions, inline expansion for optional details, and a
snack bar or material banner for feedback that does not require a modal route.
The corner `Banner` is a compact visual label rather than a message surface.

Modal surfaces need deliberate route, focus, dismissal, and accessibility
behavior. Present dialog widgets with `showDialog` and modal sheets with
`showModalBottomSheet`; the widget describes the surface, while the presenting
API manages the route and barrier. Keep essential actions visible, return a
typed result when the surface closes, and do not rely on tapping outside as the
only way to dismiss content. Long or input-heavy tasks usually deserve a full
screen instead of a crowded dialog.

Transient feedback should be owned by the appropriate scaffold messenger.
Use `ScaffoldMessenger` to show and clear snack bars and material banners across
route transitions, and avoid stacking messages until they obscure the current
task. Expansion widgets are part of normal layout rather than overlays, so
their open state, list identity, scrolling, and restoration should be managed
alongside the surrounding content. A `Drawer` is a scaffold panel for
navigation or supporting destinations, not a general-purpose modal dialog.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels) — Focused, bite-sized article covering Material: Dialogs, Alerts, and Panels
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels) — Step-by-step material that builds practical Material: Dialogs, Alerts, and Panels knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels) — Structured, in-depth material for learning about Material: Dialogs, Alerts, and Panels thoroughly

## Material Dialogs, Alerts, and Panels

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `AlertDialog` | Presents a focused alert with a title, supporting content, and decision actions | Keep the decision concise, order actions predictably, and make overflowing content scrollable when necessary | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/AlertDialog "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/AlertDialog "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/AlertDialog "Deep Dive") |
| `SimpleDialog` | Presents a short list of straightforward choices in a dialog surface | Use it only for simple selection; return the selected value when dismissing the dialog route | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/SimpleDialog "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/SimpleDialog "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/SimpleDialog "Deep Dive") |
| `Dialog` | Provides the base Material dialog surface for custom modal content | Supply clear semantics, constraints, focus behavior, and dismissal controls instead of rebuilding a full-screen workflow inside it | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Dialog "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Dialog "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Dialog "Deep Dive") |
| `AboutDialog` | Shows application identity, version information, legal text, and licenses | Provide accurate application metadata and ensure license content remains reachable and scrollable | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/AboutDialog "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/AboutDialog "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/AboutDialog "Deep Dive") |
| `BottomSheet` | Builds a persistent Material sheet attached to nearby screen content | Coordinate it through `Scaffold` when persistent, and use the modal bottom-sheet API when interaction behind the sheet must be blocked | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/BottomSheet "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/BottomSheet "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/BottomSheet "Deep Dive") |
| `ExpansionPanel` | Defines a header and expandable body inside an `ExpansionPanelList` | Keep expansion state in the parent and use stable identity when panels can be reordered or updated | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/ExpansionPanel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/ExpansionPanel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/ExpansionPanel "Deep Dive") |
| `ExpansionTile` | Expands and collapses inline child content from a list-style header | Preserve state deliberately in scrolling lists and avoid nesting controls that make the header's tap behavior ambiguous | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/ExpansionTile "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/ExpansionTile "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/ExpansionTile "Deep Dive") |
| `SnackBar` | Reports brief, non-blocking feedback near the bottom of a scaffold | Show it through `ScaffoldMessenger`, keep copy concise, and offer at most one clear action that remains usable for the display duration | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/SnackBar "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/SnackBar "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/SnackBar "Deep Dive") |
| `Banner` | Paints a diagonal corner label over a child | Reserve it for short status labels such as debug or preview, and do not confuse it with an actionable material message banner | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Banner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Banner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Banner "Deep Dive") |
| `MaterialBanner` | Displays a persistent Material message with actions at the top of scaffold content | Use `ScaffoldMessenger` and provide an explicit action or other clear path for resolving and hiding the message | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/MaterialBanner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/MaterialBanner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/MaterialBanner "Deep Dive") |
| `Drawer` | Reveals a Material side panel for navigation and supporting destinations | Close the drawer before completing navigation and keep selection, focus, and back-button behavior synchronized with the current route | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Drawer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Drawer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Drawer "Deep Dive") |

## Questions

- [When is an alert important enough to interrupt the current task with `AlertDialog`?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/When-is-an-alert-important-enough-to-interrupt-the-current-task-with-AlertDialog%3F)
- [Is the content a short selection that fits `SimpleDialog`, or does it need a richer surface?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Is-the-content-a-short-selection-that-fits-SimpleDialog%2C-or-does-it-need-a-richer-surface%3F)
- [What route, barrier, focus, sizing, and dismissal behavior must a custom `Dialog` provide?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/What-route%2C-barrier%2C-focus%2C-sizing%2C-and-dismissal-behavior-must-a-custom-Dialog-provide%3F)
- [Which application metadata and license information should `AboutDialog` expose?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Which-application-metadata-and-license-information-should-AboutDialog-expose%3F)
- [Should this `BottomSheet` be persistent or modal, and how should it return a result?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Should-this-BottomSheet-be-persistent-or-modal%2C-and-how-should-it-return-a-result%3F)
- [Where should the parent store and update each `ExpansionPanel`'s expanded state?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Where-should-the-parent-store-and-update-each-ExpansionPanel's-expanded-state%3F)
- [How should an `ExpansionTile` preserve its state when it scrolls out of view?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/How-should-an-ExpansionTile-preserve-its-state-when-it-scrolls-out-of-view%3F)
- [Is this feedback brief and non-blocking enough for a `SnackBar`?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Is-this-feedback-brief-and-non-blocking-enough-for-a-SnackBar%3F)
- [Does a short corner `Banner` label communicate this status without obscuring content?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Does-a-short-corner-Banner-label-communicate-this-status-without-obscuring-content%3F)
- [Does the message need the persistence and explicit actions of a `MaterialBanner`?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Does-the-message-need-the-persistence-and-explicit-actions-of-a-MaterialBanner%3F)
- [Does this navigation structure belong in a `Drawer`, and how will it adapt on wider layouts?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Does-this-navigation-structure-belong-in-a-Drawer%2C-and-how-will-it-adapt-on-wider-layouts%3F)

## Best Practices

- [Keep `AlertDialog` content focused on one decision and make long content scroll safely](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Keep-AlertDialog-content-focused-on-one-decision-and-make-long-content-scroll-safely)
- [Use `SimpleDialog` for concise choices and return the selected value through the route](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Use-SimpleDialog-for-concise-choices-and-return-the-selected-value-through-the-route)
- [Give a custom `Dialog` bounded layout, meaningful semantics, predictable focus, and an obvious dismissal path](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Give-a-custom-Dialog-bounded-layout%2C-meaningful-semantics%2C-predictable-focus%2C-and-an-obvious-dismissal-path)
- [Keep `AboutDialog` application identity, version, legal text, and license sources accurate](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Keep-AboutDialog-application-identity%2C-version%2C-legal-text%2C-and-license-sources-accurate)
- [Choose persistent versus modal bottom-sheet behavior from whether background interaction should remain available](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Choose-persistent-versus-modal-bottom-sheet-behavior-from-whether-background-interaction-should-remain-available)
- [Treat `ExpansionPanel` state as controlled parent state and preserve stable panel identity](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Treat-ExpansionPanel-state-as-controlled-parent-state-and-preserve-stable-panel-identity)
- [Use storage keys or controlled state when `ExpansionTile` expansion must survive scrolling and rebuilds](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Use-storage-keys-or-controlled-state-when-ExpansionTile-expansion-must-survive-scrolling-and-rebuilds)
- [Queue and replace `SnackBar` messages deliberately instead of flooding `ScaffoldMessenger`](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Queue-and-replace-SnackBar-messages-deliberately-instead-of-flooding-ScaffoldMessenger)
- [Keep `Banner` labels short, legible, and secondary to the underlying content](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Keep-Banner-labels-short%2C-legible%2C-and-secondary-to-the-underlying-content)
- [Provide a clear resolution or dismissal action for every persistent `MaterialBanner`](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Provide-a-clear-resolution-or-dismissal-action-for-every-persistent-MaterialBanner)
- [Use `Drawer` for destinations and supporting navigation, then close it before changing routes](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Use-Drawer-for-destinations-and-supporting-navigation%2C-then-close-it-before-changing-routes)
- [Test overlays and panels with keyboard navigation, screen readers, large text, back navigation, restoration, and narrow screens](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Dialogs-Alerts-and-Panels/Test-overlays-and-panels-with-keyboard-navigation%2C-screen-readers%2C-large-text%2C-back-navigation%2C-restoration%2C-and-narrow-screens)

[< Back to widgets](../README.md)
