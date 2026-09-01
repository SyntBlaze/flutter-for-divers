## Best Practices

- Declare assets and fonts explicitly and verify packaged output on every target
- Use logical asset keys and let the bundle choose the appropriate variant
- Keep font family and style metadata consistent with the font files
- Load runtime fonts before depending on them for stable measurement or layout
- Decode images near their intended display dimensions when full resolution is unnecessary
- Avoid repeatedly decoding the same encoded image when a suitable cache can reuse it
- Handle animated image frames according to their duration and repetition metadata
- Dispose codecs, immutable buffers, and images when their documented ownership ends
- Avoid redundant conversions between files, byte lists, immutable buffers, and codecs
- Keep custom bundle implementations asynchronous and preserve meaningful load errors
- Do not perform blocking file access on platform, UI, or raster-critical paths
- Respect task-runner ownership when handing resources from I/O work to raster work
- Precache only resources likely to be needed soon and account for memory pressure
- Schedule large uploads before latency-sensitive animation when profiling shows first-use stalls
- Reuse uploaded graphics resources instead of recreating them every frame
- Profile loading, decoding, transfer, upload, and rendering as separate stages
