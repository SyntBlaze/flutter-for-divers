# Focus and Keyboard Dispatch

Flutter sends non-text keyboard input through the focus tree. `HardwareKeyboard`
maintains normalized keyboard state and delivers `KeyEvent` objects, while
`FocusManager` tracks the active focus hierarchy and its `primaryFocus`.
Starting at that `FocusNode`, key events can propagate toward ancestor nodes
until a handler resolves them.

```text
platform key data
       |
       v
HardwareKeyboard -> KeyEvent (down or up)
       |
       v
FocusManager -> primary FocusNode -> focus ancestors
       |                                  |
       |                                  +-> KeyboardListener
       v
Shortcuts -> Intent -> Actions -> application behavior

FocusScopeNode -> FocusTraversalPolicy -> next focus target
```

Direct key handling and semantic command handling serve different needs.
`KeyboardListener` is useful when code needs the key events themselves.
`Shortcuts`, `Intent`, and `Actions` are preferable for commands because they
separate a physical interaction from its meaning and behavior. Text entry uses
Flutter's text-input and editing APIs rather than this key-event dispatch path.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch) — Focused, bite-sized article covering Focus and Keyboard Dispatch
- [Learning Path](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch) — Step-by-step material that builds practical Focus and Keyboard Dispatch knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch) — Structured, in-depth material for learning about Focus and Keyboard Dispatch thoroughly

## Focus and Keyboard Topics

| Topic | Primary role | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `FocusManager` | Owns the focus tree's root scope, primary focus, and global focus state | Observe or change focus through the framework APIs without bypassing focus-tree invariants | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusManager "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusManager "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusManager "Deep Dive") |
| `FocusNode` | Stores persistent focus state and participates in key-event propagation | Keep ownership explicit, attach it to the intended subtree, and dispose nodes you own | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusNode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusNode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusNode "Deep Dive") |
| `FocusScopeNode` | Groups focus nodes and remembers focus history within a scope | Use scopes to contain navigation and restore a meaningful focused descendant | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusScopeNode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusScopeNode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusScopeNode "Deep Dive") |
| `FocusTraversalPolicy` | Selects the next focusable node for traversal requests | Match traversal order to visual order, reading direction, and platform expectations | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusTraversalPolicy "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusTraversalPolicy "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/FocusTraversalPolicy "Deep Dive") |
| `HardwareKeyboard` | Normalizes key events and exposes pressed-key and lock-mode state | Read keyboard state as part of a defined event flow and account for synthesized events | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/HardwareKeyboard "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/HardwareKeyboard "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/HardwareKeyboard "Deep Dive") |
| `KeyEvent` | Base representation of a normalized hardware keyboard event | Use it for non-text key handling; character entry belongs to the text-input system | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyEvent "Deep Dive") |
| `KeyDownEvent` | Reports the initial press of a logical and physical key | Treat subsequent `KeyRepeatEvent` objects separately when behavior should run only once | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyDownEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyDownEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyDownEvent "Deep Dive") |
| `KeyUpEvent` | Reports that a pressed key has been released | Do not assume every sequence is observed without interruption or synthesized recovery | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyUpEvent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyUpEvent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyUpEvent "Deep Dive") |
| `KeyboardListener` | Delivers `KeyEvent` objects while its focus node is focused | Use it for low-level key behavior, not semantic commands or editable text | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyboardListener "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyboardListener "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/KeyboardListener "Deep Dive") |
| `Shortcuts` | Maps keyboard activators to semantic intents in a widget subtree | Keep bindings contextual and avoid unexpectedly shadowing platform or editing shortcuts | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Shortcuts "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Shortcuts "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Shortcuts "Deep Dive") |
| `Actions` | Resolves intents to actions and invokes application behavior | Share actions across keys, menus, buttons, and accessibility interactions where appropriate | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Actions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Actions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Actions "Deep Dive") |
| `Intent` | Describes the semantic operation requested by an interaction | Keep intents immutable and place mutable execution logic in actions | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Intent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Intent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Intent "Deep Dive") |

## Questions

- [How does `FocusManager` choose and track the primary focus?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/How-does-FocusManager-choose-and-track-the-primary-focus%3F)
- [In what order do focused nodes receive a key event?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/In-what-order-do-focused-nodes-receive-a-key-event%3F)
- [How does a focus scope remember and restore its focused descendant?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/How-does-a-focus-scope-remember-and-restore-its-focused-descendant%3F)
- [How should traversal order follow the interface's layout and reading order?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/How-should-traversal-order-follow-the-interface's-layout-and-reading-order%3F)
- [How does `HardwareKeyboard` maintain pressed-key and lock-mode state?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/How-does-HardwareKeyboard-maintain-pressed-key-and-lock-mode-state%3F)
- [When should code handle a `KeyEvent` instead of using text-input APIs?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/When-should-code-handle-a-KeyEvent-instead-of-using-text-input-APIs%3F)
- [How does a `KeyDownEvent` differ from a repeated key event?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/How-does-a-KeyDownEvent-differ-from-a-repeated-key-event%3F)
- [When can a `KeyUpEvent` be synthesized by the framework?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/When-can-a-KeyUpEvent-be-synthesized-by-the-framework%3F)
- [When is `KeyboardListener` more appropriate than `Shortcuts`?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/When-is-KeyboardListener-more-appropriate-than-Shortcuts%3F)
- [How are key combinations mapped to semantic commands?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/How-are-key-combinations-mapped-to-semantic-commands%3F)
- [How does `Actions` locate the behavior for an intent?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/How-does-Actions-locate-the-behavior-for-an-intent%3F)
- [What belongs in an `Intent`, and what belongs in its action?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/What-belongs-in-an-Intent%2C-and-what-belongs-in-its-action%3F)
- [What happens when no focus node handles a key event?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/What-happens-when-no-focus-node-handles-a-key-event%3F)
- [How does focus traversal differ from key-event propagation?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/How-does-focus-traversal-differ-from-key-event-propagation%3F)

## Best Practices

- [Create long-lived focus nodes outside `build` and dispose nodes you own](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Create-long-lived-focus-nodes-outside-build-and-dispose-nodes-you-own)
- [Use focus scopes to contain navigation and preserve local focus history](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Use-focus-scopes-to-contain-navigation-and-preserve-local-focus-history)
- [Request focus only in response to deliberate lifecycle or user events](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Request-focus-only-in-response-to-deliberate-lifecycle-or-user-events)
- [Keep traversal order aligned with visual and accessibility reading order](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Keep-traversal-order-aligned-with-visual-and-accessibility-reading-order)
- [Test forward, reverse, and directional traversal](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Test-forward%2C-reverse%2C-and-directional-traversal)
- [Handle direct key events only while the intended node has focus](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Handle-direct-key-events-only-while-the-intended-node-has-focus)
- [Treat pressed-key state as event-time state rather than application state](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Treat-pressed-key-state-as-event-time-state-rather-than-application-state)
- [Handle key repeat deliberately for commands that must run only once](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Handle-key-repeat-deliberately-for-commands-that-must-run-only-once)
- [Do not depend on raw key events for editable text](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Do-not-depend-on-raw-key-events-for-editable-text)
- [Represent commands with shortcuts, intents, and actions](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Represent-commands-with-shortcuts%2C-intents%2C-and-actions)
- [Keep physical key bindings separate from semantic command behavior](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Keep-physical-key-bindings-separate-from-semantic-command-behavior)
- [Let multiple interaction surfaces invoke the same semantic action](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Let-multiple-interaction-surfaces-invoke-the-same-semantic-action)
- [Avoid overriding established platform and text-editing shortcuts](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Avoid-overriding-established-platform-and-text-editing-shortcuts)
- [Test focus visibility, keyboard-only use, modifier combinations, and key repeat](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Focus-and-Keyboard-Dispatch/Test-focus-visibility%2C-keyboard-only-use%2C-modifier-combinations%2C-and-key-repeat)

[< Back to hit testing & input dispatch](../README.md)
