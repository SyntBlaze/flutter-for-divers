# Test Types

Test types describe the scope, environment, and kind of confidence a check
provides. A healthy Flutter test strategy combines fast, focused feedback with
broader checks of rendering, integration boundaries, complete user journeys,
and release readiness instead of expecting one suite to catch every failure.

```text
small scope / fast feedback                         broad scope / high realism

unit -> widget -> contract -> integration -> smoke -> manual QA
  |        |           |            |
  |        |           |            +---- complete user journeys
  |        |           +----------------- system boundary compatibility
  |        +----------------------------- UI behavior and rendering
  +-------------------------------------- isolated business logic

golden / snapshot ---- protect selected output representations
regression ---------- preserve behavior after a defect is fixed
```

The labels overlap because they answer different questions. A regression test
describes why a test exists, while unit, widget, and integration describe its
scope. Golden and snapshot tests describe how output is compared. Smoke tests
sample critical paths quickly, and a manual QA checklist covers observations
that are difficult or uneconomical to automate.

Prefer the narrowest test that can faithfully expose a risk. Add broader tests
where framework behavior, rendering, navigation, plugins, backends, or real
devices are part of the contract. The resulting portfolio should make failures
easy to diagnose while protecting the user journeys that matter most.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Test-Types) — Focused, bite-sized article covering Test Types
- [Learning Path](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Test-Types) — Step-by-step material that builds practical Test Types knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Test-Types) — Structured, in-depth material for learning about Test Types thoroughly

## Test Types

| Test type | Focus | Key considerations | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Unit test | Verify one small unit of Dart behavior in isolation | Keep inputs and outcomes deterministic; substitute only dependencies outside the unit's responsibility | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Test-Types/Unit-test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Test-Types/Unit-test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Test-Types/Unit-test "Deep Dive") |
| Widget test | Exercise Flutter widgets in a controlled test binding | Provide required inherited context, pump deliberate state transitions, and assert behavior rather than implementation details | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Test-Types/Widget-test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Test-Types/Widget-test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Test-Types/Widget-test "Deep Dive") |
| Integration test | Verify collaborating application layers or complete flows in a realistic runtime | Control external data, isolate scenarios, account for platform behavior, and collect useful failure evidence | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Test-Types/Integration-test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Test-Types/Integration-test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Test-Types/Integration-test "Deep Dive") |
| Golden test | Compare rendered pixels with an approved reference image | Stabilize fonts, dimensions, themes, animations, and platform-dependent rendering; review baseline changes intentionally | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Test-Types/Golden-test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Test-Types/Golden-test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Test-Types/Golden-test "Deep Dive") |
| Smoke test | Check quickly that a build starts and its critical path remains usable | Keep the suite small, reliable, and representative enough to detect a fundamentally broken release | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Test-Types/Smoke-test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Test-Types/Smoke-test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Test-Types/Smoke-test "Deep Dive") |
| Regression test | Prevent a previously observed defect from returning | Reproduce the original failure at the narrowest faithful level and retain the test after the fix | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Test-Types/Regression-test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Test-Types/Regression-test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Test-Types/Regression-test "Deep Dive") |
| Contract test | Verify that two components agree on an interface or data exchange | Define consumer-visible expectations, validate both sides, and version intentional compatibility changes | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Test-Types/Contract-test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Test-Types/Contract-test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Test-Types/Contract-test "Deep Dive") |
| Snapshot test | Compare serialized or structured output with an approved stored representation | Keep snapshots focused and reviewable; avoid large baselines whose changes obscure meaningful differences | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Test-Types/Snapshot-test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Test-Types/Snapshot-test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Test-Types/Snapshot-test "Deep Dive") |
| Manual QA checklist | Guide repeatable human verification of release behavior and experience | State preconditions and expected outcomes, cover devices and accessibility, and record evidence and ownership | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Test-Types/Manual-QA-checklist "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Test-Types/Manual-QA-checklist "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Test-Types/Manual-QA-checklist "Deep Dive") |

## Questions

- [How should a team choose between a unit, widget, and integration test?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/How-should-a-team-choose-between-a-unit%2C-widget%2C-and-integration-test%3F)
- [When does a unit test need a fake rather than a real collaborator?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/When-does-a-unit-test-need-a-fake-rather-than-a-real-collaborator%3F)
- [Which behavior belongs in a widget test instead of a unit test?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Which-behavior-belongs-in-a-widget-test-instead-of-a-unit-test%3F)
- [How much of an integration test should use real services and devices?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/How-much-of-an-integration-test-should-use-real-services-and-devices%3F)
- [Which visual states are valuable enough to maintain as goldens?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Which-visual-states-are-valuable-enough-to-maintain-as-goldens%3F)
- [What is the smallest smoke suite that can reject an unusable build?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/What-is-the-smallest-smoke-suite-that-can-reject-an-unusable-build%3F)
- [At what test level should a reported defect become a regression test?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/At-what-test-level-should-a-reported-defect-become-a-regression-test%3F)
- [How can providers and consumers detect an incompatible contract before release?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/How-can-providers-and-consumers-detect-an-incompatible-contract-before-release%3F)
- [When is a structured snapshot clearer than explicit assertions?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/When-is-a-structured-snapshot-clearer-than-explicit-assertions%3F)
- [Which release risks still require judgment from a human tester?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Which-release-risks-still-require-judgment-from-a-human-tester%3F)
- [Can one test be both a regression test and a widget, golden, or integration test?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Can-one-test-be-both-a-regression-test-and-a-widget%2C-golden%2C-or-integration-test%3F)
- [How should fast feedback and production realism be balanced in CI?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/How-should-fast-feedback-and-production-realism-be-balanced-in-CI%3F)

## Best Practices

- [Use the narrowest test that faithfully covers the risk](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Use-the-narrowest-test-that-faithfully-covers-the-risk)
- [Build most behavioral coverage from fast, deterministic tests](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Build-most-behavioral-coverage-from-fast%2C-deterministic-tests)
- [Test widgets through visible states and user interactions](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Test-widgets-through-visible-states-and-user-interactions)
- [Reserve integration tests for collaboration and runtime behavior that narrower tests cannot prove](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Reserve-integration-tests-for-collaboration-and-runtime-behavior-that-narrower-tests-cannot-prove)
- [Keep test data, time, randomness, and external responses under explicit control](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Keep-test-data%2C-time%2C-randomness%2C-and-external-responses-under-explicit-control)
- [Treat golden changes as reviewed interface changes, not automatic updates](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Treat-golden-changes-as-reviewed-interface-changes%2C-not-automatic-updates)
- [Run a small, stable smoke suite against every release candidate](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Run-a-small%2C-stable-smoke-suite-against-every-release-candidate)
- [Write a failing regression test before fixing a reproducible defect](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Write-a-failing-regression-test-before-fixing-a-reproducible-defect)
- [Express contracts in terms both provider and consumer can verify](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Express-contracts-in-terms-both-provider-and-consumer-can-verify)
- [Prefer focused snapshots that reveal why output changed](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Prefer-focused-snapshots-that-reveal-why-output-changed)
- [Make manual QA steps repeatable with clear setup, action, and expected result](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Make-manual-QA-steps-repeatable-with-clear-setup%2C-action%2C-and-expected-result)
- [Give every test independent setup and cleanup so execution order does not matter](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Give-every-test-independent-setup-and-cleanup-so-execution-order-does-not-matter)
- [Quarantine or repair flaky tests promptly instead of normalizing retries](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Quarantine-or-repair-flaky-tests-promptly-instead-of-normalizing-retries)
- [Track suite duration and move redundant scenarios to the cheapest reliable level](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Track-suite-duration-and-move-redundant-scenarios-to-the-cheapest-reliable-level)
- [Include accessibility, localization, error states, and relevant device variants in the strategy](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Test-Types/Include-accessibility%2C-localization%2C-error-states%2C-and-relevant-device-variants-in-the-strategy)

[< Back to testing & quality](../README.md)
