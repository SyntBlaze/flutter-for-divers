# Performance Targets

Performance targets turn a vague goal such as "make the app feel fast" into
observable limits for rendering, startup, memory, and distribution size. A
useful target names the user journey, device class, build mode, refresh rate,
measurement method, and acceptable percentile so that the same scenario can be
measured repeatedly and regressions can be detected before release.

```text
input / animation
       |
       v
build -> layout -> paint ---- UI-thread portion of the frame
                              |
                              v
                         layer tree
                              |
                              v
                    raster work -> GPU work -> display
                         |              |          |
                         +------ shared frame budget ------+

launch -> first frame -> usable state       memory over time
   |           |             |                    |
   +------ startup targets ---+              steady / peak / leak

release artifact --------------------------------------> app-size target
```

At 60 Hz the display presents a new frame about every 16.67 ms; at 120 Hz the
interval is about 8.33 ms. These are end-to-end deadlines, not separate budgets
that every pipeline stage may consume in full. Build, layout, and paint execute
on the UI side of Flutter's rendering pipeline, while rasterization and GPU work
must also finish in time for presentation. Pipelining can overlap work, but a
slow stage still creates missed frames, queued work, or uneven frame pacing.

Targets should describe distributions rather than a single best run. Track
typical and tail behavior, separate warm from cold conditions, and record
device temperature, power mode, content volume, and network state when they can
change the result. Measure rendering on representative physical devices in
profile or release mode; debug-mode assertions, service extensions, and JIT
overhead distort production performance.

Startup, memory, and app size need equally precise definitions. Startup may end
at first frame, first meaningful content, or readiness for interaction. Memory
may refer to Dart heap, native allocations, graphics resources, or total process
footprint. App size may mean download, installed, or per-architecture size.
Choose the definition that matches the user impact and retain it with every
reported value.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets) — Focused, bite-sized article covering Performance Targets
- [Learning Path](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets) — Step-by-step material that builds practical Performance Targets knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets) — Structured, in-depth material for learning about Performance Targets thoroughly

## Performance Target Topics

| Topic | Target | Key considerations | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Frame budget | Bound the total work needed to produce and present each frame | Derive the deadline from the active refresh rate, measure frame pacing and tail percentiles, and investigate UI and raster overruns separately | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets/Frame-budget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets/Frame-budget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets/Frame-budget "Deep Dive") |
| 60 Hz rendering | Deliver smooth motion on displays refreshing 60 times per second | Treat approximately 16.67 ms as the presentation interval and leave headroom for scheduling variance and platform work | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets/60-Hz-rendering "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets/60-Hz-rendering "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets/60-Hz-rendering "Deep Dive") |
| 120 Hz rendering | Sustain smooth motion on high-refresh-rate displays | Treat approximately 8.33 ms as the presentation interval, test on hardware that actually runs at 120 Hz, and account for dynamic refresh-rate changes | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets/120-Hz-rendering "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets/120-Hz-rendering "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets/120-Hz-rendering "Deep Dive") |
| Build time | Limit widget build work performed for a frame | Measure representative interactions, distinguish necessary from broad rebuilds, and evaluate both duration and frequency | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets/Build-time "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets/Build-time "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets/Build-time "Deep Dive") |
| Layout time | Limit constraint propagation and geometry calculation | Test realistic tree depth and list sizes, and look for repeated layout passes or intrinsically measured subtrees | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets/Layout-time "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets/Layout-time "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets/Layout-time "Deep Dive") |
| Paint time | Limit recording of drawing commands and layer changes | Measure complex visual states and distinguish UI-side paint recording from later rasterization | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets/Paint-time "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets/Paint-time "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets/Paint-time "Deep Dive") |
| Raster time | Limit conversion of the layer tree into pixels | Profile representative scenes in profile or release mode and correlate spikes with images, clips, effects, shaders, and cache behavior | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets/Raster-time "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets/Raster-time "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets/Raster-time "Deep Dive") |
| GPU time | Keep submitted graphics work within the presentation deadline | Use device-supported GPU measurements, account for resolution and thermal throttling, and distinguish CPU submission stalls from GPU execution | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets/GPU-time "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets/GPU-time "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets/GPU-time "Deep Dive") |
| Startup time | Bound the delay from launch to a meaningful, usable state | Define cold, warm, and resumed launches separately and mark first frame, meaningful content, and interaction readiness explicitly | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets/Startup-time "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets/Startup-time "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets/Startup-time "Deep Dive") |
| Memory footprint | Bound steady-state and peak memory while detecting unbounded growth | Include Dart, native, image, and graphics allocations as appropriate; test long sessions and memory pressure on lower-memory devices | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets/Memory-footprint "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets/Memory-footprint "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets/Memory-footprint "Deep Dive") |
| App size | Bound download and installed cost for each target artifact | Compare like-for-like release builds, architectures, assets, symbols, and store processing rather than relying on an unqualified file size | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Performance-Targets/App-size "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Performance-Targets/App-size "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Performance-Targets/App-size "Deep Dive") |

## Questions

- [How should a frame budget be derived from the display refresh rate?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/How-should-a-frame-budget-be-derived-from-the-display-refresh-rate%3F)
- [Why is 16.67 ms not a safe per-stage allowance for 60 Hz rendering?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Why-is-16.67-ms-not-a-safe-per-stage-allowance-for-60-Hz-rendering%3F)
- [What changes when the presentation interval falls to about 8.33 ms at 120 Hz?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/What-changes-when-the-presentation-interval-falls-to-about-8.33-ms-at-120-Hz%3F)
- [How can build duration and rebuild frequency be measured independently?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/How-can-build-duration-and-rebuild-frequency-be-measured-independently%3F)
- [Which traces reveal repeated or unexpectedly expensive layout work?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Which-traces-reveal-repeated-or-unexpectedly-expensive-layout-work%3F)
- [How is paint recording time different from raster time?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/How-is-paint-recording-time-different-from-raster-time%3F)
- [When does a raster-thread spike cause a missed frame?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/When-does-a-raster-thread-spike-cause-a-missed-frame%3F)
- [How can GPU execution time be separated from CPU-side rendering work?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/How-can-GPU-execution-time-be-separated-from-CPU-side-rendering-work%3F)
- [Should startup end at first frame, meaningful content, or readiness for input?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Should-startup-end-at-first-frame%2C-meaningful-content%2C-or-readiness-for-input%3F)
- [Which memory number represents the user-visible risk: heap, resident set, graphics memory, peak use, or growth over time?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Which-memory-number-represents-the-user-visible-risk%3A-heap%2C-resident-set%2C-graphics-memory%2C-peak-use%2C-or-growth-over-time%3F)
- [Should app-size targets cover download size, installed size, or both?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Should-app-size-targets-cover-download-size%2C-installed-size%2C-or-both%3F)
- [Which devices, journeys, content volumes, and percentiles should define a release gate?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Which-devices%2C-journeys%2C-content-volumes%2C-and-percentiles-should-define-a-release-gate%3F)
- [How much headroom should remain for operating-system work, thermal variation, and future features?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/How-much-headroom-should-remain-for-operating-system-work%2C-thermal-variation%2C-and-future-features%3F)
- [How should performance baselines and intentional budget changes be reviewed?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/How-should-performance-baselines-and-intentional-budget-changes-be-reviewed%3F)

## Best Practices

- [Define frame deadlines from the refresh rates the product supports](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Define-frame-deadlines-from-the-refresh-rates-the-product-supports)
- [Report frame-time distributions and missed-frame counts, not only averages](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Report-frame-time-distributions-and-missed-frame-counts%2C-not-only-averages)
- [Leave scheduling headroom beneath the nominal 60 Hz interval](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Leave-scheduling-headroom-beneath-the-nominal-60-Hz-interval)
- [Verify 120 Hz behavior on representative high-refresh-rate hardware](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Verify-120-Hz-behavior-on-representative-high-refresh-rate-hardware)
- [Measure widget build duration and rebuild frequency for named interactions](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Measure-widget-build-duration-and-rebuild-frequency-for-named-interactions)
- [Exercise layout targets with production-like tree depth, text, and collection sizes](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Exercise-layout-targets-with-production-like-tree-depth%2C-text%2C-and-collection-sizes)
- [Separate paint recording regressions from rasterization regressions](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Separate-paint-recording-regressions-from-rasterization-regressions)
- [Correlate raster spikes with the exact visual state and timeline events that produced them](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Correlate-raster-spikes-with-the-exact-visual-state-and-timeline-events-that-produced-them)
- [Measure GPU work at realistic resolution and under controlled thermal conditions](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Measure-GPU-work-at-realistic-resolution-and-under-controlled-thermal-conditions)
- [Define and track cold, warm, and resumed startup scenarios independently](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Define-and-track-cold%2C-warm%2C-and-resumed-startup-scenarios-independently)
- [Track steady state, peak use, and post-interaction retention during long-running memory tests](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Track-steady-state%2C-peak-use%2C-and-post-interaction-retention-during-long-running-memory-tests)
- [Compare reproducible release artifacts with the same target, architecture, symbols, and store assumptions](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Compare-reproducible-release-artifacts-with-the-same-target%2C-architecture%2C-symbols%2C-and-store-assumptions)
- [Profile on representative physical devices in profile or release mode](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Profile-on-representative-physical-devices-in-profile-or-release-mode)
- [Record build revision, device, operating system, refresh rate, scenario, content, and measurement method with every result](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Record-build-revision%2C-device%2C-operating-system%2C-refresh-rate%2C-scenario%2C-content%2C-and-measurement-method-with-every-result)
- [Use percentile-based budgets and repeat enough runs to expose variance](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Use-percentile-based-budgets-and-repeat-enough-runs-to-expose-variance)
- [Establish per-device-class baselines and fail continuous checks on meaningful regressions](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Establish-per-device-class-baselines-and-fail-continuous-checks-on-meaningful-regressions)
- [Review target changes as product tradeoffs with explicit user impact](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Performance-Targets/Review-target-changes-as-product-tradeoffs-with-explicit-user-impact)

[< Back to Performance & Debugging](../README.md)
