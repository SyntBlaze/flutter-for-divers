# Flutter Commands

Flutter's command-line interface coordinates environment diagnostics, dependency
resolution, static analysis, tests, local execution, and platform builds. These
commands share project configuration and tool caches, but they answer different
questions: whether the development machine is ready, whether the source is
healthy, whether behavior is verified, and whether a distributable artifact can
be produced for a particular platform.

```text
development machine
        |
        v
 flutter doctor
        |
        v
pubspec.yaml -----> flutter pub get / upgrade
        |                       |
        +-----------+-----------+
                    v
       flutter analyze + flutter test
                    |
                    v
               flutter run
                    |
                    v
  flutter build <platform artifact>
       |          |           |
       v          v           v
 Android       Apple       desktop / web
 APK / AAB    app / IPA       app bundle
```

Run commands from the package or application directory whose `pubspec.yaml`
defines the intended dependency graph. Prefer reproducible dependency resolution
in automation, treat analyzer warnings and test failures as build failures, and
choose a build command by the artifact expected by the destination rather than
by the developer's host platform alone. Several targets also require native
toolchains, platform projects, signing configuration, or execution on a
compatible host operating system.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands) — Focused, bite-sized article covering Flutter Commands
- [Learning Path](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands) — Step-by-step material that builds practical Flutter Commands knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands) — Structured, in-depth material for learning about Flutter Commands thoroughly

## Flutter Command Topics

| Command | Purpose | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `flutter doctor` | Inspect the Flutter installation and platform toolchains | Review verbose diagnostics when a target is unavailable, and distinguish optional integrations from requirements for the platforms the project ships | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-doctor "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-doctor "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-doctor "Deep Dive") |
| `flutter pub get` | Resolve declared dependencies and fetch packages | Keep `pubspec.lock` under the appropriate version-control policy and use locked versions in application CI for reproducible builds | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-pub-get "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-pub-get "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-pub-get "Deep Dive") |
| `flutter pub upgrade` | Re-resolve dependencies to newer allowed versions | Review the lockfile diff, release notes, analysis, and tests instead of treating dependency upgrades as a routine fetch | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-pub-upgrade "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-pub-upgrade "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-pub-upgrade "Deep Dive") |
| `flutter analyze` | Run Dart and Flutter static analysis | Commit a shared analysis configuration and fail continuous integration on diagnostics the team has agreed to enforce | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-analyze "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-analyze "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-analyze "Deep Dive") |
| `flutter test` | Execute automated Flutter tests | Select unit, widget, integration, coverage, concurrency, and reporter options deliberately for local feedback and CI artifacts | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-test "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-test "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-test "Deep Dive") |
| `flutter run` | Build and launch an application on a selected device | Specify the target device when selection is ambiguous and remember that run mode changes debugging, performance, and compilation behavior | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-run "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-run "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-run "Deep Dive") |
| `flutter build apk` | Produce one or more Android APKs | Choose build mode, ABI splitting, signing, and distribution channel with artifact size and device compatibility in mind | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-apk "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-apk "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-apk "Deep Dive") |
| `flutter build appbundle` | Produce an Android App Bundle for store distribution | Configure release signing and verify the generated bundle before uploading it to the intended Play Console track | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-appbundle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-appbundle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-appbundle "Deep Dive") |
| `flutter build ios` | Build the iOS application bundle | Run on macOS with the required Xcode environment and make code-signing choices appropriate to testing, archiving, or distribution | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-ios "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-ios "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-ios "Deep Dive") |
| `flutter build ipa` | Archive iOS and export an IPA | Align bundle identity, signing assets, export method, and export options with the App Store Connect or enterprise workflow | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-ipa "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-ipa "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-ipa "Deep Dive") |
| `flutter build macos` | Produce a macOS application | Build on macOS and plan entitlements, signing, hardened runtime, packaging, and notarization as separate release concerns | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-macos "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-macos "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-macos "Deep Dive") |
| `flutter build windows` | Produce a Windows desktop application | Build on Windows with the supported Visual Studio toolchain, then package and sign the output for the chosen distribution mechanism | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-windows "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-windows "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-windows "Deep Dive") |
| `flutter build linux` | Produce a Linux desktop application | Build on Linux with required native dependencies and package runtime libraries for the target distribution format | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-linux "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-linux "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-linux "Deep Dive") |
| `flutter build web` | Produce static assets for browser deployment | Set deployment paths and web build options consistently with the hosting origin, caching rules, browser support, and renderer requirements | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-web "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-web "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Flutter-Commands/flutter-build-web "Deep Dive") |

## Questions

- [How can `flutter doctor` distinguish a broken required toolchain from an unused optional platform integration?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/How-can-flutter-doctor-distinguish-a-broken-required-toolchain-from-an-unused-optional-platform-integration%3F)
- [When should CI use the checked-in lockfile produced by `flutter pub get`?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/When-should-CI-use-the-checked-in-lockfile-produced-by-flutter-pub-get%3F)
- [How should a team review and validate changes made by `flutter pub upgrade`?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/How-should-a-team-review-and-validate-changes-made-by-flutter-pub-upgrade%3F)
- [Which analyzer diagnostics should block a merge or release?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Which-analyzer-diagnostics-should-block-a-merge-or-release%3F)
- [How should test selection, coverage, concurrency, and machine-readable reporting differ between local runs and CI?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/How-should-test-selection%2C-coverage%2C-concurrency%2C-and-machine-readable-reporting-differ-between-local-runs-and-CI%3F)
- [Which device and build mode should be selected for `flutter run`?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Which-device-and-build-mode-should-be-selected-for-flutter-run%3F)
- [When is an APK required instead of an Android App Bundle?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/When-is-an-APK-required-instead-of-an-Android-App-Bundle%3F)
- [Which signing and version settings must be correct before building an app bundle?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Which-signing-and-version-settings-must-be-correct-before-building-an-app-bundle%3F)
- [When should an iOS build disable signing, and what can that build verify?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/When-should-an-iOS-build-disable-signing%2C-and-what-can-that-build-verify%3F)
- [How do archive and export settings affect the IPA produced for distribution?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/How-do-archive-and-export-settings-affect-the-IPA-produced-for-distribution%3F)
- [Which macOS entitlements and notarization steps happen outside compilation?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Which-macOS-entitlements-and-notarization-steps-happen-outside-compilation%3F)
- [What must accompany Windows build output to make it installable and trustworthy?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/What-must-accompany-Windows-build-output-to-make-it-installable-and-trustworthy%3F)
- [Which native libraries must be present on the Linux build host and end-user system?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Which-native-libraries-must-be-present-on-the-Linux-build-host-and-end-user-system%3F)
- [How do base paths, renderers, source maps, and cache policy affect a web build after deployment?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/How-do-base-paths%2C-renderers%2C-source-maps%2C-and-cache-policy-affect-a-web-build-after-deployment%3F)
- [Which commands should form the minimum pull-request and release pipeline?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Which-commands-should-form-the-minimum-pull-request-and-release-pipeline%3F)

## Best Practices

- [Run `flutter doctor` when provisioning or changing a build machine, and retain verbose diagnostics when investigating toolchain failures](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Run-flutter-doctor-when-provisioning-or-changing-a-build-machine%2C-and-retain-verbose-diagnostics-when-investigating-toolchain-failures)
- [Use `flutter pub get` for normal reproducible resolution and keep application lockfiles reviewed and committed](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Use-flutter-pub-get-for-normal-reproducible-resolution-and-keep-application-lockfiles-reviewed-and-committed)
- [Perform dependency upgrades as explicit, testable changes with a reviewed lockfile diff](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Perform-dependency-upgrades-as-explicit%2C-testable-changes-with-a-reviewed-lockfile-diff)
- [Keep analysis options consistent locally and in CI](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Keep-analysis-options-consistent-locally-and-in-CI)
- [Run fast tests on every change and publish useful reports or coverage from CI](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Run-fast-tests-on-every-change-and-publish-useful-reports-or-coverage-from-CI)
- [Select the target device and build mode explicitly in scripts](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Select-the-target-device-and-build-mode-explicitly-in-scripts)
- [Build the artifact required by the distribution channel instead of renaming or repackaging a different output](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Build-the-artifact-required-by-the-distribution-channel-instead-of-renaming-or-repackaging-a-different-output)
- [Inject signing credentials securely and never commit private keys or secret passwords](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Inject-signing-credentials-securely-and-never-commit-private-keys-or-secret-passwords)
- [Pin and report Flutter, Dart, Java, Xcode, CocoaPods, Visual Studio, and other relevant toolchain versions](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Pin-and-report-Flutter%2C-Dart%2C-Java%2C-Xcode%2C-CocoaPods%2C-Visual-Studio%2C-and-other-relevant-toolchain-versions)
- [Keep version names and build numbers unique and synchronized with store records](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Keep-version-names-and-build-numbers-unique-and-synchronized-with-store-records)
- [Build Apple targets on a compatible macOS host and validate signing before the release deadline](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Build-Apple-targets-on-a-compatible-macOS-host-and-validate-signing-before-the-release-deadline)
- [Treat desktop packaging, native dependencies, signing, and notarization as tested parts of the release pipeline](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Treat-desktop-packaging%2C-native-dependencies%2C-signing%2C-and-notarization-as-tested-parts-of-the-release-pipeline)
- [Deploy web output with the same base path and caching assumptions used at build time](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Deploy-web-output-with-the-same-base-path-and-caching-assumptions-used-at-build-time)
- [Archive artifacts, checksums, logs, and test results so a release can be traced to its source revision](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Archive-artifacts%2C-checksums%2C-logs%2C-and-test-results-so-a-release-can-be-traced-to-its-source-revision)
- [Verify a release artifact in a staging distribution channel before promoting it to production](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Flutter-Commands/Verify-a-release-artifact-in-a-staging-distribution-channel-before-promoting-it-to-production)

[< Back to build & release deployment](../README.md)
