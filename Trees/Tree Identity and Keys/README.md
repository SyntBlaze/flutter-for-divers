# Tree Identity and Keys

Flutter preserves a mounted element when a replacement widget can update the
widget already associated with that element. `Widget.canUpdate` requires the
widgets to have the same runtime type and equal keys. When no key is supplied,
the framework normally reconciles children by their position; keys let a parent
distinguish, move, or intentionally replace children of the same type.

```text
Key
├── LocalKey ── unique among siblings
│   ├── ValueKey
│   ├── ObjectKey
│   ├── UniqueKey
│   └── PageStorageKey
└── GlobalKey ─ unique across the application
    ├── GlobalObjectKey
    └── LabeledGlobalKey

old element + new widget
        │
        └── same runtimeType and key? ── yes ──> update element; preserve State
                                      └── no  ──> replace element; discard State
```

Slots describe where a child belongs in its parent and can be updated when a
retained child moves. A `GlobalKey` adds an application-wide identity that can
move an existing element, including its state and descendants, to a new parent
during the same frame. That behavior is powerful but more expensive and more
constrained than ordinary sibling reconciliation.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys) — Focused, bite-sized article covering Tree Identity and Keys
- [Learning Path](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys) — Step-by-step material that builds practical Tree Identity and Keys knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys) — Structured, in-depth material for learning about Tree Identity and Keys thoroughly

## Tree Identity and Keys Topics

| Topic | Role in identity and reconciliation | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| Key | Optional widget identifier used with runtime type to decide whether an element can be updated | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/Key "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/Key "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/Key "Deep Dive") |
| LocalKey | Base class for keys that need to be unique only among siblings | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/LocalKey "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/LocalKey "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/LocalKey "Deep Dive") |
| GlobalKey | Application-wide key that identifies an element and provides access to its context and state | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/GlobalKey "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/GlobalKey "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/GlobalKey "Deep Dive") |
| ValueKey | Local key whose equality and hash code come from a supplied value | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/ValueKey "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/ValueKey "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/ValueKey "Deep Dive") |
| ObjectKey | Local key that compares its supplied object by identity | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/ObjectKey "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/ObjectKey "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/ObjectKey "Deep Dive") |
| UniqueKey | Local key equal only to itself, forcing a distinct identity for each instance | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/UniqueKey "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/UniqueKey "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/UniqueKey "Deep Dive") |
| PageStorageKey | Value-based local key used to locate saved state in the nearest `PageStorage` bucket | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/PageStorageKey "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/PageStorageKey "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/PageStorageKey "Deep Dive") |
| GlobalObjectKey | Global key whose identity is based on an object using identical-object semantics | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/GlobalObjectKey "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/GlobalObjectKey "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/GlobalObjectKey "Deep Dive") |
| LabeledGlobalKey | Global key with an optional debug label that does not participate in identity | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/LabeledGlobalKey "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/LabeledGlobalKey "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/LabeledGlobalKey "Deep Dive") |
| Widget identity | The relationship between transient widget instances and retained element locations | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/Widget-identity "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/Widget-identity "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/Widget-identity "Deep Dive") |
| Runtime type matching | The requirement that old and new widgets have the same runtime type before an element is updated | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/Runtime-type-matching "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/Runtime-type-matching "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/Runtime-type-matching "Deep Dive") |
| Slot matching | The parent-defined location metadata used to place and reorder retained children | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/Slot-matching "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/Slot-matching "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/Slot-matching "Deep Dive") |
| State preservation | Retention of an existing `State` object when its element is reused or globally reparented | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/State-preservation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/State-preservation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/State-preservation "Deep Dive") |
| Element reparenting | Moving a globally keyed element and its subtree from one parent to another | [💡](https://app.syntblaze.com/qt/flutter/Trees/Tree-Identity-and-Keys/Element-reparenting "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Tree-Identity-and-Keys/Element-reparenting "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Tree-Identity-and-Keys/Element-reparenting "Deep Dive") |

## Questions

- [How does Flutter decide whether an existing element can update to a new widget?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/How-does-Flutter-decide-whether-an-existing-element-can-update-to-a-new-widget%3F)
- [Why do runtime type and key both have to match?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Why-do-runtime-type-and-key-both-have-to-match%3F)
- [When is no key the correct choice?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/When-is-no-key-the-correct-choice%3F)
- [How unique must a `LocalKey` be?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/How-unique-must-a-LocalKey-be%3F)
- [When should a stable identifier be wrapped in a `ValueKey`?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/When-should-a-stable-identifier-be-wrapped-in-a-ValueKey%3F)
- [How does `ObjectKey` differ from `ValueKey`?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/How-does-ObjectKey-differ-from-ValueKey%3F)
- [Why does recreating a `UniqueKey` discard existing state?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Why-does-recreating-a-UniqueKey-discard-existing-state%3F)
- [What state does a `PageStorageKey` help restore?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/What-state-does-a-PageStorageKey-help-restore%3F)
- [When is a `GlobalKey` necessary instead of a local key?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/When-is-a-GlobalKey-necessary-instead-of-a-local-key%3F)
- [Does the debug label of a `LabeledGlobalKey` affect equality?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Does-the-debug-label-of-a-LabeledGlobalKey-affect-equality%3F)
- [What is a child slot, and how does it relate to reordering?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/What-is-a-child-slot%2C-and-how-does-it-relate-to-reordering%3F)
- [Which identity changes cause a `State` object to be replaced?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Which-identity-changes-cause-a-State-object-to-be-replaced%3F)
- [What happens when a globally keyed subtree moves to a different parent?](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/What-happens-when-a-globally-keyed-subtree-moves-to-a-different-parent%3F)

## Best Practices

- [Leave children unkeyed when stable positional reconciliation expresses their identity](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Leave-children-unkeyed-when-stable-positional-reconciliation-expresses-their-identity)
- [Use stable domain identifiers for reorderable or insertable sibling collections](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Use-stable-domain-identifiers-for-reorderable-or-insertable-sibling-collections)
- [Keep local keys unique among children of the same parent](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Keep-local-keys-unique-among-children-of-the-same-parent)
- [Choose `ObjectKey` only when object identity, rather than value equality, defines identity](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Choose-ObjectKey-only-when-object-identity%2C-rather-than-value-equality%2C-defines-identity)
- [Do not recreate a `UniqueKey` on every build when state should survive](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Do-not-recreate-a-UniqueKey-on-every-build-when-state-should-survive)
- [Use `PageStorageKey` values that are unique within their storage path](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Use-PageStorageKey-values-that-are-unique-within-their-storage-path)
- [Create long-lived `GlobalKey` instances outside `build`](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Create-long-lived-GlobalKey-instances-outside-build)
- [Prefer local keys unless global access or cross-parent reparenting is required](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Prefer-local-keys-unless-global-access-or-cross-parent-reparenting-is-required)
- [Never mount two widgets with the same `GlobalKey` at the same time](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Never-mount-two-widgets-with-the-same-GlobalKey-at-the-same-time)
- [Treat a global-key debug label as diagnostics, not identity](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Treat-a-global-key-debug-label-as-diagnostics%2C-not-identity)
- [Preserve both widget type and key when state is intended to survive an update](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Preserve-both-widget-type-and-key-when-state-is-intended-to-survive-an-update)
- [Complete global-key moves within the same animation frame](https://app.syntblaze.com/qsp/flutter/Trees/Tree-Identity-and-Keys/Complete-global-key-moves-within-the-same-animation-frame)

[< Back to trees](../README.md)
