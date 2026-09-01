# Dependency Injection

Dependency injection separates object construction from object behavior. An
application composition root builds the dependency graph, selects concrete
implementations, assigns lifetimes, and supplies collaborators to the objects
that use them.

```text
Composition root -> build / register dependency graph
                         |
             +-----------+-----------+
             v           v           v
          factory   lazy singleton   scope
             \           |           /
              +----> inject contracts
                         |
                         v
                 application objects
                         |
                         v
               dispose owned resources
```

Prefer explicit injection at architectural boundaries. Containers and service
locators can simplify assembly, but resolution should remain near the
composition root so business logic does not depend on hidden global state.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Injection) — Focused, bite-sized article covering Dependency Injection
- [Learning Path](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Injection) — Step-by-step material that builds practical Dependency Injection knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Injection) — Structured, in-depth material for learning about Dependency Injection thoroughly

## Techniques and Lifetimes

| Topic | Primary role | Useful when | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Constructor injection | Supplies required collaborators through an object's constructor | Dependencies should be visible, immutable, and easy to replace in tests | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Injection/Constructor-injection "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Injection/Constructor-injection "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Injection/Constructor-injection "Deep Dive") |
| Interface injection | Supplies a dependency through an explicit injection contract | A framework or lifecycle requires dependencies to be attached after construction | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Injection/Interface-injection "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Injection/Interface-injection "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Injection/Interface-injection "Deep Dive") |
| Factory injection | Supplies a function or factory that creates instances on demand | Creation needs runtime arguments, deferred work, or a fresh instance per use | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Injection/Factory-injection "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Injection/Factory-injection "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Injection/Factory-injection "Deep Dive") |
| Service locator pattern | Resolves registered dependencies from a shared registry | A composition boundary needs centralized lookup without passing every dependency through constructors | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Injection/Service-locator-pattern "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Injection/Service-locator-pattern "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Injection/Service-locator-pattern "Deep Dive") |
| Dependency graph | Describes objects, their dependencies, and their construction order | Application wiring needs to be validated, visualized, or generated | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Injection/Dependency-graph "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Injection/Dependency-graph "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Injection/Dependency-graph "Deep Dive") |
| Lazy singleton | Creates one shared instance only on first access | Construction is expensive or optional, while one application-wide instance is appropriate | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Injection/Lazy-singleton "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Injection/Lazy-singleton "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Injection/Lazy-singleton "Deep Dive") |
| Factory registration | Registers a provider that creates a new instance for each resolution | Consumers need isolated, short-lived, or stateful objects | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Injection/Factory-registration "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Injection/Factory-registration "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Injection/Factory-registration "Deep Dive") |
| Scoped dependencies | Limits an instance to a feature, session, route, or other bounded lifetime | State and resources must be shared locally and released together | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Injection/Scoped-dependencies "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Injection/Scoped-dependencies "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Injection/Scoped-dependencies "Deep Dive") |
| Test overrides | Replaces production registrations or injected values with test doubles | Tests need deterministic collaborators and isolation from external systems | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Injection/Test-overrides "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Injection/Test-overrides "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Injection/Test-overrides "Deep Dive") |
| Disposal lifecycle | Defines who closes resources and when disposal occurs | Dependencies own streams, controllers, clients, subscriptions, or other finite resources | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Dependency-Injection/Disposal-lifecycle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Dependency-Injection/Disposal-lifecycle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Dependency-Injection/Disposal-lifecycle "Deep Dive") |

## Questions

- [What is a composition root, and where should it live?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/What-is-a-composition-root%2C-and-where-should-it-live%3F)
- [Why is constructor injection usually the default?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Why-is-constructor-injection-usually-the-default%3F)
- [When is post-construction interface injection justified?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/When-is-post-construction-interface-injection-justified%3F)
- [How does factory injection differ from factory registration?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/How-does-factory-injection-differ-from-factory-registration%3F)
- [When does a service locator hide too much dependency information?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/When-does-a-service-locator-hide-too-much-dependency-information%3F)
- [How can circular dependencies in the object graph be removed?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/How-can-circular-dependencies-in-the-object-graph-be-removed%3F)
- [Should a dependency be a lazy singleton or a factory?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Should-a-dependency-be-a-lazy-singleton-or-a-factory%3F)
- [Which objects should have scoped lifetimes?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Which-objects-should-have-scoped-lifetimes%3F)
- [How should production dependencies be replaced in tests?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/How-should-production-dependencies-be-replaced-in-tests%3F)
- [Who owns and disposes an injected resource?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Who-owns-and-disposes-an-injected-resource%3F)

## Best Practices

- [Keep application wiring in one explicit composition root](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Keep-application-wiring-in-one-explicit-composition-root)
- [Prefer constructor injection for required dependencies](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Prefer-constructor-injection-for-required-dependencies)
- [Depend on application-owned interfaces at architectural boundaries](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Depend-on-application-owned-interfaces-at-architectural-boundaries)
- [Use factories for runtime values and deliberately short-lived objects](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Use-factories-for-runtime-values-and-deliberately-short-lived-objects)
- [Keep service location out of domain and business logic](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Keep-service-location-out-of-domain-and-business-logic)
- [Validate the complete dependency graph during startup and in tests](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Validate-the-complete-dependency-graph-during-startup-and-in-tests)
- [Choose singleton, factory, and scoped lifetimes deliberately](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Choose-singleton%2C-factory%2C-and-scoped-lifetimes-deliberately)
- [Avoid mutable application-wide singletons](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Avoid-mutable-application-wide-singletons)
- [Align dependency scopes with feature and session ownership](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Align-dependency-scopes-with-feature-and-session-ownership)
- [Reset overrides and containers between tests](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Reset-overrides-and-containers-between-tests)
- [Pair every owned resource with an explicit disposal strategy](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Pair-every-owned-resource-with-an-explicit-disposal-strategy)
- [Fail fast when a required dependency is missing](https://app.syntblaze.com/qsp/flutter/App-Architecture/Dependency-Injection/Fail-fast-when-a-required-dependency-is-missing)

[< Back to app architecture](../README.md)
