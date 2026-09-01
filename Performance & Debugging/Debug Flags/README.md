# Debug Flags

Flutter's diagnostic flags make otherwise invisible layout, painting, input,
build, and frame-scheduling behavior observable. They are investigation tools:
enable one flag to test a concrete hypothesis, reproduce the problem on a
representative screen, collect evidence, and restore the default before moving
on. Most paint and profiling flags are intended for debug or profile workflows,
not for judging release performance.

```text
symptom
   |
   +--> geometry or alignment --------> `debugPaintSizeEnabled`
   |                                    `debugPaintBaselinesEnabled`
   |
   +--> pointer hit region -----------> `debugPaintPointersEnabled`
   |
   +--> unexpected repainting --------> `debugRepaintRainbowEnabled`
   |                                    `debugProfilePaintsEnabled`
   |
   +--> unexpected rebuilding --------> `debugProfileBuildsEnabled`
   |
   +--> missed frame budget ----------> `showPerformanceOverlay`
   |
   +--> animation hard to inspect ----> `timeDilation`
```

Visual overlays answer different questions from timeline profiling. Debug-paint
flags annotate the rendered scene and help locate a suspicious widget or render
object. Profiling flags add timing events that can be inspected in DevTools.
`showPerformanceOverlay` provides continuous frame-level feedback, while
`timeDilation` slows Flutter's animation clock so transitions are easier to
inspect; it does not simulate a slow CPU or prove that an animation meets its
frame budget.

Several flags are library-level globals, so imports and availability differ.
Rendering diagnostics commonly come from `package:flutter/rendering.dart`,
build profiling is associated with the widgets framework, and `timeDilation`
comes from the scheduler library. Prefer setting diagnostics in a deliberately
debug-only entry point or inside an `assert` callback so they cannot silently
become part of the application's normal configuration.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Debug-Flags) — Focused, bite-sized article covering Debug Flags
- [Learning Path](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Debug-Flags) — Step-by-step material that builds practical Debug Flags knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Debug-Flags) — Structured, in-depth material for learning about Debug Flags thoroughly

## Debug Flag Topics

| Topic | Reveals or changes | Use it to investigate | Key caution | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | --- | :---: | :---: | :---: |
| `debugPaintSizeEnabled` | Paints layout boundaries, padding, alignment guides, and related box geometry | Unexpected size, spacing, constraints, or alignment | The overlay is diagnostic paint, not application UI | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Debug-Flags/debugPaintSizeEnabled "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Debug-Flags/debugPaintSizeEnabled "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Debug-Flags/debugPaintSizeEnabled "Deep Dive") |
| `debugPaintBaselinesEnabled` | Paints text baselines used by render objects | Text or icon rows whose baseline alignment looks wrong | A baseline marker identifies geometry; it does not explain which constraint produced it | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Debug-Flags/debugPaintBaselinesEnabled "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Debug-Flags/debugPaintBaselinesEnabled "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Debug-Flags/debugPaintBaselinesEnabled "Deep Dive") |
| `debugPaintPointersEnabled` | Highlights render boxes involved in pointer hit testing | Tap targets that are missing, oversized, overlapping, or intercepting input | Combine it with hit-test and gesture reasoning; a painted region does not guarantee a gesture wins | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Debug-Flags/debugPaintPointersEnabled "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Debug-Flags/debugPaintPointersEnabled "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Debug-Flags/debugPaintPointersEnabled "Deep Dive") |
| `debugRepaintRainbowEnabled` | Changes diagnostic colors as repainting occurs | Regions that repaint more often or more broadly than expected | Color changes show repaint activity, not repaint cost | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Debug-Flags/debugRepaintRainbowEnabled "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Debug-Flags/debugRepaintRainbowEnabled "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Debug-Flags/debugRepaintRainbowEnabled "Deep Dive") |
| `debugProfileBuildsEnabled` | Emits profiling information for widget build work | Slow builds and unexpectedly frequent rebuilds | Profiling adds overhead; confirm the finding with DevTools and representative profile measurements | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Debug-Flags/debugProfileBuildsEnabled "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Debug-Flags/debugProfileBuildsEnabled "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Debug-Flags/debugProfileBuildsEnabled "Deep Dive") |
| `debugProfilePaintsEnabled` | Emits profiling information for render-object paint work | Expensive or unexpectedly repeated paint operations | Paint timing is only one part of a frame; raster and GPU work may still dominate | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Debug-Flags/debugProfilePaintsEnabled "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Debug-Flags/debugProfilePaintsEnabled "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Debug-Flags/debugProfilePaintsEnabled "Deep Dive") |
| `showPerformanceOverlay` | Displays frame pipeline graphs over the app | Jank, missed frame budgets, and whether work is concentrated in UI or raster processing | Read it in profile mode on representative hardware; debug-mode timings are distorted | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Debug-Flags/showPerformanceOverlay "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Debug-Flags/showPerformanceOverlay "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Debug-Flags/showPerformanceOverlay "Deep Dive") |
| `timeDilation` | Scales Flutter's animation time progression | Fast transitions, gesture-driven animations, and intermediate visual states | Restore it to `1.0`; it is not a performance benchmark or a substitute for frame stepping | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Debug-Flags/timeDilation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Debug-Flags/timeDilation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Debug-Flags/timeDilation "Deep Dive") |

## Questions

- [Which overlay helps explain an unexpected widget size or alignment?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Which-overlay-helps-explain-an-unexpected-widget-size-or-alignment%3F)
- [How can text baseline placement be made visible?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/How-can-text-baseline-placement-be-made-visible%3F)
- [Which render boxes participate in the pointer hit-test region?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Which-render-boxes-participate-in-the-pointer-hit-test-region%3F)
- [Is a region repainting repeatedly, and how broad is each repaint?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Is-a-region-repainting-repeatedly%2C-and-how-broad-is-each-repaint%3F)
- [Which widgets are building frequently or taking significant build time?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Which-widgets-are-building-frequently-or-taking-significant-build-time%3F)
- [Which render objects are spending time in paint?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Which-render-objects-are-spending-time-in-paint%3F)
- [Is frame work exceeding the current display's frame budget?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Is-frame-work-exceeding-the-current-display's-frame-budget%3F)
- [How can an animation be slowed down for visual inspection?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/How-can-an-animation-be-slowed-down-for-visual-inspection%3F)
- [Why is profile mode more trustworthy than debug mode for frame timing?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Why-is-profile-mode-more-trustworthy-than-debug-mode-for-frame-timing%3F)
- [When should a visual diagnostic be paired with a DevTools timeline trace?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/When-should-a-visual-diagnostic-be-paired-with-a-DevTools-timeline-trace%3F)

## Best Practices

- [Enable one diagnostic at a time and start from a reproducible symptom](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Enable-one-diagnostic-at-a-time-and-start-from-a-reproducible-symptom)
- [Keep diagnostic configuration explicitly debug-only](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Keep-diagnostic-configuration-explicitly-debug-only)
- [Use `debugPaintSizeEnabled` to inspect geometry before changing constraints](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Use-debugPaintSizeEnabled-to-inspect-geometry-before-changing-constraints)
- [Check actual baseline guides before compensating with arbitrary padding](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Check-actual-baseline-guides-before-compensating-with-arbitrary-padding)
- [Verify both hit-test coverage and gesture-arena behavior for pointer bugs](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Verify-both-hit-test-coverage-and-gesture-arena-behavior-for-pointer-bugs)
- [Use repaint colors to locate activity, then profile to measure its cost](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Use-repaint-colors-to-locate-activity%2C-then-profile-to-measure-its-cost)
- [Correlate build events with rebuild statistics and application state changes](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Correlate-build-events-with-rebuild-statistics-and-application-state-changes)
- [Correlate paint events with raster timing before choosing a paint optimization](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Correlate-paint-events-with-raster-timing-before-choosing-a-paint-optimization)
- [Measure frame performance in profile mode on representative physical hardware](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Measure-frame-performance-in-profile-mode-on-representative-physical-hardware)
- [Treat `timeDilation` as an inspection aid and restore it to `1.0`](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Treat-timeDilation-as-an-inspection-aid-and-restore-it-to-1.0)
- [Record the device, build mode, refresh rate, route, and interaction used for a trace](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Record-the-device%2C-build-mode%2C-refresh-rate%2C-route%2C-and-interaction-used-for-a-trace)
- [Disable every diagnostic flag after the investigation](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Debug-Flags/Disable-every-diagnostic-flag-after-the-investigation)

[< Back to Performance & Debugging](../README.md)
