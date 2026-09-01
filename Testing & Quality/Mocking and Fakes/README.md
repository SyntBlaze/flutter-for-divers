# Mocking and Fakes

Test doubles replace production collaborators so a test can control inputs,
observe important interactions, and avoid slow or nondeterministic boundaries.
The right double depends on what the test needs: a stub supplies an answer, a
fake provides a small working implementation, and a mock records calls for
interaction verification.

```text
                         test double
                              |
            +-----------------+-----------------+
            |                 |                 |
            v                 v                 v
      return a result   model useful behavior   observe calls
            |                 |                 |
            v                 v                 v
          stub              fake               mock
                              |
                    +---------+----------+
                    v                    v
             repository state     controlled boundaries
                                  time / async / images
```

Prefer the simplest double that makes the behavior deterministic and the test
easy to understand. State-based assertions against outputs usually tolerate
refactoring better than verifying every internal call. Interaction assertions
are most useful at genuine architectural boundaries, such as ensuring that a
completed operation persists once or that a rejected operation never reaches
the network.

Handwritten fakes can express realistic state transitions and often work well
across many tests, but they must not grow into a second production
implementation. Time, timers, asynchronous work, and image loading deserve
explicit controls: wall-clock waits and live networking make failures slow,
environment-dependent, and difficult to reproduce.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Mocking-and-Fakes) — Focused, bite-sized article covering Mocking and Fakes
- [Learning Path](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Mocking-and-Fakes) — Step-by-step material that builds practical Mocking and Fakes knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Mocking-and-Fakes) — Structured, in-depth material for learning about Mocking and Fakes thoroughly

## Mocking and Fakes Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Mock object | Record calls and verify selected interactions with a collaborator | Verify only behaviorally significant communication; coupling assertions to every call makes harmless refactors break tests | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Mocking-and-Fakes/Mock-object "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Mocking-and-Fakes/Mock-object "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Mocking-and-Fakes/Mock-object "Deep Dive") |
| Stub object | Supply predetermined values, errors, or streams to the system under test | Configure responses close to the scenario and avoid adding interaction assertions that turn the stub into an implicit mock | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Mocking-and-Fakes/Stub-object "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Mocking-and-Fakes/Stub-object "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Mocking-and-Fakes/Stub-object "Deep Dive") |
| Fake object | Provide a lightweight working implementation of a production contract | Keep its semantics sufficient for the test while making controls and limitations explicit | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Mocking-and-Fakes/Fake-object "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Mocking-and-Fakes/Fake-object "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Mocking-and-Fakes/Fake-object "Deep Dive") |
| Controlled async clock | Advance timers and asynchronous scheduling without waiting for real time | Drive time deliberately, flush work in a known order, and detect pending timers or microtasks at test completion | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Mocking-and-Fakes/Controlled-async-clock "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Mocking-and-Fakes/Controlled-async-clock "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Mocking-and-Fakes/Controlled-async-clock "Deep Dive") |
| Test clock | Supply a deterministic source for the current instant | Inject clock access into production code and distinguish reading time from advancing scheduled asynchronous work | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Mocking-and-Fakes/Test-clock "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Mocking-and-Fakes/Test-clock "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Mocking-and-Fakes/Test-clock "Deep Dive") |
| Network image fake | Return predictable image bytes or failures without live HTTP access | Use valid fixed assets, cover loading and error paths, and reset caches or overrides between tests | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Mocking-and-Fakes/Network-image-fake "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Mocking-and-Fakes/Network-image-fake "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Mocking-and-Fakes/Network-image-fake "Deep Dive") |
| Test doubles | Select a dummy, stub, spy, mock, or fake according to what must be supplied or observed | Name doubles by their role in a test and choose the least powerful replacement that expresses the scenario | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Mocking-and-Fakes/Test-doubles "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Mocking-and-Fakes/Test-doubles "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Mocking-and-Fakes/Test-doubles "Deep Dive") |
| Fake repositories | Model repository state and operations with an in-memory implementation | Preserve the public contract, including identifiers, ordering, errors, and update semantics, without duplicating infrastructure | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Mocking-and-Fakes/Fake-repositories "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Mocking-and-Fakes/Fake-repositories "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Mocking-and-Fakes/Fake-repositories "Deep Dive") |

## Questions

- [When should a test verify collaborator interactions with a mock?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/When-should-a-test-verify-collaborator-interactions-with-a-mock%3F)
- [How does a stub differ from a mock when both are configured to return values?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/How-does-a-stub-differ-from-a-mock-when-both-are-configured-to-return-values%3F)
- [When is a handwritten fake clearer than a generated mock?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/When-is-a-handwritten-fake-clearer-than-a-generated-mock%3F)
- [How can delayed futures, timers, retries, and debouncing be tested without wall-clock waits?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/How-can-delayed-futures%2C-timers%2C-retries%2C-and-debouncing-be-tested-without-wall-clock-waits%3F)
- [What is the difference between controlling the current time and controlling asynchronous scheduling?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/What-is-the-difference-between-controlling-the-current-time-and-controlling-asynchronous-scheduling%3F)
- [How should widget and golden tests replace network-loaded images?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/How-should-widget-and-golden-tests-replace-network-loaded-images%3F)
- [Which kind of test double best communicates the role of a collaborator in this scenario?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Which-kind-of-test-double-best-communicates-the-role-of-a-collaborator-in-this-scenario%3F)
- [Which repository semantics must an in-memory fake preserve?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Which-repository-semantics-must-an-in-memory-fake-preserve%3F)
- [When is using the real dependency simpler and more trustworthy than replacing it?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/When-is-using-the-real-dependency-simpler-and-more-trustworthy-than-replacing-it%3F)
- [How can shared doubles be reset so tests remain independent?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/How-can-shared-doubles-be-reset-so-tests-remain-independent%3F)

## Best Practices

- [Choose a double from the behavior the test must control or observe](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Choose-a-double-from-the-behavior-the-test-must-control-or-observe)
- [Prefer state and outcome assertions unless an interaction is itself part of the contract](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Prefer-state-and-outcome-assertions-unless-an-interaction-is-itself-part-of-the-contract)
- [Verify only meaningful calls and avoid asserting incidental call order](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Verify-only-meaningful-calls-and-avoid-asserting-incidental-call-order)
- [Keep stub responses explicit, local, and specific to the scenario](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Keep-stub-responses-explicit%2C-local%2C-and-specific-to-the-scenario)
- [Use small handwritten fakes when realistic state makes tests easier to read](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Use-small-handwritten-fakes-when-realistic-state-makes-tests-easier-to-read)
- [Document intentional differences between a fake and its production implementation](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Document-intentional-differences-between-a-fake-and-its-production-implementation)
- [Advance virtual time explicitly and ensure no scheduled work leaks past the test](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Advance-virtual-time-explicitly-and-ensure-no-scheduled-work-leaks-past-the-test)
- [Inject a clock instead of reading system time directly in business logic](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Inject-a-clock-instead-of-reading-system-time-directly-in-business-logic)
- [Use fixed local image data and restore global image or HTTP overrides after each test](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Use-fixed-local-image-data-and-restore-global-image-or-HTTP-overrides-after-each-test)
- [Keep fake repositories deterministic and faithful to their public contracts](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Keep-fake-repositories-deterministic-and-faithful-to-their-public-contracts)
- [Create fresh mutable doubles per test or reset them during teardown](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Create-fresh-mutable-doubles-per-test-or-reset-them-during-teardown)
- [Avoid live networks, real clocks, randomness, and process-wide mutable state in isolated tests](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Avoid-live-networks%2C-real-clocks%2C-randomness%2C-and-process-wide-mutable-state-in-isolated-tests)
- [Keep test-only controls out of production interfaces unless they represent a genuine abstraction](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Mocking-and-Fakes/Keep-test-only-controls-out-of-production-interfaces-unless-they-represent-a-genuine-abstraction)

[< Back to testing & quality](../README.md)
