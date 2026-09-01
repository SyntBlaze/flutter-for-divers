# Rendering Backend

Flutter's rendering backend turns framework-recorded drawing intent into pixels
that a platform surface can present. The framework builds a scene from retained
layers and display lists; the engine then rasterizes that scene, prepares GPU
resources, submits commands through Skia or Impeller, and hands the completed
surface to the embedder for presentation.

```text
Framework paint -> display lists -> layer tree -> scene
                                               |
                                               v
Engine rasterizer -> Skia / Impeller -> GPU commands -> surface -> display
                         ^                    ^
                         |                    |
                  shaders and pipelines   textures and buffers
```

These stages overlap conceptually but have distinct costs. Recording a display
list does not draw pixels, rasterization is broader than GPU execution, and a
submitted command buffer may still be waiting in a driver or GPU queue. Backend
behavior also differs by renderer, platform, graphics API, and device, so traces
from representative hardware are more useful than assumptions based on one
configuration.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend) — Focused, bite-sized article covering Rendering Backend
- [Learning Path](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend) — Step-by-step material that builds practical Rendering Backend knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend) — Structured, in-depth material for learning about Rendering Backend thoroughly

## Rendering Components

| Topic | Primary responsibility | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| GPU command submission | Encode and submit rendering work to the graphics driver and GPU | Submission is asynchronous, so CPU completion does not mean the frame has finished on the GPU | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend/GPU-command-submission "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend/GPU-command-submission "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend/GPU-command-submission "Deep Dive") |
| Skia | Provide a cross-platform 2D graphics engine used by supported Flutter renderer configurations | Backend choice and platform graphics API affect compilation, caching, and diagnostics | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend/Skia "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend/Skia "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend/Skia "Deep Dive") |
| Impeller | Use predictable pipelines and ahead-of-time prepared shader assets to render Flutter scenes | Runtime pipeline creation and resource upload can still create first-use work | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend/Impeller "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend/Impeller "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend/Impeller "Deep Dive") |
| Display list | Store ordered, backend-neutral drawing operations recorded during paint | Keep recorded operations and bounds efficient because the rasterizer later replays them | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend/Display-list "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend/Display-list "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend/Display-list "Deep Dive") |
| Scene | Package the composited visual result that the framework submits to the engine | A scene is the framework-to-engine output, not yet a rasterized image | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend/Scene "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend/Scene "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend/Scene "Deep Dive") |
| Layer tree handoff | Transfer retained layers and their display lists from UI-side production to raster-side consumption | Avoid confusing UI-thread scene construction with raster-thread execution | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend/Layer-tree-handoff "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend/Layer-tree-handoff "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend/Layer-tree-handoff "Deep Dive") |
| Rasterization | Convert the submitted layer tree and drawing operations into pixels for a target surface | Expensive effects, large images, and cache misses can consume the raster deadline | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend/Rasterization "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend/Rasterization "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend/Rasterization "Deep Dive") |
| Surface | Represent the render target and presentation boundary supplied by the platform integration | Surface availability, size, format, and lifecycle must match the current view | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend/Surface "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend/Surface "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend/Surface "Deep Dive") |
| Texture upload | Transfer decoded image or external texture data into GPU-accessible resources | Upload timing and bandwidth can stall rendering or increase memory pressure | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend/Texture-upload "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend/Texture-upload "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend/Texture-upload "Deep Dive") |
| Shader compilation | Turn shader programs and pipeline state into GPU-executable work | First-use compilation or pipeline creation can delay a frame | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend/Shader-compilation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend/Shader-compilation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend/Shader-compilation "Deep Dive") |
| Shader warm-up | Prepare representative shader or pipeline work before a latency-sensitive interaction | Warm only realistic workloads and verify that the chosen renderer benefits | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Rendering-Backend/Shader-warm-up "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Rendering-Backend/Shader-warm-up "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Rendering-Backend/Shader-warm-up "Deep Dive") |

## Questions

- [What happens between a recorded draw operation and GPU execution?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/What-happens-between-a-recorded-draw-operation-and-GPU-execution%3F)
- [Why can the CPU finish submitting a frame while the GPU is still busy?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Why-can-the-CPU-finish-submitting-a-frame-while-the-GPU-is-still-busy%3F)
- [How do Skia and Impeller fit into Flutter's rendering architecture?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/How-do-Skia-and-Impeller-fit-into-Flutter's-rendering-architecture%3F)
- [What is Impeller designed to make more predictable?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/What-is-Impeller-designed-to-make-more-predictable%3F)
- [What does a display list contain, and when is it recorded?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/What-does-a-display-list-contain%2C-and-when-is-it-recorded%3F)
- [How is a scene different from a layer tree or a rendered image?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/How-is-a-scene-different-from-a-layer-tree-or-a-rendered-image%3F)
- [Where does the UI-side layer tree cross into raster-side work?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Where-does-the-UI-side-layer-tree-cross-into-raster-side-work%3F)
- [What work belongs to rasterization besides issuing GPU commands?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/What-work-belongs-to-rasterization-besides-issuing-GPU-commands%3F)
- [How does the embedder-provided surface affect frame presentation?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/How-does-the-embedder-provided-surface-affect-frame-presentation%3F)
- [Why can uploading a large texture delay a frame?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Why-can-uploading-a-large-texture-delay-a-frame%3F)
- [When are shaders or graphics pipelines compiled?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/When-are-shaders-or-graphics-pipelines-compiled%3F)
- [Does shader warm-up remove every kind of first-frame jank?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Does-shader-warm-up-remove-every-kind-of-first-frame-jank%3F)
- [Which backend stage is responsible for a slow raster frame?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Which-backend-stage-is-responsible-for-a-slow-raster-frame%3F)
- [Why can rendering behavior differ across devices and graphics APIs?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Why-can-rendering-behavior-differ-across-devices-and-graphics-APIs%3F)

## Best Practices

- [Measure raster and GPU work in profile mode on representative devices](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Measure-raster-and-GPU-work-in-profile-mode-on-representative-devices)
- [Distinguish command recording, submission, execution, and presentation](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Distinguish-command-recording%2C-submission%2C-execution%2C-and-presentation)
- [Confirm the active renderer before interpreting backend-specific traces](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Confirm-the-active-renderer-before-interpreting-backend-specific-traces)
- [Keep display lists focused and avoid recording invisible work](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Keep-display-lists-focused-and-avoid-recording-invisible-work)
- [Use stable layer boundaries only where retained rendering provides a measured benefit](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Use-stable-layer-boundaries-only-where-retained-rendering-provides-a-measured-benefit)
- [Reduce expensive effects and oversized draw bounds before adding caches](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Reduce-expensive-effects-and-oversized-draw-bounds-before-adding-caches)
- [Treat surface creation, resizing, loss, and teardown as lifecycle events](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Treat-surface-creation%2C-resizing%2C-loss%2C-and-teardown-as-lifecycle-events)
- [Decode and upload textures close to the dimensions actually displayed](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Decode-and-upload-textures-close-to-the-dimensions-actually-displayed)
- [Reuse GPU resources instead of recreating them every frame](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Reuse-GPU-resources-instead-of-recreating-them-every-frame)
- [Avoid blocking application threads while waiting for GPU completion](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Avoid-blocking-application-threads-while-waiting-for-GPU-completion)
- [Exercise representative effects when evaluating shader compilation behavior](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Exercise-representative-effects-when-evaluating-shader-compilation-behavior)
- [Warm shaders or pipelines only when profiling shows a first-use problem](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Warm-shaders-or-pipelines-only-when-profiling-shows-a-first-use-problem)
- [Validate warm-up coverage on every supported backend and target class](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Validate-warm-up-coverage-on-every-supported-backend-and-target-class)
- [Use renderer-specific diagnostics to confirm the source of raster jank](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Rendering-Backend/Use-renderer-specific-diagnostics-to-confirm-the-source-of-raster-jank)

[< Back to engine & threads](../README.md)
