# Responsive Layout

Responsive layout changes a composition according to the space available to a
widget, while adaptive layout also changes structure or interaction patterns to
fit the platform, input method, or device capabilities. In Flutter, these
decisions should usually begin with local constraints from `LayoutBuilder` and
use environmental data from `MediaQuery` only when the decision genuinely
depends on the view as a whole.

```text
platform view
    |
    +---- size / orientation / text scale
    +---- padding / viewPadding / viewInsets
    +---- display features (hinges, folds, cutouts)
    |
    v
MediaQuery ------------------------------+
                                         |
parent constraints -> LayoutBuilder -----+----> choose composition
                                         |          |
                                         |          +-- compact
                                         |          +-- medium
                                         |          +-- expanded
                                         |
                                         +----> protect usable regions
                                                    |
                                                    +-- SafeArea
                                                    +-- keyboard inset
                                                    +-- foldable panes
```

Breakpoints are thresholds where the content or interaction model benefits
from a different composition. They should describe available space, not assume
a named phone, tablet, or desktop. A reusable component should react to the
constraints its parent actually gives it; a screen-level shell can additionally
consider view size, orientation, display features, and platform conventions.

System-obscured space has several meanings. `MediaQueryData.padding` describes
currently unobstructed system padding, `viewPadding` describes persistent
physical intrusions even when other UI overlaps them, and `viewInsets`
describes areas completely obscured by system UI such as an onscreen keyboard.
`SafeArea` consumes the relevant padding for its child, so nested consumers
must reason about the adjusted `MediaQuery` rather than repeatedly adding the
same inset.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout) — Focused, bite-sized article covering Responsive Layout
- [Learning Path](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout) — Step-by-step material that builds practical Responsive Layout knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout) — Structured, in-depth material for learning about Responsive Layout thoroughly

## Responsive Layout Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `MediaQuery` | Read view-wide dimensions, accessibility settings, system insets, and display features | Select the narrowest aspect needed so unrelated environmental changes do not rebuild too much UI | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/MediaQuery "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/MediaQuery "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/MediaQuery "Deep Dive") |
| `LayoutBuilder` | Build from the constraints supplied by the immediate parent | Prefer it for component-level decisions because view width may differ from the space the component receives | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/LayoutBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/LayoutBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/LayoutBuilder "Deep Dive") |
| `OrientationBuilder` | Choose UI using the orientation implied by local constraints | Orientation alone loses useful width and height information; use it only when the two-state distinction expresses the design | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/OrientationBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/OrientationBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/OrientationBuilder "Deep Dive") |
| Breakpoints | Define thresholds where a layout changes composition | Derive thresholds from content needs and test the boundary values, not only common device widths | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/Breakpoints "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/Breakpoints "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/Breakpoints "Deep Dive") |
| Adaptive layout | Change structure or behavior for available capabilities and conventions | Preserve task continuity and information hierarchy when navigation or interaction patterns change | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/Adaptive-layout "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/Adaptive-layout "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/Adaptive-layout "Deep Dive") |
| Responsive layout | Reflow, resize, reveal, or hide content as available space changes | Respond to usable constraints and content pressure rather than scaling the entire interface uniformly | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/Responsive-layout "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/Responsive-layout "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/Responsive-layout "Deep Dive") |
| `SafeArea` | Keep content outside selected system intrusions | Apply it at the correct boundary and avoid restoring padding that an ancestor has already consumed | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/SafeArea "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/SafeArea "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/SafeArea "Deep Dive") |
| ViewPadding | Represent persistent system padding around the physical view | Use `MediaQueryData.viewPadding` when the original intrusion matters even while transient UI changes ordinary padding | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/ViewPadding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/ViewPadding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/ViewPadding "Deep Dive") |
| ViewInsets | Represent view regions fully obscured by system UI | The bottom `viewInsets` commonly tracks the keyboard, but code should treat every edge deliberately | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/ViewInsets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/ViewInsets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/ViewInsets "Deep Dive") |
| Keyboard inset | Adapt focused content when the onscreen keyboard obscures part of the view | Keep the focused control reachable without applying the inset twice or shifting unrelated chrome unnecessarily | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/Keyboard-inset "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/Keyboard-inset "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/Keyboard-inset "Deep Dive") |
| Display features | Describe folds, hinges, cutouts, and other sub-screen boundaries | Partition content using feature bounds and state rather than assuming one continuous rectangular canvas | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/Display-features "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/Display-features "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/Display-features "Deep Dive") |
| Foldables | Compose layouts across one or more usable regions of a folding display | Avoid placing primary content or controls across a hinge and preserve state as posture changes | [💡](https://app.syntblaze.com/qt/flutter/Layout-Constraints/Responsive-Layout/Foldables "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Layout-Constraints/Responsive-Layout/Foldables "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Layout-Constraints/Responsive-Layout/Foldables "Deep Dive") |

## Questions

- [Does this decision depend on the whole view or only the constraints of one component?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Does-this-decision-depend-on-the-whole-view-or-only-the-constraints-of-one-component%3F)
- [Which `MediaQuery` aspect does the subtree actually need?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Which-MediaQuery-aspect-does-the-subtree-actually-need%3F)
- [Would width classes communicate the design better than portrait versus landscape?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Would-width-classes-communicate-the-design-better-than-portrait-versus-landscape%3F)
- [At what content pressure does the current composition stop working?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/At-what-content-pressure-does-the-current-composition-stop-working%3F)
- [Which parts should reflow, resize, relocate, reveal, or disappear at each width?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Which-parts-should-reflow%2C-resize%2C-relocate%2C-reveal%2C-or-disappear-at-each-width%3F)
- [Does adaptation reflect platform and input conventions without creating inconsistent behavior?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Does-adaptation-reflect-platform-and-input-conventions-without-creating-inconsistent-behavior%3F)
- [Which ancestor owns protection from system padding?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Which-ancestor-owns-protection-from-system-padding%3F)
- [Does the layout need current unobstructed padding, persistent view padding, or fully obscured insets?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Does-the-layout-need-current-unobstructed-padding%2C-persistent-view-padding%2C-or-fully-obscured-insets%3F)
- [Can focused content remain visible and scrollable while the keyboard is open?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Can-focused-content-remain-visible-and-scrollable-while-the-keyboard-is-open%3F)
- [Will keyboard avoidance and scaffold resizing apply the same bottom inset twice?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Will-keyboard-avoidance-and-scaffold-resizing-apply-the-same-bottom-inset-twice%3F)
- [How should a hinge, fold, or cutout divide the available content regions?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/How-should-a-hinge%2C-fold%2C-or-cutout-divide-the-available-content-regions%3F)
- [Does state, focus, and scroll position survive rotation, resizing, and posture changes?](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Does-state%2C-focus%2C-and-scroll-position-survive-rotation%2C-resizing%2C-and-posture-changes%3F)

## Best Practices

- [Base reusable component layout on local constraints from `LayoutBuilder`](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Base-reusable-component-layout-on-local-constraints-from-LayoutBuilder)
- [Use `MediaQuery` for view environment data rather than as a substitute for parent constraints](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Use-MediaQuery-for-view-environment-data-rather-than-as-a-substitute-for-parent-constraints)
- [Read only the environmental aspect needed by a subtree when practical](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Read-only-the-environmental-aspect-needed-by-a-subtree-when-practical)
- [Choose breakpoints where content requires a structural change](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Choose-breakpoints-where-content-requires-a-structural-change)
- [Name width classes by layout intent and keep their thresholds centralized](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Name-width-classes-by-layout-intent-and-keep-their-thresholds-centralized)
- [Preserve content priority instead of uniformly scaling the complete interface](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Preserve-content-priority-instead-of-uniformly-scaling-the-complete-interface)
- [Keep adaptive navigation and interaction changes predictable across configurations](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Keep-adaptive-navigation-and-interaction-changes-predictable-across-configurations)
- [Apply `SafeArea` at deliberate screen or region boundaries](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Apply-SafeArea-at-deliberate-screen-or-region-boundaries)
- [Distinguish `padding`, `viewPadding`, and `viewInsets` before adding edge spacing](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Distinguish-padding%2C-viewPadding%2C-and-viewInsets-before-adding-edge-spacing)
- [Make focused fields reachable through scrolling when the keyboard reduces usable space](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Make-focused-fields-reachable-through-scrolling-when-the-keyboard-reduces-usable-space)
- [Treat display-feature bounds as unavailable or separating space according to their type and state](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Treat-display-feature-bounds-as-unavailable-or-separating-space-according-to-their-type-and-state)
- [Keep important controls and reading flow away from hinges and folds](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Keep-important-controls-and-reading-flow-away-from-hinges-and-folds)
- [Test intermediate sizes, breakpoint edges, split-screen windows, large text, keyboards, and rotation](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Test-intermediate-sizes%2C-breakpoint-edges%2C-split-screen-windows%2C-large-text%2C-keyboards%2C-and-rotation)
- [Preserve state and focus when rebuilding a different responsive composition](https://app.syntblaze.com/qsp/flutter/Layout-Constraints/Responsive-Layout/Preserve-state-and-focus-when-rebuilding-a-different-responsive-composition)

[< Back to layout constraints](../README.md)
