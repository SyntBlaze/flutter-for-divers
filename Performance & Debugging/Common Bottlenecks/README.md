# Common Bottlenecks

Flutter performance bottlenecks occur when application, framework, engine, or
platform work exceeds the time or memory available for a user interaction.
The visible symptom may be a missed frame, delayed response, slow startup, or
growing memory use, but the cause can sit in a different phase of the workload.
Profile a repeatable scenario before changing code, and follow evidence from
the symptom to the responsible thread, isolate, render phase, or platform call.

```text
user action
    |
    +--> synchronous Dart work ----> JSON parsing / file I/O
    |
    +--> build --------------------> excessive rebuild scope
    |
    +--> layout -------------------> unbounded lists / layout thrashing
    |
    +--> paint and raster ---------> images / shaders / custom painting
    |
    +--> platform channel ---------> native queue, work, and response latency
                  |
                  v
        delayed response or missed frame
```

Begin by identifying the affected interval in a profile build on representative
hardware. For rendering problems, inspect individual slow frames and separate
UI-thread work from raster-thread and GPU work. For delayed operations, add
bounded timeline events around parsing, I/O, and platform calls, then correlate
them with CPU samples and frame timings. A coincident expensive event is only a
lead; reproduce it and verify that changing the suspected cause improves the
same measurement.

Optimization should preserve correctness and avoid merely shifting cost. Moving
work off the UI isolate can protect frame delivery, but serialization and
message transfer still cost time. Lazy list construction reduces initial work,
but item lifecycle and caching still need bounds. Image downsampling lowers
decode memory and upload cost, while shader preparation and simpler painting
can reduce first-use or per-frame raster stalls. Measure startup, steady-state,
and interaction performance separately because an improvement in one phase can
regress another.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Common-Bottlenecks) — Focused, bite-sized article covering Common Bottlenecks
- [Learning Path](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Common-Bottlenecks) — Step-by-step material that builds practical Common Bottlenecks knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Common-Bottlenecks) — Structured, in-depth material for learning about Common Bottlenecks thoroughly

## Common Bottleneck Topics

| Topic | Typical symptom | Investigation direction | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Large synchronous JSON parsing | Input, animation, or navigation stalls while a large response is decoded and transformed | Profile parsing and model construction on the UI isolate; reduce payload or work, stream where appropriate, or move sufficiently large CPU-bound work to an isolate | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Common-Bottlenecks/Large-synchronous-JSON-parsing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Common-Bottlenecks/Large-synchronous-JSON-parsing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Common-Bottlenecks/Large-synchronous-JSON-parsing "Deep Dive") |
| Synchronous file I/O | Frames or interactions pause while storage operations complete | Find blocking reads, writes, metadata queries, and follow-up parsing; use asynchronous APIs and keep work outside frame-critical paths | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Common-Bottlenecks/Synchronous-file-I-O "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Common-Bottlenecks/Synchronous-file-I-O "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Common-Bottlenecks/Synchronous-file-I-O "Deep Dive") |
| Unbounded list rendering | Initial rendering, scrolling, layout, and memory costs grow with collection size | Check for eager child creation, nested non-lazy collections, and `shrinkWrap`; use builder-based lists or slivers with bounded caching | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Common-Bottlenecks/Unbounded-list-rendering "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Common-Bottlenecks/Unbounded-list-rendering "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Common-Bottlenecks/Unbounded-list-rendering "Deep Dive") |
| Excessive rebuild scope | A small state change causes broad or frequent widget construction | Use rebuild statistics and build profiling to locate listeners or inherited dependencies above unaffected subtrees | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Common-Bottlenecks/Excessive-rebuild-scope "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Common-Bottlenecks/Excessive-rebuild-scope "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Common-Bottlenecks/Excessive-rebuild-scope "Deep Dive") |
| Heavy image decoding | Navigation or scrolling stutters and memory spikes as images appear | Compare source and decoded dimensions with physical display size, inspect decode timing and cache churn, and request appropriately sized images | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Common-Bottlenecks/Heavy-image-decoding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Common-Bottlenecks/Heavy-image-decoding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Common-Bottlenecks/Heavy-image-decoding "Deep Dive") |
| Shader compilation jank | The first occurrence of an effect or transition produces a raster-time spike | Reproduce on the actual rendering backend and hardware, correlate first-use frames with shader or pipeline work, and validate targeted warm-up or simpler effects | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Common-Bottlenecks/Shader-compilation-jank "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Common-Bottlenecks/Shader-compilation-jank "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Common-Bottlenecks/Shader-compilation-jank "Deep Dive") |
| Expensive custom painting | Frames with custom visuals show high paint or raster duration | Profile the painter, inspect repaint frequency and drawing operations, implement correct repaint invalidation, and isolate stable expensive regions when beneficial | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Common-Bottlenecks/Expensive-custom-painting "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Common-Bottlenecks/Expensive-custom-painting "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Common-Bottlenecks/Expensive-custom-painting "Deep Dive") |
| Layout thrashing | Layout repeats within a frame or geometry changes continually across frames | Trace relayout causes, intrinsic passes, changing constraints, and measurement-driven state updates; make geometry and invalidation boundaries stable | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Common-Bottlenecks/Layout-thrashing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Common-Bottlenecks/Layout-thrashing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Common-Bottlenecks/Layout-thrashing "Deep Dive") |
| Platform channel latency | A Dart request waits unpredictably for native processing or a response | Instrument both sides of the channel and separate queueing, encoding, thread hops, native work, and reply transfer | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Common-Bottlenecks/Platform-channel-latency "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Common-Bottlenecks/Platform-channel-latency "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Common-Bottlenecks/Platform-channel-latency "Deep Dive") |

## Questions

- [How much UI-isolate time is spent decoding JSON and constructing application models?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/How-much-UI-isolate-time-is-spent-decoding-JSON-and-constructing-application-models%3F)
- [Which file operations block a frame-critical or startup-critical execution path?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Which-file-operations-block-a-frame-critical-or-startup-critical-execution-path%3F)
- [Are off-screen collection items being built, laid out, painted, or retained unnecessarily?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Are-off-screen-collection-items-being-built%2C-laid-out%2C-painted%2C-or-retained-unnecessarily%3F)
- [Which state notification marks widgets dirty even though their rendered inputs did not change?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Which-state-notification-marks-widgets-dirty-even-though-their-rendered-inputs-did-not-change%3F)
- [How large is each decoded image relative to its rendered physical-pixel dimensions?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/How-large-is-each-decoded-image-relative-to-its-rendered-physical-pixel-dimensions%3F)
- [Does the raster spike occur only on first use, and which renderer, backend, and device produced it?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Does-the-raster-spike-occur-only-on-first-use%2C-and-which-renderer%2C-backend%2C-and-device-produced-it%3F)
- [Is custom-painting cost caused by repaint frequency, display-list recording, or raster complexity?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Is-custom-painting-cost-caused-by-repaint-frequency%2C-display-list-recording%2C-or-raster-complexity%3F)
- [What invalidation causes the same subtree to be laid out repeatedly?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/What-invalidation-causes-the-same-subtree-to-be-laid-out-repeatedly%3F)
- [How is platform-channel latency divided among Dart encoding, queueing, native work, and reply handling?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/How-is-platform-channel-latency-divided-among-Dart-encoding%2C-queueing%2C-native-work%2C-and-reply-handling%3F)
- [Is the symptom repeatable in profile mode after warm-up on representative physical hardware?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Is-the-symptom-repeatable-in-profile-mode-after-warm-up-on-representative-physical-hardware%3F)
- [Does the proposed optimization remove work, defer it, move it to another thread, or trade time for memory?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Does-the-proposed-optimization-remove-work%2C-defer-it%2C-move-it-to-another-thread%2C-or-trade-time-for-memory%3F)
- [Which before-and-after trace proves that the change improves the user-visible scenario?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Which-before-and-after-trace-proves-that-the-change-improves-the-user-visible-scenario%3F)

## Best Practices

- [Capture a narrow profile trace of a repeatable user interaction before optimizing](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Capture-a-narrow-profile-trace-of-a-repeatable-user-interaction-before-optimizing)
- [Inspect slow frames individually and distinguish UI, raster, GPU, and asynchronous latency](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Inspect-slow-frames-individually-and-distinguish-UI%2C-raster%2C-GPU%2C-and-asynchronous-latency)
- [Move large CPU-bound parsing off the UI isolate only after measuring computation and transfer costs](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Move-large-CPU-bound-parsing-off-the-UI-isolate-only-after-measuring-computation-and-transfer-costs)
- [Use asynchronous file APIs and keep parsing or transformation out of frame-critical callbacks](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Use-asynchronous-file-APIs-and-keep-parsing-or-transformation-out-of-frame-critical-callbacks)
- [Render large collections lazily with builder constructors or slivers](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Render-large-collections-lazily-with-builder-constructors-or-slivers)
- [Place state listeners and inherited dependencies immediately above the widgets that consume them](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Place-state-listeners-and-inherited-dependencies-immediately-above-the-widgets-that-consume-them)
- [Decode images near their required physical-pixel dimensions and keep caches bounded](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Decode-images-near-their-required-physical-pixel-dimensions-and-keep-caches-bounded)
- [Validate first-use shader mitigation on every supported renderer and representative device class](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Validate-first-use-shader-mitigation-on-every-supported-renderer-and-representative-device-class)
- [Keep custom painters deterministic, make `shouldRepaint` accurate, and avoid repainting stable content](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Keep-custom-painters-deterministic%2C-make-shouldRepaint-accurate%2C-and-avoid-repainting-stable-content)
- [Prefer stable constraints and one-way layout decisions over measurement-driven relayout loops](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Prefer-stable-constraints-and-one-way-layout-decisions-over-measurement-driven-relayout-loops)
- [Batch or redesign chatty platform-channel exchanges when measurement shows per-call overhead is material](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Batch-or-redesign-chatty-platform-channel-exchanges-when-measurement-shows-per-call-overhead-is-material)
- [Control device temperature, data volume, cache state, and build mode when comparing traces](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Control-device-temperature%2C-data-volume%2C-cache-state%2C-and-build-mode-when-comparing-traces)
- [Change one suspected cause at a time and rerun the same scenario](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Change-one-suspected-cause-at-a-time-and-rerun-the-same-scenario)
- [Check startup, memory, responsiveness, and correctness for regressions after moving or caching work](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Common-Bottlenecks/Check-startup%2C-memory%2C-responsiveness%2C-and-correctness-for-regressions-after-moving-or-caching-work)

[< Back to Performance & Debugging](../README.md)
