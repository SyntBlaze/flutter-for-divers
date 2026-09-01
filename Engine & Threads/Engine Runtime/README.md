# Engine Runtime

The Flutter engine runtime hosts the Dart virtual machine, creates and manages
isolates, connects the framework to the embedder, and coordinates asynchronous
work beneath a running Flutter application. The shell is the engine's central
coordinator: it owns task runners, connects platform-facing services to Dart,
and carries frames and messages across runtime boundaries.

```text
host application -> embedder -> Flutter Engine -> Shell
                                      |             |
                                      v             +-> platform and message loops
                                   Dart VM          +-> rendering and I/O task runners
                                      |
                                      v
                              isolate group
                               |          |
                               v          v
                         root isolate   other isolates
                               |
                               v
                  event loop -> event -> microtask drain
                               |
                               v
                      PlatformDispatcher callbacks
```

The VM may be shared by multiple engine instances in a process, while each
engine has its own shell and root isolate. Isolates do not share ordinary Dart
heap objects; they communicate with messages, although isolates in the same
isolate group can share VM-managed code and other internal resources. Most
application code should rely on framework APIs rather than reach into engine
lifecycle or dispatcher callbacks directly.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime) — Focused, bite-sized article covering Engine Runtime
- [Learning Path](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime) — Step-by-step material that builds practical Engine Runtime knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime) — Structured, in-depth material for learning about Engine Runtime thoroughly

## Runtime Components

| Topic | Primary role | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Flutter Engine | Implements the native runtime beneath the Flutter framework | It integrates Dart execution, rendering, text, accessibility, and platform communication | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/Flutter-Engine "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/Flutter-Engine "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/Flutter-Engine "Deep Dive") |
| Embedder | Adapts the engine to an operating system and host application | It supplies surfaces, input, lifecycle signals, task runners, and platform services | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/Embedder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/Embedder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/Embedder "Deep Dive") |
| Shell | Coordinates the engine's platform, UI, raster, and I/O subsystems | It preserves thread-affinity rules while handing work between task runners | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/Shell "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/Shell "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/Shell "Deep Dive") |
| Dart VM | Executes Dart code and provides runtime services for isolates | Compilation behavior and diagnostics differ across debug, profile, and release modes | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/Dart-VM "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/Dart-VM "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/Dart-VM "Deep Dive") |
| Dart isolate | Provides an independent Dart heap and event-processing context | Mutable Dart objects are not shared directly between isolates | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/Dart-isolate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/Dart-isolate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/Dart-isolate "Deep Dive") |
| Root isolate | Runs the Flutter framework for an engine instance | It owns engine-to-framework hooks unavailable to ordinary background isolates | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/Root-isolate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/Root-isolate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/Root-isolate "Deep Dive") |
| Isolate group | Shares VM-managed code and selected internal resources among related isolates | Group membership does not make ordinary Dart objects concurrently shared | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/Isolate-group "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/Isolate-group "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/Isolate-group "Deep Dive") |
| Event loop | Processes asynchronous events for an isolate one at a time | Long synchronous callbacks delay input, timers, messages, and frame work | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/Event-loop "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/Event-loop "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/Event-loop "Deep Dive") |
| Microtask queue | Runs deferred work before the event loop accepts its next event | Unbounded microtasks can starve timers, messages, and rendering | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/Microtask-queue "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/Microtask-queue "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/Microtask-queue "Deep Dive") |
| Message loop | Drives queued native tasks on an engine thread | Each task runner targets the message loop associated with its thread | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/Message-loop "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/Message-loop "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/Message-loop "Deep Dive") |
| `PlatformDispatcher` | Exposes engine-provided views, frame signals, lifecycle data, and callbacks to Dart | The framework binding normally owns its low-level callbacks | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/PlatformDispatcher "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/PlatformDispatcher "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/PlatformDispatcher "Deep Dive") |
| Engine lifecycle | Covers engine creation, isolate startup, running, shutdown, and teardown | Initialization and destruction must respect resource ownership and thread affinity | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Engine-Runtime/Engine-lifecycle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Engine-Runtime/Engine-lifecycle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Engine-Runtime/Engine-lifecycle "Deep Dive") |

## Questions

- [What responsibilities belong to the Flutter engine rather than the framework?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/What-responsibilities-belong-to-the-Flutter-engine-rather-than-the-framework%3F)
- [How does an embedder connect the engine to its host platform?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/How-does-an-embedder-connect-the-engine-to-its-host-platform%3F)
- [Why does the shell coordinate several task runners?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Why-does-the-shell-coordinate-several-task-runners%3F)
- [How do Dart execution modes change between debug, profile, and release builds?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/How-do-Dart-execution-modes-change-between-debug%2C-profile%2C-and-release-builds%3F)
- [What state is isolated when a Dart isolate is created?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/What-state-is-isolated-when-a-Dart-isolate-is-created%3F)
- [How is the root isolate different from a background isolate?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/How-is-the-root-isolate-different-from-a-background-isolate%3F)
- [What can related isolates share through an isolate group?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/What-can-related-isolates-share-through-an-isolate-group%3F)
- [In what order are events and microtasks processed?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/In-what-order-are-events-and-microtasks-processed%3F)
- [When should work be scheduled as a microtask?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/When-should-work-be-scheduled-as-a-microtask%3F)
- [How does an engine message loop relate to a Dart isolate's event loop?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/How-does-an-engine-message-loop-relate-to-a-Dart-isolate's-event-loop%3F)
- [Which engine callbacks are exposed through `PlatformDispatcher`?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Which-engine-callbacks-are-exposed-through-PlatformDispatcher%3F)
- [What happens between engine creation and the first framework frame?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/What-happens-between-engine-creation-and-the-first-framework-frame%3F)
- [Can two engine instances share one Dart VM?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Can-two-engine-instances-share-one-Dart-VM%3F)
- [Why can CPU-heavy synchronous Dart work delay a frame?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Why-can-CPU-heavy-synchronous-Dart-work-delay-a-frame%3F)
- [How are platform messages delivered to the framework's root isolate?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/How-are-platform-messages-delivered-to-the-framework's-root-isolate%3F)
- [What must be released when an engine instance shuts down?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/What-must-be-released-when-an-engine-instance-shuts-down%3F)

## Best Practices

- [Use framework APIs for routine application behavior](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Use-framework-APIs-for-routine-application-behavior)
- [Keep embedder responsibilities separate from framework policy](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Keep-embedder-responsibilities-separate-from-framework-policy)
- [Respect the shell's task-runner and thread-affinity contracts](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Respect-the-shell's-task-runner-and-thread-affinity-contracts)
- [Measure runtime behavior in the build mode used for the investigation](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Measure-runtime-behavior-in-the-build-mode-used-for-the-investigation)
- [Use isolates for work large enough to justify transfer and startup costs](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Use-isolates-for-work-large-enough-to-justify-transfer-and-startup-costs)
- [Keep root-isolate work responsive to frames and platform messages](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Keep-root-isolate-work-responsive-to-frames-and-platform-messages)
- [Pass explicit, bounded messages between isolates](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Pass-explicit%2C-bounded-messages-between-isolates)
- [Break long synchronous work into appropriate asynchronous or isolated work](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Break-long-synchronous-work-into-appropriate-asynchronous-or-isolated-work)
- [Keep microtasks short and avoid self-perpetuating microtask chains](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Keep-microtasks-short-and-avoid-self-perpetuating-microtask-chains)
- [Post native work to the task runner that owns the target resource](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Post-native-work-to-the-task-runner-that-owns-the-target-resource)
- [Let Flutter's binding stack own low-level `PlatformDispatcher` callbacks](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Let-Flutter's-binding-stack-own-low-level-PlatformDispatcher-callbacks)
- [Make engine startup and shutdown paths idempotent and ownership-aware](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Make-engine-startup-and-shutdown-paths-idempotent-and-ownership-aware)
- [Avoid assuming ordinary Dart objects are shared between isolates](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Avoid-assuming-ordinary-Dart-objects-are-shared-between-isolates)
- [Treat engine callbacks as lifecycle-sensitive integration points](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Treat-engine-callbacks-as-lifecycle-sensitive-integration-points)
- [Profile event-loop stalls before moving work to another isolate](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Profile-event-loop-stalls-before-moving-work-to-another-isolate)
- [Release platform, graphics, and Dart resources in their required order](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Engine-Runtime/Release-platform%2C-graphics%2C-and-Dart-resources-in-their-required-order)

[< Back to engine & threads](../README.md)
