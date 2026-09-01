# Cupertino Design

Cupertino design in Flutter combines iOS-styled widgets, semantic theme data,
dynamic system colors, and platform conventions. A convincing iOS experience
depends on more than visual resemblance: typography, navigation hierarchy,
forms, modal presentation, safe areas, gestures, and accessibility behavior
should work together as users expect on Apple platforms.

```text
CupertinoApp / CupertinoTheme
              |
              v
     CupertinoThemeData ------> CupertinoDynamicColor
       |          |                      |
       v          v                      v
 typography   semantic colors <--- current brightness / contrast
       |          |
       +-----+----+
             v
 navigation | form rows | modal patterns
             |
             v
 platform-aware composition and behavior
```

Prefer semantic styling and inherited theme values over copying fixed iOS
colors or dimensions into each widget. Adapt where the platform has a strong
interaction convention, but preserve the product's information architecture,
accessibility, and behavior rather than maintaining two unrelated applications.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Cupertino-Design) — Focused, bite-sized article covering Cupertino Design
- [Learning Path](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Cupertino-Design) — Step-by-step material that builds practical Cupertino Design knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Cupertino-Design) — Structured, in-depth material for learning about Cupertino Design thoroughly

## Cupertino Design Topics

| Topic | Focus | Key considerations | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| CupertinoTheme | Provide an inherited Cupertino theme to a widget subtree | Scope overrides narrowly, obtain values through context, and avoid rebuilding the entire application for local styling changes | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Cupertino-Design/CupertinoTheme "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Cupertino-Design/CupertinoTheme "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Cupertino-Design/CupertinoTheme "Deep Dive") |
| CupertinoThemeData | Define semantic colors, brightness, and Cupertino text styles | Start from coherent theme data, use copy and resolution APIs for variations, and test light and dark appearances | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Cupertino-Design/CupertinoThemeData "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Cupertino-Design/CupertinoThemeData "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Cupertino-Design/CupertinoThemeData "Deep Dive") |
| CupertinoDynamicColor | Resolve a semantic color for the active appearance and accessibility settings | Resolve with the correct context, retain dynamic colors until use where possible, and verify contrast across every variant | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Cupertino-Design/CupertinoDynamicColor "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Cupertino-Design/CupertinoDynamicColor "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Cupertino-Design/CupertinoDynamicColor "Deep Dive") |
| iOS typography | Reproduce readable iOS hierarchy with Cupertino text styles and scalable text | Respect Dynamic Type, avoid fixed text heights, and allow localized or accessibility-sized content to reflow | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-typography "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-typography "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-typography "Deep Dive") |
| iOS navigation | Build hierarchical navigation with iOS bars, titles, back behavior, and transitions | Preserve expected swipe-back behavior, meaningful route history, safe-area handling, and large-title collapse where used | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-navigation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-navigation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-navigation "Deep Dive") |
| iOS form rows | Compose grouped settings and data-entry rows with clear labels and controls | Keep rows accessible at large text sizes, provide sufficient targets and separators, and choose controls that express the value type | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-form-rows "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-form-rows "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-form-rows "Deep Dive") |
| iOS modal patterns | Choose sheets, popovers, alerts, and action sheets according to task and context | Match dismissal semantics to consequence, avoid destructive defaults, preserve focus, and account for compact and regular layouts | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-modal-patterns "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-modal-patterns "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Cupertino-Design/iOS-modal-patterns "Deep Dive") |
| Platform adaptive widgets | Select or compose controls whose presentation and behavior fit the current platform | Adapt intentional platform conventions rather than every pixel, keep shared semantics, and test each supported target directly | [💡](https://app.syntblaze.com/qt/flutter/Theming-Assets-and-Design/Cupertino-Design/Platform-adaptive-widgets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Theming-Assets-and-Design/Cupertino-Design/Platform-adaptive-widgets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Theming-Assets-and-Design/Cupertino-Design/Platform-adaptive-widgets "Deep Dive") |

## Questions

- [Where should CupertinoTheme be placed, and when should a subtree override it?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Where-should-CupertinoTheme-be-placed%2C-and-when-should-a-subtree-override-it%3F)
- [Which values belong in CupertinoThemeData instead of an application design-token layer?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Which-values-belong-in-CupertinoThemeData-instead-of-an-application-design-token-layer%3F)
- [How does a CupertinoDynamicColor choose among light, dark, high-contrast, and elevated variants?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/How-does-a-CupertinoDynamicColor-choose-among-light%2C-dark%2C-high-contrast%2C-and-elevated-variants%3F)
- [When should a dynamic color be explicitly resolved rather than passed through to a Cupertino widget?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/When-should-a-dynamic-color-be-explicitly-resolved-rather-than-passed-through-to-a-Cupertino-widget%3F)
- [How can an iOS typographic hierarchy remain useful when Dynamic Type enlarges text?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/How-can-an-iOS-typographic-hierarchy-remain-useful-when-Dynamic-Type-enlarges-text%3F)
- [Which navigation behaviors make a Flutter route feel native on iOS?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Which-navigation-behaviors-make-a-Flutter-route-feel-native-on-iOS%3F)
- [How should form rows change when labels wrap or controls need more space?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/How-should-form-rows-change-when-labels-wrap-or-controls-need-more-space%3F)
- [When is an action sheet more appropriate than an alert or a modal sheet?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/When-is-an-action-sheet-more-appropriate-than-an-alert-or-a-modal-sheet%3F)
- [Which widgets should adapt by platform, and which should retain a consistent brand expression?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Which-widgets-should-adapt-by-platform%2C-and-which-should-retain-a-consistent-brand-expression%3F)
- [How can shared business behavior remain independent from Material and Cupertino presentation?](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/How-can-shared-business-behavior-remain-independent-from-Material-and-Cupertino-presentation%3F)

## Best Practices

- [Install a coherent Cupertino theme near the application boundary and keep feature overrides local](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Install-a-coherent-Cupertino-theme-near-the-application-boundary-and-keep-feature-overrides-local)
- [Read inherited theme values from context instead of duplicating them as fixed constants](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Read-inherited-theme-values-from-context-instead-of-duplicating-them-as-fixed-constants)
- [Create theme variations from a common CupertinoThemeData foundation](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Create-theme-variations-from-a-common-CupertinoThemeData-foundation)
- [Test every themed surface in light mode, dark mode, increased contrast, and relevant elevation contexts](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Test-every-themed-surface-in-light-mode%2C-dark-mode%2C-increased-contrast%2C-and-relevant-elevation-contexts)
- [Use semantic dynamic colors and verify that foreground and background pairs remain legible](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Use-semantic-dynamic-colors-and-verify-that-foreground-and-background-pairs-remain-legible)
- [Respect Dynamic Type, localization, bold text, and content reflow](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Respect-Dynamic-Type%2C-localization%2C-bold-text%2C-and-content-reflow)
- [Preserve iOS navigation hierarchy, back gestures, title behavior, and safe areas](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Preserve-iOS-navigation-hierarchy%2C-back-gestures%2C-title-behavior%2C-and-safe-areas)
- [Make form rows large enough to operate and flexible enough for accessibility-sized content](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Make-form-rows-large-enough-to-operate-and-flexible-enough-for-accessibility-sized-content)
- [Choose modal patterns by task consequence and make dismissal behavior explicit](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Choose-modal-patterns-by-task-consequence-and-make-dismissal-behavior-explicit)
- [Keep destructive actions clearly labeled, separated, and confirmed when their impact warrants it](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Keep-destructive-actions-clearly-labeled%2C-separated%2C-and-confirmed-when-their-impact-warrants-it)
- [Isolate platform selection from domain logic and expose consistent semantics on every platform](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Isolate-platform-selection-from-domain-logic-and-expose-consistent-semantics-on-every-platform)
- [Test adaptive widgets on real target platforms instead of relying only on a platform override](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Test-adaptive-widgets-on-real-target-platforms-instead-of-relying-only-on-a-platform-override)
- [Prefer native interaction expectations where they materially affect comprehension or control](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Prefer-native-interaction-expectations-where-they-materially-affect-comprehension-or-control)
- [Treat Cupertino fidelity, product identity, and accessibility as complementary constraints](https://app.syntblaze.com/qsp/flutter/Theming-Assets-and-Design/Cupertino-Design/Treat-Cupertino-fidelity%2C-product-identity%2C-and-accessibility-as-complementary-constraints)

[< Back to theming assets & design](../README.md)
