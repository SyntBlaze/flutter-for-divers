# Accessibility Semantics

Flutter exposes an accessibility-focused semantics tree alongside the widget
and render trees. Widgets such as `Semantics`, `MergeSemantics`, and
`ExcludeSemantics` annotate or reshape that tree. The engine then translates
semantics nodes, flags, actions, labels, values, bounds, and traversal metadata
into the accessibility APIs understood by services such as Android TalkBack,
iOS VoiceOver, and desktop screen readers.

```text
widgets and render objects
          |
          v
   semantics annotations
          |
          v
 Flutter semantics tree
  (nodes, flags, actions,
   text, bounds, ordering)
          |
          v
 platform accessibility API
          |
          v
 screen reader / switch access / voice control
```

A useful semantics tree describes meaning and available interaction without
repeating visual implementation details. A control generally needs an
understandable label, its current value or state when relevant, and the actions
it can actually perform. Merging can turn a visually composite control into one
coherent accessibility node; exclusion can remove redundant descendants; and
blocking can keep an obscured route or background region from competing with
the active interface.

Several requested topic names below are concepts rather than Flutter widget
class names. **SemanticsLabel**, **SemanticsHint**, and **SemanticsValue** refer
to semantic text exposed through properties such as `Semantics.label`,
`Semantics.hint`, and `Semantics.value`. **SemanticsButton** and
**SemanticsLink** refer to the button and link roles expressed by semantic
flags or corresponding `Semantics` properties. Their pages retain these names
to keep the topic vocabulary consistent.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics) — Focused, bite-sized article covering Accessibility Semantics
- [Learning Path](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics) — Step-by-step material that builds practical Accessibility Semantics knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics) — Structured, in-depth material for learning about Accessibility Semantics thoroughly

## Accessibility Semantics Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Semantics` | Adds accessibility meaning, state, roles, and actions to a subtree | Describe the user-facing purpose and behavior; do not merely restate every visible implementation detail | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Semantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Semantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Semantics "Deep Dive") |
| `MergeSemantics` | Combines descendant semantics into one logical node | Merge only when the descendants form one control and their properties and actions remain unambiguous | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/MergeSemantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/MergeSemantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/MergeSemantics "Deep Dive") |
| `ExcludeSemantics` | Removes descendant semantics from the resulting semantics tree | Exclude duplicated or decorative meaning without hiding content that a nonvisual user needs | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/ExcludeSemantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/ExcludeSemantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/ExcludeSemantics "Deep Dive") |
| `BlockSemantics` | Prevents earlier painted sibling semantics from being exposed below a blocking region | Use it for modal or overlay behavior whose inactive background must not remain reachable | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/BlockSemantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/BlockSemantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/BlockSemantics "Deep Dive") |
| SemanticsLabel | Provides the concise accessible name of an element | State purpose in context and avoid duplicating role, state, or neighboring text already announced | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsLabel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsLabel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsLabel "Deep Dive") |
| SemanticsHint | Explains the result of performing an action when that result is not evident | Keep hints supplemental; the label must still identify the element on its own | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsHint "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsHint "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsHint "Deep Dive") |
| SemanticsValue | Communicates the current value of a stateful control | Keep the value synchronized with visible state and expose increased or decreased values where adjustable | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsValue "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsValue "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsValue "Deep Dive") |
| SemanticsButton | Identifies button behavior as an accessibility role | Mark only genuinely activatable button-like controls and expose a matching tap action | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsButton "Deep Dive") |
| SemanticsLink | Identifies navigation to a resource or destination as a link role | Use link meaning for navigation, not as a generic style for every tappable element | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsLink "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsLink "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/SemanticsLink "Deep Dive") |
| `CustomSemanticsAction` | Exposes a named accessibility action beyond the standard semantics actions | Prefer standard actions when they fit, and give every custom action a localized, outcome-oriented label | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/CustomSemanticsAction "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/CustomSemanticsAction "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/CustomSemanticsAction "Deep Dive") |
| Live region | Requests announcement when important semantic content changes | Announce timely status changes sparingly and avoid rapid or repetitive updates that interrupt users | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Live-region "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Live-region "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Live-region "Deep Dive") |
| Screen reader traversal | Controls the order and grouping in which semantic content is explored | Keep traversal predictable and aligned with logical reading order, including in right-to-left layouts | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Screen-reader-traversal "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Screen-reader-traversal "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Screen-reader-traversal "Deep Dive") |

## Questions

- [How does a `Semantics` annotation become a platform accessibility node?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/How-does-a-Semantics-annotation-become-a-platform-accessibility-node%3F)
- [When should several descendants be announced as one `MergeSemantics` node?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/When-should-several-descendants-be-announced-as-one-MergeSemantics-node%3F)
- [What information is safe to remove with `ExcludeSemantics`?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/What-information-is-safe-to-remove-with-ExcludeSemantics%3F)
- [How does `BlockSemantics` keep an inactive background out of accessibility navigation?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/How-does-BlockSemantics-keep-an-inactive-background-out-of-accessibility-navigation%3F)
- [What makes an accessible label concise, unique, and useful in context?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/What-makes-an-accessible-label-concise%2C-unique%2C-and-useful-in-context%3F)
- [When does a hint add information that the label and role do not already provide?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/When-does-a-hint-add-information-that-the-label-and-role-do-not-already-provide%3F)
- [How should a control expose its current semantic value and possible adjustments?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/How-should-a-control-expose-its-current-semantic-value-and-possible-adjustments%3F)
- [When should custom interaction be represented with button semantics?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/When-should-custom-interaction-be-represented-with-button-semantics%3F)
- [What distinguishes link semantics from a general tap action?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/What-distinguishes-link-semantics-from-a-general-tap-action%3F)
- [When is a `CustomSemanticsAction` justified instead of a standard action?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/When-is-a-CustomSemanticsAction-justified-instead-of-a-standard-action%3F)
- [Which changing content deserves a live-region announcement?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Which-changing-content-deserves-a-live-region-announcement%3F)
- [How can traversal order remain logical when visual position, reading direction, and grouping differ?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/How-can-traversal-order-remain-logical-when-visual-position%2C-reading-direction%2C-and-grouping-differ%3F)

## Best Practices

- [Inspect the resulting semantics tree instead of assuming widget structure maps directly to accessibility output](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Inspect-the-resulting-semantics-tree-instead-of-assuming-widget-structure-maps-directly-to-accessibility-output)
- [Prefer the semantics already supplied by standard Flutter controls, adding annotations only where meaning is missing](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Prefer-the-semantics-already-supplied-by-standard-Flutter-controls%2C-adding-annotations-only-where-meaning-is-missing)
- [Merge descendants only when users should perceive and operate them as a single element](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Merge-descendants-only-when-users-should-perceive-and-operate-them-as-a-single-element)
- [Exclude decorative and duplicate semantics while preserving names, values, state, and actions](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Exclude-decorative-and-duplicate-semantics-while-preserving-names%2C-values%2C-state%2C-and-actions)
- [Block obscured background semantics when presenting a modal interaction](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Block-obscured-background-semantics-when-presenting-a-modal-interaction)
- [Localize labels, hints, values, and custom action names with the rest of the interface](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Localize-labels%2C-hints%2C-values%2C-and-custom-action-names-with-the-rest-of-the-interface)
- [Keep labels focused on identity and hints focused on non-obvious outcomes](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Keep-labels-focused-on-identity-and-hints-focused-on-non-obvious-outcomes)
- [Update semantic state and values whenever the corresponding visual state changes](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Update-semantic-state-and-values-whenever-the-corresponding-visual-state-changes)
- [Expose roles and actions that agree with what the control actually does](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Expose-roles-and-actions-that-agree-with-what-the-control-actually-does)
- [Use standard semantics actions before defining a custom action](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Use-standard-semantics-actions-before-defining-a-custom-action)
- [Reserve live regions for important, time-sensitive changes and test their announcement behavior on target platforms](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Reserve-live-regions-for-important%2C-time-sensitive-changes-and-test-their-announcement-behavior-on-target-platforms)
- [Test traversal with real screen readers in every supported text direction, not only with visual inspection](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Accessibility-Semantics/Test-traversal-with-real-screen-readers-in-every-supported-text-direction%2C-not-only-with-visual-inspection)

[< Back to internationalization & accessibility](../README.md)
