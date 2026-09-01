# Forms

Flutter forms coordinate editable fields, validation, focus, and persistence
into a single user workflow. A `Form` groups `FormField` descendants, while a
long-lived `GlobalKey<FormState>` can expose operations such as validation,
saving, and resetting from the owning state. Individual fields still own their
input presentation and should report values and errors through a clear data
flow.

```text
user input -> onChanged -> field value
                         |
submit -> FormState.validate() -> validator -> errors shown
                         |
                         +-- valid -> FormState.save() -> onSaved -> persist
                         |
reset  -> FormState.reset() ---------------------------> initial values
```

Validation timing is part of the experience rather than only a correctness
check. Avoid showing errors before a user has had a reasonable chance to edit,
but always validate the complete form before submission. Keep transient widget
state separate from the submitted domain model, move focus in a predictable
order, and make asynchronous submission state explicit so duplicate requests
cannot be triggered.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms) — Focused, bite-sized article covering Forms
- [Learning Path](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms) — Step-by-step material that builds practical Forms knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms) — Structured, in-depth material for learning about Forms thoroughly

## Forms Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Form` | Groups related form fields and coordinates their state | Place one around a cohesive submission unit and avoid using a global key when `Form.of` provides the needed local access | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/Form "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/Form "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/Form "Deep Dive") |
| `FormField` | Base widget for a value, validation result, saving, and reset behavior | Use it to integrate custom controls with the form lifecycle, preserving error and interaction state | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/FormField "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/FormField "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/FormField "Deep Dive") |
| `TextFormField` | Material text input with built-in `FormField<String>` integration | Manage its controller or initial value deliberately, and dispose owned controllers and focus nodes | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/TextFormField "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/TextFormField "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/TextFormField "Deep Dive") |
| `GlobalKey<FormState>` | Stable key that exposes a form's `FormState` to its owner | Create it once in `State`, never inside `build`, and prefer narrower context-based access where practical | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/GlobalKey-FormState "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/GlobalKey-FormState "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/GlobalKey-FormState "Deep Dive") |
| Form validation | Rules and timing used to reject incomplete or invalid values | Keep synchronous field rules pure, validate cross-field constraints coherently, and surface actionable errors | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/Form-validation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/Form-validation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/Form-validation "Deep Dive") |
| `AutovalidateMode` | Controls when a field automatically reruns validation | `onUserInteraction` is often a balanced default; avoid exposing errors before the user engages | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/AutovalidateMode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/AutovalidateMode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/AutovalidateMode "Deep Dive") |
| `validator` | Callback that maps a candidate field value to an error message or success | Return `null` for valid input, avoid side effects, and handle nullable or normalized values explicitly | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/validator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/validator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/validator "Deep Dive") |
| `onSaved` | Callback invoked when the form's `save` operation commits field values | Call `validate` first and map saved input into a typed model rather than scattering mutations | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/onSaved "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/onSaved "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/onSaved "Deep Dive") |
| `onChanged` | Callback for responding to each field or form value change | Use it for lightweight state synchronization, not expensive requests or final submission semantics | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/onChanged "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/onChanged "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/onChanged "Deep Dive") |
| Form reset | Restores fields to their initial values and clears form interaction state | Reset controllers and external state consistently when they are not governed by `FormField.reset` | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/Form-reset "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/Form-reset "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/Form-reset "Deep Dive") |
| Form submission | Validates, saves, and sends a complete form result | Disable or guard repeated submission, preserve recoverable input on failure, and report progress and outcome | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/Form-submission "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/Form-submission "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/Form-submission "Deep Dive") |
| Field focus flow | Moves keyboard focus through fields and onto the final action | Match visual and semantic order, use appropriate input actions, and keep traversal accessible on every device | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Forms/Field-focus-flow "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Forms/Field-focus-flow "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Forms/Field-focus-flow "Deep Dive") |

## Questions

- [When should a screen use one `Form` rather than validating fields independently?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/When-should-a-screen-use-one-Form-rather-than-validating-fields-independently%3F)
- [How can a custom control participate fully in validation, saving, and reset?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/How-can-a-custom-control-participate-fully-in-validation%2C-saving%2C-and-reset%3F)
- [When should `TextFormField` use a controller instead of `initialValue`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/When-should-TextFormField-use-a-controller-instead-of-initialValue%3F)
- [When is `GlobalKey<FormState>` justified, and when is `Form.of` sufficient?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/When-is-GlobalKey%3CFormState%3E-justified%2C-and-when-is-Form.of-sufficient%3F)
- [How should field-level and cross-field validation responsibilities be divided?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/How-should-field-level-and-cross-field-validation-responsibilities-be-divided%3F)
- [Which `AutovalidateMode` gives useful feedback without showing errors too early?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Which-AutovalidateMode-gives-useful-feedback-without-showing-errors-too-early%3F)
- [Why should a `validator` remain synchronous, deterministic, and free of side effects?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Why-should-a-validator-remain-synchronous%2C-deterministic%2C-and-free-of-side-effects%3F)
- [What is the difference between collecting a value with `onChanged` and committing it with `onSaved`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/What-is-the-difference-between-collecting-a-value-with-onChanged-and-committing-it-with-onSaved%3F)
- [How can rapidly changing input be observed without triggering excessive rebuilds or requests?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/How-can-rapidly-changing-input-be-observed-without-triggering-excessive-rebuilds-or-requests%3F)
- [Which controller-backed or external values must be restored in addition to `FormState.reset`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Which-controller-backed-or-external-values-must-be-restored-in-addition-to-FormState.reset%3F)
- [How should validation, saving, asynchronous work, and failure recovery be ordered during submission?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/How-should-validation%2C-saving%2C-asynchronous-work%2C-and-failure-recovery-be-ordered-during-submission%3F)
- [How should keyboard actions and focus traversal lead users through the form?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/How-should-keyboard-actions-and-focus-traversal-lead-users-through-the-form%3F)

## Best Practices

- [Make each `Form` represent one cohesive validation and submission boundary](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Make-each-Form-represent-one-cohesive-validation-and-submission-boundary)
- [Use `FormField` when a custom input must participate in the standard form lifecycle](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Use-FormField-when-a-custom-input-must-participate-in-the-standard-form-lifecycle)
- [Keep `TextEditingController` and `FocusNode` ownership explicit and dispose locally owned instances](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Keep-TextEditingController-and-FocusNode-ownership-explicit-and-dispose-locally-owned-instances)
- [Create `GlobalKey<FormState>` once and keep it stable across rebuilds](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Create-GlobalKey%3CFormState%3E-once-and-keep-it-stable-across-rebuilds)
- [Keep validation rules deterministic, localized, and easy to test](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Keep-validation-rules-deterministic%2C-localized%2C-and-easy-to-test)
- [Delay automatic error display until user interaction unless the workflow requires immediate guidance](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Delay-automatic-error-display-until-user-interaction-unless-the-workflow-requires-immediate-guidance)
- [Return concise corrective messages from `validator` and `null` for valid values](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Return-concise-corrective-messages-from-validator-and-null-for-valid-values)
- [Validate before calling `save`, then construct a typed submission model](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Validate-before-calling-save%2C-then-construct-a-typed-submission-model)
- [Keep `onChanged` work inexpensive and debounce remote lookups or other costly effects](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Keep-onChanged-work-inexpensive-and-debounce-remote-lookups-or-other-costly-effects)
- [Define reset behavior for form fields, controllers, focus, and external state together](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Define-reset-behavior-for-form-fields%2C-controllers%2C-focus%2C-and-external-state-together)
- [Guard against duplicate submissions and keep entered values recoverable after failure](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Guard-against-duplicate-submissions-and-keep-entered-values-recoverable-after-failure)
- [Test focus order, keyboard actions, validation messages, reset, and submission with assistive technology](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Forms/Test-focus-order%2C-keyboard-actions%2C-validation-messages%2C-reset%2C-and-submission-with-assistive-technology)

[< Back to forms input & gestures](../README.md)
