# Text Input

Flutter text input spans a convenient Material widget, a lower-level editable
primitive, persistent editing state, keyboard configuration, and transformations
applied before new text reaches the application. `TextField` covers most user
interfaces, while `EditableText` exposes the underlying editing behavior for
custom controls. A `TextEditingController` carries both the text and its
`TextSelection` between the widget and application code.

```text
hardware/software keyboard or autofill service
                      |
                      v
          platform IME composition
                      |
                      v
            TextInputFormatter(s)
                      |
                      v
       TextEditingValue in the controller
             /                    \
            v                      v
    text + selection       TextField / EditableText
```

Keyboard type and action are requests to the platform, not validation rules.
Formatters can constrain committed edits, but they must preserve selection and
composing ranges and should not interfere with text still being composed by an
input method editor (IME). Validation and domain normalization belong at the
appropriate application boundary rather than being hidden entirely in the
keyboard configuration.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input) — Focused, bite-sized article covering Text Input
- [Learning Path](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input) — Step-by-step material that builds practical Text Input knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input) — Structured, in-depth material for learning about Text Input thoroughly

## Text Input Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `TextField` | Material text-entry widget that combines editing, decoration, focus, and callbacks | Use it for standard fields, and explicitly manage any controller or focus node that the application owns | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/TextField "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/TextField "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/TextField "Deep Dive") |
| `EditableText` | Core editable-text primitive beneath higher-level text fields | Prefer `TextField` unless a custom control truly needs direct ownership of rendering, cursor, selection, focus, and text-input behavior | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/EditableText "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/EditableText "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/EditableText "Deep Dive") |
| `TextEditingController` | Mutable controller for a field's text, selection, and composing state | Create it outside `build`, avoid listener feedback loops, and dispose it with its owner | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/TextEditingController "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/TextEditingController "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/TextEditingController "Deep Dive") |
| `TextSelection` | Base and extent describing a caret or selected range in the current text | Keep offsets valid after programmatic edits and preserve the intended caret direction and affinity | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/TextSelection "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/TextSelection "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/TextSelection "Deep Dive") |
| `TextInputFormatter` | Contract for accepting or transforming each proposed editing value | Return a coherent `TextEditingValue` and avoid changing active composing text unless the transformation is composition-safe | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/TextInputFormatter "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/TextInputFormatter "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/TextInputFormatter "Deep Dive") |
| `FilteringTextInputFormatter` | Replaces matches that are allowed or denied by a pattern | Treat filtering as input shaping, not complete validation, and account for Unicode and smart punctuation | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/FilteringTextInputFormatter "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/FilteringTextInputFormatter "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/FilteringTextInputFormatter "Deep Dive") |
| `LengthLimitingTextInputFormatter` | Limits input by user-perceived character count | Choose enforcement behavior deliberately and remember that grapheme clusters can contain multiple code units | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/LengthLimitingTextInputFormatter "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/LengthLimitingTextInputFormatter "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/LengthLimitingTextInputFormatter "Deep Dive") |
| `TextInputType` | Describes the keyboard layout most suitable for the expected content | It is a platform hint and does not guarantee valid, complete, or secure input | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/TextInputType "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/TextInputType "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/TextInputType "Deep Dive") |
| `TextInputAction` | Describes the action key and expected editing-flow intent | Pair the action with focus movement or submission behavior instead of relying on the keyboard label alone | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/TextInputAction "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/TextInputAction "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/TextInputAction "Deep Dive") |
| Obscure text | Masks sensitive text in an editable control | Masking is a visual privacy measure; also control logging, autofill, copying, storage, and semantics according to the threat model | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/Obscure-text "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/Obscure-text "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/Obscure-text "Deep Dive") |
| `AutofillHints` | Semantic hints used by platform autofill services to identify field meaning | Use accurate hints within an autofill scope and test platform-specific save and fill behavior | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/AutofillHints "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/AutofillHints "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/AutofillHints "Deep Dive") |
| IME composition | Temporary composing range used while an input method builds a final character sequence | Preserve composing edits and test languages, keyboards, autocorrection, dead keys, and multi-stage input methods | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Text-Input/IME-composition "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Text-Input/IME-composition "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Text-Input/IME-composition "Deep Dive") |

## Questions

- [When is `TextField` sufficient, and when is direct use of `EditableText` justified?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/When-is-TextField-sufficient%2C-and-when-is-direct-use-of-EditableText-justified%3F)
- [Who should own and dispose a `TextEditingController`?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Who-should-own-and-dispose-a-TextEditingController%3F)
- [How can text be changed programmatically without moving the caret unexpectedly?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/How-can-text-be-changed-programmatically-without-moving-the-caret-unexpectedly%3F)
- [Why can changing a controller from one of its listeners create a feedback loop?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Why-can-changing-a-controller-from-one-of-its-listeners-create-a-feedback-loop%3F)
- [When should input be formatted as the user types rather than validated after editing?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/When-should-input-be-formatted-as-the-user-types-rather-than-validated-after-editing%3F)
- [How do allow and deny patterns behave when `FilteringTextInputFormatter` finds no match?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/How-do-allow-and-deny-patterns-behave-when-FilteringTextInputFormatter-finds-no-match%3F)
- [Does a length limit count UTF-16 code units, Unicode scalar values, or user-perceived characters?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Does-a-length-limit-count-UTF-16-code-units%2C-Unicode-scalar-values%2C-or-user-perceived-characters%3F)
- [Why does requesting a numeric keyboard not guarantee numeric input?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Why-does-requesting-a-numeric-keyboard-not-guarantee-numeric-input%3F)
- [How should Next, Done, Search, and Send actions affect focus or submission?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/How-should-Next%2C-Done%2C-Search%2C-and-Send-actions-affect-focus-or-submission%3F)
- [Which protections are still required when a field obscures its text?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Which-protections-are-still-required-when-a-field-obscures-its-text%3F)
- [How do fields participate in a platform autofill context?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/How-do-fields-participate-in-a-platform-autofill-context%3F)
- [Why should a formatter avoid rewriting an active IME composing region?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Why-should-a-formatter-avoid-rewriting-an-active-IME-composing-region%3F)

## Best Practices

- [Start with `TextField` and use `EditableText` only for deliberate custom behavior](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Start-with-TextField-and-use-EditableText-only-for-deliberate-custom-behavior)
- [Keep owned controllers stable across rebuilds and dispose them deterministically](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Keep-owned-controllers-stable-across-rebuilds-and-dispose-them-deterministically)
- [Update the complete `TextEditingValue` when text and selection must change together](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Update-the-complete-TextEditingValue-when-text-and-selection-must-change-together)
- [Keep formatter transformations predictable, local, and safe for selection and composition](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Keep-formatter-transformations-predictable%2C-local%2C-and-safe-for-selection-and-composition)
- [Use formatters to improve entry, then validate the complete value separately](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Use-formatters-to-improve-entry%2C-then-validate-the-complete-value-separately)
- [Count and display length in user-perceived characters](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Count-and-display-length-in-user-perceived-characters)
- [Choose keyboard type for entry convenience, never as a security boundary](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Choose-keyboard-type-for-entry-convenience%2C-never-as-a-security-boundary)
- [Match the action key to a real focus transition or submission operation](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Match-the-action-key-to-a-real-focus-transition-or-submission-operation)
- [Provide a safe reveal affordance when users need to verify obscured text](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Provide-a-safe-reveal-affordance-when-users-need-to-verify-obscured-text)
- [Prevent secrets and personal data from leaking through logs, analytics, or unintended persistence](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Prevent-secrets-and-personal-data-from-leaking-through-logs%2C-analytics%2C-or-unintended-persistence)
- [Apply precise autofill hints and verify behavior on every supported platform](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Apply-precise-autofill-hints-and-verify-behavior-on-every-supported-platform)
- [Test with pasted text, emoji, combining marks, right-to-left text, and multiple IMEs](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Test-with-pasted-text%2C-emoji%2C-combining-marks%2C-right-to-left-text%2C-and-multiple-IMEs)
- [Preserve selection and composing ranges during programmatic edits](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Preserve-selection-and-composing-ranges-during-programmatic-edits)
- [Test input behavior with hardware keyboards, software keyboards, autofill, and accessibility tools](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Text-Input/Test-input-behavior-with-hardware-keyboards%2C-software-keyboards%2C-autofill%2C-and-accessibility-tools)

[< Back to forms input & gestures](../README.md)
