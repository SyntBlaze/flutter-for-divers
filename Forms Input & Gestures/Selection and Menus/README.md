# Selection and Menus

Flutter selection controls expose state through values and callbacks, while menus
and autocomplete controls reveal choices on demand. Most controls follow a
controlled-widget contract: the application supplies the current value or
selection, a callback reports the user's proposed change, and rebuilding with
new state makes that change visible. A non-null callback usually enables the
control; a null callback commonly represents its disabled state.

```text
choice count and presentation
            |
            +-- independent boolean --------> Checkbox / Switch
            +-- one of a visible set --------> Radio / SegmentedButton
            +-- scalar or numeric range -----> Slider / RangeSlider
            +-- choice revealed on demand ---> Dropdown / Popup / MenuAnchor
            \-- searchable suggestions ------> Autocomplete
```

Choose a control for the meaning of the decision, not only its appearance.
Checkboxes represent independent choices, radios and single-selection segments
represent one choice from a group, and switches conventionally apply an on/off
setting immediately. Sliders are best when approximate relative position is
useful; use direct text entry or another precise control when exact values matter.

Material 3 introduces alternatives for several older Material APIs.
`DropdownMenu` is generally the Material 3 choice for dropdown selection, while
`DropdownButton` remains useful for its established controlled-value contract.
`MenuAnchor` supports Material 3 anchored menus and arbitrary menu children;
`PopupMenuButton` remains a compact, convenient Material 2-style popup menu.
These pairs differ in state ownership, focus, keyboard behavior, and composition,
so migration should be intentional rather than a mechanical widget rename.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus) — Focused, bite-sized article covering Selection and Menus
- [Learning Path](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus) — Step-by-step material that builds practical Selection and Menus knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus) — Structured, in-depth material for learning about Selection and Menus thoroughly

## Selection and Menus Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Checkbox` | Selects an independent boolean value, with optional indeterminate state | Supply `value`, handle the proposed `bool?` in `onChanged`, rebuild with the accepted value, and enable `tristate` only when `null` has a clear meaning | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Checkbox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Checkbox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Checkbox "Deep Dive") |
| `Radio` | Selects one value from a mutually exclusive group | Keep one group value as the source of truth, update it through the group's selection callback, and give the group an accessible label; use the current `RadioGroup` pattern where supported | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Radio "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Radio "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Radio "Deep Dive") |
| `Switch` | Toggles a setting that normally takes effect immediately | Treat `value` as controlled state and apply `onChanged` promptly; use a checkbox instead when the choice is part of a batch submitted later | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Switch "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Switch "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Switch "Deep Dive") |
| `Slider` | Chooses one numeric value from a continuous or divided range | Clamp the controlled `value` to `min` and `max`, use `divisions` for discrete steps, and provide a useful semantic value when the number alone is unclear | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Slider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Slider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Slider "Deep Dive") |
| `RangeSlider` | Chooses ordered start and end values within one numeric range | Store and rebuild with `RangeValues`, preserve valid ordering and bounds, and communicate both endpoints accessibly | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/RangeSlider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/RangeSlider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/RangeSlider "Deep Dive") |
| `DropdownButton` | Opens the established Material dropdown for a controlled selected value | Ensure exactly one item matches a non-null `value`, update state in `onChanged`, and explicitly manage focus, menu width, and disabled hints | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/DropdownButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/DropdownButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/DropdownButton "Deep Dive") |
| `DropdownMenu` | Material 3 text-field-like dropdown with optional filtering and search | `initialSelection` initializes internal selection rather than providing the same controlled contract as `DropdownButton.value`; persist `onSelected` results and coordinate any controller and focus node deliberately | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/DropdownMenu "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/DropdownMenu "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/DropdownMenu "Deep Dive") |
| `PopupMenuButton` | Opens a convenient popup list and reports the selected item | Return stable typed values from entries, commit in `onSelected`, handle cancellation when needed, and prefer `MenuAnchor` when Material 3 composition or cascading menus are required | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/PopupMenuButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/PopupMenuButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/PopupMenuButton "Deep Dive") |
| `MenuAnchor` | Anchors a Material 3 menu to a builder-defined control | Keep opening, closing, focus restoration, and `MenuController` ownership coherent; place actions on menu children such as `MenuItemButton` | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/MenuAnchor "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/MenuAnchor "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/MenuAnchor "Deep Dive") |
| `SegmentedButton` | Presents a compact Material 3 set of mutually related choices | Keep `selected` as a controlled `Set<T>`, handle the complete replacement set in `onSelectionChanged`, and configure empty or multiple selection only when the model permits it | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/SegmentedButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/SegmentedButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/SegmentedButton "Deep Dive") |
| `Autocomplete` | Suggests matching options as text is entered and commits a selected option | Keep `optionsBuilder` fast, define stable display text and equality behavior, handle `onSelected`, and preserve keyboard traversal between the field and options view | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Autocomplete "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Autocomplete "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Autocomplete "Deep Dive") |

## Questions

- [When should a boolean choice be a checkbox, a switch, or a radio option?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/When-should-a-boolean-choice-be-a-checkbox%2C-a-switch%2C-or-a-radio-option%3F)
- [How does a radio group keep one selected value and expose one accessible question?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/How-does-a-radio-group-keep-one-selected-value-and-expose-one-accessible-question%3F)
- [Why must a controlled control rebuild after `onChanged` or `onSelectionChanged`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Why-must-a-controlled-control-rebuild-after-onChanged-or-onSelectionChanged%3F)
- [When should a slider be continuous, divided into steps, or replaced by precise entry?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/When-should-a-slider-be-continuous%2C-divided-into-steps%2C-or-replaced-by-precise-entry%3F)
- [How should a range control announce and update its two endpoints?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/How-should-a-range-control-announce-and-update-its-two-endpoints%3F)
- [How does `DropdownButton.value` differ from `DropdownMenu.initialSelection`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/How-does-DropdownButton.value-differ-from-DropdownMenu.initialSelection%3F)
- [When is `DropdownButton` still preferable to the Material 3 `DropdownMenu`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/When-is-DropdownButton-still-preferable-to-the-Material-3-DropdownMenu%3F)
- [When should `PopupMenuButton` be migrated to `MenuAnchor`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/When-should-PopupMenuButton-be-migrated-to-MenuAnchor%3F)
- [Who owns menu open state, focus, and focus restoration around a `MenuAnchor`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Who-owns-menu-open-state%2C-focus%2C-and-focus-restoration-around-a-MenuAnchor%3F)
- [How do single, multiple, and empty selection change the `SegmentedButton` contract?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/How-do-single%2C-multiple%2C-and-empty-selection-change-the-SegmentedButton-contract%3F)
- [How should autocomplete suggestions behave for typing, arrow keys, Escape, Enter, and focus loss?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/How-should-autocomplete-suggestions-behave-for-typing%2C-arrow-keys%2C-Escape%2C-Enter%2C-and-focus-loss%3F)

## Best Practices

- [Keep the model as the source of truth for controlled values and rebuild after accepting a callback](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Keep-the-model-as-the-source-of-truth-for-controlled-values-and-rebuild-after-accepting-a-callback)
- [Represent disabled state intentionally and do not rely on color alone to explain why an action is unavailable](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Represent-disabled-state-intentionally-and-do-not-rely-on-color-alone-to-explain-why-an-action-is-unavailable)
- [Use labels, grouping, semantics, adequate touch targets, and visible focus for every selection control](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Use-labels%2C-grouping%2C-semantics%2C-adequate-touch-targets%2C-and-visible-focus-for-every-selection-control)
- [Choose controls by decision semantics: independent, mutually exclusive, immediate, ranged, or command-like](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Choose-controls-by-decision-semantics%3A-independent%2C-mutually-exclusive%2C-immediate%2C-ranged%2C-or-command-like)
- [Provide textual or semantic values for sliders and do not require fine pointer precision](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Provide-textual-or-semantic-values-for-sliders-and-do-not-require-fine-pointer-precision)
- [Use stable typed values and deterministic equality for menu entries and selected items](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Use-stable-typed-values-and-deterministic-equality-for-menu-entries-and-selected-items)
- [Treat `DropdownMenu` and `MenuAnchor` as Material 3 APIs with different state and composition contracts, not drop-in replacements](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Treat-DropdownMenu-and-MenuAnchor-as-Material-3-APIs-with-different-state-and-composition-contracts%2C-not-drop-in-replacements)
- [Keep menu items reachable by keyboard, use conventional arrow/Escape/Enter behavior, and restore focus to the opener when the menu closes](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Keep-menu-items-reachable-by-keyboard%2C-use-conventional-arrow%2FEscape%2FEnter-behavior%2C-and-restore-focus-to-the-opener-when-the-menu-closes)
- [Avoid hiding critical or frequently used actions exclusively inside an undiscoverable popup menu](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Avoid-hiding-critical-or-frequently-used-actions-exclusively-inside-an-undiscoverable-popup-menu)
- [Keep segmented choices short, distinct, and few enough to remain legible at large text scales](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Keep-segmented-choices-short%2C-distinct%2C-and-few-enough-to-remain-legible-at-large-text-scales)
- [Debounce or cancel expensive asynchronous suggestion work and ignore stale autocomplete results](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Debounce-or-cancel-expensive-asynchronous-suggestion-work-and-ignore-stale-autocomplete-results)
- [Test touch, mouse, keyboard, screen reader, text scaling, high contrast, disabled state, and focus traversal](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Selection-and-Menus/Test-touch%2C-mouse%2C-keyboard%2C-screen-reader%2C-text-scaling%2C-high-contrast%2C-disabled-state%2C-and-focus-traversal)

[< Back to forms input & gestures](../README.md)
