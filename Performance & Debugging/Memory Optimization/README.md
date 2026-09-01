# Memory Optimization

Memory optimization in Flutter is the practice of keeping the application's
live object graph, native resources, and caches proportional to the work the
user can observe. A growing heap is not automatically a leak: caches may warm
up, garbage collection is periodic, and image decoding can allocate memory
outside the Dart heap. The useful question is whether memory returns to a
stable baseline after a feature, route, or workload is no longer needed.

```text
owner created
    |
    +-- controller / subscription / stream ----> dispose / cancel / close
    |
    +-- image or static cache -----------------> bounded capacity + eviction
    |
    +-- closure / callback / singleton --------> inspect retained references
                                                   |
                                                   v
                                  allocation profile + leak tracking
```

Start with a repeatable scenario in profile mode on representative hardware.
Record a baseline, exercise the scenario several times, allow garbage
collection, and compare both the Dart heap and external or native memory. Use
allocation profiling to find which object types grow, then inspect retaining
paths to learn why instances remain reachable. A snapshot alone shows what is
alive; repeated snapshots and lifecycle-aware leak tracking distinguish
expected residency from unintended retention.

Resource ownership should be explicit. The object that creates a disposable
controller or subscription normally releases it when its own lifecycle ends.
Streams with application-wide ownership may intentionally outlive a widget,
but they still need a documented shutdown boundary. Caches need budgets and
eviction policies, while closures and long-lived services should avoid keeping
short-lived widget state or `BuildContext` instances reachable.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Memory-Optimization) — Focused, bite-sized article covering Memory Optimization
- [Learning Path](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Memory-Optimization) — Step-by-step material that builds practical Memory Optimization knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Memory-Optimization) — Structured, in-depth material for learning about Memory Optimization thoroughly

## Memory Optimization Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Dispose controllers | Release controllers and their listeners when their owner is destroyed | Dispose only resources the owner created, and detach any separately registered listeners | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Memory-Optimization/Dispose-controllers "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Memory-Optimization/Dispose-controllers "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Memory-Optimization/Dispose-controllers "Deep Dive") |
| Cancel subscriptions | Stop event delivery and release references held by stream subscriptions | Store each subscription, await cancellation when cleanup is asynchronous, and handle replacement without leaving the old listener active | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Memory-Optimization/Cancel-subscriptions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Memory-Optimization/Cancel-subscriptions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Memory-Optimization/Cancel-subscriptions "Deep Dive") |
| Close streams | End streams owned by controllers, services, or repositories | Close the producing `StreamController` at its real ownership boundary; consumers cancel subscriptions rather than closing a stream they do not own | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Memory-Optimization/Close-streams "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Memory-Optimization/Close-streams "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Memory-Optimization/Close-streams "Deep Dive") |
| Image cache limits | Bound decoded image memory and cache entry counts | Tune limits from measured workloads, request images near their display size, and avoid clearing useful caches reflexively | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Memory-Optimization/Image-cache-limits "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Memory-Optimization/Image-cache-limits "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Memory-Optimization/Image-cache-limits "Deep Dive") |
| Avoid retaining `BuildContext` | Prevent short-lived elements and widget subtrees from being kept alive by long-lived references | Extract immutable values before asynchronous gaps and verify `context.mounted` before later context-dependent work | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Memory-Optimization/Avoid-retaining-BuildContext "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Memory-Optimization/Avoid-retaining-BuildContext "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Memory-Optimization/Avoid-retaining-BuildContext "Deep Dive") |
| Avoid static caches without eviction | Keep process-lifetime maps and singletons from growing without bound | Define capacity, expiry, invalidation, and observability for every long-lived cache | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Memory-Optimization/Avoid-static-caches-without-eviction "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Memory-Optimization/Avoid-static-caches-without-eviction "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Memory-Optimization/Avoid-static-caches-without-eviction "Deep Dive") |
| Leak tracking | Detect objects that outlive their expected lifecycle | Treat reports as evidence to investigate, reproduce them with controlled lifecycles, and account for framework or test-harness ownership | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Memory-Optimization/Leak-tracking "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Memory-Optimization/Leak-tracking "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Memory-Optimization/Leak-tracking "Deep Dive") |
| Object allocation profiling | Identify allocation rates, surviving object types, and retaining paths | Compare snapshots around a reproducible action and separate allocation churn from objects that remain reachable | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Memory-Optimization/Object-allocation-profiling "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Memory-Optimization/Object-allocation-profiling "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Memory-Optimization/Object-allocation-profiling "Deep Dive") |

## Questions

- [Who owns each controller, and at which lifecycle boundary should it be disposed?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Who-owns-each-controller%2C-and-at-which-lifecycle-boundary-should-it-be-disposed%3F)
- [How can a replaced or canceled subscription still retain its listener or owner?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/How-can-a-replaced-or-canceled-subscription-still-retain-its-listener-or-owner%3F)
- [When should a stream producer close its controller instead of a consumer canceling its subscription?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/When-should-a-stream-producer-close-its-controller-instead-of-a-consumer-canceling-its-subscription%3F)
- [How do decoded image dimensions, device pixel ratio, and cache limits affect memory use?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/How-do-decoded-image-dimensions%2C-device-pixel-ratio%2C-and-cache-limits-affect-memory-use%3F)
- [Why can storing a `BuildContext` retain an element and its surrounding widget subtree?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Why-can-storing-a-BuildContext-retain-an-element-and-its-surrounding-widget-subtree%3F)
- [Which capacity, expiry, and invalidation policy bounds a long-lived cache?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Which-capacity%2C-expiry%2C-and-invalidation-policy-bounds-a-long-lived-cache%3F)
- [How can leak tracking distinguish delayed cleanup from a persistent leak?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/How-can-leak-tracking-distinguish-delayed-cleanup-from-a-persistent-leak%3F)
- [Which allocation-profile evidence shows churn, growth, or unintended retention?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Which-allocation-profile-evidence-shows-churn%2C-growth%2C-or-unintended-retention%3F)
- [Why can total process memory grow even when the Dart heap returns to baseline?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Why-can-total-process-memory-grow-even-when-the-Dart-heap-returns-to-baseline%3F)
- [How should memory measurements account for garbage collection, cache warm-up, and workload variance?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/How-should-memory-measurements-account-for-garbage-collection%2C-cache-warm-up%2C-and-workload-variance%3F)

## Best Practices

- [Make controller ownership explicit and dispose owned controllers deterministically](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Make-controller-ownership-explicit-and-dispose-owned-controllers-deterministically)
- [Keep subscription handles and cancel them when their consumer stops listening](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Keep-subscription-handles-and-cancel-them-when-their-consumer-stops-listening)
- [Close owned stream controllers and define shutdown behavior for long-lived services](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Close-owned-stream-controllers-and-define-shutdown-behavior-for-long-lived-services)
- [Decode images near their rendered dimensions and set cache budgets from measurements](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Decode-images-near-their-rendered-dimensions-and-set-cache-budgets-from-measurements)
- [Pass values or callbacks into long-lived work instead of retaining `BuildContext`](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Pass-values-or-callbacks-into-long-lived-work-instead-of-retaining-BuildContext)
- [Give static and singleton caches bounded capacity, expiry, or explicit invalidation](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Give-static-and-singleton-caches-bounded-capacity%2C-expiry%2C-or-explicit-invalidation)
- [Add lifecycle-aware leak checks to focused tests and investigate every stable regression](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Add-lifecycle-aware-leak-checks-to-focused-tests-and-investigate-every-stable-regression)
- [Compare allocation snapshots before and after a repeatable user journey](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Compare-allocation-snapshots-before-and-after-a-repeatable-user-journey)
- [Measure profile or release builds on representative physical devices](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Measure-profile-or-release-builds-on-representative-physical-devices)
- [Track Dart heap, external memory, raster resources, and overall process memory separately](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Track-Dart-heap%2C-external-memory%2C-raster-resources%2C-and-overall-process-memory-separately)
- [Warm the scenario, repeat it, and verify that memory settles instead of judging one peak](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Warm-the-scenario%2C-repeat-it%2C-and-verify-that-memory-settles-instead-of-judging-one-peak)
- [Fix unintended retaining references before applying broad cache clears or forced cleanup](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Fix-unintended-retaining-references-before-applying-broad-cache-clears-or-forced-cleanup)
- [Record a memory baseline and regression threshold for critical user journeys](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Memory-Optimization/Record-a-memory-baseline-and-regression-threshold-for-critical-user-journeys)

[< Back to Performance & Debugging](../README.md)
