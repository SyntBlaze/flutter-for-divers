# Text Direction

Text direction determines how Flutter lays out text and resolves directional
geometry. Left-to-right (LTR) interfaces typically place the logical start on
the left, while right-to-left (RTL) interfaces place it on the right. A
`Directionality` ancestor supplies that context to widgets below it, and
localization-aware application widgets normally provide the direction from the
active locale.

```text
active locale
     |
     v
TextDirection.ltr or TextDirection.rtl
     |
     v
Directionality
     |
     +----> text shaping and bidirectional layout
     +----> start/end geometry resolution
     +----> directional alignment and borders
     +----> selected directional icon mirroring
```

Direction is more than reversing a row. Text can contain LTR and RTL runs in a
single paragraph, so Flutter's text engine applies the Unicode bidirectional
algorithm using the paragraph direction as context. Layout values expressed as
`start` and `end` resolve against that same context. This lets one widget tree
adapt naturally without scattering locale checks throughout the interface.

Directional behavior should express meaning rather than physical coordinates.
Use directional padding, alignment, and border radii when a value means
“leading” or “trailing”; keep physical `left` and `right` APIs only when the
position is genuinely fixed. Mirror icons that communicate direction, such as
back and forward, but do not mirror symbols whose shape has an intrinsic or
widely recognized meaning.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Text-Direction) — Focused, bite-sized article covering Text Direction
- [Learning Path](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Text-Direction) — Step-by-step material that builds practical Text Direction knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Text-Direction) — Structured, in-depth material for learning about Text Direction thoroughly

## Text Direction Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Directionality` | Provides a `TextDirection` to a widget subtree | Read the inherited direction at the point where geometry or text is resolved, and ensure isolated test trees provide one | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Text-Direction/Directionality "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Text-Direction/Directionality "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Text-Direction/Directionality "Deep Dive") |
| `TextDirection.ltr` | Establishes a paragraph and layout context that starts on the left | Use it when the content or locale is LTR, not as a universal default that overrides localized direction | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Text-Direction/TextDirection.ltr "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Text-Direction/TextDirection.ltr "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Text-Direction/TextDirection.ltr "Deep Dive") |
| `TextDirection.rtl` | Establishes a paragraph and layout context that starts on the right | Test the whole interface in RTL because ordering, alignment, padding, and navigation cues can all change | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Text-Direction/TextDirection.rtl "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Text-Direction/TextDirection.rtl "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Text-Direction/TextDirection.rtl "Deep Dive") |
| Bidirectional text | Lays out mixed LTR and RTL runs within one paragraph | Preserve correct paragraph context and isolate interpolated user content when its direction can differ | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Text-Direction/Bidirectional-text "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Text-Direction/Bidirectional-text "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Text-Direction/Bidirectional-text "Deep Dive") |
| `EdgeInsetsDirectional` | Defines padding or margins with start and end edges | Resolve it with the ambient direction and use physical insets only for physically fixed edges | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Text-Direction/EdgeInsetsDirectional "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Text-Direction/EdgeInsetsDirectional "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Text-Direction/EdgeInsetsDirectional "Deep Dive") |
| `AlignmentDirectional` | Positions a child using start and end rather than left and right | Prefer it when alignment follows reading direction, especially for labels, controls, and overlays | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Text-Direction/AlignmentDirectional "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Text-Direction/AlignmentDirectional "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Text-Direction/AlignmentDirectional "Deep Dive") |
| `BorderRadiusDirectional` | Assigns corner radii to logical start and end sides | Use it for direction-aware shapes and verify asymmetric components in both directions | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Text-Direction/BorderRadiusDirectional "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Text-Direction/BorderRadiusDirectional "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Text-Direction/BorderRadiusDirectional "Deep Dive") |
| Start and end alignment | Models leading and trailing positions across layout APIs | Keep logical ordering consistent across visuals, focus traversal, semantics, and gestures | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Text-Direction/Start-and-end-alignment "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Text-Direction/Start-and-end-alignment "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Text-Direction/Start-and-end-alignment "Deep Dive") |
| Mirroring icons | Flips directional glyphs when the reading direction changes | Mirror navigation and progression cues selectively; leave logos, clocks, media controls, and other intrinsic symbols unchanged | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Text-Direction/Mirroring-icons "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Text-Direction/Mirroring-icons "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Text-Direction/Mirroring-icons "Deep Dive") |

## Questions

- [Where does a widget obtain its ambient text direction?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Where-does-a-widget-obtain-its-ambient-text-direction%3F)
- [When should a subtree explicitly use `TextDirection.ltr`?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/When-should-a-subtree-explicitly-use-TextDirection.ltr%3F)
- [What changes when an application is rendered with `TextDirection.rtl`?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/What-changes-when-an-application-is-rendered-with-TextDirection.rtl%3F)
- [How are Latin text, Arabic or Hebrew text, numbers, and punctuation ordered in one paragraph?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/How-are-Latin-text%2C-Arabic-or-Hebrew-text%2C-numbers%2C-and-punctuation-ordered-in-one-paragraph%3F)
- [When should spacing use `EdgeInsetsDirectional` instead of `EdgeInsets`?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/When-should-spacing-use-EdgeInsetsDirectional-instead-of-EdgeInsets%3F)
- [How does `AlignmentDirectional` resolve start and end positions?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/How-does-AlignmentDirectional-resolve-start-and-end-positions%3F)
- [How can an asymmetric shape adapt with `BorderRadiusDirectional`?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/How-can-an-asymmetric-shape-adapt-with-BorderRadiusDirectional%3F)
- [Which layout decisions should follow logical start and end rather than physical left and right?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Which-layout-decisions-should-follow-logical-start-and-end-rather-than-physical-left-and-right%3F)
- [Which icons should mirror in RTL, and which should retain their original shape?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Which-icons-should-mirror-in-RTL%2C-and-which-should-retain-their-original-shape%3F)

## Best Practices

- [Let the localized application establish the primary `Directionality`](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Let-the-localized-application-establish-the-primary-Directionality)
- [Override direction only for content or subtrees with a known directional requirement](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Override-direction-only-for-content-or-subtrees-with-a-known-directional-requirement)
- [Exercise complete screens under RTL instead of checking text alignment alone](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Exercise-complete-screens-under-RTL-instead-of-checking-text-alignment-alone)
- [Test mixed-script strings, numbers, punctuation, and interpolated user content](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Test-mixed-script-strings%2C-numbers%2C-punctuation%2C-and-interpolated-user-content)
- [Use directional insets when spacing represents leading and trailing edges](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Use-directional-insets-when-spacing-represents-leading-and-trailing-edges)
- [Use directional alignment when placement should follow reading order](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Use-directional-alignment-when-placement-should-follow-reading-order)
- [Model asymmetric logical corners with directional border radii](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Model-asymmetric-logical-corners-with-directional-border-radii)
- [Keep visual order, reading order, focus order, and semantic order coherent](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Keep-visual-order%2C-reading-order%2C-focus-order%2C-and-semantic-order-coherent)
- [Mirror only icons whose meaning depends on direction](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Mirror-only-icons-whose-meaning-depends-on-direction)
- [Include LTR and RTL locales in widget, golden, and accessibility tests](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Text-Direction/Include-LTR-and-RTL-locales-in-widget%2C-golden%2C-and-accessibility-tests)

[< Back to internationalization & accessibility](../README.md)
