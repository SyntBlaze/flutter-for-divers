# Input Accessibility

Accessible input lets people operate the same interface with a keyboard,
switch device, voice control, screen reader, pointer, or touch. Flutter's
focus system identifies the current interaction target, traversal determines
how that target changes, and shortcuts and actions translate an input gesture
into an application command. Labels, tooltips, and timely error announcements
make those controls understandable when visual context is unavailable.

```text
keyboard / switch / voice / pointer
                 |
                 v
      focus and traversal order
                 |
                 v
       Shortcuts -> Actions
                 |
                 v
       visible + semantic feedback
       tooltips / error announcements
```

Input methods expose different assumptions. Keyboard and switch users need a
complete, predictable focus path; voice-control users need stable, visible
labels that match semantic names; and assistive technologies need controls to
retain their native roles and states. A feature is not input-accessible merely
because it responds to taps: every action must be reachable, understandable,
operable, and confirmable without depending on one device or gesture.

Use Flutter's focus, shortcuts, and actions systems to express navigation and
commands semantically. Keep focus order aligned with the visual and reading
order, show a clear focus indicator, and restore focus deliberately after
dialogs or navigation. Tooltips can clarify unfamiliar controls but do not
replace labels. When validation or submission fails, move focus only when it
helps recovery and announce the error without repeatedly interrupting the
user.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Input-Accessibility) — Focused, bite-sized article covering Input Accessibility
- [Learning Path](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Input-Accessibility) — Step-by-step material that builds practical Input Accessibility knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Input-Accessibility) — Structured, in-depth material for learning about Input Accessibility thoroughly

## Input Accessibility Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Keyboard navigation | Operating every interactive feature without touch or a pointer | Provide a complete focus path, expected key behavior, and a persistent visible focus indicator | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Keyboard-navigation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Keyboard-navigation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Keyboard-navigation "Deep Dive") |
| Switch access | Navigating and activating controls through sequential scanning | Keep the focus sequence efficient, avoid gesture-only actions, and expose each control's role, state, and label | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Switch-access "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Switch-access "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Switch-access "Deep Dive") |
| Voice control | Selecting and invoking controls by spoken commands | Make visible text and semantic labels stable and consistent so controls can be addressed unambiguously | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Voice-control "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Voice-control "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Voice-control "Deep Dive") |
| Focus order | Defining the sequence in which interactive elements receive focus | Match visual and reading order, including after responsive layout changes and conditional content | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Focus-order "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Focus-order "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Focus-order "Deep Dive") |
| `FocusTraversalPolicy` | Choosing the next focus target within a traversal group | Select or customize a policy deliberately and test forward, reverse, and directional movement | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Input-Accessibility/FocusTraversalPolicy "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Input-Accessibility/FocusTraversalPolicy "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Input-Accessibility/FocusTraversalPolicy "Deep Dive") |
| `Shortcuts` | Mapping key activators to semantic intents | Preserve platform conventions and text-editing behavior while keeping bindings local to the relevant context | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Shortcuts "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Shortcuts "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Shortcuts "Deep Dive") |
| `Actions` | Resolving semantic intents to executable behavior | Share command behavior across keyboard, menus, buttons, and assistive input instead of duplicating handlers | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Actions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Actions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Actions "Deep Dive") |
| `Tooltip` | Providing supplemental descriptions for unfamiliar controls | Supply an accessible message, support keyboard discovery, and never use a tooltip as the control's only label | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Tooltip "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Tooltip "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Tooltip "Deep Dive") |
| Error announcements | Communicating validation and operation failures to assistive technology | Announce concise, actionable errors at the right time and associate field errors with the affected input | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Error-announcements "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Error-announcements "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Input-Accessibility/Error-announcements "Deep Dive") |

## Questions

- [Can every action be reached and completed using only a keyboard?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Can-every-action-be-reached-and-completed-using-only-a-keyboard%3F)
- [Does sequential scanning visit controls in a useful order without unnecessary stops?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Does-sequential-scanning-visit-controls-in-a-useful-order-without-unnecessary-stops%3F)
- [Can voice-control users identify a control from the same words they see on screen?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Can-voice-control-users-identify-a-control-from-the-same-words-they-see-on-screen%3F)
- [Does focus order still match reading order at every supported layout size?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Does-focus-order-still-match-reading-order-at-every-supported-layout-size%3F)
- [When should the default `FocusTraversalPolicy` be replaced or scoped to a group?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/When-should-the-default-FocusTraversalPolicy-be-replaced-or-scoped-to-a-group%3F)
- [Which key bindings belong in `Shortcuts`, and which platform conventions must remain available?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Which-key-bindings-belong-in-Shortcuts%2C-and-which-platform-conventions-must-remain-available%3F)
- [How can `Actions` expose one command through multiple input methods?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/How-can-Actions-expose-one-command-through-multiple-input-methods%3F)
- [When does a `Tooltip` add useful context without duplicating or replacing an accessible label?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/When-does-a-Tooltip-add-useful-context-without-duplicating-or-replacing-an-accessible-label%3F)
- [How should an error be announced and associated with the control that needs attention?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/How-should-an-error-be-announced-and-associated-with-the-control-that-needs-attention%3F)
- [Where should focus move after opening or closing a route, dialog, menu, or transient overlay?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Where-should-focus-move-after-opening-or-closing-a-route%2C-dialog%2C-menu%2C-or-transient-overlay%3F)

## Best Practices

- [Make every pointer or touch action available through keyboard navigation](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Make-every-pointer-or-touch-action-available-through-keyboard-navigation)
- [Test the complete interface with sequential switch scanning](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Test-the-complete-interface-with-sequential-switch-scanning)
- [Keep visible control text and accessible names consistent for voice control](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Keep-visible-control-text-and-accessible-names-consistent-for-voice-control)
- [Arrange focus according to visual and semantic reading order](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Arrange-focus-according-to-visual-and-semantic-reading-order)
- [Use traversal groups and `FocusTraversalPolicy` only at meaningful navigation boundaries](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Use-traversal-groups-and-FocusTraversalPolicy-only-at-meaningful-navigation-boundaries)
- [Use `Shortcuts` to map input gestures to intents rather than embedding key checks throughout widgets](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Use-Shortcuts-to-map-input-gestures-to-intents-rather-than-embedding-key-checks-throughout-widgets)
- [Use `Actions` so buttons, menus, keys, and assistive input can invoke the same command](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Use-Actions-so-buttons%2C-menus%2C-keys%2C-and-assistive-input-can-invoke-the-same-command)
- [Provide an obvious focus indicator with sufficient contrast](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Provide-an-obvious-focus-indicator-with-sufficient-contrast)
- [Treat `Tooltip` as supplemental help and provide an accessible name independently](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Treat-Tooltip-as-supplemental-help-and-provide-an-accessible-name-independently)
- [Keep error announcements concise, actionable, and free from repeated unsolicited interruptions](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Keep-error-announcements-concise%2C-actionable%2C-and-free-from-repeated-unsolicited-interruptions)
- [Test traversal in both directions and restore focus to a logical target after context changes](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Input-Accessibility/Test-traversal-in-both-directions-and-restore-focus-to-a-logical-target-after-context-changes)

[< Back to internationalization & accessibility](../README.md)
