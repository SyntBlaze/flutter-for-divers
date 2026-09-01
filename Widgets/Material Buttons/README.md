# Material: Buttons

Material buttons turn a user's intent into an immediate action. Choose a button
whose visual emphasis matches the importance of that action: filled buttons for
prominent choices, outlined or text buttons for lower-emphasis alternatives,
icon buttons for familiar compact actions, and floating action buttons for a
screen's primary floating action. Menus and segmented controls belong here when
the interaction selects an action or a small, visible set of options.

Button APIs share important behavior even when they look different. A null
callback normally disables a button, `ButtonStyle` and the surrounding theme
control state-dependent appearance, and labels, tooltips, focus, and minimum
target sizes determine whether a control remains understandable and usable.
Favor semantic button widgets over hand-built gesture surfaces so keyboard,
pointer, focus, ink, and accessibility behavior stay consistent.

Use `ElevatedButton`, `FilledButton`, `OutlinedButton`, or `TextButton` for
labeled actions based on the required emphasis. Use `FilledButton.tonal` when a
filled surface is helpful but the action should not compete with the highest
priority action. Reserve `FloatingActionButton` for a primary action tied to
the current screen, and use `IconButton` only when the icon's meaning is clear.
Choose `PopupMenuButton` or `MenuAnchor` for contextual commands, and
`SegmentedButton` for a compact set of mutually related choices.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Material-Buttons) — Focused, bite-sized article covering Material: Buttons
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Material-Buttons) — Step-by-step material that builds practical Material: Buttons knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Material-Buttons) — Structured, in-depth material for learning about Material: Buttons thoroughly

## Material Buttons

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `ElevatedButton` | Presents a labeled action with elevation and a filled surface | Use its elevation sparingly and avoid making every action look equally prominent | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Buttons/ElevatedButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Buttons/ElevatedButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Buttons/ElevatedButton "Deep Dive") |
| `FilledButton` | Presents a high-emphasis Material action on a filled container | Keep it for important actions and provide a null `onPressed` only when a disabled state is meaningful | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Buttons/FilledButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Buttons/FilledButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Buttons/FilledButton "Deep Dive") |
| `FilledButton.tonal` | Presents a filled action with a softer secondary-container treatment | Use it for medium emphasis rather than as an interchangeable color variant of the primary filled button | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Buttons/FilledButton.tonal "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Buttons/FilledButton.tonal "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Buttons/FilledButton.tonal "Deep Dive") |
| `FloatingActionButton` | Places a prominent circular or extended action above screen content | A screen should normally have at most one, representing its primary action rather than navigation | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Buttons/FloatingActionButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Buttons/FloatingActionButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Buttons/FloatingActionButton "Deep Dive") |
| `IconButton` | Exposes a compact action through an icon | Supply an accessible tooltip and use an icon whose purpose is recognizable in context | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Buttons/IconButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Buttons/IconButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Buttons/IconButton "Deep Dive") |
| `OutlinedButton` | Presents a medium-emphasis action with an outline | Use it where a boundary helps discovery without competing with the primary filled action | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Buttons/OutlinedButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Buttons/OutlinedButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Buttons/OutlinedButton "Deep Dive") |
| `PopupMenuButton` | Opens a Material popup menu from a compact trigger | Model discrete contextual commands and keep menu item values, enabled states, and selection handling coherent | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Buttons/PopupMenuButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Buttons/PopupMenuButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Buttons/PopupMenuButton "Deep Dive") |
| `SegmentedButton` | Displays a small set of related choices as connected segments | Keep the set concise and configure single versus multi-selection semantics deliberately | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Buttons/SegmentedButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Buttons/SegmentedButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Buttons/SegmentedButton "Deep Dive") |
| `TextButton` | Presents a low-emphasis labeled action without a persistent container | Use it for supplementary actions where placement and wording provide enough discoverability | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Buttons/TextButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Buttons/TextButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Buttons/TextButton "Deep Dive") |
| `MenuAnchor` | Anchors a Material menu to an arbitrary builder-defined control | Manage the controller, focus, alignment, and nested menu behavior without obscuring the trigger's semantics | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Buttons/MenuAnchor "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Buttons/MenuAnchor "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Buttons/MenuAnchor "Deep Dive") |

## Questions

- [When should an action use elevation instead of a flat filled treatment?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/When-should-an-action-use-elevation-instead-of-a-flat-filled-treatment%3F)
- [Which action on a screen deserves the highest-emphasis filled button?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Which-action-on-a-screen-deserves-the-highest-emphasis-filled-button%3F)
- [When does a tonal filled button communicate the right level of emphasis?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/When-does-a-tonal-filled-button-communicate-the-right-level-of-emphasis%3F)
- [Is the action important and screen-specific enough to be a floating action button?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Is-the-action-important-and-screen-specific-enough-to-be-a-floating-action-button%3F)
- [Will users understand the icon without a visible text label?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Will-users-understand-the-icon-without-a-visible-text-label%3F)
- [When does an outline improve discoverability without creating excessive emphasis?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/When-does-an-outline-improve-discoverability-without-creating-excessive-emphasis%3F)
- [Should these contextual actions appear in a popup menu rather than inline?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Should-these-contextual-actions-appear-in-a-popup-menu-rather-than-inline%3F)
- [Does the choice set fit a compact segmented control, and can users select one or many values?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Does-the-choice-set-fit-a-compact-segmented-control%2C-and-can-users-select-one-or-many-values%3F)
- [Is the action discoverable enough to use the lowest-emphasis button style?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Is-the-action-discoverable-enough-to-use-the-lowest-emphasis-button-style%3F)
- [When is an anchored or cascading menu more appropriate than `PopupMenuButton`?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/When-is-an-anchored-or-cascading-menu-more-appropriate-than-PopupMenuButton%3F)

## Best Practices

- [Use `ElevatedButton` selectively where elevation communicates useful prominence](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Use-ElevatedButton-selectively-where-elevation-communicates-useful-prominence)
- [Reserve `FilledButton` for a small number of important actions](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Reserve-FilledButton-for-a-small-number-of-important-actions)
- [Use `FilledButton.tonal` for medium-emphasis actions that still need a container](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Use-FilledButton.tonal-for-medium-emphasis-actions-that-still-need-a-container)
- [Give each screen no more than one clear primary floating action](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Give-each-screen-no-more-than-one-clear-primary-floating-action)
- [Provide tooltips, adequate hit targets, and recognizable glyphs for icon-only buttons](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Provide-tooltips%2C-adequate-hit-targets%2C-and-recognizable-glyphs-for-icon-only-buttons)
- [Pair `OutlinedButton` with higher-emphasis actions without making it visually dominant](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Pair-OutlinedButton-with-higher-emphasis-actions-without-making-it-visually-dominant)
- [Keep popup menu commands concise, contextual, and keyboard accessible](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Keep-popup-menu-commands-concise%2C-contextual%2C-and-keyboard-accessible)
- [Use segmented buttons only for small related sets and keep selection state controlled](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Use-segmented-buttons-only-for-small-related-sets-and-keep-selection-state-controlled)
- [Place `TextButton` where context makes its action easy to find and understand](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Place-TextButton-where-context-makes-its-action-easy-to-find-and-understand)
- [Build `MenuAnchor` triggers with clear semantics and predictable focus behavior](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Build-MenuAnchor-triggers-with-clear-semantics-and-predictable-focus-behavior)
- [Test all button states with keyboard navigation, screen readers, large text, and touch targets](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Buttons/Test-all-button-states-with-keyboard-navigation%2C-screen-readers%2C-large-text%2C-and-touch-targets)

[< Back to widgets](../README.md)
