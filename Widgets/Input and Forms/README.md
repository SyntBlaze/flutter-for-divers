# Input and Forms

Flutter input widgets range from low-level editable text to complete form,
selection, and menu controls. The visual control is only one part of the
design: applications also need a clear owner for the current value, a policy
for validation and submission, accessible labels, and predictable keyboard
and focus behavior.

```text
user gesture or keyboard event
              |
              v
        input control
              |
              v
     value / controller state
              |
       +------+------+
       |             |
       v             v
  validation      application action
       |
       v
 error presentation and focus recovery
```

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms) — Focused, bite-sized article covering Input and Forms
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms) — Step-by-step material that builds practical Input and Forms knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms) — Structured, in-depth material for learning about Input and Forms thoroughly

## Selection and Composition Guidance

Use `Form` to coordinate a group of `FormField` descendants when the group
needs validation, saving, or resetting as one unit. `TextFormField` provides
the standard bridge between a Material `TextField` and that form lifecycle;
use `TextField` when independent text entry is enough. Reach for
`EditableText` only when building a custom text-input experience and accepting
responsibility for selection, cursor, focus, styling, and platform input
details. Keep controllers and focus nodes in state objects, update them when
widget configuration changes, and dispose of resources the widget owns.

Choose a control that matches the value model. `Checkbox` represents an
independent Boolean or optional tristate value, `Radio` selects one value from
a mutually exclusive group, `Switch` toggles an immediate setting, `Slider`
selects one value from a range, and `RangeSlider` selects an interval. Their
`ListTile` variants are useful when the label and supporting content should
share one large tap target. Preserve a single source of truth: render the
control from application state and update that state from its callback.

Use `Autocomplete` for a conventional suggestions field and
`RawAutocomplete` when the field, options overlay, and selection behavior need
custom composition. Use `DropdownButton` for the established button-and-menu
pattern, `DropdownMenu` for the newer text-field-like Material menu, and
`PopupMenuButton` for an action menu rather than a form value. Prefer
`KeyboardListener` for hardware key events. `RawKeyboardListener` is retained
for older code paths but should not be the first choice for new implementations.

## Input and Form Widgets

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Form` | Coordinates validation, saving, and resetting for descendant form fields | Use one stable `GlobalKey<FormState>` or `Form.of` lookup and validate at an intentional interaction point | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/Form "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/Form "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/Form "Deep Dive") |
| `FormField` | Supplies reusable field state, validation, saving, and error presentation | Custom fields must call `didChange` so the form sees value and interaction updates | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/FormField "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/FormField "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/FormField "Deep Dive") |
| `TextFormField` | Integrates Material text entry with the `FormField` lifecycle | Decide whether a controller or `initialValue` owns the initial text and avoid conflicting sources | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/TextFormField "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/TextFormField "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/TextFormField "Deep Dive") |
| `TextField` | Provides Material text input, selection, decoration, and editing callbacks | Own and dispose controllers and focus nodes deliberately, and handle submission separately from every edit | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/TextField "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/TextField "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/TextField "Deep Dive") |
| `EditableText` | Exposes the low-level editable-text implementation beneath higher-level fields | Custom use must supply focus, controller, cursor, text style, and platform editing behavior correctly | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/EditableText "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/EditableText "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/EditableText "Deep Dive") |
| `Autocomplete` | Builds a conventional text field with filtered selectable suggestions | Keep option equality, display text, and asynchronous result ordering predictable | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/Autocomplete "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/Autocomplete "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/Autocomplete "Deep Dive") |
| `RawAutocomplete` | Composes a custom field, options view, and selection pipeline | Anchor the overlay correctly and coordinate controller and focus-node ownership | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/RawAutocomplete "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/RawAutocomplete "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/RawAutocomplete "Deep Dive") |
| `Checkbox` | Selects a Boolean or optional tristate value | When `tristate` is enabled, account for `null` in state, semantics, and callback handling | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/Checkbox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/Checkbox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/Checkbox "Deep Dive") |
| `CheckboxListTile` | Combines a checkbox with a labeled Material list row | Ensure the merged semantics remain valid when title or secondary content is interactive | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/CheckboxListTile "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/CheckboxListTile "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/CheckboxListTile "Deep Dive") |
| `Radio` | Represents one option in a mutually exclusive selection group | Model the selected group value once and give every option a distinct, stable value | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/Radio "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/Radio "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/Radio "Deep Dive") |
| `RadioListTile` | Combines a radio option with a labeled Material list row | Make the whole row's selection behavior and group semantics clear | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/RadioListTile "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/RadioListTile "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/RadioListTile "Deep Dive") |
| `Slider` | Selects a single numeric value along a bounded range | Clamp and quantize state consistently, and provide a semantic label for non-obvious values | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/Slider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/Slider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/Slider "Deep Dive") |
| `RangeSlider` | Selects lower and upper numeric bounds | Preserve ordered endpoints and make overlapping-thumb behavior understandable | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/RangeSlider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/RangeSlider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/RangeSlider "Deep Dive") |
| `Switch` | Toggles an immediate Boolean setting | Use a checkbox instead when the action is part of a deferred multi-field submission | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/Switch "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/Switch "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/Switch "Deep Dive") |
| `SwitchListTile` | Combines a switch with a labeled Material list row | Let the row expose one coherent tap target and accessible control label | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/SwitchListTile "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/SwitchListTile "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/SwitchListTile "Deep Dive") |
| `DropdownButton` | Selects one item from a button-triggered dropdown menu | The current value must match exactly one item, and the menu needs a useful disabled or hint state | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/DropdownButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/DropdownButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/DropdownButton "Deep Dive") |
| `DropdownMenu` | Presents Material menu selection through a text-field-like control | Choose initial selection and controller usage so displayed text cannot drift from selected state | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/DropdownMenu "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/DropdownMenu "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/DropdownMenu "Deep Dive") |
| `PopupMenuButton` | Opens a transient menu of commands or choices from a button | Use it for contextual actions and communicate the selected value elsewhere when selection persists | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/PopupMenuButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/PopupMenuButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/PopupMenuButton "Deep Dive") |
| `RawKeyboardListener` | Receives legacy raw hardware keyboard events for a focused subtree | Prefer `KeyboardListener` for new code and keep a live `FocusNode` attached while listening | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/RawKeyboardListener "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/RawKeyboardListener "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/RawKeyboardListener "Deep Dive") |
| `KeyboardListener` | Receives hardware key events while its focus node has focus | Handle logical keys and repeat events without interfering with text input or shortcut systems | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Input-and-Forms/KeyboardListener "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Input-and-Forms/KeyboardListener "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Input-and-Forms/KeyboardListener "Deep Dive") |

## Questions

- [How should a `Form` coordinate validation, saving, resetting, and focus on the first error?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/How-should-a-Form-coordinate-validation%2C-saving%2C-resetting%2C-and-focus-on-the-first-error%3F)
- [How can a custom `FormField` report changes and render validation errors?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/How-can-a-custom-FormField-report-changes-and-render-validation-errors%3F)
- [When should `TextFormField` use a controller instead of `initialValue`?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/When-should-TextFormField-use-a-controller-instead-of-initialValue%3F)
- [How should `TextField` separate editing, submission, focus, and controller ownership?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/How-should-TextField-separate-editing%2C-submission%2C-focus%2C-and-controller-ownership%3F)
- [When is building directly with `EditableText` justified?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/When-is-building-directly-with-EditableText-justified%3F)
- [How does `Autocomplete` match, display, and select option objects?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/How-does-Autocomplete-match%2C-display%2C-and-select-option-objects%3F)
- [Which field and overlay responsibilities does `RawAutocomplete` leave to the caller?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Which-field-and-overlay-responsibilities-does-RawAutocomplete-leave-to-the-caller%3F)
- [When should a `Checkbox` use tristate behavior?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/When-should-a-Checkbox-use-tristate-behavior%3F)
- [How does `CheckboxListTile` combine its label, tap target, and semantics?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/How-does-CheckboxListTile-combine-its-label%2C-tap-target%2C-and-semantics%3F)
- [How do radio options share one mutually exclusive selected value?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/How-do-radio-options-share-one-mutually-exclusive-selected-value%3F)
- [When is `RadioListTile` clearer than separately composing a radio and label?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/When-is-RadioListTile-clearer-than-separately-composing-a-radio-and-label%3F)
- [How should a `Slider` represent divisions, labels, and semantic values?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/How-should-a-Slider-represent-divisions%2C-labels%2C-and-semantic-values%3F)
- [How can `RangeSlider` keep two endpoints understandable and ordered?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/How-can-RangeSlider-keep-two-endpoints-understandable-and-ordered%3F)
- [When does an immediate setting call for a `Switch` rather than a checkbox?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/When-does-an-immediate-setting-call-for-a-Switch-rather-than-a-checkbox%3F)
- [How should `SwitchListTile` expose its entire row as one control?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/How-should-SwitchListTile-expose-its-entire-row-as-one-control%3F)
- [How are `DropdownButton` items matched to the current value?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/How-are-DropdownButton-items-matched-to-the-current-value%3F)
- [When should a Material form use `DropdownMenu`?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/When-should-a-Material-form-use-DropdownMenu%3F)
- [When is `PopupMenuButton` an action menu rather than a value field?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/When-is-PopupMenuButton-an-action-menu-rather-than-a-value-field%3F)
- [Why should legacy `RawKeyboardListener` uses migrate to `KeyboardListener`?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Why-should-legacy-RawKeyboardListener-uses-migrate-to-KeyboardListener%3F)
- [How should `KeyboardListener` interact with focus, repeat events, and shortcuts?](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/How-should-KeyboardListener-interact-with-focus%2C-repeat-events%2C-and-shortcuts%3F)

## Best Practices

- [Keep the `FormState` access path stable and validate only at meaningful times](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Keep-the-FormState-access-path-stable-and-validate-only-at-meaningful-times)
- [Call `FormFieldState.didChange` whenever a custom field's value changes](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Call-FormFieldState.didChange-whenever-a-custom-field's-value-changes)
- [Use one authoritative source for `TextFormField` text and dispose owned resources](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Use-one-authoritative-source-for-TextFormField-text-and-dispose-owned-resources)
- [Configure `TextField` input type, action, autofill, and semantics for the task](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Configure-TextField-input-type%2C-action%2C-autofill%2C-and-semantics-for-the-task)
- [Prefer higher-level text fields unless custom editing behavior truly requires `EditableText`](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Prefer-higher-level-text-fields-unless-custom-editing-behavior-truly-requires-EditableText)
- [Keep `Autocomplete` option identity and displayed labels deterministic](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Keep-Autocomplete-option-identity-and-displayed-labels-deterministic)
- [Position `RawAutocomplete` options accessibly and share focus resources intentionally](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Position-RawAutocomplete-options-accessibly-and-share-focus-resources-intentionally)
- [Represent nullable checkbox state explicitly when enabling tristate](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Represent-nullable-checkbox-state-explicitly-when-enabling-tristate)
- [Avoid incompatible interactive descendants inside `CheckboxListTile` labels](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Avoid-incompatible-interactive-descendants-inside-CheckboxListTile-labels)
- [Give every `Radio` option a stable value and one shared group owner](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Give-every-Radio-option-a-stable-value-and-one-shared-group-owner)
- [Keep `RadioListTile` labels concise and make selection state unmistakable](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Keep-RadioListTile-labels-concise-and-make-selection-state-unmistakable)
- [Expose meaningful units and values for `Slider` users and assistive technology](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Expose-meaningful-units-and-values-for-Slider-users-and-assistive-technology)
- [Validate `RangeSlider` endpoints as one interval rather than unrelated numbers](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Validate-RangeSlider-endpoints-as-one-interval-rather-than-unrelated-numbers)
- [Use `Switch` for settings whose effect is immediate and reversible](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Use-Switch-for-settings-whose-effect-is-immediate-and-reversible)
- [Treat `SwitchListTile` as one labeled interactive surface](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Treat-SwitchListTile-as-one-labeled-interactive-surface)
- [Keep `DropdownButton` values unique and provide empty, disabled, and error states](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Keep-DropdownButton-values-unique-and-provide-empty%2C-disabled%2C-and-error-states)
- [Keep `DropdownMenu` selection, filtering, and displayed text synchronized](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Keep-DropdownMenu-selection%2C-filtering%2C-and-displayed-text-synchronized)
- [Use `PopupMenuButton` for concise contextual actions with clear labels](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Use-PopupMenuButton-for-concise-contextual-actions-with-clear-labels)
- [Migrate new key-event handling away from `RawKeyboardListener`](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Migrate-new-key-event-handling-away-from-RawKeyboardListener)
- [Scope `KeyboardListener` narrowly and defer command handling to shortcuts and actions](https://app.syntblaze.com/qsp/flutter/Widgets/Input-and-Forms/Scope-KeyboardListener-narrowly-and-defer-command-handling-to-shortcuts-and-actions)

[< Back to widgets](../README.md)
