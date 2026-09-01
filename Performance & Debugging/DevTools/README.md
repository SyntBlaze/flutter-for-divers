# DevTools

Flutter DevTools is a suite of diagnostics that connects to a running Dart and
Flutter application through the VM service. Its views expose different parts of
the same performance story: widget and render trees, frame timings, CPU samples,
allocations, network traffic, logs, and release artifact composition. Use the
view that matches the symptom, then correlate evidence across views before
changing code.

```text
representative build on representative hardware
                      |
                      v
              Flutter VM service
                      |
       +--------------+----------------+
       |              |                |
       v              v                v
 inspector       performance        CPU profiler
 widget tree     frame chart        sampled stacks
 rebuilds        timeline events    method costs
       |              |                |
       +--------------+----------------+
                      |
       +--------------+----------------+
       |              |                |
       v              v                v
    memory          network          logging
 allocations       requests         correlated events

 release artifact ----> app size tool
```

Choose the build mode deliberately. Debug mode is useful for structural
inspection, diagnostics, and rebuild investigation, but its assertions and
development runtime distort performance. Profile mode is the default for
frame, CPU, memory, and startup investigations because it preserves profiling
support while behaving more like release. Validate important conclusions in a
release build where the required observability remains available, and always
use representative physical hardware for claims about user-visible speed.

A useful session begins with a reproducible interaction and a narrow question.
Record a trace around that interaction, identify the slow frame or interval,
and inspect the UI and raster workloads separately. Correlate expensive
timeline spans with CPU stacks, rebuild activity, allocations, requests, and
logs. A single chart is evidence, not a diagnosis: warm-up, debug overhead,
device temperature, background work, and nonrepresentative data can all produce
misleading results.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/DevTools) — Focused, bite-sized article covering DevTools
- [Learning Path](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/DevTools) — Step-by-step material that builds practical DevTools knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/DevTools) — Structured, in-depth material for learning about DevTools thoroughly

## DevTools Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Flutter Inspector | Explore widget, element, and render-object structure and select UI from the running application | Use it to understand ownership, constraints, dependencies, and rebuild scope without treating a deep tree alone as proof of a bottleneck | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/DevTools/Flutter-Inspector "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/DevTools/Flutter-Inspector "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/DevTools/Flutter-Inspector "Deep Dive") |
| Performance view | Record and analyze frame rendering and application timeline activity | Profile a repeatable interaction on representative hardware and separate work on the UI thread from raster work | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/DevTools/Performance-view "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/DevTools/Performance-view "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/DevTools/Performance-view "Deep Dive") |
| CPU profiler | Sample Dart call stacks and attribute execution time to methods and callers | Capture only the relevant interval, distinguish self time from total time, and confirm sampled hotspots with repeated measurements | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/DevTools/CPU-profiler "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/DevTools/CPU-profiler "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/DevTools/CPU-profiler "Deep Dive") |
| Memory view | Observe heap usage, garbage collection, allocations, and retaining paths | Compare snapshots after repeatable lifecycle checkpoints; rising memory is not a leak unless objects remain reachable unexpectedly | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/DevTools/Memory-view "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/DevTools/Memory-view "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/DevTools/Memory-view "Deep Dive") |
| Network view | Inspect supported HTTP, HTTPS, and WebSocket activity initiated by the Dart application | Correlate request timing and payload size with user actions while redacting credentials and sensitive payload data | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/DevTools/Network-view "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/DevTools/Network-view "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/DevTools/Network-view "Deep Dive") |
| Logging view | Search and correlate framework, application, garbage-collection, and runtime log events | Emit structured, low-noise context and use timestamps or correlation identifiers to connect logs with traces and requests | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/DevTools/Logging-view "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/DevTools/Logging-view "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/DevTools/Logging-view "Deep Dive") |
| App size tool | Explore how packages, libraries, code, and assets contribute to a compiled artifact | Analyze comparable release builds for the same target and configuration; compressed download size and installed size answer different questions | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/DevTools/App-size-tool "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/DevTools/App-size-tool "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/DevTools/App-size-tool "Deep Dive") |
| Timeline events | Inspect timestamped work across framework, Dart, engine, and application instrumentation | Add bounded custom events around meaningful operations and avoid tracing so much detail that instrumentation changes the workload | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/DevTools/Timeline-events "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/DevTools/Timeline-events "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/DevTools/Timeline-events "Deep Dive") |
| Frame chart | Compare per-frame UI and raster durations against the device frame budget | Select individual over-budget frames and investigate the responsible phase rather than optimizing averages alone | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/DevTools/Frame-chart "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/DevTools/Frame-chart "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/DevTools/Frame-chart "Deep Dive") |
| Rebuild stats | Identify widgets that rebuild and how often they rebuild during an interaction | Treat counts as a lead: frequent cheap rebuilds can be harmless, while a smaller expensive subtree may be the real problem | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/DevTools/Rebuild-stats "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/DevTools/Rebuild-stats "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/DevTools/Rebuild-stats "Deep Dive") |

## Questions

- [Which tree relationship, constraint, or dependency explains the UI behavior under investigation?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Which-tree-relationship%2C-constraint%2C-or-dependency-explains-the-UI-behavior-under-investigation%3F)
- [Is a missed frame dominated by UI-thread work, raster-thread work, or activity outside the frame pipeline?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Is-a-missed-frame-dominated-by-UI-thread-work%2C-raster-thread-work%2C-or-activity-outside-the-frame-pipeline%3F)
- [Which sampled call stack accounts for the expensive interval, and is the cost in the method itself or its callees?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Which-sampled-call-stack-accounts-for-the-expensive-interval%2C-and-is-the-cost-in-the-method-itself-or-its-callees%3F)
- [Which objects survive the lifecycle point where they should have become unreachable?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Which-objects-survive-the-lifecycle-point-where-they-should-have-become-unreachable%3F)
- [Is perceived latency caused by connection setup, server wait time, transfer size, parsing, or work after the response?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Is-perceived-latency-caused-by-connection-setup%2C-server-wait-time%2C-transfer-size%2C-parsing%2C-or-work-after-the-response%3F)
- [Which stable identifiers can correlate an application log with a frame, request, isolate, or user action?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Which-stable-identifiers-can-correlate-an-application-log-with-a-frame%2C-request%2C-isolate%2C-or-user-action%3F)
- [Which code or asset change explains the size difference between two comparable release artifacts?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Which-code-or-asset-change-explains-the-size-difference-between-two-comparable-release-artifacts%3F)
- [Where should custom timeline events begin and end to represent one meaningful unit of work?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Where-should-custom-timeline-events-begin-and-end-to-represent-one-meaningful-unit-of-work%3F)
- [Which individual frames exceed the current display's budget, and on which thread?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Which-individual-frames-exceed-the-current-display's-budget%2C-and-on-which-thread%3F)
- [Does the highlighted rebuild scope include widgets whose inputs did not change?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Does-the-highlighted-rebuild-scope-include-widgets-whose-inputs-did-not-change%3F)
- [Which build mode and device state make this measurement both observable and representative?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Which-build-mode-and-device-state-make-this-measurement-both-observable-and-representative%3F)
- [Can the suspected bottleneck be reproduced consistently after warm-up and across multiple recordings?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Can-the-suspected-bottleneck-be-reproduced-consistently-after-warm-up-and-across-multiple-recordings%3F)

## Best Practices

- [Start with a specific, reproducible user interaction and record only the interval needed to explain it](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Start-with-a-specific%2C-reproducible-user-interaction-and-record-only-the-interval-needed-to-explain-it)
- [Use debug mode for structural diagnostics and profile mode for representative performance investigation](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Use-debug-mode-for-structural-diagnostics-and-profile-mode-for-representative-performance-investigation)
- [Measure on physical devices that represent the slow and high-refresh-rate ends of the supported range](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Measure-on-physical-devices-that-represent-the-slow-and-high-refresh-rate-ends-of-the-supported-range)
- [Warm up the interaction, control device temperature and background activity, and compare multiple recordings](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Warm-up-the-interaction%2C-control-device-temperature-and-background-activity%2C-and-compare-multiple-recordings)
- [Inspect UI and raster durations independently before deciding whether to optimize build, layout, paint, or rasterization](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Inspect-UI-and-raster-durations-independently-before-deciding-whether-to-optimize-build%2C-layout%2C-paint%2C-or-rasterization)
- [Use the Inspector to verify constraints, ownership, and dependency scope before restructuring a widget tree](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Use-the-Inspector-to-verify-constraints%2C-ownership%2C-and-dependency-scope-before-restructuring-a-widget-tree)
- [Interpret rebuild counts together with build cost and subtree size](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Interpret-rebuild-counts-together-with-build-cost-and-subtree-size)
- [Keep CPU captures narrow and compare self time, total time, callers, and callees](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Keep-CPU-captures-narrow-and-compare-self-time%2C-total-time%2C-callers%2C-and-callees)
- [Take memory snapshots at equivalent lifecycle checkpoints and repeat the scenario before concluding that memory leaks](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Take-memory-snapshots-at-equivalent-lifecycle-checkpoints-and-repeat-the-scenario-before-concluding-that-memory-leaks)
- [Correlate network events with CPU work and timeline spans so response parsing is not mistaken for transport latency](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Correlate-network-events-with-CPU-work-and-timeline-spans-so-response-parsing-is-not-mistaken-for-transport-latency)
- [Keep logs structured and actionable, and never record secrets, tokens, or sensitive payloads](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Keep-logs-structured-and-actionable%2C-and-never-record-secrets%2C-tokens%2C-or-sensitive-payloads)
- [Instrument application-specific work with balanced, bounded timeline events and remove excessive diagnostic overhead](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Instrument-application-specific-work-with-balanced%2C-bounded-timeline-events-and-remove-excessive-diagnostic-overhead)
- [Compare app-size reports only when target platform, architecture, build mode, flags, and source baseline are controlled](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Compare-app-size-reports-only-when-target-platform%2C-architecture%2C-build-mode%2C-flags%2C-and-source-baseline-are-controlled)
- [Save traces, build metadata, device details, and reproduction steps when sharing a performance finding](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Save-traces%2C-build-metadata%2C-device-details%2C-and-reproduction-steps-when-sharing-a-performance-finding)
- [Change one suspected cause at a time and rerun the same measurement before accepting an optimization](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/DevTools/Change-one-suspected-cause-at-a-time-and-rerun-the-same-measurement-before-accepting-an-optimization)

[< Back to Performance & Debugging](../README.md)
