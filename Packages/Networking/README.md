# Networking

Networking is the way an application exchanges data with remote services. A
well-designed networking layer turns requests, responses, streams, and failures
into predictable application data while keeping transport details out of
widgets and business rules.

```text
User intent -> repository -> API client -> network -> remote service
                    ^                            |
                    |                            v
             domain result <- mapping <- response, event, or failure
```

Start by matching the client to the protocol and the amount of abstraction the
application needs. HTTP is a small foundation for explicit requests, while Dio
provides a configurable request pipeline. Retrofit and Chopper can reduce
repeated REST client code through declarative endpoints and code generation.
GraphQL Flutter and Ferry target GraphQL APIs, with different balances of
runtime flexibility, generated types, and cache integration.

Use WebSocket Channel for protocol-level WebSocket communication and Socket.IO
Client when the server specifically speaks the Socket.IO protocol. Fresh Dio
adds a reusable authentication-token lifecycle to a Dio-based stack.
Connectivity Plus reports available network interfaces; it does not by itself
prove that the internet or a particular backend is reachable. Internet
Connection Checker Plus is intended for reachability checks, although a real
request can still fail and must always be handled.

Choose one primary client per API boundary when practical, then hide it behind
a small service or repository interface. Add generation, interceptors, caching,
connectivity signals, and real-time connections only when the application has a
clear need for them.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Networking) — Focused, bite-sized article covering Networking
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Networking) — Step-by-step material that builds practical Networking knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Networking) — Structured, in-depth material for learning about Networking thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Dio | Configurable HTTP client with interceptors, cancellation, request options, and file transfer support | REST clients that need shared policies, diagnostics, or fine-grained request control | [💡](https://app.syntblaze.com/qt/flutter/Packages/Networking/Dio "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Networking/Dio "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Networking/Dio "Deep Dive") |
| HTTP | Lightweight APIs for explicit HTTP requests and streamed responses | Small integrations and applications that prefer a minimal client abstraction | [💡](https://app.syntblaze.com/qt/flutter/Packages/Networking/HTTP "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Networking/HTTP "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Networking/HTTP "Deep Dive") |
| Retrofit | Annotation-driven generation of typed REST clients backed by Dio | Larger REST APIs with repeated endpoint, parameter, and response boilerplate | [💡](https://app.syntblaze.com/qt/flutter/Packages/Networking/Retrofit "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Networking/Retrofit "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Networking/Retrofit "Deep Dive") |
| Chopper | Declarative HTTP services with generated implementations, converters, and interceptors | Teams that want generated REST clients with customizable request and conversion pipelines | [💡](https://app.syntblaze.com/qt/flutter/Packages/Networking/Chopper "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Networking/Chopper "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Networking/Chopper "Deep Dive") |
| GraphQL Flutter | GraphQL client with query, mutation, subscription, cache, and Flutter widget integration | Applications that want a Flutter-oriented GraphQL client and reactive cached results | [💡](https://app.syntblaze.com/qt/flutter/Packages/Networking/GraphQL-Flutter "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Networking/GraphQL-Flutter "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Networking/GraphQL-Flutter "Deep Dive") |
| Ferry | Generated, strongly typed GraphQL operations with a normalized client cache | Schema-driven GraphQL applications that prioritize compile-time operation types | [💡](https://app.syntblaze.com/qt/flutter/Packages/Networking/Ferry "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Networking/Ferry "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Networking/Ferry "Deep Dive") |
| WebSocket Channel | Stream-based abstraction over bidirectional WebSocket connections | Custom WebSocket protocols, live feeds, chat, and other low-latency updates | [💡](https://app.syntblaze.com/qt/flutter/Packages/Networking/WebSocket-Channel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Networking/WebSocket-Channel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Networking/WebSocket-Channel "Deep Dive") |
| Socket.IO Client | Dart client for Socket.IO events, acknowledgements, namespaces, and reconnection | Flutter applications communicating with an existing Socket.IO server | [💡](https://app.syntblaze.com/qt/flutter/Packages/Networking/Socket.IO-Client "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Networking/Socket.IO-Client "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Networking/Socket.IO-Client "Deep Dive") |
| Fresh Dio | Dio integration for storing, attaching, refreshing, and revoking authentication tokens | Dio-based applications that need a consistent token-refresh lifecycle | [💡](https://app.syntblaze.com/qt/flutter/Packages/Networking/Fresh-Dio "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Networking/Fresh-Dio "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Networking/Fresh-Dio "Deep Dive") |
| Connectivity Plus | Platform connectivity and network-interface status | Adapting behavior or UI when available connection types change | [💡](https://app.syntblaze.com/qt/flutter/Packages/Networking/Connectivity-Plus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Networking/Connectivity-Plus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Networking/Connectivity-Plus "Deep Dive") |
| Internet Connection Checker Plus | Reachability checks and internet-status change notifications | Distinguishing an available network interface from likely internet access | [💡](https://app.syntblaze.com/qt/flutter/Packages/Networking/Internet-Connection-Checker-Plus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Networking/Internet-Connection-Checker-Plus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Networking/Internet-Connection-Checker-Plus "Deep Dive") |

## Questions

- [How should a network request move through the application?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/How-should-a-network-request-move-through-the-application%3F)
- [When should I choose HTTP instead of Dio?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/When-should-I-choose-HTTP-instead-of-Dio%3F)
- [When is a generated REST client worthwhile?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/When-is-a-generated-REST-client-worthwhile%3F)
- [What is the difference between REST and GraphQL?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/What-is-the-difference-between-REST-and-GraphQL%3F)
- [How do GraphQL Flutter and Ferry differ?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/How-do-GraphQL-Flutter-and-Ferry-differ%3F)
- [When should I use WebSockets instead of polling?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/When-should-I-use-WebSockets-instead-of-polling%3F)
- [Is Socket.IO the same protocol as WebSocket?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Is-Socket.IO-the-same-protocol-as-WebSocket%3F)
- [Where should API clients, services, and repositories live?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Where-should-API-clients%2C-services%2C-and-repositories-live%3F)
- [How should request and response models be mapped to domain models?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/How-should-request-and-response-models-be-mapped-to-domain-models%3F)
- [How should timeouts, cancellation, retries, and backoff work together?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/How-should-timeouts%2C-cancellation%2C-retries%2C-and-backoff-work-together%3F)
- [How should authentication tokens be attached and refreshed?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/How-should-authentication-tokens-be-attached-and-refreshed%3F)
- [What can connectivity status tell the application?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/What-can-connectivity-status-tell-the-application%3F)
- [How should offline behavior and caching be designed?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/How-should-offline-behavior-and-caching-be-designed%3F)
- [How should pagination and concurrent requests be handled?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/How-should-pagination-and-concurrent-requests-be-handled%3F)
- [How can network code be tested without calling a real service?](https://app.syntblaze.com/qsp/flutter/Packages/Networking/How-can-network-code-be-tested-without-calling-a-real-service%3F)

## Best Practices

- [Keep transport code out of widgets](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Keep-transport-code-out-of-widgets)
- [Expose domain-friendly repositories instead of raw client responses](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Expose-domain-friendly-repositories-instead-of-raw-client-responses)
- [Use typed request, response, and failure models](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Use-typed-request%2C-response%2C-and-failure-models)
- [Validate status codes and payloads before mapping their data](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Validate-status-codes-and-payloads-before-mapping-their-data)
- [Model transport, server, authentication, and parsing failures separately](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Model-transport%2C-server%2C-authentication%2C-and-parsing-failures-separately)
- [Set explicit connection, send, and response timeouts where supported](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Set-explicit-connection%2C-send%2C-and-response-timeouts-where-supported)
- [Cancel obsolete requests when screens, searches, or filters change](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Cancel-obsolete-requests-when-screens%2C-searches%2C-or-filters-change)
- [Prevent stale responses from overwriting newer results](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Prevent-stale-responses-from-overwriting-newer-results)
- [Retry only transient failures and apply bounded backoff with jitter](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Retry-only-transient-failures-and-apply-bounded-backoff-with-jitter)
- [Retry state-changing operations only when they are safe or idempotent](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Retry-state-changing-operations-only-when-they-are-safe-or-idempotent)
- [Centralize base URLs, headers, serialization, and cross-cutting policies](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Centralize-base-URLs%2C-headers%2C-serialization%2C-and-cross-cutting-policies)
- [Coordinate concurrent authentication failures through one refresh operation](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Coordinate-concurrent-authentication-failures-through-one-refresh-operation)
- [Store credentials securely and never log tokens or sensitive payloads](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Store-credentials-securely-and-never-log-tokens-or-sensitive-payloads)
- [Treat connectivity signals as hints rather than proof that an API is reachable](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Treat-connectivity-signals-as-hints-rather-than-proof-that-an-API-is-reachable)
- [Design offline behavior and cache invalidation deliberately](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Design-offline-behavior-and-cache-invalidation-deliberately)
- [Paginate large collections and guard against duplicate page requests](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Paginate-large-collections-and-guard-against-duplicate-page-requests)
- [Close clients, sockets, controllers, and subscriptions with their lifecycle](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Close-clients%2C-sockets%2C-controllers%2C-and-subscriptions-with-their-lifecycle)
- [Reconnect real-time channels with bounded backoff and restore subscriptions](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Reconnect-real-time-channels-with-bounded-backoff-and-restore-subscriptions)
- [Keep generated clients reproducible and regenerate them after schema changes](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Keep-generated-clients-reproducible-and-regenerate-them-after-schema-changes)
- [Test success, failure, timeout, cancellation, malformed data, and race conditions](https://app.syntblaze.com/qsp/flutter/Packages/Networking/Test-success%2C-failure%2C-timeout%2C-cancellation%2C-malformed-data%2C-and-race-conditions)

[< Back to packages](../README.md)
