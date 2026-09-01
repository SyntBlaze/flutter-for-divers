# Focus and Keyboard

Flutter routes keyboard input through a focus tree rather than directly to
whichever widget was built most recently. `FocusNode` and `FocusScopeNode`
represent persistent focus state, while `Focus` and `FocusScope` connect those
nodes to widget subtrees. Traversal policies determine where focus moves, and
the shortcuts-and-actions system turns key combinations into semantic commands.

```text
hardware key event
       |
       v
HardwareKeyboard / KeyboardListener
       |
       v
primary FocusNode -> focus ancestors
       |
       v
Shortcuts -> Intent -> Actions -> application behavior

FocusTraversalGroup -> FocusTraversalPolicy -> next focus target
```

Focus nodes are long-lived objects with ownership and disposal requirements;
they should not be recreated during every build. Key handling should also stay
semantic where possible: use `Shortcuts`, `Intent`, and `Actions` for commands,
and reserve direct keyboard listeners for low-level key-state behavior. The
current event model uses `KeyEvent`, `HardwareKeyboard`, and `KeyboardListener`.
`RawKeyboardListener` belongs to the older `RawKeyEvent` model and is deprecated
in favor of `KeyboardListener`, so it is mainly relevant when maintaining or
migrating legacy code.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard) — Focused, bite-sized article covering Focus and Keyboard
- [Learning Path](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard) — Step-by-step material that builds practical Focus and Keyboard knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard) — Structured, in-depth material for learning about Focus and Keyboard thoroughly

## Focus and Keyboard Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `FocusNode` | Stores focus state, requests focus, and receives key events for one focusable location | Create it outside `build`, keep ownership clear, and dispose it when its owner is removed | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusNode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusNode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusNode "Deep Dive") |
| `FocusScopeNode` | Groups focus nodes and remembers the most recently focused descendant | Use scopes to contain navigation and restore focus without coupling unrelated interface regions | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusScopeNode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusScopeNode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusScopeNode "Deep Dive") |
| `FocusScope` | Creates or manages a focus scope for a widget subtree | Introduce a scope at meaningful navigation boundaries such as routes, dialogs, and composite controls | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusScope "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusScope "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusScope "Deep Dive") |
| `Focus` | Attaches a focus node and configures focus and key handling for a subtree | Prefer widget-managed nodes unless outside code must retain and control the node directly | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Focus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Focus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Focus "Deep Dive") |
| `FocusTraversalGroup` | Establishes an independent traversal-policy region | Group controls when their visual or semantic navigation order differs from the surrounding interface | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusTraversalGroup "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusTraversalGroup "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusTraversalGroup "Deep Dive") |
| `FocusTraversalPolicy` | Selects the next or previous focus candidate | Choose a policy whose order follows layout, reading direction, accessibility, and platform expectations | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusTraversalPolicy "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusTraversalPolicy "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/FocusTraversalPolicy "Deep Dive") |
| `KeyboardListener` | Receives modern `KeyEvent` objects while its focus node has focus | Use it for direct key events, not for text entry or commands better represented by shortcuts and actions | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/KeyboardListener "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/KeyboardListener "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/KeyboardListener "Deep Dive") |
| `RawKeyboardListener` | Receives legacy `RawKeyEvent` objects for a focused subtree | It is deprecated; migrate to `KeyboardListener` and the `KeyEvent`/`HardwareKeyboard` model | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/RawKeyboardListener "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/RawKeyboardListener "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/RawKeyboardListener "Deep Dive") |
| `Shortcuts` | Maps keyboard activators to semantic intents | Define platform-appropriate bindings near their active context and avoid consuming text-editing keys unexpectedly | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Shortcuts "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Shortcuts "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Shortcuts "Deep Dive") |
| `Actions` | Resolves intents to actions and invokes application behavior | Keep command behavior separate from physical key combinations so buttons, menus, and keys can share it | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Actions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Actions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Actions "Deep Dive") |
| `Intent` | Describes the semantic operation requested by an interaction | Make custom intents immutable command descriptions and put mutable behavior in their actions | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Intent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Intent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Intent "Deep Dive") |
| `LogicalKeyboardKey` | Identifies the logical meaning of a key after keyboard-layout interpretation | Use logical keys for command meaning; physical positions require a physical-key API instead | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/LogicalKeyboardKey "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/LogicalKeyboardKey "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/LogicalKeyboardKey "Deep Dive") |
| `HardwareKeyboard` | Exposes the modern global keyboard state and normalized key-event stream | Treat pressed-key and lock-mode state as event-time state, and account for synthesized events and focus changes | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/HardwareKeyboard "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/HardwareKeyboard "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/HardwareKeyboard "Deep Dive") |

## Questions

- [Who should own and dispose a `FocusNode`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Who-should-own-and-dispose-a-FocusNode%3F)
- [How does a `FocusScopeNode` remember and restore its focused child?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/How-does-a-FocusScopeNode-remember-and-restore-its-focused-child%3F)
- [Where should focus-scope boundaries be introduced?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Where-should-focus-scope-boundaries-be-introduced%3F)
- [When should `Focus` create its own node instead of receiving one?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/When-should-Focus-create-its-own-node-instead-of-receiving-one%3F)
- [When does a region need its own `FocusTraversalGroup`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/When-does-a-region-need-its-own-FocusTraversalGroup%3F)
- [Which traversal policy best matches the interface's visual and reading order?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Which-traversal-policy-best-matches-the-interface's-visual-and-reading-order%3F)
- [When is `KeyboardListener` more appropriate than `Shortcuts` or a text field?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/When-is-KeyboardListener-more-appropriate-than-Shortcuts-or-a-text-field%3F)
- [How should legacy `RawKeyboardListener` code migrate to modern key events?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/How-should-legacy-RawKeyboardListener-code-migrate-to-modern-key-events%3F)
- [How are key combinations resolved into intents?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/How-are-key-combinations-resolved-into-intents%3F)
- [How does `Actions` locate and invoke the action for an intent?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/How-does-Actions-locate-and-invoke-the-action-for-an-intent%3F)
- [What belongs in an `Intent`, and what belongs in its action?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/What-belongs-in-an-Intent%2C-and-what-belongs-in-its-action%3F)
- [When should a shortcut use a logical key rather than a physical key?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/When-should-a-shortcut-use-a-logical-key-rather-than-a-physical-key%3F)
- [How does `HardwareKeyboard` maintain pressed keys and lock-mode state?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/How-does-HardwareKeyboard-maintain-pressed-keys-and-lock-mode-state%3F)

## Best Practices

- [Create long-lived focus nodes outside `build` and dispose nodes you own](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Create-long-lived-focus-nodes-outside-build-and-dispose-nodes-you-own)
- [Use focus scopes to contain navigation and restore focus within a region](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Use-focus-scopes-to-contain-navigation-and-restore-focus-within-a-region)
- [Request focus in response to deliberate lifecycle or user events](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Request-focus-in-response-to-deliberate-lifecycle-or-user-events)
- [Keep traversal order aligned with visual order and accessibility reading order](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Keep-traversal-order-aligned-with-visual-order-and-accessibility-reading-order)
- [Test forward, reverse, and directional traversal across group boundaries](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Test-forward%2C-reverse%2C-and-directional-traversal-across-group-boundaries)
- [Handle direct key events only while the intended node has focus](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Handle-direct-key-events-only-while-the-intended-node-has-focus)
- [Migrate deprecated raw-key listeners instead of introducing new ones](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Migrate-deprecated-raw-key-listeners-instead-of-introducing-new-ones)
- [Represent commands with shortcuts, intents, and actions rather than scattered key checks](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Represent-commands-with-shortcuts%2C-intents%2C-and-actions-rather-than-scattered-key-checks)
- [Let multiple interaction surfaces invoke the same semantic action](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Let-multiple-interaction-surfaces-invoke-the-same-semantic-action)
- [Avoid overriding established platform and text-editing shortcuts without a clear reason](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Avoid-overriding-established-platform-and-text-editing-shortcuts-without-a-clear-reason)
- [Use `HardwareKeyboard` state only as part of a well-defined event flow](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Use-HardwareKeyboard-state-only-as-part-of-a-well-defined-event-flow)
- [Test focus visibility, keyboard-only operation, key repeat, and platform-specific bindings](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Focus-and-Keyboard/Test-focus-visibility%2C-keyboard-only-operation%2C-key-repeat%2C-and-platform-specific-bindings)

[< Back to forms input & gestures](../README.md)
