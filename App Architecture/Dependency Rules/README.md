# Dependency Rules

Dependency rules control which parts of a Flutter application may know about
one another. They keep stable business policy insulated from widgets,
frameworks, platforms, and external systems while making state changes and
side effects easier to locate, replace, and test.

```text
Widgets -> presentation logic -> domain policy <- interfaces
                                          ^             |
                                          |             v
                                  data / platform implementations

State:        mutable input -> explicit transition -> immutable output
Side effects: application policy -> boundary interface -> external system
```

Dependencies should point toward the code least likely to change for technical
reasons. Outer layers translate framework and provider details into
application-owned contracts; inner layers describe behavior without importing
those details.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Rules) — Focused, bite-sized article covering Dependency Rules
- [Learning Path](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Rules) — Step-by-step material that builds practical Dependency Rules knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Rules) — Structured, in-depth material for learning about Dependency Rules thoroughly

## Rules

| Rule | Protects | Practical effect | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Depend inward | Stable policy from volatile implementation details | Outer layers depend on inner contracts, not the reverse | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Rules/Depend-inward "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Rules/Depend-inward "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Rules/Depend-inward "Deep Dive") |
| Keep domain independent | Business rules from frameworks, storage, transport, and UI concerns | Domain code uses plain Dart and application-owned abstractions | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Rules/Keep-domain-independent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Rules/Keep-domain-independent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Rules/Keep-domain-independent "Deep Dive") |
| Hide platform APIs behind interfaces | Application code from plugins, channels, and operating-system APIs | Platform-specific adapters implement focused interfaces | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Rules/Hide-platform-APIs-behind-interfaces "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Rules/Hide-platform-APIs-behind-interfaces "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Rules/Hide-platform-APIs-behind-interfaces "Deep Dive") |
| Keep widgets thin | UI composition from orchestration and state-transition logic | Widgets render state and forward user intent | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Rules/Keep-widgets-thin "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Rules/Keep-widgets-thin "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Rules/Keep-widgets-thin "Deep Dive") |
| Keep business rules out of widgets | Business behavior from widget lifecycle and framework coupling | Rules live in domain or application services that can be tested directly | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Rules/Keep-business-rules-out-of-widgets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Rules/Keep-business-rules-out-of-widgets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Rules/Keep-business-rules-out-of-widgets "Deep Dive") |
| Avoid global mutable state | Predictability, isolation, and test independence | Mutable state has an explicit owner and bounded lifetime | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Rules/Avoid-global-mutable-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Rules/Avoid-global-mutable-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Rules/Avoid-global-mutable-state "Deep Dive") |
| Prefer immutable state | Reliable change detection and reproducible transitions | Updates create new complete state values instead of mutating shared objects | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Rules/Prefer-immutable-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Rules/Prefer-immutable-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Rules/Prefer-immutable-state "Deep Dive") |
| Prefer explicit dependencies | Understandable construction and replaceable collaborators | Required services are visible in constructors or factory inputs | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Rules/Prefer-explicit-dependencies "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Rules/Prefer-explicit-dependencies "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Rules/Prefer-explicit-dependencies "Deep Dive") |
| Isolate side effects | Deterministic business logic and controlled external interaction | I/O, time, randomness, analytics, and platform calls occur at named boundaries | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Rules/Isolate-side-effects "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Rules/Isolate-side-effects "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Rules/Isolate-side-effects "Deep Dive") |

## Questions

- [What does it mean for dependencies to point inward?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/What-does-it-mean-for-dependencies-to-point-inward%3F)
- [Which layer should own an interface used by domain policy?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Which-layer-should-own-an-interface-used-by-domain-policy%3F)
- [Can an independent domain import Flutter packages?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Can-an-independent-domain-import-Flutter-packages%3F)
- [How should plugins and platform channels be wrapped?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/How-should-plugins-and-platform-channels-be-wrapped%3F)
- [What responsibilities are appropriate inside a widget?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/What-responsibilities-are-appropriate-inside-a-widget%3F)
- [Where should validation and business decisions live?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Where-should-validation-and-business-decisions-live%3F)
- [Why does global mutable state make tests unreliable?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Why-does-global-mutable-state-make-tests-unreliable%3F)
- [When is local mutation acceptable?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/When-is-local-mutation-acceptable%3F)
- [How should immutable state be updated efficiently?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/How-should-immutable-state-be-updated-efficiently%3F)
- [Why is constructor injection more explicit than service lookup?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Why-is-constructor-injection-more-explicit-than-service-lookup%3F)
- [Which operations count as side effects?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Which-operations-count-as-side-effects%3F)
- [How can dependency rules be enforced in a Flutter project?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/How-can-dependency-rules-be-enforced-in-a-Flutter-project%3F)
- [When is a deliberate dependency-rule exception reasonable?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/When-is-a-deliberate-dependency-rule-exception-reasonable%3F)

## Best Practices

- [Make dependency direction visible in package and import boundaries](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Make-dependency-direction-visible-in-package-and-import-boundaries)
- [Let inner layers own the contracts they need](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Let-inner-layers-own-the-contracts-they-need)
- [Use plain Dart types for domain concepts](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Use-plain-Dart-types-for-domain-concepts)
- [Wrap plugins and platform channels with application-owned interfaces](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Wrap-plugins-and-platform-channels-with-application-owned-interfaces)
- [Limit widgets to rendering, composition, and forwarding intent](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Limit-widgets-to-rendering%2C-composition%2C-and-forwarding-intent)
- [Test business rules without a widget test harness](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Test-business-rules-without-a-widget-test-harness)
- [Give every mutable value a clear owner and lifetime](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Give-every-mutable-value-a-clear-owner-and-lifetime)
- [Expose complete immutable state snapshots](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Expose-complete-immutable-state-snapshots)
- [Pass required collaborators through constructors or factory inputs](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Pass-required-collaborators-through-constructors-or-factory-inputs)
- [Keep the composition root at an outer application boundary](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Keep-the-composition-root-at-an-outer-application-boundary)
- [Represent I/O behind narrow interfaces](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Represent-I%2FO-behind-narrow-interfaces)
- [Inject time, randomness, and environment access when behavior depends on them](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Inject-time%2C-randomness%2C-and-environment-access-when-behavior-depends-on-them)
- [Test boundary implementations separately from policy](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Test-boundary-implementations-separately-from-policy)
- [Document and review intentional exceptions](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Rules/Document-and-review-intentional-exceptions)

[< Back to app architecture](../README.md)
