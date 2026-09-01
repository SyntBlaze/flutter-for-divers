# Testing & Debugging

Testing checks that software behaves as intended and continues to do so as it
changes. In Flutter, a balanced test suite usually combines fast tests for
isolated logic, widget tests for rendering and interaction, visual comparisons
for appearance, and a smaller number of integration tests for complete user
journeys on real or virtual devices.

```text
Requirement -> Arrange deterministic inputs -> Exercise behavior -> Observe result
      ^                                                               |
      +---------- diagnose failure <- compare with expectation <-------+
```

The useful boundary is not simply “unit” versus “integration.” A test should
cover the smallest meaningful behavior through a stable public interface. Test
doubles can isolate collaborators when their real behavior would be slow,
unreliable, or difficult to control, while fakes and in-memory implementations
often preserve more realistic behavior than extensive mocking. Debugging and
preview tools complement tests by making runtime state, device constraints, and
otherwise hard-to-reproduce conditions visible during development.

## Selection Guidance

Start with Flutter Test for unit and widget coverage, then add more specialized
tools only where they solve a concrete limitation. Use Integration Test for
end-to-end flows driven through a deployed Flutter application. Patrol is an
alternative for device-level scenarios that also need to interact with native
system UI or platform dialogs.

Choose one primary test-double style within a feature. Mocktail provides a
code-generation-free mocking API, while Mockito uses generated mocks and typed
stubs. Bloc Test adds concise expectations for sequences of Bloc or Cubit
states. Fake Async is useful when behavior depends on timers or delayed work and
the clock must remain under test control.

For visual regression coverage, Golden Toolkit offers helpers for multi-device
widget scenarios, while Alchemist structures themed golden test groups and
variants. Network Image Mock removes live image requests from widget tests, and
Leak Tracker for Flutter Testing can detect objects that outlive their expected
lifecycle. Device Preview is primarily an interactive development aid for
exploring layouts, locales, and device characteristics; it does not replace
automated tests on representative targets.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging) — Focused, bite-sized article covering Testing & Debugging
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging) — Step-by-step material that builds practical Testing & Debugging knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging) — Structured, in-depth material for learning about Testing & Debugging thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Flutter Test | Flutter's core unit and widget testing APIs, matchers, bindings, and test harness | Fast logic tests and deterministic widget rendering or interaction checks | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Flutter-Test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Flutter-Test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Flutter-Test "Deep Dive") |
| Integration Test | Drives a complete Flutter application on an emulator, simulator, browser, or physical device | Verifying critical journeys across widgets, plugins, persistence, and platform boundaries | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Integration-Test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Integration-Test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Integration-Test "Deep Dive") |
| Patrol | Integration testing with Flutter finders plus native automation capabilities | Device flows involving permission prompts, notifications, WebViews, or other system UI | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Patrol "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Patrol "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Patrol "Deep Dive") |
| Mocktail | Runtime mock creation with stubbing, verification, and argument matching | Teams that want lightweight Dart test doubles without generated mock classes | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Mocktail "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Mocktail "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Mocktail "Deep Dive") |
| Mockito | Generated, strongly typed mocks with stubbing and interaction verification | Codebases that prefer generated mocks and explicit interfaces for collaborators | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Mockito "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Mockito "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Mockito "Deep Dive") |
| Bloc Test | Scenario-based helpers for exercising Blocs and Cubits and matching emitted states | Concise tests of state transitions, errors, and asynchronous event handling | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Bloc-Test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Bloc-Test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Bloc-Test "Deep Dive") |
| Golden Toolkit | Golden-test helpers for devices, text scales, widget scenarios, and pumping | Reusable visual regression suites across several screen configurations | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Golden-Toolkit "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Golden-Toolkit "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Golden-Toolkit "Deep Dive") |
| Alchemist | Structured golden test groups, variants, theming, and platform-aware rendering | Design systems and components that need organized visual regression coverage | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Alchemist "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Alchemist "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Alchemist "Deep Dive") |
| Network Image Mock | Intercepts network image requests during tests and supplies deterministic responses | Widget or golden tests containing `Image.network` or network-backed image providers | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Network-Image-Mock "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Network-Image-Mock "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Network-Image-Mock "Deep Dive") |
| Fake Async | Runs timer, delay, and microtask behavior against a controllable virtual clock | Testing retries, debouncing, timeouts, periodic work, and time-based state changes quickly | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Fake-Async "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Fake-Async "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Fake-Async "Deep Dive") |
| Leak Tracker for Flutter Testing | Instruments object lifecycles and reports objects that remain reachable unexpectedly | Detecting undisposed controllers, listeners, subscriptions, and other lifecycle leaks in tests | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Leak-Tracker-for-Flutter-Testing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Leak-Tracker-for-Flutter-Testing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Leak-Tracker-for-Flutter-Testing "Deep Dive") |
| Device Preview | Interactive previews of device sizes, orientations, locales, text scales, and platform settings | Exploring responsive and localized UI during development before formal device testing | [💡](https://app.syntblaze.com/qt/flutter/Packages/Testing-and-Debugging/Device-Preview "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Testing-and-Debugging/Device-Preview "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Testing-and-Debugging/Device-Preview "Deep Dive") |

## Questions

- [What is the difference between unit, widget, golden, and integration tests?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/What-is-the-difference-between-unit%2C-widget%2C-golden%2C-and-integration-tests%3F)
- [Which behaviors should be covered at each test layer?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Which-behaviors-should-be-covered-at-each-test-layer%3F)
- [When should a dependency be real, fake, stubbed, or mocked?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/When-should-a-dependency-be-real%2C-fake%2C-stubbed%2C-or-mocked%3F)
- [Should a test verify output state or collaborator interactions?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Should-a-test-verify-output-state-or-collaborator-interactions%3F)
- [How can asynchronous widget tests be made deterministic?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/How-can-asynchronous-widget-tests-be-made-deterministic%3F)
- [When should `pump`, `pumpAndSettle`, or a fixed-duration pump be used?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/When-should-pump%2C-pumpAndSettle%2C-or-a-fixed-duration-pump-be-used%3F)
- [How are timers, debounce logic, and retries tested without waiting?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/How-are-timers%2C-debounce-logic%2C-and-retries-tested-without-waiting%3F)
- [What makes a golden test stable across machines?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/What-makes-a-golden-test-stable-across-machines%3F)
- [How should intentional golden changes be reviewed?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/How-should-intentional-golden-changes-be-reviewed%3F)
- [Which user journeys justify an integration test?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Which-user-journeys-justify-an-integration-test%3F)
- [How can native permission dialogs and system UI be tested?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/How-can-native-permission-dialogs-and-system-UI-be-tested%3F)
- [Why does a test pass alone but fail in the full suite?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Why-does-a-test-pass-alone-but-fail-in-the-full-suite%3F)
- [How can leaked controllers, listeners, and subscriptions be detected?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/How-can-leaked-controllers%2C-listeners%2C-and-subscriptions-be-detected%3F)
- [When is a device preview useful, and what can it not validate?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/When-is-a-device-preview-useful%2C-and-what-can-it-not-validate%3F)
- [How should intermittent test failures be diagnosed?](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/How-should-intermittent-test-failures-be-diagnosed%3F)

## Best Practices

- [Build a testing pyramid with many fast tests and a focused set of device tests](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Build-a-testing-pyramid-with-many-fast-tests-and-a-focused-set-of-device-tests)
- [Test observable behavior through stable public interfaces](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Test-observable-behavior-through-stable-public-interfaces)
- [Keep each test independent and safe to run in any order](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Keep-each-test-independent-and-safe-to-run-in-any-order)
- [Use fixed clocks, seeded randomness, and controlled asynchronous scheduling](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Use-fixed-clocks%2C-seeded-randomness%2C-and-controlled-asynchronous-scheduling)
- [Keep network services, file systems, and live backends out of deterministic tests](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Keep-network-services%2C-file-systems%2C-and-live-backends-out-of-deterministic-tests)
- [Prefer small fakes for stateful collaborators and mocks for narrow interactions](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Prefer-small-fakes-for-stateful-collaborators-and-mocks-for-narrow-interactions)
- [Stub every meaningful result, failure, empty response, and boundary condition](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Stub-every-meaningful-result%2C-failure%2C-empty-response%2C-and-boundary-condition)
- [Verify state and outcomes before verifying implementation details](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Verify-state-and-outcomes-before-verifying-implementation-details)
- [Give tests names that describe the condition and expected behavior](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Give-tests-names-that-describe-the-condition-and-expected-behavior)
- [Use finders and semantic labels that survive harmless layout refactors](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Use-finders-and-semantic-labels-that-survive-harmless-layout-refactors)
- [Advance frames deliberately instead of relying blindly on `pumpAndSettle`](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Advance-frames-deliberately-instead-of-relying-blindly-on-pumpAndSettle)
- [Keep golden fixtures, fonts, themes, pixel ratios, and rendering conditions controlled](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Keep-golden-fixtures%2C-fonts%2C-themes%2C-pixel-ratios%2C-and-rendering-conditions-controlled)
- [Review golden diffs as visual changes rather than automatically accepting them](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Review-golden-diffs-as-visual-changes-rather-than-automatically-accepting-them)
- [Run critical integration journeys on representative devices and platforms](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Run-critical-integration-journeys-on-representative-devices-and-platforms)
- [Reset permissions, storage, authentication, and backend state between device scenarios](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Reset-permissions%2C-storage%2C-authentication%2C-and-backend-state-between-device-scenarios)
- [Dispose controllers, focus nodes, subscriptions, timers, and test-owned resources](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Dispose-controllers%2C-focus-nodes%2C-subscriptions%2C-timers%2C-and-test-owned-resources)
- [Capture logs, screenshots, seed values, and device details when a test fails](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Capture-logs%2C-screenshots%2C-seed-values%2C-and-device-details-when-a-test-fails)
- [Quarantine flaky tests only with an owner, diagnosis, and removal deadline](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Quarantine-flaky-tests-only-with-an-owner%2C-diagnosis%2C-and-removal-deadline)
- [Use previews and debuggers for exploration, then encode regressions as automated tests](https://app.syntblaze.com/qsp/flutter/Packages/Testing-and-Debugging/Use-previews-and-debuggers-for-exploration%2C-then-encode-regressions-as-automated-tests)

[< Back to packages](../README.md)
