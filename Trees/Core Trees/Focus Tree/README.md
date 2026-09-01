# Focus Tree

The focus tree is Flutter's persistent hierarchy for deciding which part of the
interface receives keyboard events. `FocusNode` and `FocusScopeNode` objects
form the tree, while `Focus` and `FocusScope` widgets attach and maintain those
objects alongside the widget tree. `FocusManager` owns the root scope and tracks
the current primary focus.

```text
FocusManager
     |
     v
root FocusScopeNode
     +-- FocusScopeNode ----> FocusNode
     |       +-------------> FocusNode (primary focus)
     +-- FocusNode
             |
             +-- key event -> Shortcuts -> Actions

FocusTraversalGroup -> FocusTraversalPolicy + FocusOrder
```

The focus tree is related to, but distinct from, the widget tree. Focus nodes
can outlive individual builds and must be attached, reparented, and disposed
according to their ownership. Traversal policies choose the next focus target;
shortcuts and actions translate key combinations into semantic commands and
application behavior.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree) — Focused, bite-sized article covering Focus Tree
- [Learning Path](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree) — Step-by-step material that builds practical Focus Tree knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree) — Structured, in-depth material for learning about Focus Tree thoroughly

## Focus Tree Nodes

| Topic | Role in focus and keyboard interaction | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| `FocusManager` | Owns the global focus hierarchy and tracks primary focus and highlight behavior | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree/FocusManager "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree/FocusManager "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree/FocusManager "Deep Dive") |
| `FocusScopeNode` | Groups focusable descendants and remembers the most recently focused child in a scope | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree/FocusScopeNode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree/FocusScopeNode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree/FocusScopeNode "Deep Dive") |
| `FocusNode` | Persistent node that can request focus, receive key events, and participate in traversal | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree/FocusNode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree/FocusNode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree/FocusNode "Deep Dive") |
| `FocusScope` | Widget that introduces and maintains a focus scope for its descendant subtree | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree/FocusScope "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree/FocusScope "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree/FocusScope "Deep Dive") |
| `Focus` | Widget that attaches a focus node and configures focus behavior for a subtree | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree/Focus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree/Focus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree/Focus "Deep Dive") |
| `FocusTraversalGroup` | Defines a traversal-policy boundary for a group of focusable descendants | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree/FocusTraversalGroup "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree/FocusTraversalGroup "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree/FocusTraversalGroup "Deep Dive") |
| `FocusTraversalPolicy` | Strategy that orders candidates and selects the next node during focus traversal | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree/FocusTraversalPolicy "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree/FocusTraversalPolicy "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree/FocusTraversalPolicy "Deep Dive") |
| `FocusOrder` | Comparable ordering value used by ordered traversal policies | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree/FocusOrder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree/FocusOrder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree/FocusOrder "Deep Dive") |
| `ShortcutManager` | Resolves key-event activators to intents for a shortcuts subtree | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree/ShortcutManager "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree/ShortcutManager "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree/ShortcutManager "Deep Dive") |
| `Actions` | Widget that maps intents to actions and dispatches them through an inherited action context | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree/Actions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree/Actions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree/Actions "Deep Dive") |
| `Shortcuts` | Widget that maps keyboard activators to intents before action invocation | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Focus-Tree/Shortcuts "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Focus-Tree/Shortcuts "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Focus-Tree/Shortcuts "Deep Dive") |

## Questions

- [How does the focus tree differ from the widget tree?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/How-does-the-focus-tree-differ-from-the-widget-tree%3F)
- [What does `FocusManager` own, and what is primary focus?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/What-does-FocusManager-own%2C-and-what-is-primary-focus%3F)
- [How does a focus scope remember and restore focus among its descendants?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/How-does-a-focus-scope-remember-and-restore-focus-among-its-descendants%3F)
- [When should an application create and own a `FocusNode`?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/When-should-an-application-create-and-own-a-FocusNode%3F)
- [What is the difference between `Focus` and `FocusScope`?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/What-is-the-difference-between-Focus-and-FocusScope%3F)
- [How does a `Focus` widget keep a node attached when the widget tree changes?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/How-does-a-Focus-widget-keep-a-node-attached-when-the-widget-tree-changes%3F)
- [How does keyboard focus move when the user presses Tab or Shift-Tab?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/How-does-keyboard-focus-move-when-the-user-presses-Tab-or-Shift-Tab%3F)
- [When should descendants be placed in a `FocusTraversalGroup`?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/When-should-descendants-be-placed-in-a-FocusTraversalGroup%3F)
- [How does `FocusOrder` affect ordered traversal?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/How-does-FocusOrder-affect-ordered-traversal%3F)
- [How do key events become intents and actions?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/How-do-key-events-become-intents-and-actions%3F)
- [When is a custom `ShortcutManager` useful?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/When-is-a-custom-ShortcutManager-useful%3F)
- [How does `Actions.invoke` find and run an action for an intent?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/How-does-Actions.invoke-find-and-run-an-action-for-an-intent%3F)

## Best Practices

- [Create long-lived focus nodes outside `build` and dispose owned nodes](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Create-long-lived-focus-nodes-outside-build-and-dispose-owned-nodes)
- [Let `Focus` and `FocusScope` manage attachments and reparenting](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Let-Focus-and-FocusScope-manage-attachments-and-reparenting)
- [Use focus scopes to contain navigation and restore the last focused child](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Use-focus-scopes-to-contain-navigation-and-restore-the-last-focused-child)
- [Request focus in response to deliberate lifecycle or user events](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Request-focus-in-response-to-deliberate-lifecycle-or-user-events)
- [Set `canRequestFocus`, `skipTraversal`, and descendant flags intentionally](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Set-canRequestFocus%2C-skipTraversal%2C-and-descendant-flags-intentionally)
- [Choose traversal policies that match the interface's visual and reading order](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Choose-traversal-policies-that-match-the-interface's-visual-and-reading-order)
- [Use stable, unambiguous orders when explicit traversal ordering is required](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Use-stable%2C-unambiguous-orders-when-explicit-traversal-ordering-is-required)
- [Group regions that need independent traversal behavior](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Group-regions-that-need-independent-traversal-behavior)
- [Express keyboard commands as intents and actions instead of raw key checks](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Express-keyboard-commands-as-intents-and-actions-instead-of-raw-key-checks)
- [Keep shortcut definitions close to the context in which they apply](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Keep-shortcut-definitions-close-to-the-context-in-which-they-apply)
- [Reuse the standard action and intent system before introducing custom dispatch](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Reuse-the-standard-action-and-intent-system-before-introducing-custom-dispatch)
- [Test keyboard navigation, focus visibility, and scope restoration](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Focus-Tree/Test-keyboard-navigation%2C-focus-visibility%2C-and-scope-restoration)

[< Back to Core Trees](../README.md)
