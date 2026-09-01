# Design Systems

A design system turns visual and interaction decisions into a shared language
that Flutter applications can apply consistently. It connects foundational
tokens to semantic roles, component variants, reusable widgets, documented
examples, and automated visual checks.

```text
brand foundations
       |
       v
raw scales -----> semantic design tokens
 spacing              | color | typography | radius | elevation
                      v
              component variants
                      |
                      v
               reusable widgets
                      |
          +-----------+-----------+
          v                       v
   catalog and review       golden coverage
          |                       |
          +-------- feedback -----+
```

Tokens should describe intent rather than scatter literal values throughout
widgets. Raw scales provide a controlled vocabulary, while semantic tokens
express roles such as surface, critical action, or supporting text. Components
then consume those roles so a brand, brightness mode, accessibility setting,
or product variation can change without rewriting every screen.

A design system is also a maintained product. Its catalog should make states,
variants, constraints, and accessibility behavior visible to designers and
engineers. Golden tests can catch unintended rendering changes, but they work
best alongside behavioral and semantic tests and a deliberate review process
for expected visual updates.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Design-Systems) — Focused, bite-sized article covering Design Systems
- [Learning Path](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Design-Systems) — Step-by-step material that builds practical Design Systems knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Design-Systems) — Structured, in-depth material for learning about Design Systems thoroughly

## Design System Topics

| Topic | Focus | Key considerations | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Design tokens | Represent design decisions as named, reusable values with stable meaning | Separate raw values from semantic and component roles; define ownership, naming, versioning, and supported overrides | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Design-Systems/Design-tokens "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Design-Systems/Design-tokens "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Design-Systems/Design-tokens "Deep Dive") |
| Spacing scale | Standardize gaps, padding, and layout rhythm | Use a small coherent scale, allow exceptional values deliberately, and test density and large-text behavior | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Design-Systems/Spacing-scale "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Design-Systems/Spacing-scale "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Design-Systems/Spacing-scale "Deep Dive") |
| Color tokens | Assign semantic color roles independently of literal colors | Provide complete light, dark, high-contrast, and interaction-state mappings with accessible foreground pairs | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Design-Systems/Color-tokens "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Design-Systems/Color-tokens "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Design-Systems/Color-tokens "Deep Dive") |
| Typography scale | Define text roles through size, weight, height, spacing, and family | Design for text scaling, localization, platform rendering, fallback fonts, and readable hierarchy | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Design-Systems/Typography-scale "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Design-Systems/Typography-scale "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Design-Systems/Typography-scale "Deep Dive") |
| Radius scale | Give corners and shapes a consistent visual vocabulary | Match radii to component size and nesting, and avoid arbitrary values that weaken hierarchy | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Design-Systems/Radius-scale "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Design-Systems/Radius-scale "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Design-Systems/Radius-scale "Deep Dive") |
| Elevation scale | Express layering and emphasis consistently | Coordinate shadow, tonal surface treatment, overlays, and stacking semantics across brightness modes | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Design-Systems/Elevation-scale "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Design-Systems/Elevation-scale "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Design-Systems/Elevation-scale "Deep Dive") |
| Component variants | Encode supported visual and behavioral alternatives for a component | Name variants by purpose, define every state, keep APIs finite, and avoid screen-specific styling flags | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Design-Systems/Component-variants "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Design-Systems/Component-variants "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Design-Systems/Component-variants "Deep Dive") |
| Reusable widgets | Package recurring composition, behavior, semantics, and theming | Prefer focused composition over wrappers with sprawling parameters; preserve accessibility and Flutter conventions | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Design-Systems/Reusable-widgets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Design-Systems/Reusable-widgets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Design-Systems/Reusable-widgets "Deep Dive") |
| Storybook-style catalog | Present components and tokens in isolated, searchable scenarios | Cover themes, sizes, locales, text scales, states, and interactions with deterministic representative data | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Design-Systems/Storybook-style-catalog "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Design-Systems/Storybook-style-catalog "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Design-Systems/Storybook-style-catalog "Deep Dive") |
| Golden coverage | Detect unintended visual changes through image comparisons | Choose stable, high-value scenarios; control fonts and rendering; review diffs instead of updating baselines blindly | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Design-Systems/Golden-coverage "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Design-Systems/Golden-coverage "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Design-Systems/Golden-coverage "Deep Dive") |

## Questions

- [How should raw, semantic, and component tokens relate to one another?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/How-should-raw%2C-semantic%2C-and-component-tokens-relate-to-one-another%3F)
- [When is a one-off spacing value justified outside the standard scale?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/When-is-a-one-off-spacing-value-justified-outside-the-standard-scale%3F)
- [How should color tokens preserve contrast across light, dark, and high-contrast themes?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/How-should-color-tokens-preserve-contrast-across-light%2C-dark%2C-and-high-contrast-themes%3F)
- [Which typography properties belong in each named text role?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Which-typography-properties-belong-in-each-named-text-role%3F)
- [How should nested surfaces coordinate their corner radii?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/How-should-nested-surfaces-coordinate-their-corner-radii%3F)
- [When should depth use shadow, tonal color, an overlay, or no visual effect?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/When-should-depth-use-shadow%2C-tonal-color%2C-an-overlay%2C-or-no-visual-effect%3F)
- [When does a component difference deserve a named variant rather than a configuration flag?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/When-does-a-component-difference-deserve-a-named-variant-rather-than-a-configuration-flag%3F)
- [Which responsibilities belong inside a reusable design-system widget?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Which-responsibilities-belong-inside-a-reusable-design-system-widget%3F)
- [Which states and environmental variations should a component catalog expose?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Which-states-and-environmental-variations-should-a-component-catalog-expose%3F)
- [Which components and states provide the highest-value golden coverage?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Which-components-and-states-provide-the-highest-value-golden-coverage%3F)
- [How can a design-system change be rolled out without silently changing every product surface?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/How-can-a-design-system-change-be-rolled-out-without-silently-changing-every-product-surface%3F)
- [How should designers and engineers govern token and component deprecations?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/How-should-designers-and-engineers-govern-token-and-component-deprecations%3F)

## Best Practices

- [Use semantic names that communicate purpose instead of embedding literal values](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Use-semantic-names-that-communicate-purpose-instead-of-embedding-literal-values)
- [Keep token layers explicit and expose supported overrides through typed APIs](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Keep-token-layers-explicit-and-expose-supported-overrides-through-typed-APIs)
- [Build spacing from a limited scale and document intentional exceptions](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Build-spacing-from-a-limited-scale-and-document-intentional-exceptions)
- [Pair semantic background and foreground colors and verify their contrast](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Pair-semantic-background-and-foreground-colors-and-verify-their-contrast)
- [Test typography with large text, long translations, and font fallback](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Test-typography-with-large-text%2C-long-translations%2C-and-font-fallback)
- [Apply radius and elevation scales consistently to communicate containment and depth](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Apply-radius-and-elevation-scales-consistently-to-communicate-containment-and-depth)
- [Define default, hovered, focused, pressed, selected, disabled, loading, and error states where relevant](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Define-default%2C-hovered%2C-focused%2C-pressed%2C-selected%2C-disabled%2C-loading%2C-and-error-states-where-relevant)
- [Keep reusable widgets composable, accessible, and aligned with familiar Flutter APIs](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Keep-reusable-widgets-composable%2C-accessible%2C-and-aligned-with-familiar-Flutter-APIs)
- [Make catalog scenarios deterministic and easy to compare across themes and viewports](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Make-catalog-scenarios-deterministic-and-easy-to-compare-across-themes-and-viewports)
- [Use golden tests for stable visual contracts and behavioral tests for interaction and semantics](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Use-golden-tests-for-stable-visual-contracts-and-behavioral-tests-for-interaction-and-semantics)
- [Review golden diffs as product changes rather than treating baseline regeneration as routine](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Review-golden-diffs-as-product-changes-rather-than-treating-baseline-regeneration-as-routine)
- [Give tokens and components clear owners, documentation, migration notes, and deprecation paths](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Give-tokens-and-components-clear-owners%2C-documentation%2C-migration-notes%2C-and-deprecation-paths)
- [Measure adoption and remove duplicate local styling as the system matures](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Measure-adoption-and-remove-duplicate-local-styling-as-the-system-matures)
- [Validate design-system releases in representative applications before broad rollout](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Design-Systems/Validate-design-system-releases-in-representative-applications-before-broad-rollout)

[< Back to theming assets & design](../README.md)
