# API Styles

An API style defines how a Flutter client and a remote service express
operations, move data, report progress, and recover when communication is
interrupted. The right choice depends less on popularity than on the shape of
the interaction: resource-oriented requests, client-selected query results,
strongly typed remote calls, continuous bidirectional messages, one-way event
streams, or repeated checks for changing state.

```text
Flutter application
        |
        +-- request / response -------- REST, GraphQL, gRPC
        |                                  |
        |                                  +-- paginated collections
        |                                      +-- cursor pagination
        |                                      +-- offset pagination
        |
        +-- persistent connection ------ WebSocket
        |
        +-- server-to-client stream ---- Server-sent events
        |
        +-- repeated HTTP checks ------- polling
                                           |
                                           +-- immediate response
                                           +-- delayed response (long polling)

transport result -> parse -> map -> application state -> UI
                         failures / reconnect / deduplication
```

REST, GraphQL, and gRPC primarily differ in how they model operations and data
contracts. REST commonly exposes resources through HTTP semantics, GraphQL lets
the client select fields through a schema, and gRPC invokes strongly typed
service methods using generated code and Protocol Buffers. None of them removes
the need to define authentication, errors, deadlines, compatibility, tracing,
and retry behavior at the application boundary.

Real-time requirements introduce a separate decision. WebSocket supports
full-duplex messages over a persistent connection, while server-sent events
provide a one-way HTTP event stream from server to client. Polling remains a
useful choice when updates are infrequent or infrastructure favors ordinary
HTTP; long polling reduces empty responses by allowing the server to hold a
request until an update or timeout. Every streaming or repeated-request design
needs explicit connection lifecycle, resumption, ordering, duplication, and
resource-use rules.

Pagination is part of the API contract rather than a UI-only concern. Offset
pagination is straightforward and supports direct page access, but concurrent
inserts or removals can shift records between requests. Cursor pagination uses
an opaque position tied to a stable ordering, making sequential traversal more
robust for changing datasets. Whichever model is chosen, preserve server tokens
as opaque values and define ordering, filters, termination, and refresh
behavior precisely.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/API-Styles) — Focused, bite-sized article covering API Styles
- [Learning Path](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/API-Styles) — Step-by-step material that builds practical API Styles knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/API-Styles) — Structured, in-depth material for learning about API Styles thoroughly

## API Styles Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| REST | Model remote resources and operations with HTTP methods, URLs, status codes, and representations | Keep resource semantics, status handling, idempotency, and version compatibility consistent rather than treating every endpoint as an arbitrary command | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/API-Styles/REST "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/API-Styles/REST "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/API-Styles/REST "Deep Dive") |
| GraphQL | Query and mutate a typed schema while selecting the response fields the client needs | Control query complexity, normalize cache identities, handle partial data with errors, and evolve the schema without silently breaking clients | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/API-Styles/GraphQL "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/API-Styles/GraphQL "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/API-Styles/GraphQL "Deep Dive") |
| gRPC | Invoke strongly typed service methods through generated clients and Protocol Buffer messages | Plan for platform and proxy support, deadlines, status mapping, schema compatibility, streaming lifecycle, and generated-code ownership | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/API-Styles/gRPC "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/API-Styles/gRPC "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/API-Styles/gRPC "Deep Dive") |
| WebSocket | Exchange bidirectional messages over a persistent connection | Define framing, authentication renewal, heartbeats, reconnect and resubscribe behavior, ordering, backpressure, and duplicate handling | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/API-Styles/WebSocket "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/API-Styles/WebSocket "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/API-Styles/WebSocket "Deep Dive") |
| Server-sent events | Receive a one-way stream of text events over an HTTP connection | Account for browser and platform support, proxy buffering, event IDs, reconnection delay, authentication, and resumption after disconnects | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/API-Styles/Server-sent-events "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/API-Styles/Server-sent-events "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/API-Styles/Server-sent-events "Deep Dive") |
| Polling | Check periodically for state changes with independent requests | Choose an interval that balances freshness, battery, radio wakeups, server load, app lifecycle, and unchanged responses | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/API-Styles/Polling "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/API-Styles/Polling "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/API-Styles/Polling "Deep Dive") |
| Long polling | Hold a request until data changes or a time limit expires, then immediately reconnect | Coordinate client, server, proxy, and load-balancer timeouts while preventing reconnect storms and overlapping requests | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/API-Styles/Long-polling "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/API-Styles/Long-polling "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/API-Styles/Long-polling "Deep Dive") |
| Pagination | Fetch a large ordered collection in bounded segments | Specify a deterministic order, page boundaries, completion signal, filtering contract, refresh behavior, and duplicate suppression | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/API-Styles/Pagination "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/API-Styles/Pagination "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/API-Styles/Pagination "Deep Dive") |
| Cursor pagination | Continue traversal from an opaque server-issued position | Do not decode or construct cursors on the client; retain query context and handle expired cursors, mutations, duplicates, and end-of-list state | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/API-Styles/Cursor-pagination "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/API-Styles/Cursor-pagination "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/API-Styles/Cursor-pagination "Deep Dive") |
| Offset pagination | Select a segment by numeric offset and limit or page number | It enables direct page access but can become costly or inconsistent when the underlying collection changes during traversal | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/API-Styles/Offset-pagination "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/API-Styles/Offset-pagination "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/API-Styles/Offset-pagination "Deep Dive") |

## Questions

- [Does the domain fit resource-oriented HTTP operations, client-shaped queries, or strongly typed remote procedures?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Does-the-domain-fit-resource-oriented-HTTP-operations%2C-client-shaped-queries%2C-or-strongly-typed-remote-procedures%3F)
- [How will REST endpoints express idempotency, validation failures, authorization failures, and version evolution?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/How-will-REST-endpoints-express-idempotency%2C-validation-failures%2C-authorization-failures%2C-and-version-evolution%3F)
- [Can GraphQL responses contain useful data and errors together, and how should the client represent that state?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Can-GraphQL-responses-contain-useful-data-and-errors-together%2C-and-how-should-the-client-represent-that-state%3F)
- [Which Flutter targets, gateways, and deployment environments can carry the required gRPC transport and streaming modes?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Which-Flutter-targets%2C-gateways%2C-and-deployment-environments-can-carry-the-required-gRPC-transport-and-streaming-modes%3F)
- [Does the feature need bidirectional messages, or is a one-way server event stream sufficient?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Does-the-feature-need-bidirectional-messages%2C-or-is-a-one-way-server-event-stream-sufficient%3F)
- [How will an event-stream client resume from the last processed event after a disconnect?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/How-will-an-event-stream-client-resume-from-the-last-processed-event-after-a-disconnect%3F)
- [What freshness requirement justifies the polling interval and its battery and server cost?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/What-freshness-requirement-justifies-the-polling-interval-and-its-battery-and-server-cost%3F)
- [Which timeout owns a normal long-poll completion, and how does the client distinguish it from a failure?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Which-timeout-owns-a-normal-long-poll-completion%2C-and-how-does-the-client-distinguish-it-from-a-failure%3F)
- [Is the collection stable enough for offsets, or does traversal need opaque cursors tied to a deterministic order?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Is-the-collection-stable-enough-for-offsets%2C-or-does-traversal-need-opaque-cursors-tied-to-a-deterministic-order%3F)
- [What happens to an active cursor when filters, sort order, permissions, or the underlying dataset change?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/What-happens-to-an-active-cursor-when-filters%2C-sort-order%2C-permissions%2C-or-the-underlying-dataset-change%3F)
- [Can users tolerate skipped or repeated items if records are inserted or deleted between offset-based requests?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Can-users-tolerate-skipped-or-repeated-items-if-records-are-inserted-or-deleted-between-offset-based-requests%3F)
- [Where are authentication renewal, cancellation, retry safety, observability, and error mapping owned across all API styles?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Where-are-authentication-renewal%2C-cancellation%2C-retry-safety%2C-observability%2C-and-error-mapping-owned-across-all-API-styles%3F)

## Best Practices

- [Choose the interaction style from data shape, direction, latency, platform support, and operational constraints](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Choose-the-interaction-style-from-data-shape%2C-direction%2C-latency%2C-platform-support%2C-and-operational-constraints)
- [Keep transport models behind a typed application boundary so UI state does not depend on wire details](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Keep-transport-models-behind-a-typed-application-boundary-so-UI-state-does-not-depend-on-wire-details)
- [Publish explicit contracts for authentication, errors, compatibility, deadlines, cancellation, and observability](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Publish-explicit-contracts-for-authentication%2C-errors%2C-compatibility%2C-deadlines%2C-cancellation%2C-and-observability)
- [Use HTTP methods and status codes consistently, and attach idempotency controls to safely repeatable REST mutations](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Use-HTTP-methods-and-status-codes-consistently%2C-and-attach-idempotency-controls-to-safely-repeatable-REST-mutations)
- [Bound GraphQL query cost and test partial-data, schema-evolution, and normalized-cache behavior](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Bound-GraphQL-query-cost-and-test-partial-data%2C-schema-evolution%2C-and-normalized-cache-behavior)
- [Set gRPC deadlines deliberately and preserve forward-compatible Protocol Buffer field evolution](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Set-gRPC-deadlines-deliberately-and-preserve-forward-compatible-Protocol-Buffer-field-evolution)
- [Treat WebSocket reconnect, resubscription, heartbeat, ordering, backpressure, and deduplication as protocol behavior](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Treat-WebSocket-reconnect%2C-resubscription%2C-heartbeat%2C-ordering%2C-backpressure%2C-and-deduplication-as-protocol-behavior)
- [Use event identifiers and bounded retry delays to make server-sent event reconnection resumable](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Use-event-identifiers-and-bounded-retry-delays-to-make-server-sent-event-reconnection-resumable)
- [Pause or relax polling when application lifecycle and connectivity make fresh data unnecessary](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Pause-or-relax-polling-when-application-lifecycle-and-connectivity-make-fresh-data-unnecessary)
- [Add jitter and server-guided delay to long-poll reconnects so many clients do not synchronize](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Add-jitter-and-server-guided-delay-to-long-poll-reconnects-so-many-clients-do-not-synchronize)
- [Give every paginated query a stable order and define how refresh replaces or reconciles accumulated items](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Give-every-paginated-query-a-stable-order-and-define-how-refresh-replaces-or-reconciles-accumulated-items)
- [Treat cursors as opaque, query-specific tokens and persist them only as long as their contract permits](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Treat-cursors-as-opaque%2C-query-specific-tokens-and-persist-them-only-as-long-as-their-contract-permits)
- [Use offset pagination when its direct-access simplicity outweighs drift and deep-offset costs](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Use-offset-pagination-when-its-direct-access-simplicity-outweighs-drift-and-deep-offset-costs)
- [Test disconnects, partial responses, duplicates, out-of-order delivery, stale pages, and mid-operation cancellation](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/API-Styles/Test-disconnects%2C-partial-responses%2C-duplicates%2C-out-of-order-delivery%2C-stale-pages%2C-and-mid-operation-cancellation)

[< Back to data networking & storage](../README.md)
