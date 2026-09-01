# Material Design

Material Design gives Flutter applications a shared visual language for color,
type, shape, elevation, motion, and interactive states. Flutter can render both
Material 2 and Material 3 interfaces, but an application should choose its
design baseline deliberately and centralize that choice in its theme rather
than styling each widget independently.

```text
brand inputs + accessibility requirements
                  |
                  v
          seed and semantic colors
                  |
                  v
       ColorScheme + typography + shape
                  |
                  v
       elevation + motion + state layers
                  |
                  v
       Material component theme defaults
                  |
                  v
       consistent, adaptive application UI
```

Material 3 is Flutter's current Material design system and uses a broader set
of semantic color roles, updated components, and optional color generation
from a seed. Material 2 remains relevant when maintaining an older product or
matching an established design system. Treat migration as a visual and
behavioral change: verify component defaults, spacing, typography, states, and
goldens instead of assuming that switching a flag is sufficient.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design) — Focused, bite-sized article covering Material Design
- [Learning Path](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design) — Step-by-step material that builds practical Material Design knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design) — Structured, in-depth material for learning about Material Design thoroughly

## Material Design Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Material 2 | The earlier Material component styles and theme defaults | Keep it only when product requirements or migration constraints justify its older colors, typography, and component behavior | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Material-2 "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Material-2 "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Material-2 "Deep Dive") |
| Material 3 | The current Material system implemented by Flutter's Material widgets | Audit updated components, semantic roles, sizes, states, and defaults when adopting or migrating | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Material-3 "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Material-3 "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Material-3 "Deep Dive") |
| Dynamic color | A color scheme derived from platform or user-selected system colors | Provide a deterministic fallback and preserve contrast and brand intent when a dynamic palette is unavailable | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Dynamic-color "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Dynamic-color "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Dynamic-color "Deep Dive") |
| Seed color | An input color used to generate a coordinated `ColorScheme` | Evaluate the generated light and dark schemes rather than treating the seed itself as the primary role | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Seed-color "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Seed-color "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Seed-color "Deep Dive") |
| Surface color | Semantic backgrounds for components, containers, and elevation treatments | Use surface roles and containers by purpose so content contrast and hierarchy remain consistent | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Surface-color "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Surface-color "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Surface-color "Deep Dive") |
| Primary color | A prominent semantic role for key components and emphasis | Prefer `ColorScheme` roles over scattering a brand swatch or legacy `primaryColor` through widget code | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Primary-color "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Primary-color "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Primary-color "Deep Dive") |
| Secondary color | A supporting accent role used selectively beside the primary family | Assign it by semantic purpose and verify that it does not compete with primary actions | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Secondary-color "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Secondary-color "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Secondary-color "Deep Dive") |
| Error color | Semantic roles for errors, destructive states, and content placed on them | Communicate errors with text or iconography as well as color and validate every on-error contrast pair | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Error-color "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Error-color "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Error-color "Deep Dive") |
| Elevation | Perceived hierarchy expressed through shadows and Material 3 tonal overlays | Use a small tokenized scale and test its appearance in both light and dark color schemes | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Elevation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Elevation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Elevation "Deep Dive") |
| Shape | Corner, border, and outline treatments that establish component character | Define reusable shape tokens and keep interaction bounds, clipping, and focus indicators aligned | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Shape "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Shape "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Shape "Deep Dive") |
| Typography | Semantic text roles, sizes, weights, line heights, and letter spacing | Map product type tokens to `TextTheme`, account for text scaling, and verify font fallback | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Typography "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Typography "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Typography "Deep Dive") |
| Motion | Transitions and state changes that explain spatial and interaction relationships | Keep animation purposeful, consistent, interruptible, and respectful of reduced-motion preferences | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/Motion "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/Motion "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/Motion "Deep Dive") |
| State layers | Visual overlays for hover, focus, press, drag, and selection states | Derive state feedback from semantic colors and test keyboard, mouse, touch, and accessibility interactions | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Material-Design/State-layers "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Material-Design/State-layers "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Material-Design/State-layers "Deep Dive") |

## Questions

- [What visual and behavioral defaults change when an application moves from Material 2 to Material 3?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/What-visual-and-behavioral-defaults-change-when-an-application-moves-from-Material-2-to-Material-3%3F)
- [When should an established application remain on Material 2 during a staged migration?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/When-should-an-established-application-remain-on-Material-2-during-a-staged-migration%3F)
- [How should platform dynamic colors and a product's brand palette be reconciled?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/How-should-platform-dynamic-colors-and-a-product's-brand-palette-be-reconciled%3F)
- [What does `ColorScheme.fromSeed` generate, and which roles still need product review?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/What-does-ColorScheme.fromSeed-generate%2C-and-which-roles-still-need-product-review%3F)
- [Which surface and surface-container role communicates the intended hierarchy?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Which-surface-and-surface-container-role-communicates-the-intended-hierarchy%3F)
- [When should a component use primary rather than secondary emphasis?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/When-should-a-component-use-primary-rather-than-secondary-emphasis%3F)
- [How should secondary colors support the palette without creating competing calls to action?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/How-should-secondary-colors-support-the-palette-without-creating-competing-calls-to-action%3F)
- [How can an error remain understandable without relying on red alone?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/How-can-an-error-remain-understandable-without-relying-on-red-alone%3F)
- [How do tonal elevation and shadow elevation differ across light and dark themes?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/How-do-tonal-elevation-and-shadow-elevation-differ-across-light-and-dark-themes%3F)
- [Which shape values should become shared tokens rather than component-specific literals?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Which-shape-values-should-become-shared-tokens-rather-than-component-specific-literals%3F)
- [How should type roles behave under large accessibility text scales and font fallback?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/How-should-type-roles-behave-under-large-accessibility-text-scales-and-font-fallback%3F)
- [Which transitions add useful continuity, and which merely delay interaction?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Which-transitions-add-useful-continuity%2C-and-which-merely-delay-interaction%3F)
- [How should hover, focus, pressed, dragged, and selected states remain distinguishable?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/How-should-hover%2C-focus%2C-pressed%2C-dragged%2C-and-selected-states-remain-distinguishable%3F)
- [How can a team detect unintended theme-default changes after a Flutter upgrade?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/How-can-a-team-detect-unintended-theme-default-changes-after-a-Flutter-upgrade%3F)

## Best Practices

- [Choose Material 2 or Material 3 explicitly and document the migration boundary](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Choose-Material-2-or-Material-3-explicitly-and-document-the-migration-boundary)
- [Build application colors from semantic `ColorScheme` roles](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Build-application-colors-from-semantic-ColorScheme-roles)
- [Provide reviewed light, dark, high-contrast, and non-dynamic fallbacks where required](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Provide-reviewed-light%2C-dark%2C-high-contrast%2C-and-non-dynamic-fallbacks-where-required)
- [Use primary and secondary roles according to purpose rather than visual preference](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Use-primary-and-secondary-roles-according-to-purpose-rather-than-visual-preference)
- [Keep surfaces hierarchical and verify foreground contrast for every paired role](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Keep-surfaces-hierarchical-and-verify-foreground-contrast-for-every-paired-role)
- [Never use error color as the only indication of failure](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Never-use-error-color-as-the-only-indication-of-failure)
- [Tokenize elevation and shape so component families remain coherent](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Tokenize-elevation-and-shape-so-component-families-remain-coherent)
- [Map typography to semantic roles and test text scaling on constrained layouts](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Map-typography-to-semantic-roles-and-test-text-scaling-on-constrained-layouts)
- [Use motion to preserve context, keep durations consistent, and support reduced motion](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Use-motion-to-preserve-context%2C-keep-durations-consistent%2C-and-support-reduced-motion)
- [Test state layers with touch, mouse, keyboard, and assistive technology](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Test-state-layers-with-touch%2C-mouse%2C-keyboard%2C-and-assistive-technology)
- [Prefer component theme configuration over repeated widget-level styling](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Prefer-component-theme-configuration-over-repeated-widget-level-styling)
- [Add golden and interaction coverage before changing Material versions or generated palettes](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Add-golden-and-interaction-coverage-before-changing-Material-versions-or-generated-palettes)
- [Review release builds on every supported platform because fonts, shadows, and system colors can differ](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Material-Design/Review-release-builds-on-every-supported-platform-because-fonts%2C-shadows%2C-and-system-colors-can-differ)

[< Back to theming assets & design](../README.md)
