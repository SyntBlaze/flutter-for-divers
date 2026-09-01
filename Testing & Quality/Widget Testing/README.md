# Widget Testing

Widget tests render part of a Flutter widget tree in a controlled test
environment and interact with it through `WidgetTester`. They sit between unit
tests and end-to-end tests: fast enough to cover many presentation states, but
realistic enough to exercise layout, theming, localization, semantics, input,
scrolling, and framework lifecycle behavior together.

```text
test app wrapper
   +-- theme, locale, media query, dependency overrides
   +-- surface size and text scale
                    |
                    v
               widget under test
                    |
          pump -> find -> interact
                    |
                    v
       layout, state, semantics, errors
```

The test harness should provide only the application context that the widget's
public contract requires. A reusable wrapper keeps common setup consistent,
while per-test overrides make the scenario visible. Control viewport geometry,
text scaling, dependencies, localization, and asynchronous work explicitly so
tests remain deterministic and failures identify behavior rather than hidden
environment differences.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Widget-Testing) — Focused, bite-sized article covering Widget Testing
- [Learning Path](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Widget-Testing) — Step-by-step material that builds practical Widget Testing knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Widget-Testing) — Structured, in-depth material for learning about Widget Testing thoroughly

## Widget Testing Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Test app wrapper | Host a widget beneath the minimum app-level context needed by tests | Keep defaults realistic and lightweight, and let each test override only the scenario-relevant configuration | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Widget-Testing/Test-app-wrapper "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Widget-Testing/Test-app-wrapper "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Widget-Testing/Test-app-wrapper "Deep Dive") |
| Theme wrapper | Supply `ThemeData` and verify theme-dependent presentation | Test semantic theme behavior and variants without coupling assertions to incidental implementation details | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Widget-Testing/Theme-wrapper "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Widget-Testing/Theme-wrapper "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Widget-Testing/Theme-wrapper "Deep Dive") |
| MediaQuery wrapper | Provide controlled viewport, accessibility, and platform display data | Construct only deliberate values and preserve unrelated defaults so scenarios do not accidentally become unrealistic | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Widget-Testing/MediaQuery-wrapper "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Widget-Testing/MediaQuery-wrapper "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Widget-Testing/MediaQuery-wrapper "Deep Dive") |
| Dependency overrides | Replace application services with deterministic test doubles | Scope overrides to the test, reset mutable state, and expose responses explicitly in the arrange phase | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Widget-Testing/Dependency-overrides "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Widget-Testing/Dependency-overrides "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Widget-Testing/Dependency-overrides "Deep Dive") |
| Localization delegates | Load supported locales and translated resources in the harness | Await localization setup and test both lookup behavior and layouts with representative translated strings | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Widget-Testing/Localization-delegates "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Widget-Testing/Localization-delegates "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Widget-Testing/Localization-delegates "Deep Dive") |
| Surface size | Control the logical viewport dimensions used for layout | Restore the test view after each case and cover meaningful layout boundaries rather than device labels alone | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Widget-Testing/Surface-size "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Widget-Testing/Surface-size "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Widget-Testing/Surface-size "Deep Dive") |
| Text scale | Verify layout and usability as text becomes larger or smaller | Prefer current text-scaling APIs, cover accessibility-relevant values, and assert content remains reachable | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Widget-Testing/Text-scale "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Widget-Testing/Text-scale "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Widget-Testing/Text-scale "Deep Dive") |
| Scroll testing | Exercise off-screen content, lazy lists, and scroll-driven behavior | Scroll through a stable finder, pump deliberately, and distinguish revealing content from settling animations | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Widget-Testing/Scroll-testing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Widget-Testing/Scroll-testing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Widget-Testing/Scroll-testing "Deep Dive") |
| Semantics testing | Inspect the accessibility tree, labels, roles, actions, and state | Enable semantics for the test and assert the user-facing accessibility contract rather than the widget hierarchy | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Widget-Testing/Semantics-testing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Widget-Testing/Semantics-testing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Widget-Testing/Semantics-testing "Deep Dive") |
| Error state testing | Render failures and verify feedback and recovery actions | Drive errors through controlled dependencies, then assert messaging, retained context, and meaningful retry behavior | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Widget-Testing/Error-state-testing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Widget-Testing/Error-state-testing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Widget-Testing/Error-state-testing "Deep Dive") |

## Questions

- [What belongs in a shared test app wrapper, and what should remain local to a test?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/What-belongs-in-a-shared-test-app-wrapper%2C-and-what-should-remain-local-to-a-test%3F)
- [Should theme tests assert exact colors or semantic behavior?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Should-theme-tests-assert-exact-colors-or-semantic-behavior%3F)
- [Which `MediaQuery` values can materially change this widget's behavior?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Which-MediaQuery-values-can-materially-change-this-widget's-behavior%3F)
- [How can dependency overrides remain isolated when tests run in a different order?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/How-can-dependency-overrides-remain-isolated-when-tests-run-in-a-different-order%3F)
- [How should a widget test wait for localization resources to become available?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/How-should-a-widget-test-wait-for-localization-resources-to-become-available%3F)
- [Which viewport widths and heights expose the widget's meaningful layout transitions?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Which-viewport-widths-and-heights-expose-the-widget's-meaningful-layout-transitions%3F)
- [How can a test prove that large text remains readable and reachable without brittle pixel assertions?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/How-can-a-test-prove-that-large-text-remains-readable-and-reachable-without-brittle-pixel-assertions%3F)
- [When should a test use `drag`, `scrollUntilVisible`, or direct scroll-controller manipulation?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/When-should-a-test-use-drag%2C-scrollUntilVisible%2C-or-direct-scroll-controller-manipulation%3F)
- [Which labels, roles, values, and actions form this widget's accessibility contract?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Which-labels%2C-roles%2C-values%2C-and-actions-form-this-widget's-accessibility-contract%3F)
- [What should remain visible and actionable when loading fails?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/What-should-remain-visible-and-actionable-when-loading-fails%3F)
- [When is a focused widget test preferable to a unit or integration test?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/When-is-a-focused-widget-test-preferable-to-a-unit-or-integration-test%3F)
- [Which pumps are required for the state transition being tested?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Which-pumps-are-required-for-the-state-transition-being-tested%3F)

## Best Practices

- [Keep the shared test app wrapper minimal, composable, and override-friendly](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Keep-the-shared-test-app-wrapper-minimal%2C-composable%2C-and-override-friendly)
- [Exercise both light and dark or other supported theme variants where presentation changes](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Exercise-both-light-and-dark-or-other-supported-theme-variants-where-presentation-changes)
- [Set `MediaQuery` inputs explicitly when they are part of the scenario](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Set-MediaQuery-inputs-explicitly-when-they-are-part-of-the-scenario)
- [Create fresh dependency overrides and mutable fakes for every test](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Create-fresh-dependency-overrides-and-mutable-fakes-for-every-test)
- [Include long translations, plural forms, and right-to-left locales where supported](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Include-long-translations%2C-plural-forms%2C-and-right-to-left-locales-where-supported)
- [Test just below, at, and above layout boundaries with controlled surface sizes](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Test-just-below%2C-at%2C-and-above-layout-boundaries-with-controlled-surface-sizes)
- [Include accessibility-oriented text scales and verify that actions remain reachable](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Include-accessibility-oriented-text-scales-and-verify-that-actions-remain-reachable)
- [Use stable finders and bounded scrolling rather than arbitrary repeated drags](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Use-stable-finders-and-bounded-scrolling-rather-than-arbitrary-repeated-drags)
- [Assert semantics exposed to assistive technology, not merely visible text](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Assert-semantics-exposed-to-assistive-technology%2C-not-merely-visible-text)
- [Cover initial, empty, loading, success, failure, and retry states where they exist](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Cover-initial%2C-empty%2C-loading%2C-success%2C-failure%2C-and-retry-states-where-they-exist)
- [Pump only the frames the scenario requires; use `pumpAndSettle` when settling is truly bounded](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Pump-only-the-frames-the-scenario-requires%3B-use-pumpAndSettle-when-settling-is-truly-bounded)
- [Assert observable behavior and avoid depending on private widget-tree structure](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Assert-observable-behavior-and-avoid-depending-on-private-widget-tree-structure)
- [Keep tests independent of execution order, wall-clock time, network access, and host display settings](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Keep-tests-independent-of-execution-order%2C-wall-clock-time%2C-network-access%2C-and-host-display-settings)
- [Give each test a behavioral name and one clear reason to fail](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Widget-Testing/Give-each-test-a-behavioral-name-and-one-clear-reason-to-fail)

[< Back to testing & quality](../README.md)
