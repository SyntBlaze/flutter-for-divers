# Performance Concepts

Rendering performance is the ability to produce each frame before the display's
next refresh deadline. Flutter splits that work between the UI side, which
builds, lays out, and paints a layer tree, and the raster side, which turns that
tree into pixels. A smooth application keeps both sides within the budget of
the device it is actually running on.

```text
Display refresh interval
        |
        +--> UI work: build -> layout -> paint --------+
        |                                               +--> presented frame
        +--> Raster work: layers -> GPU commands -------+

60 Hz: about 16.67 ms per frame
120 Hz: about  8.33 ms per frame
Missed deadline: delayed or dropped frame -> visible jank
```

Frame averages can hide isolated stalls, so investigate individual slow frames
in a profile build. Start with the DevTools frame chart to decide whether the
UI or raster side missed its deadline, then enable narrower diagnostics only
long enough to find the source. Profiling flags add overhead and their timings
should not be treated as release-performance measurements.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts) — Focused, bite-sized article covering Performance Concepts
- [Learning Path](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts) — Step-by-step material that builds practical Performance Concepts knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts) — Structured, in-depth material for learning about Performance Concepts thoroughly

## Performance Concepts Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| 16 ms frame budget at 60 Hz | Allows roughly one display interval to produce each 60 Hz frame | Both UI and raster work must keep pace with the display; the precise interval is about 16.67 ms, not a fixed allowance independent of refresh rate | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/16-ms-frame-budget-at-60-Hz "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/16-ms-frame-budget-at-60-Hz "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/16-ms-frame-budget-at-60-Hz "Deep Dive") |
| 8 ms frame budget at 120 Hz | Halves the available work time on high-refresh 120 Hz displays | The precise interval is about 8.33 ms, so code that meets a 60 Hz deadline can still jank on a faster display | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/8-ms-frame-budget-at-120-Hz "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/8-ms-frame-budget-at-120-Hz "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/8-ms-frame-budget-at-120-Hz "Deep Dive") |
| Jank | Occurs when frame work misses a display deadline and motion stutters | Inspect slow individual frames and percentile behavior because an acceptable average can hide visible deadline misses | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/Jank "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/Jank "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/Jank "Deep Dive") |
| Build cost | Measures time spent rebuilding and reconciling widget subtrees | Reduce the scope and frequency of rebuilds shown to be expensive instead of treating every rebuild as a performance bug | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/Build-cost "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/Build-cost "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/Build-cost "Deep Dive") |
| Layout thrashing | Repeats avoidable layout work through cascading invalidations or intrinsic passes | Look for changing constraints, repeated intrinsic measurement, and invalidations that propagate farther than the actual geometry change requires | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/Layout-thrashing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/Layout-thrashing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/Layout-thrashing "Deep Dive") |
| Overdraw | Draws pixels multiple times in one frame, wasting raster and GPU work | Remove obscured drawing and unnecessary overlapping effects only after raster profiling shows that they materially affect the target device | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/Overdraw "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/Overdraw "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/Overdraw "Deep Dive") |
| Expensive `saveLayer()` | Allocates and composites an offscreen buffer for an effect | Offscreen rendering adds memory bandwidth and compositing work; use it only when the required blend, filter, clip, or group-opacity result cannot be produced more directly | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/Expensive-saveLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/Expensive-saveLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/Expensive-saveLayer "Deep Dive") |
| Shader warm-up | Pre-renders representative operations on supported backends to move shader compilation out of animation | Treat warm-up as backend-specific startup work and verify it addresses measured first-use stalls without introducing excessive startup cost | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/Shader-warm-up "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/Shader-warm-up "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/Shader-warm-up "Deep Dive") |
| Image cache | Retains decoded images within a bounded memory budget for reuse | Decode near the displayed dimensions and balance cache limits against memory pressure, decode churn, and the application's reuse pattern | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/Image-cache "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/Image-cache "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/Image-cache "Deep Dive") |
| Raster cache misses | Force stable pictures to be rasterized again instead of reused from cache | Frequently changing content, transforms, or cache-unfriendly pictures may prevent reuse; cache admission remains an engine heuristic rather than an application guarantee | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/Raster-cache-misses "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/Raster-cache-misses "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/Raster-cache-misses "Deep Dive") |
| DevTools frame chart | Separates UI-thread and raster-thread frame timing in a trace | Profile representative interactions in profile mode and use the slower side of each missed frame to narrow the investigation | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/DevTools-frame-chart "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/DevTools-frame-chart "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/DevTools-frame-chart "Deep Dive") |
| `PerformanceOverlay` | Displays live UI and raster timing bars over the application | Use it for a quick signal about which side exceeds the frame interval, then switch to a trace for attribution | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/PerformanceOverlay "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/PerformanceOverlay "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/PerformanceOverlay "Deep Dive") |
| `debugProfileBuildsEnabled` | Records per-widget build timing for profiling diagnostics | Enable detailed build events only while isolating a problem because trace volume and instrumentation overhead can distort timings | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/debugProfileBuildsEnabled "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/debugProfileBuildsEnabled "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/debugProfileBuildsEnabled "Deep Dive") |
| `debugProfilePaintsEnabled` | Records per-render-object paint timing for profiling diagnostics | Enable detailed paint events temporarily and corroborate them with frame-level evidence before changing paint boundaries or drawing code | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Performance-Concepts/debugProfilePaintsEnabled "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Performance-Concepts/debugProfilePaintsEnabled "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Performance-Concepts/debugProfilePaintsEnabled "Deep Dive") |

## Questions

- [Why is the frame budget about 16 ms on a 60 Hz display?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Why-is-the-frame-budget-about-16-ms-on-a-60-Hz-display%3F)
- [Why does a 120 Hz display reduce the budget to about 8 ms?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Why-does-a-120-Hz-display-reduce-the-budget-to-about-8-ms%3F)
- [How can one slow frame cause visible jank?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/How-can-one-slow-frame-cause-visible-jank%3F)
- [How can the DevTools frame chart distinguish UI work from raster work?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/How-can-the-DevTools-frame-chart-distinguish-UI-work-from-raster-work%3F)
- [Which rebuilds contribute most to build cost?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Which-rebuilds-contribute-most-to-build-cost%3F)
- [What causes a render object to be laid out more than necessary?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/What-causes-a-render-object-to-be-laid-out-more-than-necessary%3F)
- [How can overlapping paint create overdraw?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/How-can-overlapping-paint-create-overdraw%3F)
- [Why can `saveLayer` make rasterization expensive?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Why-can-saveLayer-make-rasterization-expensive%3F)
- [How should decoded image size and cache limits be balanced against memory?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/How-should-decoded-image-size-and-cache-limits-be-balanced-against-memory%3F)
- [Why might content fail to benefit from the raster cache?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Why-might-content-fail-to-benefit-from-the-raster-cache%3F)

## Best Practices

- [Use the actual display refresh interval as the frame deadline.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Use-the-actual-display-refresh-interval-as-the-frame-deadline.)
- [Optimize missed deadlines and outliers, not only average frame time.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Optimize-missed-deadlines-and-outliers%2C-not-only-average-frame-time.)
- [Profile in profile mode instead of drawing conclusions from debug builds.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Profile-in-profile-mode-instead-of-drawing-conclusions-from-debug-builds.)
- [Use the frame chart to separate UI-side work from raster-side work.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Use-the-frame-chart-to-separate-UI-side-work-from-raster-side-work.)
- [Keep rebuild scope as small as the changing state requires.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Keep-rebuild-scope-as-small-as-the-changing-state-requires.)
- [Avoid repeated intrinsic measurement and unnecessary relayout.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Avoid-repeated-intrinsic-measurement-and-unnecessary-relayout.)
- [Avoid `saveLayer` unless the visual effect requires an offscreen buffer.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Avoid-saveLayer-unless-the-visual-effect-requires-an-offscreen-buffer.)
- [Decode images close to their displayed dimensions.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Decode-images-close-to-their-displayed-dimensions.)
- [Enable detailed build and paint tracing only while investigating.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Enable-detailed-build-and-paint-tracing-only-while-investigating.)
- [Reproduce performance problems on representative devices and workloads.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Performance-Concepts/Reproduce-performance-problems-on-representative-devices-and-workloads.)

[< Back to Rendering Pipeline](../README.md)
