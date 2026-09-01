# Internationalization

Flutter internationalization combines locale selection, localized resources,
locale-aware formatting, and platform-specific widget translations. A
`Locale` identifies the user's language and optional script or region, while
`Localizations` exposes the resource objects selected for that locale to the
widget tree. Delegates load those objects, including Flutter's Material,
Cupertino, and Widgets localization data and an application's generated
`AppLocalizations` class.

```text
device preferences / saved app setting
                    |
                    v
       supportedLocales + resolution policy
                    |
                    v
              selected Locale
                    |
                    v
            Localizations widget
                    |
          +---------+----------+
          |         |          |
          v         v          v
       Widgets   Material   Cupertino
          |         |          |
          +---------+----------+
                    |
                    v
        generated AppLocalizations
                    ^
                    |
        ARB files --+-- flutter gen-l10n
                    |
                    v
       messages, plurals, selections,
       dates, numbers, and UI strings
```

The usual workflow starts with ARB files that contain source messages,
translations, placeholders, and plural or selection metadata. Flutter's
localization generator turns those resources into typed Dart APIs. The app
then registers the generated delegate and Flutter's framework delegates on
`MaterialApp`, `CupertinoApp`, or `WidgetsApp`, declares supported locales, and
chooses an explicit resolution and fallback policy.

Translation and formatting solve different problems. Generated messages
localize prose and grammar, including plurals and gender-dependent selections;
locale-aware date and number formatters render structured values according to
local conventions. Keep values structured until presentation time, and test
the complete result with several languages, scripts, regions, and text lengths.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization) — Focused, bite-sized article covering Internationalization
- [Learning Path](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization) — Step-by-step material that builds practical Internationalization knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization) — Structured, in-depth material for learning about Internationalization thoroughly

## Internationalization Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Locale` | Identifies a language and optional script or country/region | Prefer language, script, and region subtags that accurately describe supported content; do not treat locale identifiers as arbitrary strings | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/Locale "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/Locale "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/Locale "Deep Dive") |
| `Localizations` | Makes locale-specific resource objects available below a widget | Read resources with the generated lookup API or `Localizations.of`, and ensure the required delegate is registered above the consumer | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/Localizations "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/Localizations "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/Localizations "Deep Dive") |
| `LocalizationsDelegate` | Declares support for, loads, and optionally reloads one resource type | Keep supported-locale logic aligned with the app's locale list and avoid expensive synchronous work during loading | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/LocalizationsDelegate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/LocalizationsDelegate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/LocalizationsDelegate "Deep Dive") |
| `MaterialLocalizations` | Supplies localized strings, labels, formats, and conventions used by Material widgets | Register the global Material delegate unless a carefully maintained custom implementation is required | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/MaterialLocalizations "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/MaterialLocalizations "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/MaterialLocalizations "Deep Dive") |
| `CupertinoLocalizations` | Supplies localized resources and conventions used by Cupertino widgets | Include the Cupertino delegate when Cupertino controls can appear, even inside an otherwise Material application | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/CupertinoLocalizations "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/CupertinoLocalizations "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/CupertinoLocalizations "Deep Dive") |
| `WidgetsLocalizations` | Provides framework-level text direction and other basic widget resources | Treat it as foundational infrastructure and normally use Flutter's global Widgets delegate | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/WidgetsLocalizations "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/WidgetsLocalizations "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/WidgetsLocalizations "Deep Dive") |
| ARB files | Store localized messages, placeholders, metadata, plurals, and selections | Keep stable message keys, document placeholders, and validate every locale against the template ARB | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/ARB-files "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/ARB-files "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/ARB-files "Deep Dive") |
| `AppLocalizations` | Exposes generated, typed access to application messages | Obtain it from a context below the app's localization boundary and avoid hand-maintaining generated code | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/AppLocalizations "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/AppLocalizations "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/AppLocalizations "Deep Dive") |
| `gen-l10n` | Generates Dart localization APIs from configured ARB resources | Commit configuration and decide deliberately whether generated output is checked in or reproduced by every build | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/gen-l10n "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/gen-l10n "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/gen-l10n "Deep Dive") |
| Date formatting | Presents dates and times using locale-aware patterns | Separate instants, time zones, calendars, and display formats; never imply timezone conversion merely by formatting | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/Date-formatting "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/Date-formatting "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/Date-formatting "Deep Dive") |
| Number formatting | Presents decimal, percent, compact, and currency values for a locale | Preserve numeric values until display and specify currency explicitly when a symbol or fraction rule matters | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/Number-formatting "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/Number-formatting "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/Number-formatting "Deep Dive") |
| Pluralization | Selects grammar based on a locale's plural categories | Supply the numeric placeholder to the generated message and translate all categories required by each locale | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/Pluralization "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/Pluralization "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/Pluralization "Deep Dive") |
| Gender selection | Selects a message variant from an application-provided category | Use only when grammar requires it, define an inclusive fallback, and do not infer personal attributes | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/Gender-selection "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/Gender-selection "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/Gender-selection "Deep Dive") |
| Locale resolution | Chooses the supported locale that best matches user preferences | Preserve script and region distinctions, honor ordered device preferences, and keep the policy deterministic | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/Locale-resolution "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/Locale-resolution "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/Locale-resolution "Deep Dive") |
| Fallback locale | Defines behavior when no exact supported locale or message is available | Choose and document a product fallback explicitly; do not assume every localization layer implements the same fallback chain | [💡](https://app.syntblaze.com/qt/flutter/Internationalization-and-Accessibility/Internationalization/Fallback-locale "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Internationalization-and-Accessibility/Internationalization/Fallback-locale "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Internationalization-and-Accessibility/Internationalization/Fallback-locale "Deep Dive") |

## Questions

- [How do language, script, and country codes combine in a `Locale`?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/How-do-language%2C-script%2C-and-country-codes-combine-in-a-Locale%3F)
- [Where must `Localizations` sit for a widget to react when the locale changes?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Where-must-Localizations-sit-for-a-widget-to-react-when-the-locale-changes%3F)
- [When should a custom `LocalizationsDelegate` reload its resources?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/When-should-a-custom-LocalizationsDelegate-reload-its-resources%3F)
- [Which labels and conventions come from `MaterialLocalizations`?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Which-labels-and-conventions-come-from-MaterialLocalizations%3F)
- [Why might a Material application still need `CupertinoLocalizations`?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Why-might-a-Material-application-still-need-CupertinoLocalizations%3F)
- [How does `WidgetsLocalizations` determine the ambient text direction?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/How-does-WidgetsLocalizations-determine-the-ambient-text-direction%3F)
- [How are placeholders, descriptions, plurals, and selections represented in ARB resources?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/How-are-placeholders%2C-descriptions%2C-plurals%2C-and-selections-represented-in-ARB-resources%3F)
- [How should widgets access generated `AppLocalizations` messages?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/How-should-widgets-access-generated-AppLocalizations-messages%3F)
- [Which project settings control `gen-l10n` input, output, and generated API behavior?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Which-project-settings-control-gen-l10n-input%2C-output%2C-and-generated-API-behavior%3F)
- [How should an instant and its timezone be prepared before date formatting?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/How-should-an-instant-and-its-timezone-be-prepared-before-date-formatting%3F)
- [When should a number be formatted as decimal, percent, compact notation, or currency?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/When-should-a-number-be-formatted-as-decimal%2C-percent%2C-compact-notation%2C-or-currency%3F)
- [Why do plural rules require categories beyond singular and plural in many locales?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Why-do-plural-rules-require-categories-beyond-singular-and-plural-in-many-locales%3F)
- [When is gender selection grammatically useful, and what should the fallback be?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/When-is-gender-selection-grammatically-useful%2C-and-what-should-the-fallback-be%3F)
- [How should ordered platform locale preferences be matched against supported locales?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/How-should-ordered-platform-locale-preferences-be-matched-against-supported-locales%3F)
- [What should users see when no exact locale or translated message is available?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/What-should-users-see-when-no-exact-locale-or-translated-message-is-available%3F)
- [How can locale switching, generated resources, and formatting be tested together?](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/How-can-locale-switching%2C-generated-resources%2C-and-formatting-be-tested-together%3F)

## Best Practices

- [Model supported languages with accurate language, script, and region subtags](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Model-supported-languages-with-accurate-language%2C-script%2C-and-region-subtags)
- [Keep locale-dependent lookups inside a context below `Localizations`](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Keep-locale-dependent-lookups-inside-a-context-below-Localizations)
- [Register only delegates the application needs and keep their support declarations consistent](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Register-only-delegates-the-application-needs-and-keep-their-support-declarations-consistent)
- [Use Flutter's maintained Material, Cupertino, and Widgets localization delegates](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Use-Flutter's-maintained-Material%2C-Cupertino%2C-and-Widgets-localization-delegates)
- [Treat the template ARB as a reviewed interface for translators and generated code](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Treat-the-template-ARB-as-a-reviewed-interface-for-translators-and-generated-code)
- [Use generated `AppLocalizations` getters and methods instead of scattering raw keys or strings](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Use-generated-AppLocalizations-getters-and-methods-instead-of-scattering-raw-keys-or-strings)
- [Make localization generation reproducible locally and in continuous integration](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Make-localization-generation-reproducible-locally-and-in-continuous-integration)
- [Format dates and numbers only at the presentation boundary](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Format-dates-and-numbers-only-at-the-presentation-boundary)
- [Pass structured placeholders into translated messages rather than concatenating fragments](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Pass-structured-placeholders-into-translated-messages-rather-than-concatenating-fragments)
- [Provide complete plural and selection variants, including a safe `other` case](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Provide-complete-plural-and-selection-variants%2C-including-a-safe-other-case)
- [Define locale resolution and fallback behavior as explicit product policy](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Define-locale-resolution-and-fallback-behavior-as-explicit-product-policy)
- [Test language-only, script-specific, region-specific, unsupported, and changing locales](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Test-language-only%2C-script-specific%2C-region-specific%2C-unsupported%2C-and-changing-locales)
- [Review translations in real layouts with long text, right-to-left scripts, and accessibility text scaling](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Review-translations-in-real-layouts-with-long-text%2C-right-to-left-scripts%2C-and-accessibility-text-scaling)
- [Keep untranslated-message reporting visible in development and release quality checks](https://app.syntblaze.com/qsp/flutter/Internationalization-and-Accessibility/Internationalization/Keep-untranslated-message-reporting-visible-in-development-and-release-quality-checks)

[< Back to internationalization & accessibility](../README.md)
