# Integration Testing

Integration tests exercise a complete Flutter application across boundaries
that smaller tests intentionally replace: framework bindings, navigation,
platform integration, persistent state, networking, and backend behavior. They
provide the most confidence when they protect a small set of critical user
journeys rather than repeating every unit- and widget-level assertion on a
slower device-driven runner.

```text
test runner / CI
       |
       v
end-to-end test harness
       |
       v
real device / emulator / simulator
       |
       v
application under test ---- test credentials
       |                          |
       +---- end-to-end flow -----+
                    |
                    v
             backend sandbox
                    |
                    v
       assertions + logs + screenshots
                    |
                    v
          flaky test investigation
```

A reliable harness makes the environment explicit before a flow begins: it
selects a build, provisions a bounded identity, establishes known server and
device state, and captures enough evidence to diagnose a failure. Each flow
should then act through user-visible behavior and assert meaningful outcomes,
including durable state or server effects where those are part of the journey.

Use emulators and simulators for fast, repeatable coverage across common
configurations, then keep representative real-device coverage for hardware,
operating-system, performance, and platform-service risks that virtual devices
cannot reproduce faithfully. Treat nondeterminism as a defect to investigate;
retries may collect evidence or protect a release temporarily, but they should
not redefine an unreliable result as success.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Integration-Testing) — Focused, bite-sized article covering Integration Testing
- [Learning Path](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Integration-Testing) — Step-by-step material that builds practical Integration Testing knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Integration-Testing) — Structured, in-depth material for learning about Integration Testing thoroughly

## Integration Testing Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| End-to-end test harness | Launch, configure, drive, observe, and clean up a complete test application | Give setup, state reset, timeouts, diagnostics, and cleanup clear ownership so every flow starts from a known environment | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Integration-Testing/End-to-end-test-harness "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Integration-Testing/End-to-end-test-harness "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Integration-Testing/End-to-end-test-harness "Deep Dive") |
| End-to-end flow | Verify a critical user journey across UI, application, platform, and service boundaries | Assert business outcomes through stable user-visible behavior instead of coupling the flow to internal widget structure | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Integration-Testing/End-to-end-flow "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Integration-Testing/End-to-end-flow "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Integration-Testing/End-to-end-flow "Deep Dive") |
| Real device | Run integration coverage against physical hardware and platform services | Maintain a small representative device matrix and account for device state, permissions, connectivity, thermal limits, and OS differences | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Integration-Testing/Real-device "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Integration-Testing/Real-device "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Integration-Testing/Real-device "Deep Dive") |
| Emulator | Exercise Android scenarios in a controllable virtual-device environment | Pin images and configuration, reset mutable state, and reserve physical devices for risks the emulator cannot model accurately | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Integration-Testing/Emulator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Integration-Testing/Emulator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Integration-Testing/Emulator "Deep Dive") |
| Simulator | Exercise Apple platform scenarios in a simulated device environment | Pin runtimes and configuration while recognizing that simulated hardware and platform services differ from a physical device | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Integration-Testing/Simulator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Integration-Testing/Simulator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Integration-Testing/Simulator "Deep Dive") |
| Test credentials | Provision bounded identities and secrets for automated journeys | Keep secrets out of source control, isolate accounts from production, minimize privileges, and make renewal and cleanup automatic | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Integration-Testing/Test-credentials "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Integration-Testing/Test-credentials "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Integration-Testing/Test-credentials "Deep Dive") |
| Backend sandbox | Provide isolated services and resettable data for integration traffic | Match production contracts while supporting deterministic seeding, cleanup, observability, and protection from parallel-test collisions | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Integration-Testing/Backend-sandbox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Integration-Testing/Backend-sandbox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Integration-Testing/Backend-sandbox "Deep Dive") |
| Flaky test handling | Detect, diagnose, quarantine, and remove nondeterministic failures | Capture evidence before retrying, assign ownership, track frequency, and repair the source rather than normalizing instability | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Integration-Testing/Flaky-test-handling "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Integration-Testing/Flaky-test-handling "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Integration-Testing/Flaky-test-handling "Deep Dive") |

## Questions

- [What setup, launch, observation, and cleanup responsibilities belong in the shared harness?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/What-setup%2C-launch%2C-observation%2C-and-cleanup-responsibilities-belong-in-the-shared-harness%3F)
- [Which user journeys justify end-to-end coverage instead of faster unit or widget tests?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Which-user-journeys-justify-end-to-end-coverage-instead-of-faster-unit-or-widget-tests%3F)
- [Which hardware and platform behaviors require validation on a real device?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Which-hardware-and-platform-behaviors-require-validation-on-a-real-device%3F)
- [How should Android virtual-device images and state be pinned and reset in CI?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/How-should-Android-virtual-device-images-and-state-be-pinned-and-reset-in-CI%3F)
- [Which simulator limitations require complementary physical Apple-device coverage?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Which-simulator-limitations-require-complementary-physical-Apple-device-coverage%3F)
- [How should test identities, secrets, permissions, expiry, and cleanup be managed?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/How-should-test-identities%2C-secrets%2C-permissions%2C-expiry%2C-and-cleanup-be-managed%3F)
- [How can backend data be seeded and reset without parallel flows interfering with one another?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/How-can-backend-data-be-seeded-and-reset-without-parallel-flows-interfering-with-one-another%3F)
- [Which logs, screenshots, traces, and environment details are needed to diagnose an intermittent failure?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Which-logs%2C-screenshots%2C-traces%2C-and-environment-details-are-needed-to-diagnose-an-intermittent-failure%3F)
- [Where should an integration test assert a UI result, a persisted result, or a backend outcome?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Where-should-an-integration-test-assert-a-UI-result%2C-a-persisted-result%2C-or-a-backend-outcome%3F)
- [How should the device matrix balance release risk, execution time, and infrastructure cost?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/How-should-the-device-matrix-balance-release-risk%2C-execution-time%2C-and-infrastructure-cost%3F)
- [Which parts of the environment must be fixed, and which variations should be tested deliberately?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Which-parts-of-the-environment-must-be-fixed%2C-and-which-variations-should-be-tested-deliberately%3F)

## Best Practices

- [Keep the end-to-end suite focused on critical journeys and cross-boundary risks](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Keep-the-end-to-end-suite-focused-on-critical-journeys-and-cross-boundary-risks)
- [Build reusable setup and diagnostics into the harness while keeping flows independently runnable](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Build-reusable-setup-and-diagnostics-into-the-harness-while-keeping-flows-independently-runnable)
- [Start every flow from explicit device, application, identity, and backend state](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Start-every-flow-from-explicit-device%2C-application%2C-identity%2C-and-backend-state)
- [Drive stable user-visible interactions and assert outcomes that matter to the user or system](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Drive-stable-user-visible-interactions-and-assert-outcomes-that-matter-to-the-user-or-system)
- [Run common configurations on pinned emulators and simulators for repeatable feedback](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Run-common-configurations-on-pinned-emulators-and-simulators-for-repeatable-feedback)
- [Retain representative real-device coverage for hardware and operating-system behavior](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Retain-representative-real-device-coverage-for-hardware-and-operating-system-behavior)
- [Use least-privilege, non-production credentials with automated rotation and cleanup](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Use-least-privilege%2C-non-production-credentials-with-automated-rotation-and-cleanup)
- [Seed unique sandbox data per test and make teardown safe to repeat](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Seed-unique-sandbox-data-per-test-and-make-teardown-safe-to-repeat)
- [Avoid arbitrary delays; wait for observable conditions with explicit time bounds](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Avoid-arbitrary-delays%3B-wait-for-observable-conditions-with-explicit-time-bounds)
- [Capture logs, screenshots, device metadata, and server correlation identifiers on failure](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Capture-logs%2C-screenshots%2C-device-metadata%2C-and-server-correlation-identifiers-on-failure)
- [Use retries to gather evidence or temporarily contain known instability, not to conceal it](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Use-retries-to-gather-evidence-or-temporarily-contain-known-instability%2C-not-to-conceal-it)
- [Give quarantined tests an owner, tracked reason, repair deadline, and visible reporting](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Give-quarantined-tests-an-owner%2C-tracked-reason%2C-repair-deadline%2C-and-visible-reporting)
- [Keep tests independent so execution order and parallelism cannot change their results](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Keep-tests-independent-so-execution-order-and-parallelism-cannot-change-their-results)
- [Review the suite regularly and move redundant checks to faster test layers](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Integration-Testing/Review-the-suite-regularly-and-move-redundant-checks-to-faster-test-layers)

[< Back to testing & quality](../README.md)
