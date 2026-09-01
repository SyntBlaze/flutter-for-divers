# Internationalization

Internationalization prepares an application to support different languages,
regions, writing directions, and formatting conventions. Localization supplies
the translated messages and locale-specific resources for a particular
audience. A Flutter application normally needs both: widgets must understand
the active locale and text direction, while application messages, dates,
numbers, currencies, and plurals must be produced from structured localized
data rather than assembled from translated fragments.

```text
Platform locale or user preference
  -> resolve against the application's supported locales
  -> apply an explicit fallback when no exact locale is available
  -> load the matching message catalog and Flutter localization delegates
  -> select a message by stable key and plural, gender, or select parameters
  -> format dates, times, numbers, currencies, and units for the resolved locale
  -> render with the locale's script, text direction, typography, and layout
  -> verify meaning, accessibility, overflow, and bidirectional behavior
```

Flutter Localizations connects the widget framework and Material or Cupertino
components to locale-aware resources and behavior. It also participates in
locale resolution and supplies text direction through the widget tree. Intl
provides locale-sensitive number and date formatting plus message-selection
building blocks. These responsibilities are related but distinct: changing the
widget locale does not automatically translate application-owned copy, and
translating strings does not make manually formatted values locale-aware.

Easy Localization, Slang, and i18n Extension provide alternative ways to
organize and access application translations. Their ergonomics differ around
catalog formats, generated APIs, runtime loading, and integration style. The
best choice is the one that keeps message ownership clear, represents plural
and select logic explicitly, gives translators useful context, and makes
missing or stale translations visible before release.

## Selection Guidance

Start with Flutter Localizations because localized Flutter widgets, locale
resolution, and directionality are foundational regardless of how
application-owned messages are stored. Use Flutter's generated localization
workflow when ARB catalogs, generated strongly typed accessors, and framework
integration fit the project. Add Intl directly when code needs explicit
locale-aware date, number, currency, or message formatting outside that
generated layer.

Choose Easy Localization when its catalog-loading and widget-context workflow
fits an application that wants straightforward translation lookup and asset
organization. Choose Slang when a generated, strongly typed translation API
and its catalog workflow match the team's preferences. Consider i18n Extension
when its extension-oriented API is appropriate for a smaller or existing code
base and the team can still enforce structured keys, complete catalogs, and
locale-aware formatting.

Do not select only by the shortest call-site syntax. Compare how each approach
handles generated keys, plural and gender rules, locale fallback, deferred or
runtime loading, translator handoff, static analysis, and tests. Also confirm
supported Flutter and Dart versions and migration costs from the package's
current documentation before adopting it. A single application should normally
have one primary message-catalog workflow, even when Intl remains available for
formatting values.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Internationalization) — Focused, bite-sized article covering Internationalization
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Internationalization) — Step-by-step material that builds practical Internationalization knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Internationalization) — Structured, in-depth material for learning about Internationalization thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Flutter Localizations | Flutter SDK delegates, locale resolution, directionality, and generated application-localization integration | Establishing the framework localization layer and localizing Material, Cupertino, and Widgets behavior | [💡](https://app.syntblaze.com/qt/flutter/Packages/Internationalization/Flutter-Localizations "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Internationalization/Flutter-Localizations "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Internationalization/Flutter-Localizations "Deep Dive") |
| Intl | Locale-aware date and number formatting with message, plural, and selection primitives | Formatting values and supporting structured messages in code or generated localization workflows | [💡](https://app.syntblaze.com/qt/flutter/Packages/Internationalization/Intl "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Internationalization/Intl "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Internationalization/Intl "Deep Dive") |
| Easy Localization | Translation catalogs exposed through Flutter-aware lookup and loading APIs | Applications that prefer an asset-oriented localization workflow with concise access from widgets | [💡](https://app.syntblaze.com/qt/flutter/Packages/Internationalization/Easy-Localization "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Internationalization/Easy-Localization "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Internationalization/Easy-Localization "Deep Dive") |
| Slang | Generated, strongly typed translation access from structured locale catalogs | Teams that want compile-time-friendly translation keys and a code-generation-centered workflow | [💡](https://app.syntblaze.com/qt/flutter/Packages/Internationalization/Slang "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Internationalization/Slang "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Internationalization/Slang "Deep Dive") |
| i18n Extension | Extension-oriented translation lookup for Dart and Flutter strings | Projects that favor an incremental, code-adjacent translation API | [💡](https://app.syntblaze.com/qt/flutter/Packages/Internationalization/i18n-Extension "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Internationalization/i18n-Extension "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Internationalization/i18n-Extension "Deep Dive") |

## Questions

- [How are internationalization and localization different?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/How-are-internationalization-and-localization-different%3F)
- [How does Flutter choose among the device locale, a user preference, and supported locales?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/How-does-Flutter-choose-among-the-device-locale%2C-a-user-preference%2C-and-supported-locales%3F)
- [Should language and region preferences be stored separately from the platform locale?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Should-language-and-region-preferences-be-stored-separately-from-the-platform-locale%3F)
- [What fallback should be used when an exact language, script, and region match is unavailable?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/What-fallback-should-be-used-when-an-exact-language%2C-script%2C-and-region-match-is-unavailable%3F)
- [Why should translated sentences use message keys instead of source text as identity?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Why-should-translated-sentences-use-message-keys-instead-of-source-text-as-identity%3F)
- [How should plural, gender, and select variants be represented?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/How-should-plural%2C-gender%2C-and-select-variants-be-represented%3F)
- [Why should dates, numbers, currencies, percentages, and units be formatted by locale?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Why-should-dates%2C-numbers%2C-currencies%2C-percentages%2C-and-units-be-formatted-by-locale%3F)
- [When are generated localization accessors preferable to dynamic string lookup?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/When-are-generated-localization-accessors-preferable-to-dynamic-string-lookup%3F)
- [How can translators receive context without exposing implementation details?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/How-can-translators-receive-context-without-exposing-implementation-details%3F)
- [What must change in a layout when the locale uses a right-to-left script?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/What-must-change-in-a-layout-when-the-locale-uses-a-right-to-left-script%3F)
- [How should missing, obsolete, and untranslated messages fail in development and release builds?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/How-should-missing%2C-obsolete%2C-and-untranslated-messages-fail-in-development-and-release-builds%3F)
- [How can localized widgets be tested without changing the test machine's locale?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/How-can-localized-widgets-be-tested-without-changing-the-test-machine's-locale%3F)
- [How should localized text be exposed to screen readers and other assistive technology?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/How-should-localized-text-be-exposed-to-screen-readers-and-other-assistive-technology%3F)
- [Should translation catalogs be bundled, downloaded, or split by feature?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Should-translation-catalogs-be-bundled%2C-downloaded%2C-or-split-by-feature%3F)
- [How can a team change localization libraries without changing every widget?](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/How-can-a-team-change-localization-libraries-without-changing-every-widget%3F)

## Best Practices

- [Separate internationalization infrastructure from the localized content delivered for each locale](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Separate-internationalization-infrastructure-from-the-localized-content-delivered-for-each-locale)
- [Declare supported locales explicitly and keep locale resolution deterministic](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Declare-supported-locales-explicitly-and-keep-locale-resolution-deterministic)
- [Define a documented fallback chain for language, script, region, and the application's default locale](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Define-a-documented-fallback-chain-for-language%2C-script%2C-region%2C-and-the-application's-default-locale)
- [Preserve a user's explicit locale choice without mistaking it for the device's current preference](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Preserve-a-user's-explicit-locale-choice-without-mistaking-it-for-the-device's-current-preference)
- [Use stable semantic message keys and give translators context, descriptions, and parameter meaning](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Use-stable-semantic-message-keys-and-give-translators-context%2C-descriptions%2C-and-parameter-meaning)
- [Prefer generated, typed accessors so missing keys and invalid parameters surface during development](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Prefer-generated%2C-typed-accessors-so-missing-keys-and-invalid-parameters-surface-during-development)
- [Express plurals, gender, and other selections as complete structured messages](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Express-plurals%2C-gender%2C-and-other-selections-as-complete-structured-messages)
- [Do not concatenate translated sentence fragments or assume English word order](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Do-not-concatenate-translated-sentence-fragments-or-assume-English-word-order)
- [Format dates, times, numbers, currencies, percentages, and units with the resolved locale](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Format-dates%2C-times%2C-numbers%2C-currencies%2C-percentages%2C-and-units-with-the-resolved-locale)
- [Keep stored and transmitted values locale-neutral, then localize them only for display and input](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Keep-stored-and-transmitted-values-locale-neutral%2C-then-localize-them-only-for-display-and-input)
- [Use directional padding, alignment, icons, and traversal behavior where layouts must support RTL](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Use-directional-padding%2C-alignment%2C-icons%2C-and-traversal-behavior-where-layouts-must-support-RTL)
- [Test mixed-direction content, numerals, punctuation, and user-generated text in RTL locales](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Test-mixed-direction-content%2C-numerals%2C-punctuation%2C-and-user-generated-text-in-RTL-locales)
- [Allow text to wrap and scale; avoid fixed dimensions derived from one language](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Allow-text-to-wrap-and-scale%3B-avoid-fixed-dimensions-derived-from-one-language)
- [Use fonts and fallback fonts that cover every supported script and required glyph](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Use-fonts-and-fallback-fonts-that-cover-every-supported-script-and-required-glyph)
- [Localize semantic labels, hints, errors, announcements, and non-visual accessibility text](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Localize-semantic-labels%2C-hints%2C-errors%2C-announcements%2C-and-non-visual-accessibility-text)
- [Test every supported locale plus fallback, missing-message, long-text, and large-text scenarios](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Test-every-supported-locale-plus-fallback%2C-missing-message%2C-long-text%2C-and-large-text-scenarios)
- [Use locale-controlled widget tests and golden tests rather than relying on the host environment](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Use-locale-controlled-widget-tests-and-golden-tests-rather-than-relying-on-the-host-environment)
- [Automate checks for missing, unused, duplicated, and placeholder-inconsistent translations](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Automate-checks-for-missing%2C-unused%2C-duplicated%2C-and-placeholder-inconsistent-translations)
- [Keep the localization layer behind a stable application-facing API to contain migrations](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Keep-the-localization-layer-behind-a-stable-application-facing-API-to-contain-migrations)
- [Have fluent reviewers validate meaning and cultural fit before releasing important user-facing copy](https://app.syntblaze.com/qsp/flutter/Packages/Internationalization/Have-fluent-reviewers-validate-meaning-and-cultural-fit-before-releasing-important-user-facing-copy)

[< Back to packages](../README.md)
