# Core Pipeline Phases

Flutter turns application state into a presented frame through a sequence of
coordinated phases. Animation advances time-dependent values, build updates the
element and render-object configuration, layout determines geometry, paint
records drawing commands into layers, compositing submits a scene, and
semantics updates the accessibility representation.

```text
frame scheduling -> animation tick -> microtasks -> build -> layout
       -> compositing bits -> paint -> layer tree -> semantics
       -> scene submission -> rasterization -> GPU presentation
```

The framework tracks dirty elements and render objects so most frames process
only work invalidated since the previous frame. The boundaries between phases
matter: state should normally change before build, constraints flow during
layout, and painting should consume already-computed geometry without changing
the widget or render trees.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases) — Focused, bite-sized article covering Core Pipeline Phases
- [Learning Path](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases) — Step-by-step material that builds practical Core Pipeline Phases knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases) — Structured, in-depth material for learning about Core Pipeline Phases thoroughly

## Core Pipeline Phase Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Frame scheduling | Requests that the engine invoke the framework on a future display refresh | Multiple requests are coalesced when a frame is already scheduled; requesting a frame does not run the pipeline immediately | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Frame-scheduling "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Frame-scheduling "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Frame-scheduling "Deep Dive") |
| Animation tick | Advances active tickers from the frame timestamp | Active tickers in one frame use the same timestamp, keeping time-dependent updates synchronized | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Animation-tick "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Animation-tick "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Animation-tick "Deep Dive") |
| Microtask drain before frame work | Completes queued asynchronous continuations before persistent frame work | Microtasks queued by transient callbacks can update state before build begins, but lengthy work reduces the remaining frame budget | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Microtask-drain-before-frame-work "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Microtask-drain-before-frame-work "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Microtask-drain-before-frame-work "Deep Dive") |
| Build phase | Reconciles widgets with mounted elements and updates render-object configuration | Dirty elements rebuild in framework-defined order; build configures the tree but does not calculate geometry or draw pixels | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Build-phase "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Build-phase "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Build-phase "Deep Dive") |
| Layout phase | Propagates constraints and computes render-object sizes and positions | Constraints flow down, sizes flow up, and parents position children; relayout boundaries contain invalidation where possible | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Layout-phase "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Layout-phase "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Layout-phase "Deep Dive") |
| Compositing bits update | Recomputes which render objects require composited layers | This pass must precede paint so painting knows where retained layer boundaries are required | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Compositing-bits-update "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Compositing-bits-update "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Compositing-bits-update "Deep Dive") |
| Paint phase | Records drawing commands for dirty render objects | Painting consumes computed geometry and records commands; repaint boundaries can isolate dirty subtrees | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Paint-phase "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Paint-phase "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Paint-phase "Deep Dive") |
| Layer tree assembly | Builds the retained layer hierarchy used to construct the scene | Retained layers can be reused or transformed without rerecording every descendant's drawing commands | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Layer-tree-assembly "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Layer-tree-assembly "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Layer-tree-assembly "Deep Dive") |
| Semantics phase | Rebuilds accessibility information for dirty semantic subtrees | Semantics updates are produced when semantics are enabled and should remain consistent with the visual and interactive tree | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Semantics-phase "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Semantics-phase "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Semantics-phase "Deep Dive") |
| Scene submission | Sends the completed scene to the engine for rendering | Each render view submits its scene through its view-specific engine endpoint | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Scene-submission "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Scene-submission "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Scene-submission "Deep Dive") |
| Rasterization | Converts scene layers and drawing commands into pixels | Raster work is distinct from framework work and can miss the frame deadline even when build and layout are fast | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Rasterization "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Rasterization "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Rasterization "Deep Dive") |
| GPU presentation | Displays the rendered surface on the device | A completed surface becomes visible according to the platform compositor and display timing | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/GPU-presentation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/GPU-presentation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Core-Pipeline-Phases/GPU-presentation "Deep Dive") |

## Questions

- [When do animations advance relative to building and rendering?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/When-do-animations-advance-relative-to-building-and-rendering%3F)
- [Why do tickers receive the frame timestamp together?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Why-do-tickers-receive-the-frame-timestamp-together%3F)
- [How does build update the render tree without drawing pixels?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/How-does-build-update-the-render-tree-without-drawing-pixels%3F)
- [How do constraints, sizes, and positions flow during layout?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/How-do-constraints%2C-sizes%2C-and-positions-flow-during-layout%3F)
- [Why does Flutter update compositing bits before painting?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Why-does-Flutter-update-compositing-bits-before-painting%3F)
- [What is the difference between painting, compositing, and rasterization?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/What-is-the-difference-between-painting%2C-compositing%2C-and-rasterization%3F)
- [When is the semantics tree regenerated?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/When-is-the-semantics-tree-regenerated%3F)
- [Which work is skipped when nothing relevant is dirty?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Which-work-is-skipped-when-nothing-relevant-is-dirty%3F)
- [What happens if an earlier phase invalidates a later phase?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/What-happens-if-an-earlier-phase-invalidates-a-later-phase%3F)

## Best Practices

- [Keep build methods free of side effects.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Keep-build-methods-free-of-side-effects.)
- [Rebuild the smallest practical subtree.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Rebuild-the-smallest-practical-subtree.)
- [Respect parent constraints and return finite, valid sizes.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Respect-parent-constraints-and-return-finite%2C-valid-sizes.)
- [Avoid changing application state from layout callbacks.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Avoid-changing-application-state-from-layout-callbacks.)
- [Keep paint methods deterministic and based on computed geometry.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Keep-paint-methods-deterministic-and-based-on-computed-geometry.)
- [Avoid unnecessary clipping, opacity layers, and offscreen buffers.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Avoid-unnecessary-clipping%2C-opacity-layers%2C-and-offscreen-buffers.)
- [Provide concise semantics labels, values, hints, and actions.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Provide-concise-semantics-labels%2C-values%2C-hints%2C-and-actions.)
- [Profile pipeline work in profile mode on representative hardware.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Profile-pipeline-work-in-profile-mode-on-representative-hardware.)
- [Treat phase boundaries as one-way inputs for the current frame.](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Core-Pipeline-Phases/Treat-phase-boundaries-as-one-way-inputs-for-the-current-frame.)

[< Back to Rendering Pipeline](../README.md)
