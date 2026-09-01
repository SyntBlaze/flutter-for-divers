# Basics

Basic widgets form the vocabulary of a Flutter interface. They establish the
application shell, display text and imagery, and compose children through box,
flex, and stack layout. Most screens combine a small number of structural
widgets with focused leaf widgets rather than relying on one deeply configured
container.

```text
Application root
      |
      v
Platform shell and page structure
      |
      v
Constraint-based composition
      |
      +--> Row / Column / Stack
      |
      v
Text, icons, images, and other leaves
```

Flutter layout flows down as constraints, chooses sizes on the way back up, and
then assigns positions. Consequently, choose a layout widget for the
relationship between children: use `Row` or `Column` for a linear arrangement,
`Stack` for overlap, and `Align`, `Center`, or `SizedBox` when a single child's
position or extent is the concern. Add `Expanded`, `Flexible`, or `Spacer` only
inside a flex layout and only when remaining main-axis space must be allocated.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Widgets/Basics) — Focused, bite-sized article covering Basics
- [Learning Path](https://app.syntblaze.com/lt/flutter/Widgets/Basics) — Step-by-step material that builds practical Basics knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Widgets/Basics) — Structured, in-depth material for learning about Basics thoroughly

## Selection and Composition Guidance

Begin with the application wrapper that matches the product: `MaterialApp` for
Material conventions, `CupertinoApp` for an iOS-style experience, or
`WidgetsApp` when higher-level design-system behavior is intentionally being
built from lower-level primitives. A typical Material screen then uses
`Scaffold` and, when appropriate, `AppBar`. Treat the general idea of the app as
the root of ownership for navigation, localization, theming, and restoration,
not as a place for feature state.

Prefer the narrowest widget that communicates intent. Use `Text` for ordinary
copy and `RichText` only when spans need independently controlled styling or
interaction. Use `Icon` for glyphs from an icon font, `Image` for decoded image
content, and reserve `Placeholder` and `FlutterLogo` for development or
branding-specific needs. `Container` is convenient when several paint, sizing,
alignment, or padding concerns coincide; otherwise a focused widget such as
`SizedBox`, `Align`, or `Center` keeps the constraint story clearer.

For flex layouts, remember that `Expanded` requires its child to fill its
allocated share, `Flexible` allows the child to be smaller, and `Spacer`
consumes a proportional gap. Use `Builder` to obtain a `BuildContext` below a
new tree boundary and `StatefulBuilder` for small, localized mutable regions;
move substantial state and lifecycle ownership into a dedicated
`StatefulWidget`.

## Widgets

| Widget | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `App` | The application's root composition and ownership boundary | Keep global configuration at the root while feature state remains near its consumers | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/App "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/App "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/App "Deep Dive") |
| `MaterialApp` | A Material Design application with theme, routing, localization, and navigator defaults | Avoid nesting full application wrappers when a `Theme` or nested `Navigator` is the actual need | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/MaterialApp "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/MaterialApp "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/MaterialApp "Deep Dive") |
| `CupertinoApp` | An iOS-style application with Cupertino theming, routing, and navigation defaults | Use it when Cupertino conventions define the whole application experience | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/CupertinoApp "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/CupertinoApp "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/CupertinoApp "Deep Dive") |
| `WidgetsApp` | A low-level application shell providing core navigation, localization, and text-direction services | It omits Material and Cupertino conveniences, so higher-level behavior must be supplied deliberately | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/WidgetsApp "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/WidgetsApp "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/WidgetsApp "Deep Dive") |
| `Scaffold` | The standard Material page structure for bars, body content, drawers, sheets, and action buttons | Coordinate insets, snack bars, and page-level surfaces through the nearest scaffold | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Scaffold "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Scaffold "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Scaffold "Deep Dive") |
| `AppBar` | A Material top app bar with leading, title, actions, and flexible bottom content | Account for navigation semantics, safe areas, and available horizontal space | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/AppBar "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/AppBar "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/AppBar "Deep Dive") |
| `Text` | Styled text rendered from a single string | Let inherited text style and text scaling work unless the design requires an explicit override | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Text "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Text "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Text "Deep Dive") |
| `RichText` | Text assembled from a tree of independently styled `InlineSpan` objects | Provide appropriate semantics and text scaling because it bypasses some `Text` conveniences | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/RichText "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/RichText "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/RichText "Deep Dive") |
| `Icon` | A glyph drawn from an `IconData` source using the ambient icon theme | Add a semantic label when the icon conveys meaning without adjacent text | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Icon "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Icon "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Icon "Deep Dive") |
| `Image` | Display of an image supplied by an asset, network, file, memory, or custom provider | Reserve dimensions, choose a fit intentionally, and expose meaningful semantics | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Image "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Image "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Image "Deep Dive") |
| `FlutterLogo` | Flutter's logo rendered at a configurable size and style | Use it only where Flutter branding is appropriate and follow branding guidance | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/FlutterLogo "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/FlutterLogo "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/FlutterLogo "Deep Dive") |
| `Placeholder` | A crossed-box visual used to mark unfinished regions during development | Replace it before release and constrain it so it cannot expand unexpectedly | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Placeholder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Placeholder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Placeholder "Deep Dive") |
| `Container` | A convenience composition for alignment, padding, constraints, decoration, and transforms | Its size and behavior depend on which properties and constraints are present | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Container "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Container "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Container "Deep Dive") |
| `SizedBox` | A box that imposes a fixed, bounded, expanded, or empty extent | Fixed dimensions must still tolerate text scaling and changing parent constraints | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/SizedBox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/SizedBox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/SizedBox "Deep Dive") |
| `Center` | A single-child box that centers its child within available space | It expands when bounded, so verify the constraints supplied by its parent | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Center "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Center "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Center "Deep Dive") |
| `Align` | A single-child box that positions its child at an alignment | `widthFactor` and `heightFactor` change how the box sizes itself around the child | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Align "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Align "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Align "Deep Dive") |
| `Row` | Horizontal flex layout for multiple children | Non-flex children are measured before remaining width is divided among flex children | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Row "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Row "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Row "Deep Dive") |
| `Column` | Vertical flex layout for multiple children | Do not place it in unbounded vertical space with nonzero-flex children | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Column "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Column "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Column "Deep Dive") |
| `Stack` | Layered layout that paints children in order and can position them against its edges | Use explicit positioning and clipping policies for predictable overlap | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Stack "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Stack "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Stack "Deep Dive") |
| `Expanded` | A flex child forced to fill its allocated share of remaining main-axis space | It must be under `Row`, `Column`, or `Flex` through only compatible intervening widgets | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Expanded "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Expanded "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Expanded "Deep Dive") |
| `Flexible` | A flex child that may use less than its allocated share | Choose the fit and flex factor based on whether loose sizing is genuinely desired | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Flexible "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Flexible "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Flexible "Deep Dive") |
| `Spacer` | An empty flex child that creates a proportional gap | It consumes flex space, so main-axis spacing modes may have no extra space left to distribute | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Spacer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Spacer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Spacer "Deep Dive") |
| `Builder` | A stateless callback that builds below a fresh `BuildContext` | Use the new context when looking up an inherited widget introduced by an ancestor in the same build | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/Builder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/Builder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/Builder "Deep Dive") |
| `StatefulBuilder` | A callback-built region with localized mutable state and a state-setter function | Store mutable values outside the builder callback and keep the region small | [💡](https://app.syntblaze.com/qt/flutter/Widgets/Basics/StatefulBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Widgets/Basics/StatefulBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Widgets/Basics/StatefulBuilder "Deep Dive") |

## Questions

- [What responsibilities belong at the `App` root?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/What-responsibilities-belong-at-the-App-root%3F)
- [When should an application use `MaterialApp`?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/When-should-an-application-use-MaterialApp%3F)
- [When is `CupertinoApp` preferable to a Material shell?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/When-is-CupertinoApp-preferable-to-a-Material-shell%3F)
- [What does `WidgetsApp` provide without a design system?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/What-does-WidgetsApp-provide-without-a-design-system%3F)
- [How does `Scaffold` coordinate page-level Material features?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-does-Scaffold-coordinate-page-level-Material-features%3F)
- [How should an `AppBar` handle navigation, actions, and narrow widths?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-should-an-AppBar-handle-navigation%2C-actions%2C-and-narrow-widths%3F)
- [When is `Text` sufficient for styled copy?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/When-is-Text-sufficient-for-styled-copy%3F)
- [When does text require `RichText` and an `InlineSpan` tree?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/When-does-text-require-RichText-and-an-InlineSpan-tree%3F)
- [How do `IconTheme`, size, color, and semantics affect an `Icon`?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-do-IconTheme%2C-size%2C-color%2C-and-semantics-affect-an-Icon%3F)
- [How should an `Image` be sized, fitted, cached, and described?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-should-an-Image-be-sized%2C-fitted%2C-cached%2C-and-described%3F)
- [Where is displaying `FlutterLogo` appropriate?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Where-is-displaying-FlutterLogo-appropriate%3F)
- [How can `Placeholder` expose unfinished layout without distorting it?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-can-Placeholder-expose-unfinished-layout-without-distorting-it%3F)
- [When is `Container` clearer than several focused widgets?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/When-is-Container-clearer-than-several-focused-widgets%3F)
- [How do the constructors of `SizedBox` express different constraints?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-do-the-constructors-of-SizedBox-express-different-constraints%3F)
- [Why can `Center` occupy more space than its child?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Why-can-Center-occupy-more-space-than-its-child%3F)
- [How do alignment and size factors change an `Align` layout?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-do-alignment-and-size-factors-change-an-Align-layout%3F)
- [How does `Row` allocate bounded horizontal space?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-does-Row-allocate-bounded-horizontal-space%3F)
- [How does `Column` behave inside a scrollable or another column?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-does-Column-behave-inside-a-scrollable-or-another-column%3F)
- [When should overlapping content use `Stack`?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/When-should-overlapping-content-use-Stack%3F)
- [How does `Expanded` divide remaining flex space?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-does-Expanded-divide-remaining-flex-space%3F)
- [How does `Flexible` differ from `Expanded`?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-does-Flexible-differ-from-Expanded%3F)
- [How does `Spacer` interact with main-axis alignment?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/How-does-Spacer-interact-with-main-axis-alignment%3F)
- [When is a fresh `BuildContext` from `Builder` necessary?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/When-is-a-fresh-BuildContext-from-Builder-necessary%3F)
- [When should `StatefulBuilder` become a dedicated `StatefulWidget`?](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/When-should-StatefulBuilder-become-a-dedicated-StatefulWidget%3F)

## Best Practices

- [Keep `App` focused on application-wide configuration and composition](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Keep-App-focused-on-application-wide-configuration-and-composition)
- [Define Material theme, navigation, and localization once in `MaterialApp`](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Define-Material-theme%2C-navigation%2C-and-localization-once-in-MaterialApp)
- [Apply Cupertino navigation and visual conventions consistently](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Apply-Cupertino-navigation-and-visual-conventions-consistently)
- [Use `WidgetsApp` only when intentionally supplying design-system behavior](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Use-WidgetsApp-only-when-intentionally-supplying-design-system-behavior)
- [Place page-level Material surfaces under the appropriate `Scaffold`](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Place-page-level-Material-surfaces-under-the-appropriate-Scaffold)
- [Keep `AppBar` titles and actions concise, accessible, and responsive](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Keep-AppBar-titles-and-actions-concise%2C-accessible%2C-and-responsive)
- [Allow `Text` to wrap and scale without clipping](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Allow-Text-to-wrap-and-scale-without-clipping)
- [Preserve selection, scaling, recognition, and semantics in rich text](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Preserve-selection%2C-scaling%2C-recognition%2C-and-semantics-in-rich-text)
- [Pair meaningful `Icon` glyphs with labels or semantic descriptions](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Pair-meaningful-Icon-glyphs-with-labels-or-semantic-descriptions)
- [Constrain `Image` layout and provide loading, error, and semantic behavior](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Constrain-Image-layout-and-provide-loading%2C-error%2C-and-semantic-behavior)
- [Respect Flutter's brand rules when using `FlutterLogo`](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Respect-Flutter's-brand-rules-when-using-FlutterLogo)
- [Remove development `Placeholder` widgets before release](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Remove-development-Placeholder-widgets-before-release)
- [Prefer focused widgets when `Container` would obscure layout intent](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Prefer-focused-widgets-when-Container-would-obscure-layout-intent)
- [Use fixed `SizedBox` dimensions only where content can safely fit](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Use-fixed-SizedBox-dimensions-only-where-content-can-safely-fit)
- [Verify the incoming constraints before relying on `Center` expansion](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Verify-the-incoming-constraints-before-relying-on-Center-expansion)
- [Use directional alignment when layouts must adapt to text direction](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Use-directional-alignment-when-layouts-must-adapt-to-text-direction)
- [Make `Row` children flexible before accepting horizontal overflow](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Make-Row-children-flexible-before-accepting-horizontal-overflow)
- [Avoid flex children in a `Column` with unbounded height](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Avoid-flex-children-in-a-Column-with-unbounded-height)
- [Keep `Stack` paint order, hit testing, and clipping intentional](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Keep-Stack-paint-order%2C-hit-testing%2C-and-clipping-intentional)
- [Use `Expanded` only for children that should fill their flex allocation](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Use-Expanded-only-for-children-that-should-fill-their-flex-allocation)
- [Use `Flexible` when a flex child may remain smaller than its allocation](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Use-Flexible-when-a-flex-child-may-remain-smaller-than-its-allocation)
- [Use `Spacer` for proportional flex gaps rather than arbitrary positioning](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Use-Spacer-for-proportional-flex-gaps-rather-than-arbitrary-positioning)
- [Keep `Builder` callbacks small and use their local context deliberately](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Keep-Builder-callbacks-small-and-use-their-local-context-deliberately)
- [Reserve `StatefulBuilder` for narrowly scoped, short-lived state](https://app.syntblaze.com/qsp/flutter/Widgets/Basics/Reserve-StatefulBuilder-for-narrowly-scoped%2C-short-lived-state)

[< Back to widgets](../README.md)
