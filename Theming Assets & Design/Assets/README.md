# Assets

Flutter assets are files packaged with an application and loaded at runtime,
including images, fonts, vector artwork, and animation data. Their source files,
`pubspec.yaml` declarations, generated asset bundle, decoding work, and runtime
caches form one pipeline; a correct path alone does not guarantee an efficient,
accessible, or platform-appropriate result.

```text
source files + pubspec.yaml declarations
                    |
                    v
             application bundle
                    |
                    v
       AssetBundle / context override
                    |
          +---------+---------+
          |                   |
          v                   v
  bytes or strings       image / font / animation runtime
                              |
                              v
                     decoded resource caches
```

Use `DefaultAssetBundle.of(context)` when a widget should honor bundle overrides
from localization, tests, or an ancestor. Reserve `rootBundle` for code that has
no relevant `BuildContext`. Loading also has a runtime cost: compressed files
occupy package space, while decoded images, parsed vector scenes, fonts, and
animation compositions consume memory and may affect the first rendered frame.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets) — Focused, bite-sized article covering Assets
- [Learning Path](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets) — Step-by-step material that builds practical Assets knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets) — Structured, in-depth material for learning about Assets thoroughly

## Asset Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `pubspec.yaml` assets | Declaring files and directories for inclusion in the Flutter asset bundle | YAML indentation, exact case-sensitive keys, package ownership, and font declarations must match the files shipped by every build target | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/pubspec.yaml-assets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/pubspec.yaml-assets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/pubspec.yaml-assets "Deep Dive") |
| AssetBundle | The asynchronous interface for retrieving bundled bytes and strings by logical key | Prefer the context-provided bundle in UI code so tests and ancestors can substitute another implementation | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/AssetBundle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/AssetBundle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/AssetBundle "Deep Dive") |
| RootBundle | The process-wide bundle created for the application | Use `rootBundle` only when no contextual override should apply; avoid turning a global lookup into an implicit dependency | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/RootBundle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/RootBundle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/RootBundle "Deep Dive") |
| Image assets | Raster artwork loaded with `AssetImage`, `Image.asset`, or bundle APIs | Supply intentional dimensions and fit, accessibility semantics, and appropriately sized source pixels to control layout, decode work, and memory | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/Image-assets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/Image-assets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/Image-assets "Deep Dive") |
| Font assets | Font files mapped to families, weights, and styles in the application manifest | Declare every face accurately, retain its license, and test missing glyph fallback and text scaling on supported platforms | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/Font-assets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/Font-assets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/Font-assets "Deep Dive") |
| SVG assets | Resolution-independent vector artwork rendered by an SVG-capable package | Validate the renderer's supported SVG features, semantics, theming strategy, and parse or raster-cache cost | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/SVG-assets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/SVG-assets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/SVG-assets "Deep Dive") |
| Lottie assets | JSON compositions and related files used for timeline-based animation | Confirm exporter and runtime compatibility, bound composition complexity, and provide a reduced-motion or static experience | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/Lottie-assets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/Lottie-assets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/Lottie-assets "Deep Dive") |
| Rive assets | Artboards, animations, and state machines loaded by the Rive runtime | Keep design-file and runtime versions compatible, define input ownership, and dispose controllers or resources according to the package API | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/Rive-assets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/Rive-assets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/Rive-assets "Deep Dive") |
| Resolution-aware images | Pixel-density variants such as `2.0x` and `3.0x` selected for an `AssetImage` | Treat the base asset's dimensions as logical pixels and verify variant naming, sharpness, package size, and fallback behavior | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/Resolution-aware-images "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/Resolution-aware-images "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/Resolution-aware-images "Deep Dive") |
| Asset variants | Multiple representations selected for locale, brightness, brand, platform, or another runtime condition | Give variants one stable semantic identity and centralize selection and fallback rules instead of scattering path construction | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/Asset-variants "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/Asset-variants "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/Asset-variants "Deep Dive") |
| Asset preloading | Warming images or parsing resources before the moment they become visible | Preload only likely near-term resources, start after required context exists, and avoid delaying startup with speculative work | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/Asset-preloading "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/Asset-preloading "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/Asset-preloading "Deep Dive") |
| Image cache | Reuse and eviction of decoded images keyed by their image provider and configuration | Budget decoded memory rather than compressed file size, keep keys stable, and respond deliberately to memory pressure or content changes | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Assets/Image-cache "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Assets/Image-cache "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Assets/Image-cache "Deep Dive") |

## Questions

- [Which files and directories should be declared under Flutter assets in `pubspec.yaml`?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Which-files-and-directories-should-be-declared-under-Flutter-assets-in-pubspec.yaml%3F)
- [When should widget code use `DefaultAssetBundle.of(context)`?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/When-should-widget-code-use-DefaultAssetBundle.of(context)%3F)
- [What does `rootBundle` provide, and why can it make tests or overrides harder?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/What-does-rootBundle-provide%2C-and-why-can-it-make-tests-or-overrides-harder%3F)
- [How do source dimensions, `cacheWidth`, fit, and device pixel ratio affect image quality and memory?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/How-do-source-dimensions%2C-cacheWidth%2C-fit%2C-and-device-pixel-ratio-affect-image-quality-and-memory%3F)
- [How are font family, weight, and style declarations matched to a requested `TextStyle`?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/How-are-font-family%2C-weight%2C-and-style-declarations-matched-to-a-requested-TextStyle%3F)
- [When is SVG preferable to raster artwork, and which renderer limitations need testing?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/When-is-SVG-preferable-to-raster-artwork%2C-and-which-renderer-limitations-need-testing%3F)
- [How can Lottie playback respect reduced-motion preferences and remain inexpensive to render?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/How-can-Lottie-playback-respect-reduced-motion-preferences-and-remain-inexpensive-to-render%3F)
- [How should Rive state-machine inputs be connected to application state and lifecycle?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/How-should-Rive-state-machine-inputs-be-connected-to-application-state-and-lifecycle%3F)
- [How does Flutter select among `1.0x`, `2.0x`, and `3.0x` image variants?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/How-does-Flutter-select-among-1.0x%2C-2.0x%2C-and-3.0x-image-variants%3F)
- [Where should selection and fallback logic for locale, theme, brand, or platform variants live?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Where-should-selection-and-fallback-logic-for-locale%2C-theme%2C-brand%2C-or-platform-variants-live%3F)
- [Which assets are valuable enough to preload without slowing startup or wasting memory?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Which-assets-are-valuable-enough-to-preload-without-slowing-startup-or-wasting-memory%3F)
- [Why can a small compressed image consume much more memory after decoding?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Why-can-a-small-compressed-image-consume-much-more-memory-after-decoding%3F)
- [How can asset loading remain deterministic in widget and golden tests?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/How-can-asset-loading-remain-deterministic-in-widget-and-golden-tests%3F)

## Best Practices

- [Keep asset declarations explicit, correctly indented, and validated in continuous integration](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Keep-asset-declarations-explicit%2C-correctly-indented%2C-and-validated-in-continuous-integration)
- [Use stable semantic paths and preserve filename case across case-sensitive and case-insensitive systems](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Use-stable-semantic-paths-and-preserve-filename-case-across-case-sensitive-and-case-insensitive-systems)
- [Prefer the context-provided `AssetBundle` in widgets and injectable bundle dependencies in services](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Prefer-the-context-provided-AssetBundle-in-widgets-and-injectable-bundle-dependencies-in-services)
- [Use `rootBundle` only for genuinely application-global, context-free reads](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Use-rootBundle-only-for-genuinely-application-global%2C-context-free-reads)
- [Reserve layout space and provide meaningful semantics or deliberately exclude decorative images](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Reserve-layout-space-and-provide-meaningful-semantics-or-deliberately-exclude-decorative-images)
- [Size raster sources and decode targets for their rendered use rather than shipping one oversized image everywhere](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Size-raster-sources-and-decode-targets-for-their-rendered-use-rather-than-shipping-one-oversized-image-everywhere)
- [Declare font faces accurately, preserve licenses, and verify glyph fallback and text scaling](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Declare-font-faces-accurately%2C-preserve-licenses%2C-and-verify-glyph-fallback-and-text-scaling)
- [Test SVG, Lottie, and Rive files with the exact package and runtime versions used by the application](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Test-SVG%2C-Lottie%2C-and-Rive-files-with-the-exact-package-and-runtime-versions-used-by-the-application)
- [Pause offscreen animation and provide static or reduced-motion alternatives](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Pause-offscreen-animation-and-provide-static-or-reduced-motion-alternatives)
- [Centralize asset variant selection and define a deterministic fallback](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Centralize-asset-variant-selection-and-define-a-deterministic-fallback)
- [Preload a measured, bounded working set instead of the entire catalog](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Preload-a-measured%2C-bounded-working-set-instead-of-the-entire-catalog)
- [Measure decoded image memory and cache behavior on constrained devices](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Measure-decoded-image-memory-and-cache-behavior-on-constrained-devices)
- [Fail asset lookups visibly during development and cover critical resources with tests](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Fail-asset-lookups-visibly-during-development-and-cover-critical-resources-with-tests)
- [Review package size, first-use latency, accessibility, and licensing before release](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Assets/Review-package-size%2C-first-use-latency%2C-accessibility%2C-and-licensing-before-release)

[< Back to theming assets & design](../README.md)
