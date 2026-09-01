# Frame Scheduling & Binding

Frame scheduling and binding connect the Flutter engine's vertical-sync signals
to framework work. The binding stack initializes shared framework services,
requests frames when visual state changes, and runs animation, build, layout,
paint, compositing, semantics, and post-frame work in the correct order.

```text
engine / display vsync
        |
        v
PlatformDispatcher.onBeginFrame -> SchedulerBinding.handleBeginFrame
        |                              |
        |                              +-> transient callbacks / animation ticks
        v
PlatformDispatcher.onDrawFrame  -> SchedulerBinding.handleDrawFrame
                                       |
                                       +-> persistent callbacks -> drawFrame
                                       |      -> build -> layout -> paint
                                       |      -> compositing -> semantics
                                       |
                                       +-> post-frame callbacks
```

Flutter's standard `WidgetsFlutterBinding` combines the scheduler, services,
painting, semantics, rendering, gestures, and widgets bindings. Most application
code should use the public scheduling APIs rather than install engine callbacks
or invoke lifecycle handlers directly.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding) — Focused, bite-sized article covering Frame Scheduling & Binding
- [Learning Path](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding) — Step-by-step material that builds practical Frame Scheduling & Binding knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding) — Structured, in-depth material for learning about Frame Scheduling & Binding thoroughly

## Frame Scheduling & Binding Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `SchedulerBinding` | Coordinates frame requests, callback phases, priorities, and timing | Let the binding own the scheduler lifecycle; application code should register callbacks through its public APIs | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/SchedulerBinding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/SchedulerBinding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/SchedulerBinding "Deep Dive") |
| `WidgetsBinding` | Connects widget lifecycle and build ownership to the application binding | Its `drawFrame` performs widget finalization around the rendering work inherited from `RendererBinding` | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/WidgetsBinding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/WidgetsBinding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/WidgetsBinding "Deep Dive") |
| `RendererBinding` | Owns the render pipeline and flushes layout, paint, compositing, and semantics | Rendering phases run in order, so invalidation and expensive work in an early phase affect the rest of the frame | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/RendererBinding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/RendererBinding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/RendererBinding "Deep Dive") |
| `ServicesBinding` | Provides platform-message, lifecycle, and binary-messenger services | Ensure the binding is initialized before startup code accesses platform channels or other binding-backed services | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/ServicesBinding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/ServicesBinding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/ServicesBinding "Deep Dive") |
| `PaintingBinding` | Provides shared painting services such as image caching and decoding | Shared caches improve reuse but still require deliberate memory and image-resolution choices | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PaintingBinding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PaintingBinding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PaintingBinding "Deep Dive") |
| `GestureBinding` | Routes pointer data into hit testing and gesture processing | Input handlers may invalidate visual state, but that work is rendered only after a frame is scheduled | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/GestureBinding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/GestureBinding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/GestureBinding "Deep Dive") |
| `SemanticsBinding` | Coordinates semantics enablement and accessibility actions | Semantics work should remain available when accessibility clients request it, even if visual output is unchanged | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/SemanticsBinding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/SemanticsBinding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/SemanticsBinding "Deep Dive") |
| `PlatformDispatcher` | Exposes engine callbacks, platform state, displays, and views | Treat it as the engine boundary; avoid replacing callbacks that the framework binding owns | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PlatformDispatcher "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PlatformDispatcher "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PlatformDispatcher "Deep Dive") |
| `FlutterView` | Represents one render target with its metrics and scene submission endpoint | In multi-view applications, use the metrics and render target belonging to the intended view | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/FlutterView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/FlutterView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/FlutterView "Deep Dive") |
| `scheduleFrame()` | Asks the engine to schedule the next frame | Repeated requests are coalesced while a frame is already scheduled, and the work begins on a future engine callback | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/scheduleFrame-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/scheduleFrame-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/scheduleFrame-method "Deep Dive") |
| `handleBeginFrame()` | Processes the frame timestamp and transient animation callbacks | Transient callbacks share the frame timestamp and run before persistent rendering callbacks | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/handleBeginFrame-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/handleBeginFrame-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/handleBeginFrame-method "Deep Dive") |
| `handleDrawFrame()` | Runs persistent frame work and then post-frame callbacks | Persistent callbacks produce the frame; post-frame callbacks run only after that work completes | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/handleDrawFrame-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/handleDrawFrame-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/handleDrawFrame-method "Deep Dive") |
| `addPostFrameCallback()` | Runs a one-shot callback after the current frame has been drawn | It does not request a frame, and a callback registered after post-frame processing begins waits for the next frame | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/addPostFrameCallback-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/addPostFrameCallback-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/addPostFrameCallback-method "Deep Dive") |
| `scheduleWarmUpFrame()` | Produces an immediate synthetic frame to initialize visual state | Reserve warm-up frames for deliberate initialization work rather than routine animation or rendering | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/scheduleWarmUpFrame-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/scheduleWarmUpFrame-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/scheduleWarmUpFrame-method "Deep Dive") |
| `deferFirstFrame()` | Prevents completed frames from being sent until startup work finishes | Keep deferral bounded and pair every deferral with a reliable release path | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/deferFirstFrame-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/deferFirstFrame-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/deferFirstFrame-method "Deep Dive") |
| `allowFirstFrame()` | Releases deferred frame submission and permits the first frame | Call it only after the corresponding startup condition is satisfied; nested deferrals must all be released | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/allowFirstFrame-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/allowFirstFrame-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/allowFirstFrame-method "Deep Dive") |
| `PlatformDispatcher.instance.onBeginFrame` | Receives the engine callback that begins a scheduled frame | `SchedulerBinding` installs this callback and uses it to enter the transient-callback phase | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PlatformDispatcher.instance.onBeginFrame "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PlatformDispatcher.instance.onBeginFrame "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PlatformDispatcher.instance.onBeginFrame "Deep Dive") |
| `PlatformDispatcher.instance.onDrawFrame` | Receives the engine callback that performs the frame drawing phase | `SchedulerBinding` installs this callback and uses it to run persistent and post-frame work | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PlatformDispatcher.instance.onDrawFrame "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PlatformDispatcher.instance.onDrawFrame "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/PlatformDispatcher.instance.onDrawFrame "Deep Dive") |

## Questions

- [What responsibilities does `SchedulerBinding` have during a frame?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/What-responsibilities-does-SchedulerBinding-have-during-a-frame%3F)
- [How does `WidgetsBinding.drawFrame` connect widget work to rendering?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/How-does-WidgetsBinding.drawFrame-connect-widget-work-to-rendering%3F)
- [What rendering state and callbacks does `RendererBinding` own?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/What-rendering-state-and-callbacks-does-RendererBinding-own%3F)
- [Why must platform services wait for binding initialization?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Why-must-platform-services-wait-for-binding-initialization%3F)
- [How can a pointer event result in another frame being scheduled?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/How-can-a-pointer-event-result-in-another-frame-being-scheduled%3F)
- [How do `PlatformDispatcher` and the binding stack relate?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/How-do-PlatformDispatcher-and-the-binding-stack-relate%3F)
- [When does `scheduleFrame()` actually cause frame work to run?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/When-does-scheduleFrame()-actually-cause-frame-work-to-run%3F)
- [Which callbacks run during `handleBeginFrame()` and `handleDrawFrame()`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Which-callbacks-run-during-handleBeginFrame()-and-handleDrawFrame()%3F)
- [Does `addPostFrameCallback()` request a new frame?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Does-addPostFrameCallback()-request-a-new-frame%3F)
- [When is a warm-up frame useful?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/When-is-a-warm-up-frame-useful%3F)
- [How should `deferFirstFrame()` and `allowFirstFrame()` be balanced?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/How-should-deferFirstFrame()-and-allowFirstFrame()-be-balanced%3F)
- [Who should own `PlatformDispatcher.instance.onBeginFrame`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Who-should-own-PlatformDispatcher.instance.onBeginFrame%3F)

## Best Practices

- [Let the framework binding own the engine's frame callbacks.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Let-the-framework-binding-own-the-engine's-frame-callbacks.)
- [Request a frame only when new visual work is ready.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Request-a-frame-only-when-new-visual-work-is-ready.)
- [Use animation tickers instead of timers for frame-synchronized animation.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Use-animation-tickers-instead-of-timers-for-frame-synchronized-animation.)
- [Keep transient frame callbacks short enough to preserve rendering time.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Keep-transient-frame-callbacks-short-enough-to-preserve-rendering-time.)
- [Avoid invoking frame lifecycle handlers directly.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Avoid-invoking-frame-lifecycle-handlers-directly.)
- [Use post-frame callbacks for one-time work that requires completed layout.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Use-post-frame-callbacks-for-one-time-work-that-requires-completed-layout.)
- [Avoid creating self-perpetuating post-frame callback loops.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Avoid-creating-self-perpetuating-post-frame-callback-loops.)
- [Initialize the binding before using platform-dependent services during startup.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Initialize-the-binding-before-using-platform-dependent-services-during-startup.)
- [Use warm-up frames only for deliberate startup behavior.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Use-warm-up-frames-only-for-deliberate-startup-behavior.)
- [Keep first-frame deferral short and provide a reliable release path.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Frame-Scheduling-and-Binding/Keep-first-frame-deferral-short-and-provide-a-reliable-release-path.)

[< Back to Rendering Pipeline](../README.md)
