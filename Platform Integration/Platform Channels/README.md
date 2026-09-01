# Platform Channels

Flutter platform channels carry asynchronous messages between Dart code and
host-platform code through a `BinaryMessenger`. Higher-level channel classes
define call, event, or message patterns, while codecs translate supported Dart
values into the binary payloads that the messenger transports.

```text
Dart code                                      host-platform code
    |                                                   ^
    v                                                   |
MethodChannel / EventChannel / BasicMessageChannel      |
    |                                                   |
    v                                                   |
StandardMethodCodec / message codec <-> matching codec  |
    |                                                   |
    +----------> BinaryMessenger -> engine/embedder ----+
                              reply / events <----------+

Pigeon: typed schema -> generated Dart and host APIs -> channels
```

Channel names, codecs, payload schemas, and error envelopes form a shared
protocol. Both sides must agree on that protocol and account for asynchronous
completion, engine and plugin lifecycles, thread affinity, handler replacement,
and calls made when no implementation is registered.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Channels) — Focused, bite-sized article covering Platform Channels
- [Learning Path](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Channels) — Step-by-step material that builds practical Platform Channels knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Channels) — Structured, in-depth material for learning about Platform Channels thoroughly

## Channel APIs and Codecs

| Topic | Primary responsibility | Boundary or constraint | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `MethodChannel` | Models named method calls with one asynchronous result per invocation | Both sides must agree on channel name, codec, method names, argument shapes, and error behavior | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Channels/MethodChannel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Channels/MethodChannel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Channels/MethodChannel "Deep Dive") |
| `EventChannel` | Exposes a platform event source as a Dart stream | Listen and cancel control messages, stream lifetime, repeated subscriptions, and event errors require coordinated handling | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Channels/EventChannel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Channels/EventChannel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Channels/EventChannel "Deep Dive") |
| `BasicMessageChannel` | Exchanges arbitrary messages with an optional asynchronous reply | The selected message codec determines supported values and how `null` is represented | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Channels/BasicMessageChannel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Channels/BasicMessageChannel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Channels/BasicMessageChannel "Deep Dive") |
| `BinaryMessenger` | Routes raw binary messages, handlers, and replies between Dart and the platform side | Handler registration, ordering, isolate availability, lifecycle, and reply completion define the transport contract | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Channels/BinaryMessenger "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Channels/BinaryMessenger "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Channels/BinaryMessenger "Deep Dive") |
| `StandardMessageCodec` | Encodes common scalar, collection, and typed-data values in Flutter's standard binary format | Only supported value types cross the boundary, and custom objects need explicit representation | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Channels/StandardMessageCodec "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Channels/StandardMessageCodec "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Channels/StandardMessageCodec "Deep Dive") |
| `StandardMethodCodec` | Encodes method calls plus success and error envelopes using the standard message format | Envelope shape distinguishes success from platform failure, while a missing handler remains a separate outcome | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Channels/StandardMethodCodec "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Channels/StandardMethodCodec "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Channels/StandardMethodCodec "Deep Dive") |
| `JSONMessageCodec` | Encodes JSON-compatible messages as UTF-8 JSON | Values must remain JSON-compatible, and numeric or collection semantics may differ from the standard binary codec | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Channels/JSONMessageCodec "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Channels/JSONMessageCodec "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Channels/JSONMessageCodec "Deep Dive") |
| Pigeon | Generates type-safe Dart and host-platform messaging APIs from a shared schema | Generated code and schema versions must stay synchronized across every implementation | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Channels/Pigeon "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Channels/Pigeon "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Channels/Pigeon "Deep Dive") |
| Platform exceptions | Represent native failures, missing implementations, and protocol errors on the Dart side | Error codes, messages, details, cancellation, and absence should be mapped deliberately | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Channels/Platform-exceptions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Channels/Platform-exceptions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Channels/Platform-exceptions "Deep Dive") |
| Channel threading | Defines where handlers execute and how work moves between platform and background task queues | UI APIs remain thread-affine, blocking work must leave critical threads, and replies must return safely | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Platform-Channels/Channel-threading "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Platform-Channels/Channel-threading "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Platform-Channels/Channel-threading "Deep Dive") |

## Questions

- [When should an integration use `MethodChannel`?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/When-should-an-integration-use-MethodChannel%3F)
- [How does an `EventChannel` turn native callbacks into a Dart stream?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/How-does-an-EventChannel-turn-native-callbacks-into-a-Dart-stream%3F)
- [When is `BasicMessageChannel` a better fit than method calls?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/When-is-BasicMessageChannel-a-better-fit-than-method-calls%3F)
- [What does `BinaryMessenger` do beneath the channel APIs?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/What-does-BinaryMessenger-do-beneath-the-channel-APIs%3F)
- [Which Dart values can `StandardMessageCodec` encode?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Which-Dart-values-can-StandardMessageCodec-encode%3F)
- [How does `StandardMethodCodec` represent calls, results, and errors?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/How-does-StandardMethodCodec-represent-calls%2C-results%2C-and-errors%3F)
- [When is `JSONMessageCodec` appropriate, and what types does it preserve?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/When-is-JSONMessageCodec-appropriate%2C-and-what-types-does-it-preserve%3F)
- [How does Pigeon replace stringly typed channel contracts with generated APIs?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/How-does-Pigeon-replace-stringly-typed-channel-contracts-with-generated-APIs%3F)
- [What is the difference between a platform error and a missing plugin implementation?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/What-is-the-difference-between-a-platform-error-and-a-missing-plugin-implementation%3F)
- [On which thread or task queue does a channel handler run?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/On-which-thread-or-task-queue-does-a-channel-handler-run%3F)
- [Do platform-channel calls share objects or memory across the boundary?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Do-platform-channel-calls-share-objects-or-memory-across-the-boundary%3F)
- [How should channel protocols evolve without breaking older app or plugin versions?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/How-should-channel-protocols-evolve-without-breaking-older-app-or-plugin-versions%3F)
- [Can a background isolate send platform messages?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Can-a-background-isolate-send-platform-messages%3F)
- [What should happen to an outstanding call when an engine or plugin detaches?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/What-should-happen-to-an-outstanding-call-when-an-engine-or-plugin-detaches%3F)

## Best Practices

- [Use stable, uniquely scoped channel names](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Use-stable%2C-uniquely-scoped-channel-names)
- [Version method names and payload schemas deliberately](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Version-method-names-and-payload-schemas-deliberately)
- [Choose the narrowest channel pattern that matches calls, streams, or peer messages](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Choose-the-narrowest-channel-pattern-that-matches-calls%2C-streams%2C-or-peer-messages)
- [Keep codecs identical on both sides of a channel](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Keep-codecs-identical-on-both-sides-of-a-channel)
- [Represent payloads with small, explicit, backwards-compatible value shapes](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Represent-payloads-with-small%2C-explicit%2C-backwards-compatible-value-shapes)
- [Use Pigeon when a typed generated contract reduces protocol drift](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Use-Pigeon-when-a-typed-generated-contract-reduces-protocol-drift)
- [Regenerate and commit all Pigeon outputs after changing a schema](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Regenerate-and-commit-all-Pigeon-outputs-after-changing-a-schema)
- [Map expected native failures to stable error codes and useful details](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Map-expected-native-failures-to-stable-error-codes-and-useful-details)
- [Handle unavailable implementations, cancellation, and engine detachment explicitly](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Handle-unavailable-implementations%2C-cancellation%2C-and-engine-detachment-explicitly)
- [Complete each method or message reply exactly once](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Complete-each-method-or-message-reply-exactly-once)
- [Stop native event producers when an `EventChannel` subscription is cancelled](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Stop-native-event-producers-when-an-EventChannel-subscription-is-cancelled)
- [Keep handlers short and move blocking work off platform and frame-critical threads](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Keep-handlers-short-and-move-blocking-work-off-platform-and-frame-critical-threads)
- [Return to the required thread before touching thread-affine platform APIs](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Return-to-the-required-thread-before-touching-thread-affine-platform-APIs)
- [Exercise channel contracts in integration tests on every supported platform](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Platform-Channels/Exercise-channel-contracts-in-integration-tests-on-every-supported-platform)

[< Back to platform integration](../README.md)
