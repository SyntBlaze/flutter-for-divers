# Unit Testing

Unit tests verify small pieces of application behavior without rendering a
Flutter widget tree or driving a complete application. They are most valuable
when they exercise stable input-output contracts, domain rules, mapping, and
boundary behavior while keeping infrastructure and time under explicit test
control.

```text
fixture data / stub response / fake clock
                    |
                    v
       system under test (SUT)
       /        |          \
 validator   use case     mapper
                 |
                 v
        repository contract
                 |
                 v
       fake or mock dependency
                 |
                 v
      result + interaction assertions
```

Prefer real value objects and simple collaborators when they remain fast and
deterministic. Introduce a fake, mock, stub, fixture, or controlled clock only
for a dependency that would otherwise make the test slow, nondeterministic, or
difficult to observe. A good unit test communicates one behavioral rule,
arranges only the data needed for that rule, and fails for a clear reason.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Unit-Testing) — Focused, bite-sized article covering Unit Testing
- [Learning Path](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Unit-Testing) — Step-by-step material that builds practical Unit Testing knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Unit-Testing) — Structured, in-depth material for learning about Unit Testing thoroughly

## Unit Testing Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Pure Dart tests | Exercise framework-independent Dart code with the `test` package | Keep domain logic free of Flutter imports so tests stay fast and can run with `dart test` | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Unit-Testing/Pure-Dart-tests "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Unit-Testing/Pure-Dart-tests "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Unit-Testing/Pure-Dart-tests "Deep Dive") |
| Repository tests | Verify repository behavior, data-source coordination, caching, and error translation | Test the repository's observable contract rather than duplicating its implementation details | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Unit-Testing/Repository-tests "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Unit-Testing/Repository-tests "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Unit-Testing/Repository-tests "Deep Dive") |
| Use case tests | Confirm application operations enforce business rules and coordinate dependencies correctly | Cover success, rejection, and dependency-failure paths with explicit inputs and outcomes | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Unit-Testing/Use-case-tests "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Unit-Testing/Use-case-tests "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Unit-Testing/Use-case-tests "Deep Dive") |
| Mapper tests | Check conversion between DTOs, persistence records, domain objects, and presentation models | Include missing, malformed, optional, and boundary values so schema drift cannot fail silently | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Unit-Testing/Mapper-tests "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Unit-Testing/Mapper-tests "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Unit-Testing/Mapper-tests "Deep Dive") |
| Validator tests | Verify accepted and rejected inputs at meaningful boundaries | Use equivalence classes and edge cases instead of enumerating many redundant examples | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Unit-Testing/Validator-tests "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Unit-Testing/Validator-tests "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Unit-Testing/Validator-tests "Deep Dive") |
| Fake dependency | Supply a lightweight working implementation of a dependency contract | Keep fake behavior simpler than production behavior and expose deliberate test controls | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Unit-Testing/Fake-dependency "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Unit-Testing/Fake-dependency "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Unit-Testing/Fake-dependency "Deep Dive") |
| Mock dependency | Record and verify selected interactions with a generated or dynamic stand-in | Mock only architecturally significant collaboration; excessive interaction checks make refactoring costly | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Unit-Testing/Mock-dependency "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Unit-Testing/Mock-dependency "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Unit-Testing/Mock-dependency "Deep Dive") |
| Stub response | Return a predetermined value or failure from a collaborator | Make the configured response obvious in the arrange phase and avoid unrelated verification | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Unit-Testing/Stub-response "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Unit-Testing/Stub-response "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Unit-Testing/Stub-response "Deep Dive") |
| Fixture data | Reuse representative, named test inputs such as JSON payloads or object builders | Keep fixtures small, valid by default, and easy to customize without hiding important values | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Unit-Testing/Fixture-data "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Unit-Testing/Fixture-data "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Unit-Testing/Fixture-data "Deep Dive") |
| Fake clock | Control the current time and its progression during a test | Inject time rather than reading the system clock, and test timezone and boundary behavior deliberately | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Unit-Testing/Fake-clock "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Unit-Testing/Fake-clock "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Unit-Testing/Fake-clock "Deep Dive") |

## Questions

- [When should a test run with `dart test` instead of `flutter test`?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/When-should-a-test-run-with-dart-test-instead-of-flutter-test%3F)
- [Which repository behaviors belong in unit tests rather than integration tests?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Which-repository-behaviors-belong-in-unit-tests-rather-than-integration-tests%3F)
- [How should a use case expose dependency failures and business-rule failures?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/How-should-a-use-case-expose-dependency-failures-and-business-rule-failures%3F)
- [Which malformed and partial payloads should mapper tests cover?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Which-malformed-and-partial-payloads-should-mapper-tests-cover%3F)
- [How can validator cases cover boundaries without becoming repetitive?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/How-can-validator-cases-cover-boundaries-without-becoming-repetitive%3F)
- [When is a stateful fake clearer than a mock?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/When-is-a-stateful-fake-clearer-than-a-mock%3F)
- [Which dependency interactions are important enough to verify?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Which-dependency-interactions-are-important-enough-to-verify%3F)
- [What is the difference between a stubbed response and a mock expectation?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/What-is-the-difference-between-a-stubbed-response-and-a-mock-expectation%3F)
- [Should fixture data live inline, in builders, or in external files?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Should-fixture-data-live-inline%2C-in-builders%2C-or-in-external-files%3F)
- [How can expiration, retry, and scheduling rules be tested without waiting?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/How-can-expiration%2C-retry%2C-and-scheduling-rules-be-tested-without-waiting%3F)
- [What makes a unit test deterministic and independently repeatable?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/What-makes-a-unit-test-deterministic-and-independently-repeatable%3F)
- [Which observable behavior should remain stable during an implementation refactor?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Which-observable-behavior-should-remain-stable-during-an-implementation-refactor%3F)

## Best Practices

- [Keep framework-independent business logic testable with pure Dart](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Keep-framework-independent-business-logic-testable-with-pure-Dart)
- [Name tests after the behavior and condition they demonstrate](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Name-tests-after-the-behavior-and-condition-they-demonstrate)
- [Follow arrange, act, and assert with one clearly identified system under test](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Follow-arrange%2C-act%2C-and-assert-with-one-clearly-identified-system-under-test)
- [Assert repository results and boundary translations through its public contract](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Assert-repository-results-and-boundary-translations-through-its-public-contract)
- [Cover successful, rejected, and failed use-case paths](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Cover-successful%2C-rejected%2C-and-failed-use-case-paths)
- [Test mappers with realistic boundary values and malformed external data](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Test-mappers-with-realistic-boundary-values-and-malformed-external-data)
- [Choose validator cases from equivalence classes and exact boundaries](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Choose-validator-cases-from-equivalence-classes-and-exact-boundaries)
- [Prefer small handwritten fakes when their behavior improves readability](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Prefer-small-handwritten-fakes-when-their-behavior-improves-readability)
- [Use mocks sparingly for significant interaction contracts](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Use-mocks-sparingly-for-significant-interaction-contracts)
- [Configure stub responses locally so each test explains its scenario](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Configure-stub-responses-locally-so-each-test-explains-its-scenario)
- [Build valid fixtures by default and override only scenario-relevant fields](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Build-valid-fixtures-by-default-and-override-only-scenario-relevant-fields)
- [Inject clocks, randomness, identifiers, and other nondeterministic inputs](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Inject-clocks%2C-randomness%2C-identifiers%2C-and-other-nondeterministic-inputs)
- [Avoid shared mutable state and test-order dependencies](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Avoid-shared-mutable-state-and-test-order-dependencies)
- [Keep assertions focused enough that a failure identifies the broken rule](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Unit-Testing/Keep-assertions-focused-enough-that-a-failure-identifies-the-broken-rule)

[< Back to testing & quality](../README.md)
