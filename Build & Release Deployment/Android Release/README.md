# Android Release

Shipping a Flutter application on Android turns Dart code, Flutter assets,
Android resources, native libraries, and Gradle configuration into a signed
APK or Android App Bundle. A release is reproducible only when the toolchain,
application identity, SDK constraints, versioning, signing material, shrinking
rules, and Play Console rollout are managed as one pipeline.

```text
Flutter sources + assets + Android host project
                        |
                        v
              Flutter build + Gradle
                        |
              +---------+---------+
              |                   |
              v                   v
          signed APK       signed app bundle
              |                   |
              |                   v
              |         Play App Signing / generated APKs
              |                   |
              +---------+---------+
                        |
                        v
        internal -> closed -> production rollout
```

Use an Android App Bundle for normal Google Play delivery so the store can
generate optimized APKs for each device. Keep APK builds for direct
distribution, local installation, integration testing, or stores that require
them. In both cases, treat the application ID, version code, release keystore,
and mapping files as long-lived release assets: changing or losing them can
prevent upgrades or make production crashes harder to diagnose.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release) — Focused, bite-sized article covering Android Release
- [Learning Path](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release) — Step-by-step material that builds practical Android Release knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release) — Structured, in-depth material for learning about Android Release thoroughly

## Android Release Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Android App Bundle | Packaging compiled code and resources as the Play-preferred `.aab` publishing artifact | An app bundle is uploaded to a store; devices receive generated, signed APKs rather than installing the bundle directly | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/Android-App-Bundle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/Android-App-Bundle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/Android-App-Bundle "Deep Dive") |
| APK | Producing an installable Android package for a device or distribution channel | Decide whether to create one universal APK or ABI-specific APKs, and verify every artifact is signed and installable | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/APK "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/APK "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/APK "Deep Dive") |
| Gradle | Orchestrating Android compilation, dependencies, variants, shrinking, signing, and packaging | Keep the Gradle wrapper, Android Gradle Plugin, Java, Kotlin, and Flutter versions compatible and reproducible | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/Gradle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/Gradle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/Gradle "Deep Dive") |
| `android/app/build.gradle` | Configuring the Android application module and its build variants | Treat the file as build logic: keep application identity and release behavior explicit, review generated changes, and avoid embedding secrets | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/android-app-build.gradle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/android-app-build.gradle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/android-app-build.gradle "Deep Dive") |
| `minSdkVersion` | Declaring the oldest Android API level on which the application may install | Raising it can simplify dependencies and APIs but removes support for older devices; validate package requirements before changing it | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/minSdkVersion "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/minSdkVersion "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/minSdkVersion "Deep Dive") |
| `targetSdkVersion` | Declaring the Android behavior level the application has tested and opted into | New target levels can change permissions and platform behavior, so test migrations before the store deadline | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/targetSdkVersion "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/targetSdkVersion "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/targetSdkVersion "Deep Dive") |
| Signing config | Connecting a release variant to its key alias, credentials, and keystore | Load sensitive values from protected local or CI configuration and fail the release when signing is missing | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/Signing-config "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/Signing-config "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/Signing-config "Deep Dive") |
| Keystore | Holding the private key that establishes continuity between Android releases | Back up the release or upload key securely, restrict access, record recovery procedures, and never commit it to source control | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/Keystore "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/Keystore "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/Keystore "Deep Dive") |
| ProGuard | Expressing keep, optimization, and warning rules consumed during shrinking | Add the narrowest rules required by reflection, serialization, JNI, or libraries, then test the optimized release build | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/ProGuard "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/ProGuard "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/ProGuard "Deep Dive") |
| R8 | Shrinking, optimizing, and obfuscating Android bytecode in release builds | Preserve mapping files for every shipped version and exercise code paths that depend on dynamic lookup | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/R8 "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/R8 "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/R8 "Deep Dive") |
| Play Console | Managing application records, artifacts, policy declarations, testing, and staged releases | Align the package name and signing setup before the first upload because production identity is difficult or impossible to replace | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/Play-Console "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/Play-Console "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/Play-Console "Deep Dive") |
| Internal testing track | Distributing fast, limited builds to a small trusted tester group | Use it for smoke tests of signing, installation, billing, updates, and store-delivered behavior before broader exposure | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/Internal-testing-track "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/Internal-testing-track "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/Internal-testing-track "Deep Dive") |
| Closed testing track | Releasing to controlled cohorts under a more production-like workflow | Define cohorts and feedback channels, monitor quality signals, and promote the exact tested artifact when possible | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/Closed-testing-track "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/Closed-testing-track "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/Closed-testing-track "Deep Dive") |
| Production track | Publishing to users through full or staged rollout | Use release notes, automated checks, monitoring, staged percentages, and an explicit halt or remediation plan | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Android-Release/Production-track "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Android-Release/Production-track "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Android-Release/Production-track "Deep Dive") |

## Questions

- [When should a Play release use an Android App Bundle instead of an APK?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/When-should-a-Play-release-use-an-Android-App-Bundle-instead-of-an-APK%3F)
- [How do universal and split APKs differ in size, compatibility, and distribution?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/How-do-universal-and-split-APKs-differ-in-size%2C-compatibility%2C-and-distribution%3F)
- [Which Flutter, Java, Gradle, Android Gradle Plugin, and Kotlin versions must remain compatible?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Which-Flutter%2C-Java%2C-Gradle%2C-Android-Gradle-Plugin%2C-and-Kotlin-versions-must-remain-compatible%3F)
- [Which release settings belong in `android/app/build.gradle`, and which values should come from protected configuration?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Which-release-settings-belong-in-android%2Fapp%2Fbuild.gradle%2C-and-which-values-should-come-from-protected-configuration%3F)
- [How does changing `minSdkVersion` affect device support and dependency selection?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/How-does-changing-minSdkVersion-affect-device-support-and-dependency-selection%3F)
- [Which behavior and permission changes must be tested when `targetSdkVersion` increases?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Which-behavior-and-permission-changes-must-be-tested-when-targetSdkVersion-increases%3F)
- [How should local and CI builds supply release signing values without exposing them?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/How-should-local-and-CI-builds-supply-release-signing-values-without-exposing-them%3F)
- [What must be backed up to preserve signing continuity, and how is key recovery practiced?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/What-must-be-backed-up-to-preserve-signing-continuity%2C-and-how-is-key-recovery-practiced%3F)
- [When does reflective or generated code require a ProGuard keep rule?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/When-does-reflective-or-generated-code-require-a-ProGuard-keep-rule%3F)
- [How are R8 mapping files retained and used to deobfuscate production stack traces?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/How-are-R8-mapping-files-retained-and-used-to-deobfuscate-production-stack-traces%3F)
- [Which Play Console declarations and automated checks block or delay a rollout?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Which-Play-Console-declarations-and-automated-checks-block-or-delay-a-rollout%3F)
- [Which store-delivery checks should run on the internal testing track?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Which-store-delivery-checks-should-run-on-the-internal-testing-track%3F)
- [How should closed testers, cohorts, feedback, and promotion criteria be defined?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/How-should-closed-testers%2C-cohorts%2C-feedback%2C-and-promotion-criteria-be-defined%3F)
- [What metrics and stop conditions govern a staged production rollout?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/What-metrics-and-stop-conditions-govern-a-staged-production-rollout%3F)
- [Can the exact artifact tested in a pre-production track be promoted without rebuilding it?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Can-the-exact-artifact-tested-in-a-pre-production-track-be-promoted-without-rebuilding-it%3F)

## Best Practices

- [Prefer an Android App Bundle for Google Play and test the APKs generated from it](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Prefer-an-Android-App-Bundle-for-Google-Play-and-test-the-APKs-generated-from-it)
- [Use APKs intentionally for direct installs, automation, or channels that require them](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Use-APKs-intentionally-for-direct-installs%2C-automation%2C-or-channels-that-require-them)
- [Pin and review the Gradle wrapper and related Android build-tool versions](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Pin-and-review-the-Gradle-wrapper-and-related-Android-build-tool-versions)
- [Keep module build configuration readable, variant-aware, and free of committed credentials](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Keep-module-build-configuration-readable%2C-variant-aware%2C-and-free-of-committed-credentials)
- [Choose the minimum SDK from product support goals and verified dependency requirements](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Choose-the-minimum-SDK-from-product-support-goals-and-verified-dependency-requirements)
- [Adopt target SDK changes early enough to test permissions, background work, and platform behavior](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Adopt-target-SDK-changes-early-enough-to-test-permissions%2C-background-work%2C-and-platform-behavior)
- [Separate debug and release signing, and make an unsigned production build fail clearly](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Separate-debug-and-release-signing%2C-and-make-an-unsigned-production-build-fail-clearly)
- [Encrypt, restrict, and redundantly back up signing keys and their recovery information](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Encrypt%2C-restrict%2C-and-redundantly-back-up-signing-keys-and-their-recovery-information)
- [Keep shrinking rules narrow and document why each application-owned rule exists](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Keep-shrinking-rules-narrow-and-document-why-each-application-owned-rule-exists)
- [Test release builds with R8 enabled and archive each release's mapping and symbol files](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Test-release-builds-with-R8-enabled-and-archive-each-release's-mapping-and-symbol-files)
- [Complete Play Console policy, privacy, content, and tester requirements before the planned release date](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Complete-Play-Console-policy%2C-privacy%2C-content%2C-and-tester-requirements-before-the-planned-release-date)
- [Smoke-test store installation, upgrade paths, deep links, notifications, billing, and authentication internally](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Smoke-test-store-installation%2C-upgrade-paths%2C-deep-links%2C-notifications%2C-billing%2C-and-authentication-internally)
- [Use closed testing for representative devices, accounts, locales, and production-like services](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Use-closed-testing-for-representative-devices%2C-accounts%2C-locales%2C-and-production-like-services)
- [Promote a verified artifact through tracks and use a monitored staged production rollout](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Promote-a-verified-artifact-through-tracks-and-use-a-monitored-staged-production-rollout)
- [Record the source revision, Flutter version, dependency lockfile, build number, and artifact checksums for every release](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Android-Release/Record-the-source-revision%2C-Flutter-version%2C-dependency-lockfile%2C-build-number%2C-and-artifact-checksums-for-every-release)

[< Back to build & release deployment](../README.md)
