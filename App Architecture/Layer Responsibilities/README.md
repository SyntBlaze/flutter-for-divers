# Layer Responsibilities

Layer responsibilities define where each kind of code belongs and which
boundaries protect the application from frameworks, storage, devices, and
remote systems. Clear ownership keeps business rules stable while outer
details can change independently.

```text
User -> UI -> state management -> domain rules
                                  ^
                                  | contracts
External API -> infrastructure -> data implementations
Persistence  -> infrastructure -> data implementations
Platform     -> platform adapters -----------^
```

Dependencies should point toward stable application policy. Data,
infrastructure, and platform code implement contracts owned closer to the
domain; values and user intent travel inward, while state and results travel
back toward the UI.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/App-Architecture/Layer-Responsibilities) — Focused, bite-sized article covering Layer Responsibilities
- [Learning Path](https://app.syntblaze.com/lt/flutter/App-Architecture/Layer-Responsibilities) — Step-by-step material that builds practical Layer Responsibilities knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/App-Architecture/Layer-Responsibilities) — Structured, in-depth material for learning about Layer Responsibilities thoroughly

## Layers and Boundaries

| Topic | Primary responsibility | Boundary concern | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| UI layer | Render state, collect user intent, and handle presentation-only behavior | Avoid owning business rules or direct I/O | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Layer-Responsibilities/UI-layer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Layer-Responsibilities/UI-layer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Layer-Responsibilities/UI-layer "Deep Dive") |
| State management layer | Coordinate presentation state, asynchronous operations, and UI effects | Expose explicit states without coupling domain logic to widgets | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Layer-Responsibilities/State-management-layer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Layer-Responsibilities/State-management-layer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Layer-Responsibilities/State-management-layer "Deep Dive") |
| Domain layer | Define business rules, entities, value objects, and application-facing contracts | Stay independent of Flutter, storage, transport, and platform details | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Layer-Responsibilities/Domain-layer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Layer-Responsibilities/Domain-layer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Layer-Responsibilities/Domain-layer "Deep Dive") |
| Data layer | Implement repositories, map data models, and coordinate data sources | Translate external representations into domain concepts | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Layer-Responsibilities/Data-layer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Layer-Responsibilities/Data-layer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Layer-Responsibilities/Data-layer "Deep Dive") |
| Infrastructure layer | Provide concrete technical integrations such as clients, databases, logging, and analytics | Keep vendor and framework details behind interfaces | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Layer-Responsibilities/Infrastructure-layer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Layer-Responsibilities/Infrastructure-layer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Layer-Responsibilities/Infrastructure-layer "Deep Dive") |
| Platform layer | Adapt operating-system and device capabilities for application use | Prevent platform channels and plugins from leaking inward | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Layer-Responsibilities/Platform-layer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Layer-Responsibilities/Platform-layer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Layer-Responsibilities/Platform-layer "Deep Dive") |
| Dependency boundary | Control which modules may know about and import other modules | Make dependency direction explicit and enforceable | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Layer-Responsibilities/Dependency-boundary "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Layer-Responsibilities/Dependency-boundary "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Layer-Responsibilities/Dependency-boundary "Deep Dive") |
| External API boundary | Isolate remote protocols, schemas, authentication, and transport failures | Convert API DTOs and errors before they reach application policy | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Layer-Responsibilities/External-API-boundary "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Layer-Responsibilities/External-API-boundary "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Layer-Responsibilities/External-API-boundary "Deep Dive") |
| Persistence boundary | Isolate storage engines, schemas, migrations, and cache behavior | Keep persistence models and failures out of the domain | [💡](https://app.syntblaze.com/qt/flutter/App-Architecture/Layer-Responsibilities/Persistence-boundary "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/App-Architecture/Layer-Responsibilities/Persistence-boundary "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/App-Architecture/Layer-Responsibilities/Persistence-boundary "Deep Dive") |

## Questions

- [What responsibility belongs in each layer?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/What-responsibility-belongs-in-each-layer%3F)
- [How many layers does a Flutter application need?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/How-many-layers-does-a-Flutter-application-need%3F)
- [What is the difference between a layer and a boundary?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/What-is-the-difference-between-a-layer-and-a-boundary%3F)
- [Where should validation live?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Where-should-validation-live%3F)
- [Where should navigation and presentation-only effects live?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Where-should-navigation-and-presentation-only-effects-live%3F)
- [Should state management call repositories or use cases?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Should-state-management-call-repositories-or-use-cases%3F)
- [Which interfaces should the domain own?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Which-interfaces-should-the-domain-own%3F)
- [Where should DTOs be converted to entities?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Where-should-DTOs-be-converted-to-entities%3F)
- [How is infrastructure different from the data layer?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/How-is-infrastructure-different-from-the-data-layer%3F)
- [How should plugins and platform channels be wrapped?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/How-should-plugins-and-platform-channels-be-wrapped%3F)
- [How can dependency direction be enforced?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/How-can-dependency-direction-be-enforced%3F)
- [Where should transport and API errors be mapped?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Where-should-transport-and-API-errors-be-mapped%3F)
- [Where should migrations and cache invalidation live?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Where-should-migrations-and-cache-invalidation-live%3F)
- [When is crossing a layer directly acceptable?](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/When-is-crossing-a-layer-directly-acceptable%3F)

## Best Practices

- [Assign one clear owner to every responsibility](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Assign-one-clear-owner-to-every-responsibility)
- [Choose only the layers the application complexity justifies](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Choose-only-the-layers-the-application-complexity-justifies)
- [Point dependencies toward stable business policy](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Point-dependencies-toward-stable-business-policy)
- [Keep widgets focused on rendering and user interaction](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Keep-widgets-focused-on-rendering-and-user-interaction)
- [Model loading, success, empty, and failure states explicitly](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Model-loading%2C-success%2C-empty%2C-and-failure-states-explicitly)
- [Keep domain types independent of Flutter and external packages](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Keep-domain-types-independent-of-Flutter-and-external-packages)
- [Map DTOs and persistence records at the data boundary](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Map-DTOs-and-persistence-records-at-the-data-boundary)
- [Hide vendor SDKs and technical details behind focused interfaces](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Hide-vendor-SDKs-and-technical-details-behind-focused-interfaces)
- [Wrap plugins and platform channels in application-owned abstractions](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Wrap-plugins-and-platform-channels-in-application-owned-abstractions)
- [Validate and translate remote data at the API boundary](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Validate-and-translate-remote-data-at-the-API-boundary)
- [Treat storage schemas as implementation details](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Treat-storage-schemas-as-implementation-details)
- [Keep side effects at explicit outer boundaries](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Keep-side-effects-at-explicit-outer-boundaries)
- [Avoid sharing mutable models across layers](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Avoid-sharing-mutable-models-across-layers)
- [Test contracts and mappings at every boundary](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Test-contracts-and-mappings-at-every-boundary)
- [Document deliberate exceptions to the dependency rules](https://app.syntblaze.com/qsp/flutter/App-Architecture/Layer-Responsibilities/Document-deliberate-exceptions-to-the-dependency-rules)

[< Back to app architecture](../README.md)
