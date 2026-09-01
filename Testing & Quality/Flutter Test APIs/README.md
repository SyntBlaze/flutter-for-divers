# Flutter Test APIs

Flutter's test APIs provide a layered vocabulary for defining test cases,
sharing setup, rendering widgets, advancing simulated time, locating elements,
driving interactions, and checking outcomes. The `test` package supplies the
core structure and expectations, while `flutter_test` adds a deterministic
widget environment through `WidgetTester`.

```text
group()
  |
  +-- setUp() ---------------------------+
  |                                     |
  +-- test() -> WidgetTester             |
                 |                       |
                 +-- pumpWidget()        |
                 +-- pump() /            |
                 |   pumpAndSettle()     |
                 +-- Finder              |
                 +-- tap() / enterText() |
                 |   / drag()            |
                 +-- expect(Matcher)     |
  |                                     |
  +-- tearDown() <-----------------------+
```

Treat each test as a small state machine: arrange a known starting state, act
through the public API, advance the test environment deliberately, and assert
an observable result. Prefer precise pumps and finders over broad settling and
ambiguous matches; this keeps failures fast, local, and easier to diagnose.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs) — Focused, bite-sized article covering Flutter Test APIs
- [Learning Path](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs) — Step-by-step material that builds practical Flutter Test APIs knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs) — Structured, in-depth material for learning about Flutter Test APIs thoroughly

## Flutter Test API Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `test()` | Registers one named asynchronous or synchronous test body | Keep one behavior under test and return or await every asynchronous operation | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/test-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/test-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/test-method "Deep Dive") |
| `group()` | Organizes related tests under a shared description | Group by behavior or context, without hiding important setup in deeply nested scopes | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/group-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/group-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/group-method "Deep Dive") |
| `setUp()` | Runs preparation before each test in the current group | Recreate mutable state for every test so execution order cannot affect results | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/setUp-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/setUp-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/setUp-method "Deep Dive") |
| `tearDown()` | Runs cleanup after each test in the current group | Register cleanup close to resource creation and make it safe after partial setup failures | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/tearDown-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/tearDown-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/tearDown-method "Deep Dive") |
| WidgetTester | Controls the widget test environment and exposes the rendered tree | Use the tester passed to `testWidgets`; do not depend on real wall-clock time or platform state | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/WidgetTester "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/WidgetTester "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/WidgetTester "Deep Dive") |
| `pumpWidget()` | Attaches a root widget and schedules its initial frame | Supply a realistic app wrapper and remember that pumping a new root replaces the previous tree | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/pumpWidget-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/pumpWidget-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/pumpWidget-method "Deep Dive") |
| `pump()` | Advances the fake clock and renders a frame | Advance only the duration or frame needed to expose intermediate and time-dependent states | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/pump-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/pump-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/pump-method "Deep Dive") |
| `pumpAndSettle()` | Pumps frames until no further frame is scheduled | Use sparingly because repeating animations can time out and settling can hide unnecessary frames | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/pumpAndSettle-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/pumpAndSettle-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/pumpAndSettle-method "Deep Dive") |
| Finder | Describes how elements, widgets, or text are located in the test tree | Choose a finder that expresses user-visible intent and assert its match count before interacting | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/Finder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/Finder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/Finder "Deep Dive") |
| Matcher | Describes the condition an actual value or finder result must satisfy | Prefer specific matchers whose failure messages explain the behavioral mismatch | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/Matcher "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/Matcher "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/Matcher "Deep Dive") |
| `expect()` | Compares an actual value with a matcher | Assert observable outcomes after the relevant asynchronous work and frames have completed | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/expect-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/expect-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/expect-method "Deep Dive") |
| `find.byType()` | Locates widgets by their runtime type | Use it when the widget type is part of the contract; it does not match subclasses by default | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/find.byType-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/find.byType-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/find.byType-method "Deep Dive") |
| `find.text()` | Locates text widgets displaying an exact string | Account for localization and duplicate labels, and narrow the finder when text is not unique | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/find.text-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/find.text-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/find.text-method "Deep Dive") |
| `tap()` | Dispatches a tap at the center of a matched target | Ensure exactly one visible, hit-testable target, then pump to process the resulting state change | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/tap-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/tap-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/tap-method "Deep Dive") |
| `enterText()` | Focuses an editable target and replaces its text | Target an editable widget unambiguously and pump if validation or UI state updates afterward | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/enterText-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/enterText-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/enterText-method "Deep Dive") |
| `drag()` | Sends a drag gesture by a specified offset | Pick direction and distance from the tested layout, then pump to render scrolling or gesture effects | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Flutter-Test-APIs/drag-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Flutter-Test-APIs/drag-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Flutter-Test-APIs/drag-method "Deep Dive") |

## Questions

- [How should a test name describe behavior rather than implementation?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/How-should-a-test-name-describe-behavior-rather-than-implementation%3F)
- [When does grouping improve readability, and when does nesting obscure setup?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/When-does-grouping-improve-readability%2C-and-when-does-nesting-obscure-setup%3F)
- [Which state must be rebuilt in setUp to keep tests independent?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Which-state-must-be-rebuilt-in-setUp-to-keep-tests-independent%3F)
- [How can tearDown reliably clean up resources after a failed test?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/How-can-tearDown-reliably-clean-up-resources-after-a-failed-test%3F)
- [Which responsibilities belong to WidgetTester rather than the widget under test?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Which-responsibilities-belong-to-WidgetTester-rather-than-the-widget-under-test%3F)
- [What application shell should pumpWidget provide for a representative test?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/What-application-shell-should-pumpWidget-provide-for-a-representative-test%3F)
- [When should a test use pump instead of pumpAndSettle?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/When-should-a-test-use-pump-instead-of-pumpAndSettle%3F)
- [Why can pumpAndSettle time out around repeating animations?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Why-can-pumpAndSettle-time-out-around-repeating-animations%3F)
- [Which finder best represents the behavior a user observes?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Which-finder-best-represents-the-behavior-a-user-observes%3F)
- [How do precise matchers make failures easier to interpret?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/How-do-precise-matchers-make-failures-easier-to-interpret%3F)
- [When should expect run relative to futures, gestures, and frames?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/When-should-expect-run-relative-to-futures%2C-gestures%2C-and-frames%3F)
- [When is find.byType more appropriate than a key or semantic finder?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/When-is-find.byType-more-appropriate-than-a-key-or-semantic-finder%3F)
- [How should localized or repeated text be located without ambiguity?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/How-should-localized-or-repeated-text-be-located-without-ambiguity%3F)
- [Why should a test verify a target before tapping it?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Why-should-a-test-verify-a-target-before-tapping-it%3F)
- [What focus and validation behavior follows enterText?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/What-focus-and-validation-behavior-follows-enterText%3F)
- [How should drag distance account for viewport and scrollable geometry?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/How-should-drag-distance-account-for-viewport-and-scrollable-geometry%3F)

## Best Practices

- [Write test descriptions as observable behavior and expected outcome](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Write-test-descriptions-as-observable-behavior-and-expected-outcome)
- [Keep groups shallow and make their shared context explicit](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Keep-groups-shallow-and-make-their-shared-context-explicit)
- [Create fresh mutable collaborators before every test](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Create-fresh-mutable-collaborators-before-every-test)
- [Dispose controllers, subscriptions, clients, and temporary resources deterministically](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Dispose-controllers%2C-subscriptions%2C-clients%2C-and-temporary-resources-deterministically)
- [Drive widgets only through the WidgetTester supplied to the test](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Drive-widgets-only-through-the-WidgetTester-supplied-to-the-test)
- [Wrap the subject with only the app services it genuinely needs](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Wrap-the-subject-with-only-the-app-services-it-genuinely-needs)
- [Prefer targeted pump durations when frame timing is part of the behavior](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Prefer-targeted-pump-durations-when-frame-timing-is-part-of-the-behavior)
- [Reserve pumpAndSettle for finite animation and scheduling work](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Reserve-pumpAndSettle-for-finite-animation-and-scheduling-work)
- [Use finders that are stable under harmless implementation changes](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Use-finders-that-are-stable-under-harmless-implementation-changes)
- [Assert finder cardinality before sending an interaction](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Assert-finder-cardinality-before-sending-an-interaction)
- [Choose focused matchers that produce actionable failure output](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Choose-focused-matchers-that-produce-actionable-failure-output)
- [Use find.byType only when type identity is meaningful to the contract](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Use-find.byType-only-when-type-identity-is-meaningful-to-the-contract)
- [Treat visible text as localized product content, not always as a stable identifier](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Treat-visible-text-as-localized-product-content%2C-not-always-as-a-stable-identifier)
- [Pump after tap, text input, and drag when the action schedules state or frames](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Pump-after-tap%2C-text-input%2C-and-drag-when-the-action-schedules-state-or-frames)
- [Keep gestures realistic and assert the user-visible result, not gesture internals](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Flutter-Test-APIs/Keep-gestures-realistic-and-assert-the-user-visible-result%2C-not-gesture-internals)

[< Back to testing & quality](../README.md)
