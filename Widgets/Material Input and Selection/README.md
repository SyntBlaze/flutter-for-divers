# Material: Input and Selection

Material input and selection widgets let people enter text, choose values, and
select dates or times using controls that follow Material interaction and
visual conventions. The control is only the visible part of the feature: its
value still needs a clear owner, meaningful labels, validation where
appropriate, and predictable behavior for touch, keyboard, focus, and
assistive technology.

```text
application state
       |
       v
Material input or selection control
       |
       v
change, submit, or confirm callback
       |
       v
validation and application action
```

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection) — Focused, bite-sized article covering Material: Input and Selection
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection) — Step-by-step material that builds practical Material: Input and Selection knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection) — Structured, in-depth material for learning about Material: Input and Selection thoroughly

## Selection and Composition Guidance

Choose a control that matches the value model and the moment at which a change
takes effect. Use `Checkbox` for independent Boolean or optional tristate
choices, `Radio` for one choice from a mutually exclusive group, and `Switch`
for an immediate setting. Use `Slider` for one numeric value and `RangeSlider`
for an ordered interval. Keep each control driven by one authoritative state
value, and update that value from its callback rather than allowing displayed
and stored selections to drift apart.

Use `TextField` for independent Material text entry and `TextFormField` when
the field must participate in coordinated form validation, saving, or reset.
Keep long-lived controllers and focus nodes outside `build`, dispose resources
the widget owns, and configure keyboard type, input action, autofill, labels,
and error presentation for the task. Avoid validating noisily on every
keystroke unless immediate feedback genuinely helps the user.

Use `SearchBar` when a Material search field and its current query are the main
concern. Use `SearchAnchor` when the experience also needs an anchored search
view with dynamically built suggestions or results. Treat query updates and
suggestion selection as asynchronous-capable operations: ignore stale results,
represent loading and empty states, and keep focus and keyboard traversal
usable when the view opens or closes.

`DatePickerDialog` and `TimePickerDialog` are dialog widgets for custom route
composition or direct configuration. In ordinary application code, the
corresponding `showDatePicker` and `showTimePicker` functions are often the
simpler entry points because they handle presenting the route and returning
the confirmed value. Always supply valid bounds and initial values, respect
locale and 12/24-hour conventions, and distinguish cancellation from a
confirmed selection.

## Material Input and Selection Widgets

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Checkbox` | Selects an independent Boolean or optional tristate value | When `tristate` is enabled, model `null` explicitly and make all three states understandable | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection/Checkbox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection/Checkbox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection/Checkbox "Deep Dive") |
| `Radio` | Represents one option in a mutually exclusive selection group | Give each option a stable value and keep the group's selected value in one authoritative owner | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection/Radio "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection/Radio "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection/Radio "Deep Dive") |
| `Slider` | Selects one numeric value within a bounded range | Keep values within bounds, apply divisions consistently, and expose meaningful units or semantic labels | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection/Slider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection/Slider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection/Slider "Deep Dive") |
| `RangeSlider` | Selects lower and upper values that form an interval | Preserve ordered endpoints and make overlapping thumbs and value labels distinguishable | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection/RangeSlider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection/RangeSlider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection/RangeSlider "Deep Dive") |
| `Switch` | Toggles a Boolean setting whose effect is typically immediate | Use it for immediate, reversible state rather than a choice deferred until form submission | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection/Switch "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection/Switch "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection/Switch "Deep Dive") |
| `TextField` | Provides standalone Material text input, selection, decoration, and editing callbacks | Manage controller and focus ownership deliberately, and separate text changes from submission | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection/TextField "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection/TextField "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection/TextField "Deep Dive") |
| `TextFormField` | Integrates Material text input with validation, saving, and reset through `FormField` | Choose either a controller or `initialValue` as the initial text source and coordinate validation timing | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection/TextFormField "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection/TextFormField "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection/TextFormField "Deep Dive") |
| `SearchBar` | Presents a Material search field for entering and editing a query | Keep query state synchronized with its controller and provide clear leading, trailing, and clearing actions | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection/SearchBar "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection/SearchBar "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection/SearchBar "Deep Dive") |
| `SearchAnchor` | Connects a search control to an anchored search view and suggestions | Build responsive suggestion states and manage asynchronous result ordering, focus, and view dismissal | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection/SearchAnchor "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection/SearchAnchor "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection/SearchAnchor "Deep Dive") |
| `DatePickerDialog` | Presents Material calendar or text-input date selection in a dialog | Ensure the initial date is within valid bounds and apply locale, selectable-day, and validation rules consistently | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection/DatePickerDialog "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection/DatePickerDialog "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection/DatePickerDialog "Deep Dive") |
| `TimePickerDialog` | Presents Material time selection in a dialog | Respect locale and 12/24-hour conventions, and treat dismissal separately from confirmation | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Input-and-Selection/TimePickerDialog "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Input-and-Selection/TimePickerDialog "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Input-and-Selection/TimePickerDialog "Deep Dive") |

## Questions

- [When should a `Checkbox` expose a nullable tristate value?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/When-should-a-Checkbox-expose-a-nullable-tristate-value%3F)
- [How should a set of `Radio` options share one mutually exclusive selection?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/How-should-a-set-of-Radio-options-share-one-mutually-exclusive-selection%3F)
- [How do bounds, divisions, labels, and semantic values shape a `Slider`?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/How-do-bounds%2C-divisions%2C-labels%2C-and-semantic-values-shape-a-Slider%3F)
- [How can a `RangeSlider` keep both endpoints ordered and understandable?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/How-can-a-RangeSlider-keep-both-endpoints-ordered-and-understandable%3F)
- [When is a `Switch` more appropriate than a checkbox?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/When-is-a-Switch-more-appropriate-than-a-checkbox%3F)
- [How should `TextField` coordinate controllers, focus, editing, and submission?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/How-should-TextField-coordinate-controllers%2C-focus%2C-editing%2C-and-submission%3F)
- [When should text entry use `TextFormField` and form validation?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/When-should-text-entry-use-TextFormField-and-form-validation%3F)
- [How should a `SearchBar` keep its displayed query and application state synchronized?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/How-should-a-SearchBar-keep-its-displayed-query-and-application-state-synchronized%3F)
- [How does `SearchAnchor` coordinate its anchor, search view, and suggestions?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/How-does-SearchAnchor-coordinate-its-anchor%2C-search-view%2C-and-suggestions%3F)
- [Which bounds, entry modes, and validation rules govern a `DatePickerDialog`?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Which-bounds%2C-entry-modes%2C-and-validation-rules-govern-a-DatePickerDialog%3F)
- [How should `TimePickerDialog` adapt to locale, input mode, and cancellation?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/How-should-TimePickerDialog-adapt-to-locale%2C-input-mode%2C-and-cancellation%3F)

## Best Practices

- [Model every `Checkbox` state explicitly and provide a clear accessible label](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Model-every-Checkbox-state-explicitly-and-provide-a-clear-accessible-label)
- [Keep `Radio` values unique and place group selection under one owner](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Keep-Radio-values-unique-and-place-group-selection-under-one-owner)
- [Expose `Slider` values with meaningful precision, units, and semantics](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Expose-Slider-values-with-meaningful-precision%2C-units%2C-and-semantics)
- [Validate `RangeSlider` endpoints together as one interval](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Validate-RangeSlider-endpoints-together-as-one-interval)
- [Use `Switch` only for immediate settings and communicate the resulting state](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Use-Switch-only-for-immediate-settings-and-communicate-the-resulting-state)
- [Configure `TextField` input behavior for the task and dispose owned resources](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Configure-TextField-input-behavior-for-the-task-and-dispose-owned-resources)
- [Give `TextFormField` one text owner and validate at intentional interaction points](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Give-TextFormField-one-text-owner-and-validate-at-intentional-interaction-points)
- [Keep `SearchBar` actions, query state, and keyboard behavior consistent](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Keep-SearchBar-actions%2C-query-state%2C-and-keyboard-behavior-consistent)
- [Handle loading, empty, error, and stale-result states in `SearchAnchor`](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Handle-loading%2C-empty%2C-error%2C-and-stale-result-states-in-SearchAnchor)
- [Validate date bounds and selectable dates before presenting `DatePickerDialog`](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Validate-date-bounds-and-selectable-dates-before-presenting-DatePickerDialog)
- [Respect regional time conventions and distinguish cancel from confirm in `TimePickerDialog`](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Respect-regional-time-conventions-and-distinguish-cancel-from-confirm-in-TimePickerDialog)
- [Test every control with touch, keyboard, text scaling, and assistive technology](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Input-and-Selection/Test-every-control-with-touch%2C-keyboard%2C-text-scaling%2C-and-assistive-technology)

[< Back to widgets](../README.md)
