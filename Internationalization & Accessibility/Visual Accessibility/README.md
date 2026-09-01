# Visual Accessibility

Visual accessibility means presenting content and controls so they remain
perceivable and operable across a wide range of vision, reading, and motor
needs. A Flutter interface should adapt to the user's platform preferences
rather than assume one font size, contrast level, animation style, or input
precision. These preferences can change at runtime, so responsive decisions
belong in the widget tree instead of one-time startup configuration.

```text
platform accessibility preferences
              |
              v
      MediaQuery / theme
              |
       +------+-------+--------------+
       |              |              |
       v              v              v
  typography      color/contrast   motion/focus
       |              |              |
       +--------------+--------------+
                      v
        readable, operable UI at every scale
```

Text scaling and dynamic type can make labels occupy substantially more space,
while bold text can change line breaks and visual density. Treat those changes
as layout inputs: let content wrap, avoid fixed-height text containers, and test
large settings with realistic translations. `MediaQuery.textScalerOf(context)`
provides the ambient `TextScaler`; modern scaling can be nonlinear, so code
should not assume that every font size is multiplied by one constant factor.

Visual distinctions must not depend on color alone. Foreground and background
colors need sufficient contrast in normal and high-contrast modes, controls
need comfortably sized hit regions, and keyboard focus needs an indicator that
is visible against every state. Motion should be reduced or replaced when the
platform requests it, without removing essential state changes or feedback.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Visual-Accessibility) — Focused, bite-sized article covering Visual Accessibility
- [Learning Path](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Visual-Accessibility) — Step-by-step material that builds practical Visual Accessibility knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Visual-Accessibility) — Structured, in-depth material for learning about Visual Accessibility thoroughly

## Visual Accessibility Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Text scaling | Layout that remains readable as the user's preferred text size increases | Allow wrapping and reflow; do not clip, overlap, or hide essential text at large scales | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Text-scaling "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Text-scaling "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Text-scaling "Deep Dive") |
| `MediaQuery.textScaler` | The ambient `TextScaler` used by descendants | Read it through `MediaQuery.textScalerOf(context)` and account for nonlinear scaling | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/MediaQuery.textScaler "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/MediaQuery.textScaler "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/MediaQuery.textScaler "Deep Dive") |
| High contrast | Alternate presentation for users requesting stronger visual differentiation | Use `MediaQuery.highContrastOf(context)` where a design needs an explicit high-contrast treatment | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/High-contrast "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/High-contrast "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/High-contrast "Deep Dive") |
| Color contrast | Legibility between text, icons, controls, focus states, and their backgrounds | Test every interaction state and do not communicate meaning through color alone | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Color-contrast "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Color-contrast "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Color-contrast "Deep Dive") |
| Dynamic type | Platform-driven text-size preferences reflected in adaptive Flutter layouts | Preserve the user's chosen size and validate reflow across supported platforms and locales | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Dynamic-type "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Dynamic-type "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Dynamic-type "Deep Dive") |
| Tap target size | A control's complete interactive hit region, which can exceed its painted bounds | Keep neighboring targets distinct and large enough for users with limited pointing precision | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Tap-target-size "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Tap-target-size "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Tap-target-size "Deep Dive") |
| Minimum interactive dimension | Framework and design-system minimums for interactive controls | Treat `kMinInteractiveDimension` and platform equivalents as baselines, not reasons to shrink custom controls | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Minimum-interactive-dimension "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Minimum-interactive-dimension "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Minimum-interactive-dimension "Deep Dive") |
| Focus indicator | A visible cue showing which control currently receives keyboard or switch input | Make focused state distinct from hover, selection, and disabled states in every theme | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Focus-indicator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Focus-indicator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Focus-indicator "Deep Dive") |
| Reduced motion | An alternate experience when the user requests fewer animations | Consult `MediaQuery.disableAnimationsOf(context)` and replace nonessential movement while preserving meaning | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Reduced-motion "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Reduced-motion "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Reduced-motion "Deep Dive") |
| Bold text | A platform preference for heavier, more legible text | Respect `MediaQuery.boldTextOf(context)` and test its effects on width, wrapping, and hierarchy | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Bold-text "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Bold-text "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Bold-text "Deep Dive") |

## Questions

- [How should a layout reflow when text becomes much larger?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/How-should-a-layout-reflow-when-text-becomes-much-larger%3F)
- [Why should code use a `TextScaler` instead of assuming a linear scale factor?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Why-should-code-use-a-TextScaler-instead-of-assuming-a-linear-scale-factor%3F)
- [Which visual treatments should change when high contrast is requested?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Which-visual-treatments-should-change-when-high-contrast-is-requested%3F)
- [How should contrast be evaluated across enabled, disabled, hovered, pressed, and focused states?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/How-should-contrast-be-evaluated-across-enabled%2C-disabled%2C-hovered%2C-pressed%2C-and-focused-states%3F)
- [How do platform text preferences become sizing constraints in a Flutter layout?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/How-do-platform-text-preferences-become-sizing-constraints-in-a-Flutter-layout%3F)
- [Can a tap target be larger than the control's visible artwork?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Can-a-tap-target-be-larger-than-the-control's-visible-artwork%3F)
- [Which minimum interactive dimension applies to the app's design system and target platform?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Which-minimum-interactive-dimension-applies-to-the-app's-design-system-and-target-platform%3F)
- [Can keyboard and switch users always identify the currently focused control?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Can-keyboard-and-switch-users-always-identify-the-currently-focused-control%3F)
- [Which animations can be removed, shortened, or replaced without hiding state changes?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Which-animations-can-be-removed%2C-shortened%2C-or-replaced-without-hiding-state-changes%3F)
- [Does bold text preserve hierarchy without clipping labels or changing control behavior?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Does-bold-text-preserve-hierarchy-without-clipping-labels-or-changing-control-behavior%3F)

## Best Practices

- [Design layouts to wrap and reflow instead of locking text into fixed heights](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Design-layouts-to-wrap-and-reflow-instead-of-locking-text-into-fixed-heights)
- [Use the ambient `TextScaler` and test nonlinear scaling behavior](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Use-the-ambient-TextScaler-and-test-nonlinear-scaling-behavior)
- [Provide a deliberate high-contrast treatment where the default theme is insufficient](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Provide-a-deliberate-high-contrast-treatment-where-the-default-theme-is-insufficient)
- [Check contrast for content, controls, boundaries, and every interaction state](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Check-contrast-for-content%2C-controls%2C-boundaries%2C-and-every-interaction-state)
- [Test dynamic type with long translations and realistic data](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Test-dynamic-type-with-long-translations-and-realistic-data)
- [Make the full interactive region generous without causing targets to overlap](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Make-the-full-interactive-region-generous-without-causing-targets-to-overlap)
- [Keep custom controls at least as operable as the platform and design-system baseline](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Keep-custom-controls-at-least-as-operable-as-the-platform-and-design-system-baseline)
- [Show a persistent, high-contrast focus indicator for keyboard and switch navigation](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Show-a-persistent%2C-high-contrast-focus-indicator-for-keyboard-and-switch-navigation)
- [Honor reduced-motion preferences while retaining essential feedback and orientation](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Honor-reduced-motion-preferences-while-retaining-essential-feedback-and-orientation)
- [Allow bold text to affect typography without breaking layout or obscuring hierarchy](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Allow-bold-text-to-affect-typography-without-breaking-layout-or-obscuring-hierarchy)
- [Verify visual preferences in combination, not only one setting at a time](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Verify-visual-preferences-in-combination%2C-not-only-one-setting-at-a-time)
- [Test on small screens, at large text sizes, in both brightness modes, and with alternate input](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Visual-Accessibility/Test-on-small-screens%2C-at-large-text-sizes%2C-in-both-brightness-modes%2C-and-with-alternate-input)

[< Back to internationalization & accessibility](../README.md)
