# Thread Model

Flutter's engine uses task runners to keep platform integration, Dart and
framework work, rasterization, and asynchronous resource work from blocking
one another. These are logical execution roles: an embedder may assign them to
separate operating-system threads or allow compatible runners to share a
thread. The exact topology can therefore vary by platform and engine
configuration, but each task still has an owner and an affinity boundary.

```text
platform event loop
       |
       +-> platform task runner -> input, lifecycle, platform messages
       |              |
       |              +-> vsync signal
       |                       |
       |                       v
       +----------------> UI task runner -> Dart / framework frame work
                                      |       build a layer tree
                                      v
                                raster task runner -> GPU submission

I/O task runner / workers -> loading and resource preparation
background isolates      -> independent Dart work and message passing
```

The root isolate normally performs framework work through the UI task runner,
while additional isolates process messages independently and communicate by
sending data. Code should reason about ownership and asynchronous handoffs
rather than assume that every named role is always one permanently dedicated
OS thread.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Thread-Model) — Focused, bite-sized article covering Thread Model
- [Learning Path](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Thread-Model) — Step-by-step material that builds practical Thread Model knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Thread-Model) — Structured, in-depth material for learning about Thread Model thoroughly

## Execution Roles and Handoffs

| Topic | Primary responsibility | Boundary or constraint | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Platform thread | Runs the embedder's platform event loop and platform-facing engine work | Many host UI APIs and plugins require the platform's main thread | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Thread-Model/Platform-thread "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Thread-Model/Platform-thread "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Thread-Model/Platform-thread "Deep Dive") |
| UI thread | Runs the root Dart isolate and framework work that produces a frame | Long synchronous Dart, build, layout, or paint work delays frame production | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Thread-Model/UI-thread "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Thread-Model/UI-thread "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Thread-Model/UI-thread "Deep Dive") |
| Raster thread | Consumes submitted layer or display-list work and drives rasterization | Expensive drawing, uploads, and GPU synchronization can miss the presentation deadline | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Thread-Model/Raster-thread "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Thread-Model/Raster-thread "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Thread-Model/Raster-thread "Deep Dive") |
| I/O thread | Coordinates asynchronous resource and engine I/O work | Resource work must hand results to the runner that owns the consuming object or graphics context | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Thread-Model/I-O-thread "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Thread-Model/I-O-thread "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Thread-Model/I-O-thread "Deep Dive") |
| Thread affinity | Restricts an object, callback, or API to its owning runner or OS thread | Crossing the boundary requires posting work instead of direct access | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Thread-Model/Thread-affinity "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Thread-Model/Thread-affinity "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Thread-Model/Thread-affinity "Deep Dive") |
| Task runners | Schedule engine tasks for the platform, UI, raster, and I/O roles | Runners describe execution roles even when some share an underlying thread | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Thread-Model/Task-runners "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Thread-Model/Task-runners "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Thread-Model/Task-runners "Deep Dive") |
| Frame scheduling handoff | Passes a frame request and vsync timing to UI work, then rendering work to the raster side | Each stage must preserve ordering without synchronously blocking the next owner | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Thread-Model/Frame-scheduling-handoff "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Thread-Model/Frame-scheduling-handoff "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Thread-Model/Frame-scheduling-handoff "Deep Dive") |
| Vsync delivery | Supplies display-timed frame opportunities from the embedder to the engine scheduler | A vsync callback starts an opportunity to produce a frame; it is not the frame itself | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Thread-Model/Vsync-delivery "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Thread-Model/Vsync-delivery "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Thread-Model/Vsync-delivery "Deep Dive") |
| Platform message dispatch | Transfers binary messages and replies between host code and Dart handlers | Handler affinity, serialization, and asynchronous replies must be respected | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Thread-Model/Platform-message-dispatch "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Thread-Model/Platform-message-dispatch "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Thread-Model/Platform-message-dispatch "Deep Dive") |
| Background isolate work | Runs CPU-bound or independent Dart work outside the root isolate's event loop | Isolates do not share mutable Dart state and cannot directly manipulate the widget tree | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Thread-Model/Background-isolate-work "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Thread-Model/Background-isolate-work "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Thread-Model/Background-isolate-work "Deep Dive") |

## Questions

- [What work belongs to Flutter's platform thread?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/What-work-belongs-to-Flutter's-platform-thread%3F)
- [Why does synchronous Dart work on the UI thread cause jank?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Why-does-synchronous-Dart-work-on-the-UI-thread-cause-jank%3F)
- [How does the raster thread turn framework output into pixels?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/How-does-the-raster-thread-turn-framework-output-into-pixels%3F)
- [What work is coordinated by the engine's I/O thread?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/What-work-is-coordinated-by-the-engine's-I%2FO-thread%3F)
- [Which Flutter and host objects have thread affinity?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Which-Flutter-and-host-objects-have-thread-affinity%3F)
- [Are platform, UI, raster, and I/O task runners always separate OS threads?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Are-platform%2C-UI%2C-raster%2C-and-I%2FO-task-runners-always-separate-OS-threads%3F)
- [How does a scheduled frame move from the platform side to UI work and rasterization?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/How-does-a-scheduled-frame-move-from-the-platform-side-to-UI-work-and-rasterization%3F)
- [How does a display vsync reach Flutter's frame scheduler?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/How-does-a-display-vsync-reach-Flutter's-frame-scheduler%3F)
- [On which side do platform-channel handlers and replies run?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/On-which-side-do-platform-channel-handlers-and-replies-run%3F)
- [When should work move to a background isolate?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/When-should-work-move-to-a-background-isolate%3F)
- [Can a Dart isolate move between OS threads while still executing only one event at a time?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Can-a-Dart-isolate-move-between-OS-threads-while-still-executing-only-one-event-at-a-time%3F)
- [Why can the UI and raster stages overlap across different frames?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Why-can-the-UI-and-raster-stages-overlap-across-different-frames%3F)
- [What happens when a platform message handler performs blocking work?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/What-happens-when-a-platform-message-handler-performs-blocking-work%3F)
- [How can a background isolate communicate with the root isolate?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/How-can-a-background-isolate-communicate-with-the-root-isolate%3F)

## Best Practices

- [Treat task runners as ownership boundaries, even when they share an OS thread](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Treat-task-runners-as-ownership-boundaries%2C-even-when-they-share-an-OS-thread)
- [Keep platform callbacks short and return control to the host event loop](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Keep-platform-callbacks-short-and-return-control-to-the-host-event-loop)
- [Keep synchronous UI-isolate work within the device's frame budget](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Keep-synchronous-UI-isolate-work-within-the-device's-frame-budget)
- [Use traces to distinguish UI-thread stalls from raster-thread stalls](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Use-traces-to-distinguish-UI-thread-stalls-from-raster-thread-stalls)
- [Move blocking file and resource work away from frame-critical runners](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Move-blocking-file-and-resource-work-away-from-frame-critical-runners)
- [Post work to the owning runner instead of accessing thread-affine state directly](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Post-work-to-the-owning-runner-instead-of-accessing-thread-affine-state-directly)
- [Preserve asynchronous handoffs between frame stages](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Preserve-asynchronous-handoffs-between-frame-stages)
- [Use Flutter's scheduler rather than synthesizing application frame timing from timers](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Use-Flutter's-scheduler-rather-than-synthesizing-application-frame-timing-from-timers)
- [Make platform-message handlers asynchronous when native work may block](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Make-platform-message-handlers-asynchronous-when-native-work-may-block)
- [Keep channel payloads small and avoid repeated large serialization](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Keep-channel-payloads-small-and-avoid-repeated-large-serialization)
- [Use background isolates for measured CPU bottlenecks, not every asynchronous operation](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Use-background-isolates-for-measured-CPU-bottlenecks%2C-not-every-asynchronous-operation)
- [Send immutable or transferable data across isolate boundaries](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Send-immutable-or-transferable-data-across-isolate-boundaries)
- [Do not access widgets, render objects, or root-isolate state from a background isolate](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Do-not-access-widgets%2C-render-objects%2C-or-root-isolate-state-from-a-background-isolate)
- [Profile on representative devices before changing concurrency or scheduling](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Thread-Model/Profile-on-representative-devices-before-changing-concurrency-or-scheduling)

[< Back to engine & threads](../README.md)
