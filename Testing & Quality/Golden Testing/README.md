# Golden Testing

Golden testing detects visual regressions by rendering a widget in a controlled
environment and comparing the result with a reviewed reference image. It is
most valuable for stable, visually significant components and screens where a
pixel diff can reveal changes that behavioral assertions would miss.

```text
controlled widget state
          |
          v
device + theme + text scale
          |
          v
fonts + images + animation frame
          |
          v
     rendered image --------> golden file
          |                       |
          +------ comparison -----+
                     |
              pass or reviewed diff
```

A trustworthy golden suite controls every input that can alter rendering:
viewport and pixel ratio, theme, text scaling, fonts, image data, locale, and
animation time. Variant matrices should be intentionally small and
representative so that failures remain actionable instead of producing a large
set of redundant baselines.

Golden files are reviewed artifacts, not automatically correct output. When a
comparison fails, inspect the diff and decide whether production code regressed
or the visual contract changed deliberately. Tolerance can account for a
narrow, understood source of noise, but it should not hide layout, typography,
contrast, or state changes.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Golden-Testing) — Focused, bite-sized article covering Golden Testing
- [Learning Path](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Golden-Testing) — Step-by-step material that builds practical Golden Testing knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Golden-Testing) — Structured, in-depth material for learning about Golden Testing thoroughly

## Golden Testing Topics

| Topic | Focus | Key considerations | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Golden file | Store the reviewed reference rendering for a visual contract | Keep baselines versioned, use meaningful scenario names, and approve updates only after inspecting the diff | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Golden-Testing/Golden-file "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Golden-Testing/Golden-file "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Golden-Testing/Golden-file "Deep Dive") |
| Golden tolerance | Define narrowly justified rules for acceptable pixel differences | Prefer exact comparisons; bound any tolerance by magnitude and affected pixels so real regressions remain visible | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Golden-Testing/Golden-tolerance "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Golden-Testing/Golden-tolerance "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Golden-Testing/Golden-tolerance "Deep Dive") |
| Device variants | Compare layouts under representative viewports and pixel ratios | Cover meaningful compact, expanded, and platform-specific constraints without multiplying equivalent baselines | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Golden-Testing/Device-variants "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Golden-Testing/Device-variants "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Golden-Testing/Device-variants "Deep Dive") |
| Theme variants | Protect component appearance across supported visual themes | Exercise light, dark, high-contrast, and branded themes where their tokens or component styling differ | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Golden-Testing/Theme-variants "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Golden-Testing/Theme-variants "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Golden-Testing/Theme-variants "Deep Dive") |
| Text scale variants | Verify visual behavior at representative accessibility scales | Check wrapping, clipping, scrolling, and control growth rather than expecting every scale to retain identical geometry | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Golden-Testing/Text-scale-variants "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Golden-Testing/Text-scale-variants "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Golden-Testing/Text-scale-variants "Deep Dive") |
| Font loading | Load the intended fonts before capturing reference output | Register all required families and weights and wait for loading so fallback glyph metrics do not alter baselines | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Golden-Testing/Font-loading "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Golden-Testing/Font-loading "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Golden-Testing/Font-loading "Deep Dive") |
| Network image mocking | Replace remote image retrieval with deterministic test content | Avoid live requests, preserve expected image dimensions, and cover success, loading, and failure states explicitly | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Golden-Testing/Network-image-mocking "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Golden-Testing/Network-image-mocking "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Golden-Testing/Network-image-mocking "Deep Dive") |
| Deterministic animations | Capture visual output only at explicit, reproducible animation frames | Advance time deliberately, disable unrelated motion, and avoid open-ended settling when an animation repeats | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Golden-Testing/Deterministic-animations "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Golden-Testing/Deterministic-animations "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Golden-Testing/Deterministic-animations "Deep Dive") |

## Questions

- [What makes a golden file a useful visual contract rather than merely a screenshot?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/What-makes-a-golden-file-a-useful-visual-contract-rather-than-merely-a-screenshot%3F)
- [When is a non-zero golden tolerance justified?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/When-is-a-non-zero-golden-tolerance-justified%3F)
- [Which viewport sizes and pixel ratios provide meaningful device coverage?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Which-viewport-sizes-and-pixel-ratios-provide-meaningful-device-coverage%3F)
- [Which theme combinations deserve distinct baselines?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Which-theme-combinations-deserve-distinct-baselines%3F)
- [How should golden tests cover accessible text scaling without redundant snapshots?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/How-should-golden-tests-cover-accessible-text-scaling-without-redundant-snapshots%3F)
- [Why do golden tests render differently when the expected font is not loaded?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Why-do-golden-tests-render-differently-when-the-expected-font-is-not-loaded%3F)
- [How can widgets that display remote images be rendered without network access?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/How-can-widgets-that-display-remote-images-be-rendered-without-network-access%3F)
- [How should a test select a stable frame from an animation?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/How-should-a-test-select-a-stable-frame-from-an-animation%3F)
- [When is a widget assertion more maintainable than a golden comparison?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/When-is-a-widget-assertion-more-maintainable-than-a-golden-comparison%3F)
- [How should a team review and approve an intentional baseline update?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/How-should-a-team-review-and-approve-an-intentional-baseline-update%3F)

## Best Practices

- [Treat each golden file as a reviewed, version-controlled visual contract](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Treat-each-golden-file-as-a-reviewed%2C-version-controlled-visual-contract)
- [Use exact comparison by default and document every tolerance](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Use-exact-comparison-by-default-and-document-every-tolerance)
- [Choose a small device matrix that represents real layout breakpoints](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Choose-a-small-device-matrix-that-represents-real-layout-breakpoints)
- [Generate theme variants from the same scenario data and widget state](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Generate-theme-variants-from-the-same-scenario-data-and-widget-state)
- [Include text scales that expose wrapping and accessibility behavior](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Include-text-scales-that-expose-wrapping-and-accessibility-behavior)
- [Load production fonts and required weights before the first capture](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Load-production-fonts-and-required-weights-before-the-first-capture)
- [Replace network images with stable local bytes of known dimensions](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Replace-network-images-with-stable-local-bytes-of-known-dimensions)
- [Pump explicit durations to capture named animation states](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Pump-explicit-durations-to-capture-named-animation-states)
- [Keep locale, platform, surface size, pixel ratio, and data fixed for every baseline](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Keep-locale%2C-platform%2C-surface-size%2C-pixel-ratio%2C-and-data-fixed-for-every-baseline)
- [Test one visual concern per scenario and name the expected state clearly](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Test-one-visual-concern-per-scenario-and-name-the-expected-state-clearly)
- [Inspect image diffs before accepting regenerated baselines](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Inspect-image-diffs-before-accepting-regenerated-baselines)
- [Run behavioral and semantics tests alongside goldens rather than using image comparison for every assertion](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Run-behavioral-and-semantics-tests-alongside-goldens-rather-than-using-image-comparison-for-every-assertion)
- [Keep rendering environments consistent between local development and continuous integration](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Golden-Testing/Keep-rendering-environments-consistent-between-local-development-and-continuous-integration)

[< Back to testing & quality](../README.md)
