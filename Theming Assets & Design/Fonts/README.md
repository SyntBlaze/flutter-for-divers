# Fonts

Fonts give a Flutter interface its typographic voice while still needing to
support semantic hierarchy, readable text, localization, accessibility, and
platform differences. A text style requests a family, weight, and style;
Flutter then resolves that request against bundled font faces and fallbacks
before the engine shapes and renders the text.

```text
TextTheme / TextStyle
        |
        v
family + weight + style + variable axes
        |
        v
declared font assets -> matching font face
        |                    |
        | unavailable glyph |
        +--------------------v
                      fallback fonts
                             |
                             v
                 shaped and rendered text
```

Treat typography as a system rather than a collection of font names. Declare
every bundled face accurately, map product typography roles to the appropriate
family and weight, and plan fallbacks for every supported script and symbol.
Font metrics affect wrapping and layout, so test representative content at
large text scales and across the platforms and locales the application
supports.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Fonts) — Focused, bite-sized article covering Fonts
- [Learning Path](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Fonts) — Step-by-step material that builds practical Fonts knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Fonts) — Structured, in-depth material for learning about Fonts thoroughly

## Font Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Font family | The named collection of related typefaces selected by `TextStyle.fontFamily` or a theme | Keep the Flutter family name consistent with `pubspec.yaml` and provide an intentional default through the application's text theme | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Fonts/Font-family "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Fonts/Font-family "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Fonts/Font-family "Deep Dive") |
| Font weight | The stroke-weight request expressed through `FontWeight` | Declare each bundled face with the correct weight so Flutter selects a real face instead of synthesizing or substituting one unexpectedly | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Fonts/Font-weight "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Fonts/Font-weight "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Fonts/Font-weight "Deep Dive") |
| Font style | Upright or italic face selection through `FontStyle` | Bundle and declare true italic faces when required; an italic request without a matching asset can produce platform-dependent results | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Fonts/Font-style "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Fonts/Font-style "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Fonts/Font-style "Deep Dive") |
| Variable fonts | A single font resource whose axes can represent weight, width, optical size, or other variations | Confirm Flutter and target-platform support for the axes in use, constrain values to supported ranges, and compare output with static-face fallbacks | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Fonts/Variable-fonts "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Fonts/Variable-fonts "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Fonts/Variable-fonts "Deep Dive") |
| Fallback fonts | Ordered alternatives used when the preferred family lacks a glyph or cannot be resolved | Choose fallbacks by script and metric compatibility, then test mixed-language text, emoji, symbols, and missing-glyph behavior | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Fonts/Fallback-fonts "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Fonts/Fallback-fonts "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Fonts/Fallback-fonts "Deep Dive") |
| Custom font assets | Font files bundled and registered under the `fonts` section of `pubspec.yaml` | Include only licensed formats and faces, declare their weight and style metadata accurately, and account for application size | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Fonts/Custom-font-assets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Fonts/Custom-font-assets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Fonts/Custom-font-assets "Deep Dive") |
| Font loading in tests | Making font-dependent widget and golden output deterministic in the test environment | Load the intended assets before rendering, wait for registration to complete, and control platform, pixel ratio, locale, and text scale for goldens | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Fonts/Font-loading-in-tests "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Fonts/Font-loading-in-tests "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Fonts/Font-loading-in-tests "Deep Dive") |

## Questions

- [Where should an application's default font family be assigned?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Where-should-an-application's-default-font-family-be-assigned%3F)
- [How does Flutter choose a face when the requested FontWeight is not bundled?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/How-does-Flutter-choose-a-face-when-the-requested-FontWeight-is-not-bundled%3F)
- [Why should a true italic asset be declared instead of relying on a style request alone?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Why-should-a-true-italic-asset-be-declared-instead-of-relying-on-a-style-request-alone%3F)
- [When does a variable font improve a font bundle, and when are static faces safer?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/When-does-a-variable-font-improve-a-font-bundle%2C-and-when-are-static-faces-safer%3F)
- [How should fallback order cover multiple scripts, emoji, and symbols without changing layout unexpectedly?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/How-should-fallback-order-cover-multiple-scripts%2C-emoji%2C-and-symbols-without-changing-layout-unexpectedly%3F)
- [How are custom font assets associated with a family, weight, and style in pubspec.yaml?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/How-are-custom-font-assets-associated-with-a-family%2C-weight%2C-and-style-in-pubspec.yaml%3F)
- [Why can widget or golden tests render a fallback font even though the application uses the custom font correctly?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Why-can-widget-or-golden-tests-render-a-fallback-font-even-though-the-application-uses-the-custom-font-correctly%3F)
- [Which font metrics can change line wrapping, baselines, clipping, and control height?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Which-font-metrics-can-change-line-wrapping%2C-baselines%2C-clipping%2C-and-control-height%3F)
- [How should typography be verified for localization and large accessibility text scales?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/How-should-typography-be-verified-for-localization-and-large-accessibility-text-scales%3F)

## Best Practices

- [Set application-wide font choices through semantic TextTheme roles](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Set-application-wide-font-choices-through-semantic-TextTheme-roles)
- [Use one stable family name consistently in pubspec.yaml and theme configuration](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Use-one-stable-family-name-consistently-in-pubspec.yaml-and-theme-configuration)
- [Bundle and declare the weights the interface actually requests](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Bundle-and-declare-the-weights-the-interface-actually-requests)
- [Use genuine italic faces and accurate style metadata](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Use-genuine-italic-faces-and-accurate-style-metadata)
- [Keep variable-axis values within the font's documented ranges](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Keep-variable-axis-values-within-the-font's-documented-ranges)
- [Retain a tested static-font strategy when variable-font support is insufficient](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Retain-a-tested-static-font-strategy-when-variable-font-support-is-insufficient)
- [Define deliberate fallback families for every supported writing system](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Define-deliberate-fallback-families-for-every-supported-writing-system)
- [Test mixed scripts, emoji, symbols, and user-generated content for missing glyphs](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Test-mixed-scripts%2C-emoji%2C-symbols%2C-and-user-generated-content-for-missing-glyphs)
- [Verify font licenses permit bundling and distribution](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Verify-font-licenses-permit-bundling-and-distribution)
- [Subset or omit unused faces only after validating all required glyph coverage](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Subset-or-omit-unused-faces-only-after-validating-all-required-glyph-coverage)
- [Load application fonts explicitly before font-sensitive widget and golden assertions](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Load-application-fonts-explicitly-before-font-sensitive-widget-and-golden-assertions)
- [Pin golden-test rendering inputs and review expected platform-specific differences](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Pin-golden-test-rendering-inputs-and-review-expected-platform-specific-differences)
- [Exercise typography with long translations, bidirectional text, and large text scales](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Fonts/Exercise-typography-with-long-translations%2C-bidirectional-text%2C-and-large-text-scales)

[< Back to theming assets & design](../README.md)
