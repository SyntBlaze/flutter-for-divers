# Paint Optimization

Flutter's paint phase records drawing commands for render objects whose visual
output has changed. The rasterizer later turns the resulting layer tree into
pixels on the GPU. Paint optimization therefore has two related goals: avoid
recording unchanged content again, and keep the recorded scene inexpensive to
composite and rasterize.

```text
widget and render-object changes
              |
              v
       paint invalidation
              |
              v
      record drawing commands
              |
              +----> repaint boundaries isolate unchanged subtrees
              |
              v
          layer tree
              |
              +----> clips / opacity / saveLayer / images / shaders
              |
              v
      compositor and rasterizer
              |
              v
         display pixels
```

Begin with a reproducible slow frame in a profile build and determine whether
the cost is paint recording on the UI thread or raster work on the raster
thread. A `RepaintBoundary` can reduce repeated paint recording when a stable
subtree sits beside frequently changing content, but it also creates a
compositing boundary and can consume additional memory. Likewise, an operation
that is convenient at the widget or canvas level may require an offscreen
buffer, extra texture sampling, or more GPU work.

Optimize the measured operation rather than applying rendering primitives as
universal fixes. Keep images close to their display dimensions, make custom
painters report invalidation accurately, and inspect whether opacity, clipping,
or `saveLayer` is actually required. Account for Flutter's current rendering
backend and target hardware when evaluating shader behavior, caches, and frame
timings.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Paint-Optimization) — Focused, bite-sized article covering Paint Optimization
- [Learning Path](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Paint-Optimization) — Step-by-step material that builds practical Paint Optimization knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Paint-Optimization) — Structured, in-depth material for learning about Paint Optimization thoroughly

## Paint Optimization Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `RepaintBoundary` | Isolate a render subtree so changes outside it do not automatically repaint its contents | Add boundaries around independently changing, meaningfully expensive regions; excessive boundaries increase layer and memory overhead | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Paint-Optimization/RepaintBoundary "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Paint-Optimization/RepaintBoundary "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Paint-Optimization/RepaintBoundary "Deep Dive") |
| `CustomPainter.shouldRepaint` | Decide whether a new custom-painter delegate requires its render object to repaint | Compare every field that affects pixels and return `false` only when the old painting remains visually valid | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Paint-Optimization/CustomPainter.shouldRepaint "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Paint-Optimization/CustomPainter.shouldRepaint "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Paint-Optimization/CustomPainter.shouldRepaint "Deep Dive") |
| Avoid unnecessary `Opacity` | Prevent avoidable intermediate compositing when content can be drawn with the desired alpha directly | Prefer alpha-aware colors or purpose-built transitions where semantics are equivalent, then confirm the actual layer behavior | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Paint-Optimization/Avoid-unnecessary-Opacity "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Paint-Optimization/Avoid-unnecessary-Opacity "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Paint-Optimization/Avoid-unnecessary-Opacity "Deep Dive") |
| Avoid expensive clips | Limit clipping operations that add antialiasing, layers, or complex GPU work | Prefer simple clip geometry, avoid clipping content already constrained by design, and measure the selected clip behavior | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Paint-Optimization/Avoid-expensive-clips "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Paint-Optimization/Avoid-expensive-clips "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Paint-Optimization/Avoid-expensive-clips "Deep Dive") |
| Avoid `saveLayer` | Avoid offscreen buffers and render-target switches unless the visual effect requires them | Identify the widget, effect, or canvas operation that triggers the layer and seek a cheaper equivalent before removing required correctness | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Paint-Optimization/Avoid-saveLayer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Paint-Optimization/Avoid-saveLayer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Paint-Optimization/Avoid-saveLayer "Deep Dive") |
| Image sizing | Decode and upload images at dimensions appropriate for their rendered size and device pixel ratio | Preserve needed detail while avoiding oversized decoded images, memory pressure, and unnecessary texture bandwidth | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Paint-Optimization/Image-sizing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Paint-Optimization/Image-sizing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Paint-Optimization/Image-sizing "Deep Dive") |
| Image cache | Reuse decoded image resources without allowing the cache to crowd out the rest of the application | Tune only from measured workload and memory evidence; account for image dimensions, lifecycle, and eviction behavior | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Paint-Optimization/Image-cache "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Paint-Optimization/Image-cache "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Paint-Optimization/Image-cache "Deep Dive") |
| Raster cache | Reuse rasterized output for stable, expensive content across frames | The cache helps only when reuse repays rasterization and memory costs; changing or trivial content may not benefit | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Paint-Optimization/Raster-cache "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Paint-Optimization/Raster-cache "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Paint-Optimization/Raster-cache "Deep Dive") |
| Shader warm-up | Reduce first-use shader or pipeline compilation stalls in interactions that must remain smooth | Capture representative effects and validate on each target backend; warm-up is targeted mitigation, not a substitute for simpler rendering | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Paint-Optimization/Shader-warm-up "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Paint-Optimization/Shader-warm-up "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Paint-Optimization/Shader-warm-up "Deep Dive") |
| Impeller considerations | Evaluate paint and raster behavior with Flutter's modern rendering architecture | Verify backend, platform, Flutter version, and hardware before transferring conclusions from older rendering paths | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Paint-Optimization/Impeller-considerations "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Paint-Optimization/Impeller-considerations "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Paint-Optimization/Impeller-considerations "Deep Dive") |

## Questions

- [Which independently changing subtree is expensive enough to justify a `RepaintBoundary`?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Which-independently-changing-subtree-is-expensive-enough-to-justify-a-RepaintBoundary%3F)
- [Does `CustomPainter.shouldRepaint` compare every input that can change the generated pixels?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Does-CustomPainter.shouldRepaint-compare-every-input-that-can-change-the-generated-pixels%3F)
- [Can the same transparency be expressed without applying `Opacity` to an entire subtree?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Can-the-same-transparency-be-expressed-without-applying-Opacity-to-an-entire-subtree%3F)
- [Is this clip visually necessary, and can simpler geometry or clip behavior preserve the design?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Is-this-clip-visually-necessary%2C-and-can-simpler-geometry-or-clip-behavior-preserve-the-design%3F)
- [Which operation triggers `saveLayer`, and does its visual result require an offscreen buffer?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Which-operation-triggers-saveLayer%2C-and-does-its-visual-result-require-an-offscreen-buffer%3F)
- [How large is the decoded image relative to its physical-pixel display size?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/How-large-is-the-decoded-image-relative-to-its-physical-pixel-display-size%3F)
- [Are image-cache entries being reused, or do they primarily increase peak memory and eviction churn?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Are-image-cache-entries-being-reused%2C-or-do-they-primarily-increase-peak-memory-and-eviction-churn%3F)
- [Does the raster cache reuse this stable content often enough to recover its creation and memory costs?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Does-the-raster-cache-reuse-this-stable-content-often-enough-to-recover-its-creation-and-memory-costs%3F)
- [Which first-use interaction shows shader or pipeline compilation jank on representative hardware?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Which-first-use-interaction-shows-shader-or-pipeline-compilation-jank-on-representative-hardware%3F)
- [Which renderer and backend produced the trace being analyzed?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Which-renderer-and-backend-produced-the-trace-being-analyzed%3F)
- [Is the missed frame dominated by UI-thread paint recording or raster-thread execution?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Is-the-missed-frame-dominated-by-UI-thread-paint-recording-or-raster-thread-execution%3F)
- [Does the optimization improve slow-frame percentiles without unacceptable memory or visual-quality regressions?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Does-the-optimization-improve-slow-frame-percentiles-without-unacceptable-memory-or-visual-quality-regressions%3F)

## Best Practices

- [Use profile mode and representative physical devices for paint and raster measurements](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Use-profile-mode-and-representative-physical-devices-for-paint-and-raster-measurements)
- [Inspect individual slow frames and separate UI paint time from raster time](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Inspect-individual-slow-frames-and-separate-UI-paint-time-from-raster-time)
- [Place `RepaintBoundary` only around independently changing, expensive regions](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Place-RepaintBoundary-only-around-independently-changing%2C-expensive-regions)
- [Use repaint-rainbow diagnostics to validate repaint scope during investigation](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Use-repaint-rainbow-diagnostics-to-validate-repaint-scope-during-investigation)
- [Implement `CustomPainter.shouldRepaint` from immutable visual inputs and test both changed and unchanged delegates](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Implement-CustomPainter.shouldRepaint-from-immutable-visual-inputs-and-test-both-changed-and-unchanged-delegates)
- [Draw with the intended alpha directly when it is visually equivalent to wrapping a subtree in `Opacity`](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Draw-with-the-intended-alpha-directly-when-it-is-visually-equivalent-to-wrapping-a-subtree-in-Opacity)
- [Prefer simple clip shapes and omit clips that do not affect visible output](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Prefer-simple-clip-shapes-and-omit-clips-that-do-not-affect-visible-output)
- [Treat `saveLayer` as an explicit rendering cost and retain it when correctness genuinely requires isolation](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Treat-saveLayer-as-an-explicit-rendering-cost-and-retain-it-when-correctness-genuinely-requires-isolation)
- [Decode images near their required physical-pixel dimensions while preserving appropriate quality](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Decode-images-near-their-required-physical-pixel-dimensions-while-preserving-appropriate-quality)
- [Measure heap usage, cache churn, and reload behavior before changing image-cache limits](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Measure-heap-usage%2C-cache-churn%2C-and-reload-behavior-before-changing-image-cache-limits)
- [Rely on raster caching for stable, repeatedly reused content rather than constantly changing scenes](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Rely-on-raster-caching-for-stable%2C-repeatedly-reused-content-rather-than-constantly-changing-scenes)
- [Warm up only representative shaders or pipelines shown to cause first-use jank](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Warm-up-only-representative-shaders-or-pipelines-shown-to-cause-first-use-jank)
- [Reprofile after Flutter upgrades because renderer behavior and heuristics can change](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Reprofile-after-Flutter-upgrades-because-renderer-behavior-and-heuristics-can-change)
- [Compare identical interactions, assets, device state, and build configuration before and after each change](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Paint-Optimization/Compare-identical-interactions%2C-assets%2C-device-state%2C-and-build-configuration-before-and-after-each-change)

[< Back to Performance & Debugging](../README.md)
