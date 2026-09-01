# Dependency Injection

Dependency injection is the practice of giving an object the services it needs
instead of letting it create or locate them internally. Keeping construction
separate from behavior makes dependencies visible, implementations replaceable,
and application code easier to test.

```text
Composition root -> register or construct dependencies -> inject -> use -> dispose
```

Prefer constructor injection for application code because it makes requirements
explicit. A container such as GetIt can assemble the object graph at the app's
composition root, while Injectable can generate that registration code when
manual setup becomes repetitive. Neither package removes the need to choose
appropriate lifetimes and ownership rules.

Dependency-injection tools differ in where dependencies are stored, how they
are resolved, and who controls their lifetime. GetIt and Kiwi use central
containers, Provider scopes values to a Flutter widget subtree, and Riverpod
builds a declarative provider graph that can be read and overridden without
using `BuildContext`. Injectable complements GetIt by generating registrations
rather than acting as a separate runtime container.

## Selection Guidance

Start by deciding whether the dependency should follow a widget subtree, an
application-wide composition root, or a smaller feature or session scope.
Provider is a natural fit when dependencies belong to the Flutter element tree
and consumers already use `BuildContext`. Riverpod suits applications that want
declarative dependencies, explicit provider relationships, lifecycle handling,
and straightforward overrides in tests without coupling resolution to a widget
tree.

Choose GetIt when a small runtime container and manual registration keep the
object graph clear. Add Injectable when GetIt registrations become repetitive
or environment-specific bindings benefit from generated configuration. Kiwi is
another container-oriented option for teams that prefer its registration and
code-generation model. Whichever tool you choose, keep dependency lookup near
the composition boundary, inject dependencies into application classes, and
make initialization, scope, and disposal rules explicit.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Dependency-Injection) — Focused, bite-sized article covering Dependency Injection
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Dependency-Injection) — Step-by-step material that builds practical Dependency Injection knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Dependency-Injection) — Structured, in-depth material for learning about Dependency Injection thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| GetIt | Runtime service locator with factories, lazy singletons, scopes, and manual registration | Lightweight dependency wiring without generated code | [💡](https://app.syntblaze.com/qt/flutter/Packages/Dependency-Injection/GetIt "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Dependency-Injection/GetIt "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Dependency-Injection/GetIt "Deep Dive") |
| Injectable | Annotation-driven code generation that configures GetIt registrations | Larger dependency graphs where generated, repeatable setup reduces boilerplate | [💡](https://app.syntblaze.com/qt/flutter/Packages/Dependency-Injection/Injectable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Dependency-Injection/Injectable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Dependency-Injection/Injectable "Deep Dive") |
| Riverpod | Declarative provider graph with scoped containers, automatic lifecycle handling, and test overrides | Applications that want dependency wiring independent of `BuildContext` and closely integrated with reactive state | [💡](https://app.syntblaze.com/qt/flutter/Packages/Dependency-Injection/Riverpod "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Dependency-Injection/Riverpod "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Dependency-Injection/Riverpod "Deep Dive") |
| Provider | Widget-tree dependency exposure and scoping through inherited Flutter primitives | Flutter UI dependencies whose ownership and availability naturally follow a widget subtree | [💡](https://app.syntblaze.com/qt/flutter/Packages/Dependency-Injection/Provider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Dependency-Injection/Provider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Dependency-Injection/Provider "Deep Dive") |
| Kiwi | Runtime dependency container with factory and singleton registrations plus optional generated wiring | Teams that want container-based resolution with a choice between manual and generated registration | [💡](https://app.syntblaze.com/qt/flutter/Packages/Dependency-Injection/Kiwi "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Dependency-Injection/Kiwi "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Dependency-Injection/Kiwi "Deep Dive") |

## Questions

- [What is dependency injection?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/What-is-dependency-injection%3F)
- [How is dependency injection different from a service locator?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/How-is-dependency-injection-different-from-a-service-locator%3F)
- [What is a composition root?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/What-is-a-composition-root%3F)
- [Why is constructor injection usually preferred?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Why-is-constructor-injection-usually-preferred%3F)
- [When should a dependency be registered as a factory?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/When-should-a-dependency-be-registered-as-a-factory%3F)
- [What is the difference between a singleton and a lazy singleton?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/What-is-the-difference-between-a-singleton-and-a-lazy-singleton%3F)
- [How are asynchronous dependencies initialized?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/How-are-asynchronous-dependencies-initialized%3F)
- [How should environment-specific implementations be selected?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/How-should-environment-specific-implementations-be-selected%3F)
- [How can dependencies be replaced in tests?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/How-can-dependencies-be-replaced-in-tests%3F)
- [Who should own and dispose a dependency?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Who-should-own-and-dispose-a-dependency%3F)
- [When are dependency scopes useful?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/When-are-dependency-scopes-useful%3F)
- [How can circular dependencies be avoided?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/How-can-circular-dependencies-be-avoided%3F)
- [Should widgets resolve dependencies directly?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Should-widgets-resolve-dependencies-directly%3F)
- [When is GetIt enough?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/When-is-GetIt-enough%3F)
- [When does Injectable add value?](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/When-does-Injectable-add-value%3F)

## Best Practices

- [Keep registrations in one explicit composition root](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Keep-registrations-in-one-explicit-composition-root)
- [Prefer constructor injection in business and data-layer classes](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Prefer-constructor-injection-in-business-and-data-layer-classes)
- [Depend on focused abstractions at architectural boundaries](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Depend-on-focused-abstractions-at-architectural-boundaries)
- [Choose factory, singleton, and scoped lifetimes deliberately](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Choose-factory%2C-singleton%2C-and-scoped-lifetimes-deliberately)
- [Keep mutable global singletons to a minimum](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Keep-mutable-global-singletons-to-a-minimum)
- [Register dependencies in dependency order](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Register-dependencies-in-dependency-order)
- [Await asynchronous setup before exposing dependent features](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Await-asynchronous-setup-before-exposing-dependent-features)
- [Pair every owned resource with a disposal strategy](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Pair-every-owned-resource-with-a-disposal-strategy)
- [Reset or isolate the container between tests](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Reset-or-isolate-the-container-between-tests)
- [Override external services with deterministic test doubles](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Override-external-services-with-deterministic-test-doubles)
- [Avoid resolving dependencies deep inside domain logic](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Avoid-resolving-dependencies-deep-inside-domain-logic)
- [Pass runtime values as method or factory parameters](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Pass-runtime-values-as-method-or-factory-parameters)
- [Use scopes for authenticated sessions and other bounded lifetimes](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Use-scopes-for-authenticated-sessions-and-other-bounded-lifetimes)
- [Keep generated registration code out of hand-written edits](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Keep-generated-registration-code-out-of-hand-written-edits)
- [Regenerate and verify configuration after annotation changes](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Regenerate-and-verify-configuration-after-annotation-changes)
- [Fail fast when a required registration is missing](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Fail-fast-when-a-required-registration-is-missing)
- [Document registrations whose lifetime or initialization is surprising](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Document-registrations-whose-lifetime-or-initialization-is-surprising)
- [Test the assembled dependency graph as well as individual classes](https://app.syntblaze.com/qsp/flutter/Packages/Dependency-Injection/Test-the-assembled-dependency-graph-as-well-as-individual-classes)

[< Back to packages](../README.md)
