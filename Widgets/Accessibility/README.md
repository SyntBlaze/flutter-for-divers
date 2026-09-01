# Accessibility

Flutter accessibility spans the semantics tree, keyboard focus, and semantic
commands. Semantics widgets describe what interface elements mean to assistive
technology; focus widgets organize keyboard navigation; and `Shortcuts` with
`Actions` translate input into reusable application behavior. These systems
often cooperate, but keyboard focus and an accessibility service's current
focus are separate concepts.

```text
widget subtree
    |
    +-- Semantics / merge / exclude / block / index
    |          -> semantics tree -> platform accessibility service
    |
    +-- Focus / FocusScope -> keyboard focus and traversal
    |
    +-- Shortcuts -> Intent -> Actions -> application behavior
```

Start with native Flutter controls because they usually supply appropriate
semantics, focus behavior, and actions already. Add `Semantics` when a custom
control needs meaning or when existing semantics must be refined. Use
`MergeSemantics`, `ExcludeSemantics`, and `BlockSemantics` only to make the
resulting accessibility tree more faithful to what the user can perceive and
operate. For keyboard interaction, establish deliberate focus boundaries and
express commands as intents and actions instead of scattering raw key checks.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Accessibility) — Focused, bite-sized article covering Accessibility
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Accessibility) — Step-by-step material that builds practical Accessibility knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Accessibility) — Structured, in-depth material for learning about Accessibility thoroughly

## Accessibility Widgets

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Semantics` | Annotates a subtree with accessibility labels, values, state, roles, and actions | Supply only meaningful information and avoid duplicating semantics already exposed by descendants | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Accessibility/Semantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Accessibility/Semantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Accessibility/Semantics "Deep Dive") |
| `ExcludeSemantics` | Removes descendant semantics from the accessibility tree | Exclude decorative or deliberately replaced content, never information a user still needs | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Accessibility/ExcludeSemantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Accessibility/ExcludeSemantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Accessibility/ExcludeSemantics "Deep Dive") |
| `MergeSemantics` | Requests that descendant semantics be presented as one accessible node | Merge only descendants that form one coherent control; conflicting or independently interactive nodes may not merge usefully | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Accessibility/MergeSemantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Accessibility/MergeSemantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Accessibility/MergeSemantics "Deep Dive") |
| `BlockSemantics` | Hides semantics from previously painted siblings in the same semantic container | Use it for modal or obscuring surfaces whose underlying controls must not remain accessible | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Accessibility/BlockSemantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Accessibility/BlockSemantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Accessibility/BlockSemantics "Deep Dive") |
| `IndexedSemantics` | Assigns a semantic index to a child in an indexed collection | Keep indexes aligned with logical collection order, especially when some visual children are not semantic items | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Accessibility/IndexedSemantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Accessibility/IndexedSemantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Accessibility/IndexedSemantics "Deep Dive") |
| `Tooltip` | Provides a discoverable text explanation for a control or interface element | Keep the message concise and ensure the control also has an understandable accessible name | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Accessibility/Tooltip "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Accessibility/Tooltip "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Accessibility/Tooltip "Deep Dive") |
| `Focus` | Connects a focus node and focus behavior to a widget subtree | Keep node ownership clear and do not assume keyboard focus is the same as accessibility focus | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Accessibility/Focus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Accessibility/Focus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Accessibility/Focus "Deep Dive") |
| `FocusScope` | Groups focusable descendants and remembers focus within a region | Place scopes at meaningful boundaries such as routes, dialogs, and composite controls | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Accessibility/FocusScope "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Accessibility/FocusScope "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Accessibility/FocusScope "Deep Dive") |
| `Shortcuts` | Maps keyboard activators to semantic intents | Choose platform-appropriate bindings and avoid intercepting expected text-entry or assistive-technology keys | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Accessibility/Shortcuts "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Accessibility/Shortcuts "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Accessibility/Shortcuts "Deep Dive") |
| `Actions` | Maps intents to executable actions in the current context | Separate command meaning from input so keyboards, buttons, menus, and accessibility actions can share behavior | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Accessibility/Actions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Accessibility/Actions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Accessibility/Actions "Deep Dive") |

## Questions

- [When does a custom control need an explicit `Semantics` annotation?](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/When-does-a-custom-control-need-an-explicit-Semantics-annotation%3F)
- [When should descendant semantics be removed rather than replaced or merged?](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/When-should-descendant-semantics-be-removed-rather-than-replaced-or-merged%3F)
- [Which descendants can be represented as one coherent accessible item?](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Which-descendants-can-be-represented-as-one-coherent-accessible-item%3F)
- [How does `BlockSemantics` keep obscured sibling controls out of accessibility navigation?](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/How-does-BlockSemantics-keep-obscured-sibling-controls-out-of-accessibility-navigation%3F)
- [How should semantic indexes account for separators, headers, or hidden collection children?](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/How-should-semantic-indexes-account-for-separators%2C-headers%2C-or-hidden-collection-children%3F)
- [When does a tooltip improve discoverability without duplicating an accessible label?](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/When-does-a-tooltip-improve-discoverability-without-duplicating-an-accessible-label%3F)
- [How should a widget participate in keyboard focus without confusing it with accessibility focus?](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/How-should-a-widget-participate-in-keyboard-focus-without-confusing-it-with-accessibility-focus%3F)
- [Where should a focus scope begin and end?](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Where-should-a-focus-scope-begin-and-end%3F)
- [How should physical key combinations map to semantic commands?](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/How-should-physical-key-combinations-map-to-semantic-commands%3F)
- [How can multiple interaction surfaces invoke the same intent-driven behavior?](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/How-can-multiple-interaction-surfaces-invoke-the-same-intent-driven-behavior%3F)

## Best Practices

- [Prefer native controls and add `Semantics` only when their accessible meaning needs refinement](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Prefer-native-controls-and-add-Semantics-only-when-their-accessible-meaning-needs-refinement)
- [Exclude only decorative or intentionally replaced descendant semantics](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Exclude-only-decorative-or-intentionally-replaced-descendant-semantics)
- [Merge descendants only when users should perceive and operate them as one item](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Merge-descendants-only-when-users-should-perceive-and-operate-them-as-one-item)
- [Block background semantics while a modal or obscuring surface is active](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Block-background-semantics-while-a-modal-or-obscuring-surface-is-active)
- [Keep semantic indexes stable and consistent with logical reading order](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Keep-semantic-indexes-stable-and-consistent-with-logical-reading-order)
- [Write short, localized tooltip messages and test their semantics](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Write-short%2C-localized-tooltip-messages-and-test-their-semantics)
- [Manage long-lived focus nodes outside `build` and dispose nodes you own](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Manage-long-lived-focus-nodes-outside-build-and-dispose-nodes-you-own)
- [Use focus scopes to contain traversal and restore focus within meaningful regions](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Use-focus-scopes-to-contain-traversal-and-restore-focus-within-meaningful-regions)
- [Respect platform conventions and text-editing bindings when defining shortcuts](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Respect-platform-conventions-and-text-editing-bindings-when-defining-shortcuts)
- [Keep actions contextual, reusable, and independent of a particular input device](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Keep-actions-contextual%2C-reusable%2C-and-independent-of-a-particular-input-device)
- [Test with screen readers, keyboard-only navigation, large text, and platform accessibility settings](https://app.syntblaze.com/qsp/flutter/Widgets/Accessibility/Test-with-screen-readers%2C-keyboard-only-navigation%2C-large-text%2C-and-platform-accessibility-settings)

[< Back to widgets](../README.md)
