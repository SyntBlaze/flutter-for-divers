# Resource Loading

Flutter resource loading moves packaged or external bytes through decoding and
engine-owned preparation until the framework or renderer can consume them.
Assets and fonts commonly begin in the application bundle, while images may
also arrive from files, memory, or the network. The framework requests the
resource; the engine and embedder resolve or decode it; and graphics resources
cross to the raster side before the GPU can use them.

```text
framework request -> asset bundle bridge -> embedder asset resolver -> bytes
                                                               |
                       +-------------------+-------------------+
                       |                   |                   |
                       v                   v                   v
                  font loading      image decoding      raw asset data
                                           |
                                           v
                                  image codec / frames
                                           |
                                           v
                              raster-side GPU resource upload
```

These steps are related but not interchangeable. Reading bytes does not decode
an image, decoding does not upload a texture, and a completed upload does not
guarantee that a frame has been drawn or presented. Exact scheduling and cache
behavior vary by platform, renderer, resource source, and engine version, so
profiling should identify whether latency comes from file access, decoding,
transfer, upload, or first use.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Resource-Loading) — Focused, bite-sized article covering Resource Loading
- [Learning Path](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Resource-Loading) — Step-by-step material that builds practical Resource Loading knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Resource-Loading) — Structured, in-depth material for learning about Resource Loading thoroughly

## Resource Paths and Stages

| Topic | Primary responsibility | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Asset loading | Resolve a logical asset key and return the packaged bytes associated with it | Asset keys, bundle variants, and platform packaging determine what the embedder can resolve | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Resource-Loading/Asset-loading "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Resource-Loading/Asset-loading "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Resource-Loading/Asset-loading "Deep Dive") |
| Font loading | Make bundled or runtime-provided font data available to text shaping and rendering | Loading bytes alone is insufficient; the font must be registered and later matched by family and style | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Resource-Loading/Font-loading "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Resource-Loading/Font-loading "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Resource-Loading/Font-loading "Deep Dive") |
| Image decoding | Turn encoded image bytes into pixel frames suitable for later rendering | Decode dimensions, format, animation, memory use, and scheduling all affect latency | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Resource-Loading/Image-decoding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Resource-Loading/Image-decoding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Resource-Loading/Image-decoding "Deep Dive") |
| Image codec | Expose decoded frames, durations, and repetition metadata for a still or animated image | Frame retrieval is asynchronous, and codecs plus returned images have explicit lifecycles | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Resource-Loading/Image-codec "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Resource-Loading/Image-codec "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Resource-Loading/Image-codec "Deep Dive") |
| ImmutableBuffer | Hold engine-backed immutable bytes used by image codecs and other resource consumers | Dispose buffers when ownership ends and avoid unnecessary byte copies around the boundary | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Resource-Loading/ImmutableBuffer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Resource-Loading/ImmutableBuffer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Resource-Loading/ImmutableBuffer "Deep Dive") |
| Asset bundle bridge | Carry framework asset requests to the engine and return bytes from the embedder's asset resolver | The bridge is asynchronous and uses logical asset keys rather than arbitrary filesystem paths | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Resource-Loading/Asset-bundle-bridge "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Resource-Loading/Asset-bundle-bridge "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Resource-Loading/Asset-bundle-bridge "Deep Dive") |
| I/O thread file access | Perform engine-side file and resource work away from frame-critical task runners | The I/O runner is an engine execution role, not a promise that every Dart file API runs there | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Resource-Loading/I-O-thread-file-access "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Resource-Loading/I-O-thread-file-access "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Resource-Loading/I-O-thread-file-access "Deep Dive") |
| GPU resource upload | Transfer prepared pixel or resource data into graphics resources usable by the renderer | Upload bandwidth, synchronization, and first-use timing can delay raster work | [💡](https://app.syntblaze.com/qt/flutter/Engine-and-Threads/Resource-Loading/GPU-resource-upload "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Engine-and-Threads/Resource-Loading/GPU-resource-upload "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Engine-and-Threads/Resource-Loading/GPU-resource-upload "Deep Dive") |

## Questions

- [How does an asset key become bytes available to Dart?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/How-does-an-asset-key-become-bytes-available-to-Dart%3F)
- [How do resolution-aware or package asset variants affect lookup?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/How-do-resolution-aware-or-package-asset-variants-affect-lookup%3F)
- [When does a bundled font become available for text shaping?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/When-does-a-bundled-font-become-available-for-text-shaping%3F)
- [Why can fallback text appear when a font is loaded or declared incorrectly?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Why-can-fallback-text-appear-when-a-font-is-loaded-or-declared-incorrectly%3F)
- [What work happens between compressed image bytes and decoded pixels?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/What-work-happens-between-compressed-image-bytes-and-decoded-pixels%3F)
- [How do target decode dimensions affect image memory and latency?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/How-do-target-decode-dimensions-affect-image-memory-and-latency%3F)
- [How are still and animated images represented by an image codec?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/How-are-still-and-animated-images-represented-by-an-image-codec%3F)
- [Who owns the lifecycle of codecs, buffers, and decoded image frames?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Who-owns-the-lifecycle-of-codecs%2C-buffers%2C-and-decoded-image-frames%3F)
- [Why use an `ImmutableBuffer` instead of repeatedly copying a byte list?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Why-use-an-ImmutableBuffer-instead-of-repeatedly-copying-a-byte-list%3F)
- [How does the framework asset bundle communicate with the engine?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/How-does-the-framework-asset-bundle-communicate-with-the-engine%3F)
- [Can an asset bundle key be treated as a normal filesystem path?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Can-an-asset-bundle-key-be-treated-as-a-normal-filesystem-path%3F)
- [What resource work belongs to the engine's I/O task runner?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/What-resource-work-belongs-to-the-engine's-I%2FO-task-runner%3F)
- [Does every call to `dart:io` execute on Flutter's I/O thread?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Does-every-call-to-dart%3Aio-execute-on-Flutter's-I%2FO-thread%3F)
- [Why can an image still cause raster jank after decoding has completed?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Why-can-an-image-still-cause-raster-jank-after-decoding-has-completed%3F)
- [Where should loading, decoding, and upload time be measured separately?](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Where-should-loading%2C-decoding%2C-and-upload-time-be-measured-separately%3F)

## Best Practices

- [Declare assets and fonts explicitly and verify packaged output on every target](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Declare-assets-and-fonts-explicitly-and-verify-packaged-output-on-every-target)
- [Use logical asset keys and let the bundle choose the appropriate variant](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Use-logical-asset-keys-and-let-the-bundle-choose-the-appropriate-variant)
- [Keep font family and style metadata consistent with the font files](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Keep-font-family-and-style-metadata-consistent-with-the-font-files)
- [Load runtime fonts before depending on them for stable measurement or layout](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Load-runtime-fonts-before-depending-on-them-for-stable-measurement-or-layout)
- [Decode images near their intended display dimensions when full resolution is unnecessary](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Decode-images-near-their-intended-display-dimensions-when-full-resolution-is-unnecessary)
- [Avoid repeatedly decoding the same encoded image when a suitable cache can reuse it](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Avoid-repeatedly-decoding-the-same-encoded-image-when-a-suitable-cache-can-reuse-it)
- [Handle animated image frames according to their duration and repetition metadata](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Handle-animated-image-frames-according-to-their-duration-and-repetition-metadata)
- [Dispose codecs, immutable buffers, and images when their documented ownership ends](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Dispose-codecs%2C-immutable-buffers%2C-and-images-when-their-documented-ownership-ends)
- [Avoid redundant conversions between files, byte lists, immutable buffers, and codecs](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Avoid-redundant-conversions-between-files%2C-byte-lists%2C-immutable-buffers%2C-and-codecs)
- [Keep custom bundle implementations asynchronous and preserve meaningful load errors](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Keep-custom-bundle-implementations-asynchronous-and-preserve-meaningful-load-errors)
- [Do not perform blocking file access on platform, UI, or raster-critical paths](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Do-not-perform-blocking-file-access-on-platform%2C-UI%2C-or-raster-critical-paths)
- [Respect task-runner ownership when handing resources from I/O work to raster work](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Respect-task-runner-ownership-when-handing-resources-from-I%2FO-work-to-raster-work)
- [Precache only resources likely to be needed soon and account for memory pressure](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Precache-only-resources-likely-to-be-needed-soon-and-account-for-memory-pressure)
- [Schedule large uploads before latency-sensitive animation when profiling shows first-use stalls](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Schedule-large-uploads-before-latency-sensitive-animation-when-profiling-shows-first-use-stalls)
- [Reuse uploaded graphics resources instead of recreating them every frame](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Reuse-uploaded-graphics-resources-instead-of-recreating-them-every-frame)
- [Profile loading, decoding, transfer, upload, and rendering as separate stages](https://app.syntblaze.com/qsp/flutter/Engine-and-Threads/Resource-Loading/Profile-loading%2C-decoding%2C-transfer%2C-upload%2C-and-rendering-as-separate-stages)

[< Back to engine & threads](../README.md)
