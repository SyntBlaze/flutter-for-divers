# Cupertino

Cupertino widgets implement interaction patterns and visual conventions familiar
to users of Apple platforms. They cover page structure, navigation, dialogs,
pickers, controls, lists, text input, and transitions without requiring a
Material surface. Use them when the product intentionally follows an iOS-style
design language, or select individual Cupertino controls as part of a carefully
designed adaptive interface.

These widgets work best as a coherent system. `CupertinoPageScaffold` and
`CupertinoNavigationBar` establish page structure, while `CupertinoTabScaffold`,
`CupertinoTabBar`, and `CupertinoTabView` coordinate tab navigation and
independent navigation stacks. Dialogs, action sheets, and context menus should
be presented with the matching Cupertino route APIs so their animation,
dismissal, safe-area, and accessibility behavior feels native.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino) — Focused, bite-sized article covering Cupertino
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino) — Step-by-step material that builds practical Cupertino knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino) — Structured, in-depth material for learning about Cupertino thoroughly

## Selection and Composition Guidance

Choose controls according to the value being edited. Use switches and
checkboxes for independent Boolean values, segmented controls for a small set of
related choices, sliders for continuous ranges, and pickers for values best
understood by scrolling through ordered options. Keep state in the owning
screen, pass the current value into each control, and update it from callbacks;
do not treat a control's appearance as the source of truth.

Use `CupertinoAlertDialog` for a focused decision and
`CupertinoActionSheet` for a set of contextual actions. Use
`CupertinoDatePicker` or `CupertinoTimerPicker` for inline selection experiences
and place them in an appropriately presented surface when they should appear
modally. Prefer `CupertinoButton` and `CupertinoDialogAction` over custom gesture
regions so pressed states, focus, semantics, and target sizing remain intact.

Navigation and transition widgets require consistent route ownership. Let
`CupertinoPageRoute` drive `CupertinoPageTransition` in ordinary applications,
and reach for the transition widgets directly only when implementing a custom
route. In tabbed applications, preserve a navigator per tab when users expect
each tab's history to survive switching. Test all Cupertino layouts with safe
areas, dynamic type, keyboard navigation, screen readers, and both left-to-right
and right-to-left content.

## Cupertino Widgets

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `CupertinoActionSheet` | Presents a title, message, actions, and optional cancel action in an iOS-style modal sheet | Keep choices concise, distinguish destructive actions, and present it through the Cupertino modal API | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoActionSheet "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoActionSheet "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoActionSheet "Deep Dive") |
| `CupertinoActivityIndicator` | Displays an iOS-style indeterminate progress spinner | Use it only when progress cannot be quantified and ensure surrounding content explains the pending work | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoActivityIndicator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoActivityIndicator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoActivityIndicator "Deep Dive") |
| `CupertinoAlertDialog` | Presents a focused iOS-style alert with content and actions | Reserve it for decisions that require attention and avoid long or complex dialog content | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoAlertDialog "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoAlertDialog "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoAlertDialog "Deep Dive") |
| `CupertinoButton` | Provides a tappable iOS-style text, tinted, filled, or custom-content action | Use a null callback for a genuinely disabled action and retain adequate hit targets | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoButton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoButton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoButton "Deep Dive") |
| `CupertinoCheckbox` | Toggles an independent Boolean or tristate value with Cupertino styling | Own the value outside the widget and label the control through nearby content or semantics | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoCheckbox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoCheckbox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoCheckbox "Deep Dive") |
| `CupertinoContextMenu` | Reveals a preview and contextual actions after a long press | Offer actions that truly apply to the previewed item and provide another discoverable path where needed | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoContextMenu "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoContextMenu "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoContextMenu "Deep Dive") |
| `CupertinoDatePicker` | Selects a date, time, or date-and-time through scrolling columns | Configure mode, bounds, minute interval, locale, and 24-hour behavior consistently | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoDatePicker "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoDatePicker "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoDatePicker "Deep Dive") |
| `CupertinoDialogAction` | Represents an action in a Cupertino alert or dialog | Mark default and destructive intent accurately and keep action labels short | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoDialogAction "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoDialogAction "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoDialogAction "Deep Dive") |
| `CupertinoFullscreenDialogTransition` | Animates a full-screen Cupertino dialog route | Coordinate primary and secondary route animations and avoid invoking it when a standard route already supplies the transition | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoFullscreenDialogTransition "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoFullscreenDialogTransition "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoFullscreenDialogTransition "Deep Dive") |
| `CupertinoListSection` | Groups Cupertino list rows with headers, footers, margins, and separators | Choose plain or inset-grouped styling deliberately and keep row backgrounds and dividers coherent | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoListSection "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoListSection "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoListSection "Deep Dive") |
| `CupertinoListTile` | Displays a standard Cupertino list row with leading, title, subtitle, trailing, and tap behavior | Keep row hierarchy concise and ensure interactive trailing content does not conflict with the tile action | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoListTile "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoListTile "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoListTile "Deep Dive") |
| `CupertinoNavigationBar` | Supplies an iOS-style page navigation bar with leading, middle, and trailing content | Coordinate it with route titles, back navigation, safe areas, and hero transitions | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoNavigationBar "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoNavigationBar "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoNavigationBar "Deep Dive") |
| `CupertinoPageScaffold` | Lays out a Cupertino page with a navigation bar and body content | Decide whether content should resize around or extend behind translucent bars | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoPageScaffold "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoPageScaffold "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoPageScaffold "Deep Dive") |
| `CupertinoPageTransition` | Implements the standard horizontal transition between Cupertino pages | Normally let `CupertinoPageRoute` build it and preserve directionality and back-swipe expectations in custom routes | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoPageTransition "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoPageTransition "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoPageTransition "Deep Dive") |
| `CupertinoPicker` | Selects an item using an iOS-style scrolling wheel | Keep item extents uniform, control the scroll position when necessary, and expose the selected value clearly | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoPicker "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoPicker "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoPicker "Deep Dive") |
| `CupertinoPopupSurface` | Paints the rounded translucent or opaque surface used by Cupertino popups | Use it as popup chrome rather than a general-purpose card and account for clipping and contrast | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoPopupSurface "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoPopupSurface "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoPopupSurface "Deep Dive") |
| `CupertinoScrollbar` | Adds an iOS-style scrollbar to a scrollable | Connect it to the correct controller and verify thumb visibility and interaction across input devices | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoScrollbar "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoScrollbar "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoScrollbar "Deep Dive") |
| `CupertinoSearchTextField` | Provides an iOS-style search field with search and clear affordances | Keep query state synchronized and supply clear placeholder, submission, and clearing behavior | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoSearchTextField "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoSearchTextField "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoSearchTextField "Deep Dive") |
| `CupertinoSegmentedControl` | Selects one value from a small set of visually separated segments | Keep labels compact, provide stable map keys, and ensure every segment remains legible at larger text sizes | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoSegmentedControl "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoSegmentedControl "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoSegmentedControl "Deep Dive") |
| `CupertinoSlider` | Selects a value from a continuous or divided numeric range | Clamp values to the configured range and pair the slider with a readable value or semantic formatter | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoSlider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoSlider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoSlider "Deep Dive") |
| `CupertinoSlidingSegmentedControl` | Selects among related values with a sliding thumb | Use it for a small mutually exclusive set and keep group values and child keys stable | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoSlidingSegmentedControl "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoSlidingSegmentedControl "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoSlidingSegmentedControl "Deep Dive") |
| `CupertinoSwitch` | Toggles a Boolean setting with an iOS-style switch | Use it for an immediate independent setting, not an action that needs explicit submission | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoSwitch "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoSwitch "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoSwitch "Deep Dive") |
| `CupertinoTabBar` | Displays the persistent destinations of a Cupertino tab interface | Keep destination count small and coordinate the selected index with the enclosing tab scaffold or controller | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoTabBar "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoTabBar "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoTabBar "Deep Dive") |
| `CupertinoTabScaffold` | Coordinates a Cupertino tab bar with lazily built tab content | Preserve each tab's state and navigation history while keeping tab selection controlled | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoTabScaffold "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoTabScaffold "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoTabScaffold "Deep Dive") |
| `CupertinoTabView` | Hosts a navigator and route builder for one Cupertino tab | Give each tab an independent, stable navigation stack and provide complete route generation behavior | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoTabView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoTabView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoTabView "Deep Dive") |
| `CupertinoTextField` | Accepts editable text with iOS-style decoration and controls | Manage controllers and focus lifecycles, choose keyboard and autofill options, and validate input outside the field | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoTextField "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoTextField "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoTextField "Deep Dive") |
| `CupertinoTimerPicker` | Selects a duration using scrolling hour, minute, and second columns | Match the mode and minute or second intervals to valid domain values and handle duration changes continuously | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Cupertino/CupertinoTimerPicker "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Cupertino/CupertinoTimerPicker "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Cupertino/CupertinoTimerPicker "Deep Dive") |

## Questions

- [When should actions appear in a `CupertinoActionSheet` rather than an alert?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/When-should-actions-appear-in-a-CupertinoActionSheet-rather-than-an-alert%3F)
- [How should indeterminate loading be explained around a `CupertinoActivityIndicator`?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/How-should-indeterminate-loading-be-explained-around-a-CupertinoActivityIndicator%3F)
- [Which decisions are important enough to interrupt the user with a `CupertinoAlertDialog`?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Which-decisions-are-important-enough-to-interrupt-the-user-with-a-CupertinoAlertDialog%3F)
- [Which `CupertinoButton` style matches the action's emphasis and state?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Which-CupertinoButton-style-matches-the-action's-emphasis-and-state%3F)
- [How should a `CupertinoCheckbox` expose Boolean and tristate values accessibly?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/How-should-a-CupertinoCheckbox-expose-Boolean-and-tristate-values-accessibly%3F)
- [Are `CupertinoContextMenu` actions relevant, discoverable, and available by another path?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Are-CupertinoContextMenu-actions-relevant%2C-discoverable%2C-and-available-by-another-path%3F)
- [Which mode, date bounds, locale, and interval should a `CupertinoDatePicker` use?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Which-mode%2C-date-bounds%2C-locale%2C-and-interval-should-a-CupertinoDatePicker-use%3F)
- [When should a `CupertinoDialogAction` be marked default or destructive?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/When-should-a-CupertinoDialogAction-be-marked-default-or-destructive%3F)
- [When does a custom route need `CupertinoFullscreenDialogTransition` directly?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/When-does-a-custom-route-need-CupertinoFullscreenDialogTransition-directly%3F)
- [Should a `CupertinoListSection` use plain or inset-grouped presentation?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Should-a-CupertinoListSection-use-plain-or-inset-grouped-presentation%3F)
- [How should content and interactions be divided within a `CupertinoListTile`?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/How-should-content-and-interactions-be-divided-within-a-CupertinoListTile%3F)
- [How does a `CupertinoNavigationBar` coordinate titles, back behavior, and translucent content?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/How-does-a-CupertinoNavigationBar-coordinate-titles%2C-back-behavior%2C-and-translucent-content%3F)
- [Should `CupertinoPageScaffold` content extend behind the navigation bar?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Should-CupertinoPageScaffold-content-extend-behind-the-navigation-bar%3F)
- [When should `CupertinoPageTransition` be delegated to the route?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/When-should-CupertinoPageTransition-be-delegated-to-the-route%3F)
- [How should a `CupertinoPicker` report and restore its selected item?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/How-should-a-CupertinoPicker-report-and-restore-its-selected-item%3F)
- [When is `CupertinoPopupSurface` the appropriate chrome for custom popup content?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/When-is-CupertinoPopupSurface-the-appropriate-chrome-for-custom-popup-content%3F)
- [Which scroll controller should a `CupertinoScrollbar` observe?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Which-scroll-controller-should-a-CupertinoScrollbar-observe%3F)
- [How should `CupertinoSearchTextField` synchronize, submit, and clear its query?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/How-should-CupertinoSearchTextField-synchronize%2C-submit%2C-and-clear-its-query%3F)
- [Does the option set remain readable and compact in `CupertinoSegmentedControl`?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Does-the-option-set-remain-readable-and-compact-in-CupertinoSegmentedControl%3F)
- [How will a `CupertinoSlider` communicate its current value and increments?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/How-will-a-CupertinoSlider-communicate-its-current-value-and-increments%3F)
- [When is `CupertinoSlidingSegmentedControl` preferable to the separated segmented style?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/When-is-CupertinoSlidingSegmentedControl-preferable-to-the-separated-segmented-style%3F)
- [Is a `CupertinoSwitch` changing an immediate independent setting?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Is-a-CupertinoSwitch-changing-an-immediate-independent-setting%3F)
- [Which top-level destinations belong in a persistent `CupertinoTabBar`?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Which-top-level-destinations-belong-in-a-persistent-CupertinoTabBar%3F)
- [How should `CupertinoTabScaffold` retain each tab's state?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/How-should-CupertinoTabScaffold-retain-each-tab's-state%3F)
- [How does each `CupertinoTabView` own and generate its navigation routes?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/How-does-each-CupertinoTabView-own-and-generate-its-navigation-routes%3F)
- [Who owns the controller, focus node, validation, and submission of a `CupertinoTextField`?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Who-owns-the-controller%2C-focus-node%2C-validation%2C-and-submission-of-a-CupertinoTextField%3F)
- [Which duration units and intervals should a `CupertinoTimerPicker` expose?](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Which-duration-units-and-intervals-should-a-CupertinoTimerPicker-expose%3F)

## Best Practices

- [Keep action-sheet choices concise and separate the cancel action](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Keep-action-sheet-choices-concise-and-separate-the-cancel-action)
- [Pair indeterminate activity with an explanation and prevent duplicate work where appropriate](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Pair-indeterminate-activity-with-an-explanation-and-prevent-duplicate-work-where-appropriate)
- [Use alerts sparingly and make every dialog action unambiguous](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Use-alerts-sparingly-and-make-every-dialog-action-unambiguous)
- [Preserve `CupertinoButton` pressed, disabled, focus, and semantic behavior](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Preserve-CupertinoButton-pressed%2C-disabled%2C-focus%2C-and-semantic-behavior)
- [Keep checkbox state controlled and provide an accessible label](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Keep-checkbox-state-controlled-and-provide-an-accessible-label)
- [Limit context menus to relevant item actions and support alternative discovery](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Limit-context-menus-to-relevant-item-actions-and-support-alternative-discovery)
- [Constrain dates and intervals to values the application can accept](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Constrain-dates-and-intervals-to-values-the-application-can-accept)
- [Declare destructive and default dialog actions truthfully](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Declare-destructive-and-default-dialog-actions-truthfully)
- [Use full-screen transition widgets only as part of a correctly owned route animation](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Use-full-screen-transition-widgets-only-as-part-of-a-correctly-owned-route-animation)
- [Group related list rows and keep section spacing and separators consistent](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Group-related-list-rows-and-keep-section-spacing-and-separators-consistent)
- [Keep list-tile content concise and avoid competing tap targets](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Keep-list-tile-content-concise-and-avoid-competing-tap-targets)
- [Let route context drive navigation-bar titles and back behavior](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Let-route-context-drive-navigation-bar-titles-and-back-behavior)
- [Coordinate scaffold insets with translucent bars and the on-screen keyboard](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Coordinate-scaffold-insets-with-translucent-bars-and-the-on-screen-keyboard)
- [Preserve platform direction and gesture expectations in page transitions](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Preserve-platform-direction-and-gesture-expectations-in-page-transitions)
- [Use stable selection state and uniform item extents for pickers](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Use-stable-selection-state-and-uniform-item-extents-for-pickers)
- [Reserve popup surfaces for popup presentation and verify content contrast](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Reserve-popup-surfaces-for-popup-presentation-and-verify-content-contrast)
- [Attach scrollbars to the intended scroll position and test touch and pointer input](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Attach-scrollbars-to-the-intended-scroll-position-and-test-touch-and-pointer-input)
- [Keep search query, clear action, focus, and results state synchronized](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Keep-search-query%2C-clear-action%2C-focus%2C-and-results-state-synchronized)
- [Use segmented controls only for small, mutually related option sets](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Use-segmented-controls-only-for-small%2C-mutually-related-option-sets)
- [Expose slider values semantically and respect the configured range](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Expose-slider-values-semantically-and-respect-the-configured-range)
- [Use stable keys and a controlled group value for sliding segmented controls](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Use-stable-keys-and-a-controlled-group-value-for-sliding-segmented-controls)
- [Use switches for settings that take effect immediately](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Use-switches-for-settings-that-take-effect-immediately)
- [Keep tab destinations stable, concise, and consistently ordered](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Keep-tab-destinations-stable%2C-concise%2C-and-consistently-ordered)
- [Preserve tab state rather than rebuilding navigation history on every switch](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Preserve-tab-state-rather-than-rebuilding-navigation-history-on-every-switch)
- [Give each tab view a stable navigator and complete route handling](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Give-each-tab-view-a-stable-navigator-and-complete-route-handling)
- [Dispose owned text and focus controllers and configure text input semantics](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Dispose-owned-text-and-focus-controllers-and-configure-text-input-semantics)
- [Restrict timer-picker units and intervals to valid durations](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Restrict-timer-picker-units-and-intervals-to-valid-durations)
- [Test Cupertino interfaces with dynamic type, VoiceOver, safe areas, keyboards, and localization](https://app.syntblaze.com/qsp/flutter/Widgets/Cupertino/Test-Cupertino-interfaces-with-dynamic-type%2C-VoiceOver%2C-safe-areas%2C-keyboards%2C-and-localization)

[< Back to widgets](../README.md)
