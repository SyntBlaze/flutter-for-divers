# Animation Phase

Flutter advances framework animations during the transient-callback portion of
each scheduled frame. The scheduler supplies one frame timestamp, and every
active, unmuted `Ticker` uses that shared time reference to report elapsed time
to its callback. An `AnimationController` converts the elapsed time into a
bounded value over a duration or asks a `Simulation` for time-based motion,
then notifies its value and status listeners.

```text
display vsync -> shared frame timestamp -> transient frame callbacks
                                                |
                                                v
                                    active, unmuted Ticker
                                                |
                                                v
                                     AnimationController
                                      /               \
                           duration-driven          Simulation
                                      \               /
                                       v             v
                                    value and status listeners
                                                |
                                                v
                           may mark build / layout / paint dirty
                                                |
                                                v
                                persistent rendering work
```

A ticker keeps animation progress aligned with frames instead of approximating
display timing with a periodic timer. `TickerProvider` objects create tickers;
the `State` mixins also follow the nearest `TickerMode`, allowing inactive
widget subtrees to silence their tickers. A muted ticker does not issue
callbacks or request frames, but elapsed time is not reset, so an animation can
reflect the time that passed when ticking resumes.

Animation listeners commonly trigger rebuilds or render-object invalidation.
That resulting work runs later in the same frame during the persistent build,
layout, and paint pipeline, so expensive listeners reduce the time available to
finish the frame. Controllers and any manually created tickers must be disposed
with the lifecycle that owns them.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Animation-Phase) — Focused, bite-sized article covering Animation Phase
- [Learning Path](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Animation-Phase) — Step-by-step material that builds practical Animation Phase knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Animation-Phase) — Structured, in-depth material for learning about Animation Phase thoroughly

## Animation Phase Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Ticker` | Invokes a callback once per animation frame while active and not muted | Its elapsed duration is time since the ticker started, not a count of delivered callbacks | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Animation-Phase/Ticker "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Animation-Phase/Ticker "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Animation-Phase/Ticker "Deep Dive") |
| `TickerProvider` | Creates tickers for consumers such as animation controllers | Use a provider with the consumer's lifecycle, and let the consumer dispose each created ticker | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Animation-Phase/TickerProvider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Animation-Phase/TickerProvider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Animation-Phase/TickerProvider "Deep Dive") |
| `SingleTickerProviderStateMixin` | Supplies one widget-aware ticker from a `State` object | Use it only when the State creates a single ticker over its lifetime | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Animation-Phase/SingleTickerProviderStateMixin "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Animation-Phase/SingleTickerProviderStateMixin "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Animation-Phase/SingleTickerProviderStateMixin "Deep Dive") |
| `TickerProviderStateMixin` | Supplies multiple widget-aware tickers from one `State` object | Prefer it when several controllers or tickers can coexist or be created over the State's lifetime | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Animation-Phase/TickerProviderStateMixin "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Animation-Phase/TickerProviderStateMixin "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Animation-Phase/TickerProviderStateMixin "Deep Dive") |
| `AnimationController` | Drives an animation value over time and reports direction and status | Dispose it with its owner, and avoid listener work that consumes the frame budget | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Animation-Phase/AnimationController "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Animation-Phase/AnimationController "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Animation-Phase/AnimationController "Deep Dive") |
| `Simulation` | Computes position, velocity, and completion from elapsed time | Use `animateWith` or `animateBackWith` when motion follows physics rather than a fixed duration | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Animation-Phase/Simulation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Animation-Phase/Simulation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Animation-Phase/Simulation "Deep Dive") |
| `AnimationStatus` | Describes whether an animation is dismissed, moving forward, reversing, or completed | Status changes describe controller direction and endpoints; they are separate from value notifications | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Animation-Phase/AnimationStatus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Animation-Phase/AnimationStatus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Animation-Phase/AnimationStatus "Deep Dive") |
| `TickerMode` | Enables or silences widget-aware tickers in a subtree | Muting suppresses ticks but does not reset the ticker's elapsed time or controller state | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Animation-Phase/TickerMode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Animation-Phase/TickerMode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Animation-Phase/TickerMode "Deep Dive") |
| Vsync | Supplies a `TickerProvider` so a controller advances from scheduled frame callbacks | It aligns updates with rendering and lets inactive subtrees stop scheduling needless animation frames | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Animation-Phase/Vsync "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Animation-Phase/Vsync "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Animation-Phase/Vsync "Deep Dive") |
| Frame timestamp | Provides the shared monotonic time reference for callbacks in one frame | Derive animation progress from scheduler time instead of callback counts or wall-clock timestamps | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Animation-Phase/Frame-timestamp "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Animation-Phase/Frame-timestamp "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Animation-Phase/Frame-timestamp "Deep Dive") |

## Questions

- [When during a Flutter frame do animation tickers run?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/When-during-a-Flutter-frame-do-animation-tickers-run%3F)
- [How does a `Ticker` differ from a periodic timer?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/How-does-a-Ticker-differ-from-a-periodic-timer%3F)
- [What elapsed duration does a ticker pass to its callback?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/What-elapsed-duration-does-a-ticker-pass-to-its-callback%3F)
- [Why do animation callbacks in the same frame receive a shared timestamp?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Why-do-animation-callbacks-in-the-same-frame-receive-a-shared-timestamp%3F)
- [What lifecycle responsibilities does a `TickerProvider` establish?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/What-lifecycle-responsibilities-does-a-TickerProvider-establish%3F)
- [When should a `State` use `SingleTickerProviderStateMixin`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/When-should-a-State-use-SingleTickerProviderStateMixin%3F)
- [When is `TickerProviderStateMixin` required instead?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/When-is-TickerProviderStateMixin-required-instead%3F)
- [How does an `AnimationController` convert elapsed time into a value?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/How-does-an-AnimationController-convert-elapsed-time-into-a-value%3F)
- [When should a controller use a `Simulation` rather than a duration?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/When-should-a-controller-use-a-Simulation-rather-than-a-duration%3F)
- [What do the four `AnimationStatus` values mean?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/What-do-the-four-AnimationStatus-values-mean%3F)
- [How are status listeners different from value listeners?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/How-are-status-listeners-different-from-value-listeners%3F)
- [What happens to an active animation when its subtree disables `TickerMode`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/What-happens-to-an-active-animation-when-its-subtree-disables-TickerMode%3F)
- [Why can an animation appear to jump forward after its ticker is unmuted?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Why-can-an-animation-appear-to-jump-forward-after-its-ticker-is-unmuted%3F)
- [How can animation listeners cause build, layout, or paint work in the same frame?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/How-can-animation-listeners-cause-build%2C-layout%2C-or-paint-work-in-the-same-frame%3F)
- [What happens when an `AnimationController` is not disposed by its owner?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/What-happens-when-an-AnimationController-is-not-disposed-by-its-owner%3F)

## Best Practices

- [Use tickers and animation controllers instead of periodic timers for frame-synchronized motion](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Use-tickers-and-animation-controllers-instead-of-periodic-timers-for-frame-synchronized-motion)
- [Create controllers with a `TickerProvider` whose lifecycle matches their owner](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Create-controllers-with-a-TickerProvider-whose-lifecycle-matches-their-owner)
- [Use `SingleTickerProviderStateMixin` only for a `State` that creates one ticker](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Use-SingleTickerProviderStateMixin-only-for-a-State-that-creates-one-ticker)
- [Use `TickerProviderStateMixin` when a `State` owns multiple or replacement tickers](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Use-TickerProviderStateMixin-when-a-State-owns-multiple-or-replacement-tickers)
- [Dispose every animation controller and manually created ticker with its owner](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Dispose-every-animation-controller-and-manually-created-ticker-with-its-owner)
- [Keep ticker callbacks and animation listeners short enough to preserve the frame budget](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Keep-ticker-callbacks-and-animation-listeners-short-enough-to-preserve-the-frame-budget)
- [Build animation progress from the supplied elapsed time rather than counting frames](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Build-animation-progress-from-the-supplied-elapsed-time-rather-than-counting-frames)
- [Use simulations for physics-based motion and duration-driven controllers for fixed timelines](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Use-simulations-for-physics-based-motion-and-duration-driven-controllers-for-fixed-timelines)
- [Use status listeners for endpoint and direction transitions rather than duplicating value checks](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Use-status-listeners-for-endpoint-and-direction-transitions-rather-than-duplicating-value-checks)
- [Allow `TickerMode` to silence animations in inactive widget subtrees](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Allow-TickerMode-to-silence-animations-in-inactive-widget-subtrees)
- [Do not treat ticker muting as a pause that freezes elapsed time](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Do-not-treat-ticker-muting-as-a-pause-that-freezes-elapsed-time)
- [Avoid starting animations that cannot produce a visible or meaningful change](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Avoid-starting-animations-that-cannot-produce-a-visible-or-meaningful-change)
- [Profile rebuild, layout, and paint work triggered on every animation tick](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Profile-rebuild%2C-layout%2C-and-paint-work-triggered-on-every-animation-tick)
- [Keep animation ownership explicit so starting, stopping, and disposal remain predictable](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Animation-Phase/Keep-animation-ownership-explicit-so-starting%2C-stopping%2C-and-disposal-remain-predictable)

[< Back to Rendering Pipeline](../README.md)
