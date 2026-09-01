# Async

Flutter's reactive builders turn changing values into widget subtrees. A
`FutureBuilder` represents one eventual result, while a `StreamBuilder`
represents a sequence of asynchronous events. `ValueListenableBuilder` and
`AnimatedBuilder` rebuild from synchronous `Listenable` notifications, and
`NotificationListener` observes notifications that bubble up through the
widget tree. These APIs all trigger rebuilding, but their data models,
lifecycles, and propagation rules differ.

```text
one result       Future       -> FutureBuilder -> AsyncSnapshot
many async values Stream      -> StreamBuilder -> AsyncSnapshot
current value    ValueListenable -> ValueListenableBuilder
change signal    Listenable   -> AnimatedBuilder
bubbling event   Notification -> NotificationListener
```

## Selection Guidance

Use `FutureBuilder` for an operation that completes once and `StreamBuilder`
when values or errors may arrive repeatedly over time. Create or obtain the
future or stream before `build`—for example in `initState`,
`didChangeDependencies`, or `didUpdateWidget`—so an unrelated parent rebuild
does not restart the asynchronous work. Treat each `AsyncSnapshot` as a state
machine: render intentional initial, waiting, data, empty, and error states
rather than assuming data is immediately available.

Choose `ValueListenableBuilder` when the source exposes both a current value
and change notifications. Choose `AnimatedBuilder` when only a general
`Listenable` signal is needed, including an `Animation` or a merged group of
listenables. In both cases, pass invariant content through `child` when the API
offers it. Use `NotificationListener<T>` for descendant notifications that
bubble through the element tree, such as scroll notifications; it is not a
general replacement for application state, callbacks, or asynchronous data
builders.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Async) — Focused, bite-sized article covering Async
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Async) — Step-by-step material that builds practical Async knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Async) — Structured, in-depth material for learning about Async thoroughly

## Async Widgets

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `FutureBuilder` | Builds from the latest interaction with a single `Future` | Obtain the future outside `build` and handle every relevant `AsyncSnapshot` state | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Async/FutureBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Async/FutureBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Async/FutureBuilder "Deep Dive") |
| `StreamBuilder` | Builds from the latest events, errors, and connection state of a `Stream` | Keep stream identity stable and account for repeated values, errors, completion, and source changes | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Async/StreamBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Async/StreamBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Async/StreamBuilder "Deep Dive") |
| `ValueListenableBuilder` | Rebuilds with the current value of a `ValueListenable<T>` | Use its `child` slot for value-independent UI and let the widget manage listener registration | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Async/ValueListenableBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Async/ValueListenableBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Async/ValueListenableBuilder "Deep Dive") |
| `AnimatedBuilder` | Rebuilds selected UI whenever a general `Listenable` notifies | The name is conventional rather than restrictive; isolate invariant content in `child` | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Async/AnimatedBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Async/AnimatedBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Async/AnimatedBuilder "Deep Dive") |
| `NotificationListener` | Observes typed notifications bubbling from descendant widgets | Return `true` only to stop further bubbling, and filter by notification type and depth when necessary | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Async/NotificationListener "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Async/NotificationListener "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Async/NotificationListener "Deep Dive") |

## Questions

- [Where should a `Future` be created so rebuilds do not restart the operation?](https://app.syntblaze.com/qsp/flutter/Widgets/Async/Where-should-a-Future-be-created-so-rebuilds-do-not-restart-the-operation%3F)
- [How should a `StreamBuilder` represent waiting, active, completed, and error states?](https://app.syntblaze.com/qsp/flutter/Widgets/Async/How-should-a-StreamBuilder-represent-waiting%2C-active%2C-completed%2C-and-error-states%3F)
- [When is `ValueListenableBuilder` preferable to manually registering a listener?](https://app.syntblaze.com/qsp/flutter/Widgets/Async/When-is-ValueListenableBuilder-preferable-to-manually-registering-a-listener%3F)
- [Why is `AnimatedBuilder` useful for non-animation `Listenable` objects?](https://app.syntblaze.com/qsp/flutter/Widgets/Async/Why-is-AnimatedBuilder-useful-for-non-animation-Listenable-objects%3F)
- [How do notification type, depth, and the callback's return value affect a `NotificationListener`?](https://app.syntblaze.com/qsp/flutter/Widgets/Async/How-do-notification-type%2C-depth%2C-and-the-callback's-return-value-affect-a-NotificationListener%3F)

## Best Practices

- [Keep a `Future` stable across unrelated builds and render all meaningful snapshot states](https://app.syntblaze.com/qsp/flutter/Widgets/Async/Keep-a-Future-stable-across-unrelated-builds-and-render-all-meaningful-snapshot-states)
- [Subscribe to a stable `Stream` and handle data, errors, and completion explicitly](https://app.syntblaze.com/qsp/flutter/Widgets/Async/Subscribe-to-a-stable-Stream-and-handle-data%2C-errors%2C-and-completion-explicitly)
- [Use `ValueListenableBuilder.child` to avoid rebuilding value-independent subtrees](https://app.syntblaze.com/qsp/flutter/Widgets/Async/Use-ValueListenableBuilder.child-to-avoid-rebuilding-value-independent-subtrees)
- [Scope `AnimatedBuilder` narrowly and hoist invariant widgets into its `child`](https://app.syntblaze.com/qsp/flutter/Widgets/Async/Scope-AnimatedBuilder-narrowly-and-hoist-invariant-widgets-into-its-child)
- [Listen for the narrowest notification type and stop propagation only intentionally](https://app.syntblaze.com/qsp/flutter/Widgets/Async/Listen-for-the-narrowest-notification-type-and-stop-propagation-only-intentionally)
- [Cancel or dispose resources you own even when a builder manages its own subscription](https://app.syntblaze.com/qsp/flutter/Widgets/Async/Cancel-or-dispose-resources-you-own-even-when-a-builder-manages-its-own-subscription)

[< Back to widgets](../README.md)
