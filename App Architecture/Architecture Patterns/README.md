# Architecture Patterns

Architecture patterns give Flutter applications a shared vocabulary for
separating presentation, business rules, data access, and external systems.
They can be combined: choose only the boundaries and abstractions that make the
application easier to change, test, and understand.

```text
View -> presentation state -> controller / view model / presentation model
                                      |
                                      v
                            use case / service
                                      |
                                      v
                                 repository
                                      |
                                      v
                    data source -> external system

Cross-boundary translation: mapper / adapter / facade
Dependency direction:        outer details -> inner policies
```

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns) — Focused, bite-sized article covering Architecture Patterns
- [Learning Path](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns) — Step-by-step material that builds practical Architecture Patterns knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns) — Structured, in-depth material for learning about Architecture Patterns thoroughly

## Patterns

| Pattern | Primary role | Useful when | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Clean Architecture | Organizes code into concentric policy and implementation boundaries | Business rules must remain independent of UI, storage, and frameworks | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/Clean-Architecture "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/Clean-Architecture "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/Clean-Architecture "Deep Dive") |
| MVVM | Connects a view to observable state and actions exposed by a view model | Screens need testable presentation logic with declarative updates | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/MVVM "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/MVVM "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/MVVM "Deep Dive") |
| MVI | Models UI behavior as intents, a reducer-like state transition, and rendered state | Complex screens benefit from a predictable, unidirectional event loop | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/MVI "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/MVI "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/MVI "Deep Dive") |
| Reactive presentation architecture | Propagates state changes to the UI through streams, notifiers, or similar reactive primitives | UI must respond continuously to asynchronous or changing data | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/Reactive-presentation-architecture "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/Reactive-presentation-architecture "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/Reactive-presentation-architecture "Deep Dive") |
| Repository pattern | Presents domain-oriented operations while hiding data retrieval and storage details | The domain should not know which API, cache, or database supplies data | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/Repository-pattern "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/Repository-pattern "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/Repository-pattern "Deep Dive") |
| Data source pattern | Encapsulates direct interaction with one external or persistent data provider | API, database, cache, and device access need focused implementations | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/Data-source-pattern "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/Data-source-pattern "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/Data-source-pattern "Deep Dive") |
| Use case pattern | Represents one application action or business operation | Workflows need explicit inputs, outputs, authorization, and test boundaries | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/Use-case-pattern "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/Use-case-pattern "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/Use-case-pattern "Deep Dive") |
| Service layer | Groups related application operations behind a cohesive API | Several callers share orchestration that does not fit one entity or screen | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/Service-layer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/Service-layer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/Service-layer "Deep Dive") |
| Controller layer | Accepts UI input and coordinates presentation-facing actions | Views need a thin imperative boundary for events and lifecycle behavior | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/Controller-layer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/Controller-layer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/Controller-layer "Deep Dive") |
| Presentation model | Stores display-ready state and presentation behavior independently of widgets | Formatting and interaction state should be reusable and widget-agnostic | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/Presentation-model "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/Presentation-model "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/Presentation-model "Deep Dive") |
| View model | Exposes the state and commands required by a particular view | A screen needs a stable, testable contract tailored to its rendering needs | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/View-model "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/View-model "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/View-model "Deep Dive") |
| Mapper pattern | Converts models between layers without leaking one layer's representation | DTOs, entities, and UI models intentionally differ | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/Mapper-pattern "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/Mapper-pattern "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/Mapper-pattern "Deep Dive") |
| Adapter pattern | Makes an existing API satisfy the interface expected by application code | A package, platform service, or legacy component has an incompatible contract | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/Adapter-pattern "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/Adapter-pattern "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/Adapter-pattern "Deep Dive") |
| Facade pattern | Offers a small, cohesive interface over a complex subsystem | Callers should not coordinate several low-level collaborators themselves | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Architecture-Patterns/Facade-pattern "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Architecture-Patterns/Facade-pattern "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Architecture-Patterns/Facade-pattern "Deep Dive") |

## Questions

- [How do architectural patterns differ from folder structures?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/How-do-architectural-patterns-differ-from-folder-structures%3F)
- [Which patterns can be combined without duplicating responsibilities?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Which-patterns-can-be-combined-without-duplicating-responsibilities%3F)
- [When is Clean Architecture worth its additional boundaries?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/When-is-Clean-Architecture-worth-its-additional-boundaries%3F)
- [How do MVVM and MVI differ?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/How-do-MVVM-and-MVI-differ%3F)
- [What makes presentation architecture reactive?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/What-makes-presentation-architecture-reactive%3F)
- [Where should state transitions and side effects live in MVI?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Where-should-state-transitions-and-side-effects-live-in-MVI%3F)
- [What belongs in a repository rather than a data source?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/What-belongs-in-a-repository-rather-than-a-data-source%3F)
- [Should repositories return DTOs or domain entities?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Should-repositories-return-DTOs-or-domain-entities%3F)
- [When should application logic become a use case?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/When-should-application-logic-become-a-use-case%3F)
- [How is a service layer different from a controller layer?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/How-is-a-service-layer-different-from-a-controller-layer%3F)
- [How do presentation models and view models differ?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/How-do-presentation-models-and-view-models-differ%3F)
- [Where should mapping between DTOs, entities, and UI models happen?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Where-should-mapping-between-DTOs%2C-entities%2C-and-UI-models-happen%3F)
- [When should an external SDK be wrapped in an adapter?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/When-should-an-external-SDK-be-wrapped-in-an-adapter%3F)
- [How can a facade simplify a complex subsystem without becoming a god object?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/How-can-a-facade-simplify-a-complex-subsystem-without-becoming-a-god-object%3F)

## Best Practices

- [Choose patterns to protect real change boundaries](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Choose-patterns-to-protect-real-change-boundaries)
- [Keep dependencies pointing toward business policy](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Keep-dependencies-pointing-toward-business-policy)
- [Give each abstraction one clear reason to exist](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Give-each-abstraction-one-clear-reason-to-exist)
- [Keep widgets focused on rendering and forwarding user intent](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Keep-widgets-focused-on-rendering-and-forwarding-user-intent)
- [Expose immutable, complete presentation states](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Expose-immutable%2C-complete-presentation-states)
- [Make state transitions deterministic where practical](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Make-state-transitions-deterministic-where-practical)
- [Keep view models independent of concrete data providers](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Keep-view-models-independent-of-concrete-data-providers)
- [Express application actions with explicit inputs and outcomes](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Express-application-actions-with-explicit-inputs-and-outcomes)
- [Hide API, database, and cache selection behind repositories](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Hide-API%2C-database%2C-and-cache-selection-behind-repositories)
- [Keep each data source focused on one provider](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Keep-each-data-source-focused-on-one-provider)
- [Translate representations explicitly at layer boundaries](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Translate-representations-explicitly-at-layer-boundaries)
- [Wrap third-party and platform APIs behind application-owned contracts](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Wrap-third-party-and-platform-APIs-behind-application-owned-contracts)
- [Keep services and facades cohesive rather than universal](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Keep-services-and-facades-cohesive-rather-than-universal)
- [Test contracts and boundary behavior, not only implementations](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Test-contracts-and-boundary-behavior%2C-not-only-implementations)
- [Remove abstractions that add indirection without protecting variation](https://app.syntblaze.com/qsp/flutter/App-Architecture/Architecture-Patterns/Remove-abstractions-that-add-indirection-without-protecting-variation)

[< Back to app architecture](../README.md)
