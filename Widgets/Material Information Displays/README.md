# Material: Information Displays

Material information displays organize content into recognizable surfaces,
compact labels, progress feedback, rows, tables, and guided sequences. Choose
the component that matches the information's structure instead of choosing by
appearance alone: cards group related content, chips represent compact
entities or choices, indicators communicate ongoing work, and tables expose
data whose columns need to be compared.

Use chip variants according to their interaction model. `ActionChip` triggers
an operation, `ChoiceChip` selects one option from a set, `FilterChip` toggles
a filter, and `InputChip` represents user-supplied or removable input. Use
`ListTile` for a conventional leading-title-subtitle-trailing row and `Card`
when several elements form one semantic group. A `Badge` supplements another
control with a short status or count; it should not carry essential
information that is unavailable elsewhere.

Information displays still need state and semantics. Progress indicators
should distinguish determinate work from indeterminate waiting, tables should
remain usable on narrow and assistive interfaces, and tooltips should clarify
controls without becoming the only way to discover important instructions.
Theme the components consistently, provide meaningful labels and states, and
test layouts with large text, keyboard navigation, and screen readers.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays) — Focused, bite-sized article covering Material: Information Displays
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays) — Step-by-step material that builds practical Material: Information Displays knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays) — Structured, in-depth material for learning about Material: Information Displays thoroughly

## Material Information Displays

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Card` | Groups related content and actions on a Material surface | Treat the card as one coherent section and add explicit interaction semantics if the whole surface is tappable | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/Card "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/Card "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/Card "Deep Dive") |
| `Chip` | Displays a compact piece of information or entity | Use the specialized chip variants when the element performs an action, selection, filtering, or deletion | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/Chip "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/Chip "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/Chip "Deep Dive") |
| `ActionChip` | Presents a compact action related to nearby content | Use it for an operation rather than persistent selection, and make its label describe the result | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/ActionChip "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/ActionChip "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/ActionChip "Deep Dive") |
| `ChoiceChip` | Represents one choice within a small single-selection set | Keep selection state controlled and make the relationship among choices clear, commonly with `Wrap` | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/ChoiceChip "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/ChoiceChip "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/ChoiceChip "Deep Dive") |
| `FilterChip` | Toggles a filter or attribute in a compact multi-selection set | Show selected state clearly and ensure every combination has predictable filtering behavior | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/FilterChip "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/FilterChip "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/FilterChip "Deep Dive") |
| `InputChip` | Represents a complex input such as a person, tag, or removable token | Distinguish selection, press, and delete actions and give each action suitable semantics | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/InputChip "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/InputChip "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/InputChip "Deep Dive") |
| `CircularProgressIndicator` | Shows determinate or indeterminate progress in a circular form | Pass a normalized `value` for measurable progress and `null` only when progress cannot be quantified | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/CircularProgressIndicator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/CircularProgressIndicator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/CircularProgressIndicator "Deep Dive") |
| `LinearProgressIndicator` | Shows determinate or indeterminate progress along a horizontal track | Pair it with context about the operation and avoid presenting false precision | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/LinearProgressIndicator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/LinearProgressIndicator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/LinearProgressIndicator "Deep Dive") |
| `DataTable` | Displays rows of values under comparable labeled columns | It measures columns and can be expensive for large data sets; plan sorting, selection, and horizontal space deliberately | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/DataTable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/DataTable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/DataTable "Deep Dive") |
| `PaginatedDataTable` | Presents tabular data in pageable groups of rows | Keep a stable `DataTableSource`, report row counts accurately, and preserve selection and sort state across pages | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/PaginatedDataTable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/PaginatedDataTable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/PaginatedDataTable "Deep Dive") |
| `Divider` | Separates adjacent content with a horizontal Material rule | Use hierarchy and spacing first, adding dividers only where a boundary improves comprehension | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/Divider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/Divider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/Divider "Deep Dive") |
| `ListTile` | Arranges leading, title, subtitle, and trailing content as a standard row | Keep density and trailing actions usable, and do not overload one tile with competing tap targets | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/ListTile "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/ListTile "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/ListTile "Deep Dive") |
| `Stepper` | Guides users through an ordered sequence of steps | Own the current step and continuation logic, expose errors clearly, and preserve data when users move between steps | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/Stepper "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/Stepper "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/Stepper "Deep Dive") |
| `Tooltip` | Reveals a short explanation for a control or visual element | Keep the message concise and provide visible or semantic alternatives for essential guidance | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/Tooltip "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/Tooltip "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/Tooltip "Deep Dive") |
| `Badge` | Adds a compact count, label, or status marker to another widget | Keep labels brief, hide empty badges intentionally, and expose the same status through accessible semantics | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Material-Information-Displays/Badge "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Material-Information-Displays/Badge "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Material-Information-Displays/Badge "Deep Dive") |

## Questions

- [When should related content be grouped in a `Card` rather than separated only by spacing?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/When-should-related-content-be-grouped-in-a-Card-rather-than-separated-only-by-spacing%3F)
- [Is a non-interactive `Chip` sufficient, or does the content need a specialized chip behavior?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Is-a-non-interactive-Chip-sufficient%2C-or-does-the-content-need-a-specialized-chip-behavior%3F)
- [Does this compact element trigger an action rather than represent selected state?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Does-this-compact-element-trigger-an-action-rather-than-represent-selected-state%3F)
- [How should a set of `ChoiceChip` widgets communicate a single current choice?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/How-should-a-set-of-ChoiceChip-widgets-communicate-a-single-current-choice%3F)
- [Can users understand and combine the selected filters represented by `FilterChip` widgets?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Can-users-understand-and-combine-the-selected-filters-represented-by-FilterChip-widgets%3F)
- [Which press, selection, and deletion behaviors should an `InputChip` expose?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Which-press%2C-selection%2C-and-deletion-behaviors-should-an-InputChip-expose%3F)
- [Is circular progress measurable, and what semantic label or value explains it?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Is-circular-progress-measurable%2C-and-what-semantic-label-or-value-explains-it%3F)
- [When should linear progress be determinate instead of indeterminate?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/When-should-linear-progress-be-determinate-instead-of-indeterminate%3F)
- [Is `DataTable` appropriate for the data size and available horizontal space?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Is-DataTable-appropriate-for-the-data-size-and-available-horizontal-space%3F)
- [How will a `DataTableSource` preserve data, sorting, and selection while pages change?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/How-will-a-DataTableSource-preserve-data%2C-sorting%2C-and-selection-while-pages-change%3F)
- [Does a divider clarify grouping, or would spacing communicate the hierarchy more cleanly?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Does-a-divider-clarify-grouping%2C-or-would-spacing-communicate-the-hierarchy-more-cleanly%3F)
- [Which content and actions belong in the leading, title, subtitle, and trailing slots of a `ListTile`?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Which-content-and-actions-belong-in-the-leading%2C-title%2C-subtitle%2C-and-trailing-slots-of-a-ListTile%3F)
- [How should users move through, revise, and recover from errors in a `Stepper`?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/How-should-users-move-through%2C-revise%2C-and-recover-from-errors-in-a-Stepper%3F)
- [Can users discover and understand the control without relying solely on its tooltip?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Can-users-discover-and-understand-the-control-without-relying-solely-on-its-tooltip%3F)
- [What short status belongs in a `Badge`, and how will assistive technology receive it?](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/What-short-status-belongs-in-a-Badge%2C-and-how-will-assistive-technology-receive-it%3F)

## Best Practices

- [Group only closely related content and actions within a `Card`](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Group-only-closely-related-content-and-actions-within-a-Card)
- [Use a plain `Chip` for compact information without specialized interaction](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Use-a-plain-Chip-for-compact-information-without-specialized-interaction)
- [Write action-chip labels as clear, immediate operations](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Write-action-chip-labels-as-clear%2C-immediate-operations)
- [Keep `ChoiceChip` sets small and manage single-selection state explicitly](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Keep-ChoiceChip-sets-small-and-manage-single-selection-state-explicitly)
- [Make active filters visible and easy to clear when using `FilterChip`](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Make-active-filters-visible-and-easy-to-clear-when-using-FilterChip)
- [Give `InputChip` press and delete actions distinct purposes and semantics](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Give-InputChip-press-and-delete-actions-distinct-purposes-and-semantics)
- [Use determinate circular progress whenever the completed fraction is known](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Use-determinate-circular-progress-whenever-the-completed-fraction-is-known)
- [Place linear progress close to the operation whose state it represents](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Place-linear-progress-close-to-the-operation-whose-state-it-represents)
- [Reserve `DataTable` for genuinely tabular data and manageable row counts](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Reserve-DataTable-for-genuinely-tabular-data-and-manageable-row-counts)
- [Keep one long-lived `DataTableSource` and notify listeners when paginated data changes](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Keep-one-long-lived-DataTableSource-and-notify-listeners-when-paginated-data-changes)
- [Use dividers sparingly and theme their thickness, indent, and color consistently](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Use-dividers-sparingly-and-theme-their-thickness%2C-indent%2C-and-color-consistently)
- [Keep list tiles scannable, accessible, and free of ambiguous competing actions](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Keep-list-tiles-scannable%2C-accessible%2C-and-free-of-ambiguous-competing-actions)
- [Validate each step without discarding information users entered in other steps](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Validate-each-step-without-discarding-information-users-entered-in-other-steps)
- [Use short tooltip messages and never make hover the only discovery path](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Use-short-tooltip-messages-and-never-make-hover-the-only-discovery-path)
- [Mirror badge counts and status changes in accessible labels or surrounding content](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Mirror-badge-counts-and-status-changes-in-accessible-labels-or-surrounding-content)
- [Test information displays with large text, high contrast, keyboard input, and screen readers](https://app.syntblaze.com/qsp/flutter/Widgets/Material-Information-Displays/Test-information-displays-with-large-text%2C-high-contrast%2C-keyboard-input%2C-and-screen-readers)

[< Back to widgets](../README.md)
