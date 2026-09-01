# Testing Accessibility

Accessibility testing checks whether an interface remains understandable and
operable when users rely on assistive technology or accessibility settings.
Flutter widget tests can inspect the semantics tree, run framework accessibility
guidelines, and render layouts with different text scalers. Golden tests can
catch visual regressions, but they complement rather than replace semantic
assertions and testing with real assistive technologies.

```text
widget under test
       |
       +-- semantics enabled -> labels, roles, states, actions, traversal
       |
       +-- accessibility guidelines -> labels, tap targets, text contrast
       |
       +-- text scale variants -> layout assertions + golden images
       |
       v
manual validation -> screen reader, keyboard/switch input, device settings
```

Semantics are not necessarily enabled in a widget test. Call
`tester.ensureSemantics()` before querying semantics or evaluating guidelines
that depend on the semantics tree, and dispose the returned `SemanticsHandle`
before the test ends. A `try`/`finally` block or `addTearDown(handle.dispose)`
keeps cleanup reliable when an assertion fails. Every handle acquired by a test
must be disposed; do not create a separate handle when another helper already
owns one.

`SemanticsTester` is a helper used in Flutter's own framework test suite rather
than a general public `flutter_test` API. Application tests normally combine
`ensureSemantics()`, semantics finders, `tester.getSemantics`, and semantics
matchers. Whichever abstraction is used, keep ownership explicit and dispose
the helper or its underlying handle.

Automated checks should cover meaningful labels, roles, states, actions,
reading order, target sizes, contrast, and layouts at large text sizes. They
cannot establish whether announcements are timely, navigation feels coherent,
or wording is useful in context. Validate important flows on supported
platforms with screen readers and other relevant input methods, and repeat that
work after substantial navigation or design changes.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Testing-Accessibility) — Focused, bite-sized article covering Testing Accessibility
- [Learning Path](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Testing-Accessibility) — Step-by-step material that builds practical Testing Accessibility knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Testing-Accessibility) — Structured, in-depth material for learning about Testing Accessibility thoroughly

## Testing Accessibility Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `SemanticsTester` | Provides semantics-tree inspection helpers in Flutter's framework tests | It is not the usual public app-test API; dispose the helper so its semantics handle is released | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/SemanticsTester "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/SemanticsTester "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/SemanticsTester "Deep Dive") |
| `tester.ensureSemantics()` | Enables semantics while a widget test holds the returned handle | Dispose every `SemanticsHandle` before the test ends, including when an assertion throws | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/tester.ensureSemantics-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/tester.ensureSemantics-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/tester.ensureSemantics-method "Deep Dive") |
| Golden tests with text scale | Compare rendered output at selected text-scaling configurations | Use stable test inputs and treat goldens as visual evidence, not proof of correct semantics | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Golden-tests-with-text-scale "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Golden-tests-with-text-scale "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Golden-tests-with-text-scale "Deep Dive") |
| Screen reader labels | Verify accessible names, roles, values, hints, states, and actions | Assert the resulting semantics rather than assuming visible text produces the intended announcement | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Screen-reader-labels "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Screen-reader-labels "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Screen-reader-labels "Deep Dive") |
| Contrast checks | Evaluate whether foreground content remains distinguishable from its background | Run automated guidelines where applicable and manually review states, images, gradients, and platform rendering | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Contrast-checks "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Contrast-checks "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Contrast-checks "Deep Dive") |
| Large font layout checks | Exercise screens with large and nonlinear text scaling | Look for clipping, overlap, hidden actions, lost content, and layouts that no longer scroll or reflow | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Large-font-layout-checks "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Large-font-layout-checks "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Large-font-layout-checks "Deep Dive") |

## Questions

- [When must semantics be enabled explicitly in a widget test?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/When-must-semantics-be-enabled-explicitly-in-a-widget-test%3F)
- [Who owns and disposes the semantics handle used by a helper?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Who-owns-and-disposes-the-semantics-handle-used-by-a-helper%3F)
- [Which text-scale configurations belong in a golden-test matrix?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Which-text-scale-configurations-belong-in-a-golden-test-matrix%3F)
- [Does each actionable control expose a meaningful accessible name and role?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Does-each-actionable-control-expose-a-meaningful-accessible-name-and-role%3F)
- [Which visual states and backgrounds must be included in contrast testing?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Which-visual-states-and-backgrounds-must-be-included-in-contrast-testing%3F)
- [Does every important flow remain usable when text becomes much larger?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Does-every-important-flow-remain-usable-when-text-becomes-much-larger%3F)
- [Which findings still require validation with a real screen reader or input device?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Which-findings-still-require-validation-with-a-real-screen-reader-or-input-device%3F)

## Best Practices

- [Enable semantics only for the scope that needs it and always dispose the returned handle](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Enable-semantics-only-for-the-scope-that-needs-it-and-always-dispose-the-returned-handle)
- [Use public `flutter_test` semantics APIs for application tests and keep helper ownership explicit](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Use-public-flutter_test-semantics-APIs-for-application-tests-and-keep-helper-ownership-explicit)
- [Assert labels, roles, states, actions, and traversal instead of matching one large brittle tree unnecessarily](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Assert-labels%2C-roles%2C-states%2C-actions%2C-and-traversal-instead-of-matching-one-large-brittle-tree-unnecessarily)
- [Localize semantics strings and test representative languages, text directions, and message lengths](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Localize-semantics-strings-and-test-representative-languages%2C-text-directions%2C-and-message-lengths)
- [Run tap-target, label, and contrast guidelines as focused tests with actionable failures](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Run-tap-target%2C-label%2C-and-contrast-guidelines-as-focused-tests-with-actionable-failures)
- [Test normal, focused, selected, pressed, disabled, error, and high-contrast visual states](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Test-normal%2C-focused%2C-selected%2C-pressed%2C-disabled%2C-error%2C-and-high-contrast-visual-states)
- [Exercise both large and nonlinear text scaling, not only the default scale](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Exercise-both-large-and-nonlinear-text-scaling%2C-not-only-the-default-scale)
- [Let constrained content wrap, reflow, or scroll instead of shrinking essential text or clipping actions](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Let-constrained-content-wrap%2C-reflow%2C-or-scroll-instead-of-shrinking-essential-text-or-clipping-actions)
- [Keep golden environments deterministic and pair image comparisons with behavioral assertions](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Keep-golden-environments-deterministic-and-pair-image-comparisons-with-behavioral-assertions)
- [Manually test critical journeys with supported screen readers and relevant alternative input methods](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Testing-Accessibility/Manually-test-critical-journeys-with-supported-screen-readers-and-relevant-alternative-input-methods)

[< Back to internationalization & accessibility](../README.md)
