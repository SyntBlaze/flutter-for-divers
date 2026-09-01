# iOS Release

Releasing a Flutter application for iOS connects Flutter's build output to
Apple's native project, signing system, distribution services, and storefront
requirements. The Xcode workspace is the integration point for the Runner
target and CocoaPods dependencies, while the bundle identifier, certificates,
and provisioning profiles establish which app is being signed, by whom, and
for which devices or distribution channel.

```text
Flutter project + CocoaPods dependencies
                    |
                    v
          Runner.xcworkspace / Xcode
                    |
       bundle identifier + version/build
                    |
                    v
 certificate + provisioning profile + entitlements
                    |
                    v
                 Archive
                    |
          export options / validation
                    |
          +---------+----------+
          |                    |
          v                    v
      TestFlight       App Store Connect release
```

Treat release configuration as a reproducible pipeline rather than a sequence
of one-off Xcode fixes. Keep identifiers and entitlements consistent across the
Flutter project, Xcode targets, and App Store Connect; protect signing material;
and validate the exact archive that will be distributed. App icons, launch
experience, privacy declarations, and store metadata are release inputs, not
finishing touches after the binary has been built.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release) — Focused, bite-sized article covering iOS Release
- [Learning Path](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release) — Step-by-step material that builds practical iOS Release knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release) — Structured, in-depth material for learning about iOS Release thoroughly

## iOS Release Topics

| Topic | Focus | Key considerations | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Xcode workspace | Open and configure the generated iOS project together with its native dependencies | Use `Runner.xcworkspace` when CocoaPods is involved, keep generated settings intact, and review target capabilities and build configurations | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/Xcode-workspace "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/Xcode-workspace "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/Xcode-workspace "Deep Dive") |
| CocoaPods | Resolve and integrate native iOS plugin dependencies | Commit the appropriate lockfile, keep the deployment target compatible, and reproduce pod installation in local and CI environments | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/CocoaPods "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/CocoaPods "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/CocoaPods "Deep Dive") |
| Bundle identifier | Give the application and each related target a unique identity | Match identifiers across Xcode, signing assets, capabilities, and App Store Connect; define deliberate identifiers for flavors and extensions | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/Bundle-identifier "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/Bundle-identifier "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/Bundle-identifier "Deep Dive") |
| Provisioning profile | Authorize an app identifier, signing certificate, entitlements, and distribution method | Choose automatic or manual management intentionally, verify profile capabilities, and plan for expiration and renewal | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/Provisioning-profile "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/Provisioning-profile "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/Provisioning-profile "Deep Dive") |
| Signing certificate | Cryptographically identify the developer or distribution signer | Restrict access to private keys, track expiration and revocation, and install the complete certificate chain in build environments | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/Signing-certificate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/Signing-certificate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/Signing-certificate "Deep Dive") |
| App Store Connect | Register the app, receive builds, manage compliance, and submit releases | Align the app record with the bundle identifier, assign access narrowly, and complete metadata and compliance before the release window | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/App-Store-Connect "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/App-Store-Connect "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/App-Store-Connect "Deep Dive") |
| TestFlight | Distribute prerelease builds to internal and external testers | Use meaningful build numbers, document test scope, monitor feedback and crashes, and promote only the archive that was tested | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/TestFlight "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/TestFlight "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/TestFlight "Deep Dive") |
| Archive | Produce the signed, versioned Xcode artifact used for validation and distribution | Archive the intended scheme and configuration, preserve symbols, inspect signing details, and retain traceability to source | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/Archive "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/Archive "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/Archive "Deep Dive") |
| Export options plist | Describe how an archive should be exported for a chosen distribution workflow | Keep the export method and signing choices consistent with the destination, avoid embedding secrets, and version reusable configuration where suitable | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/Export-options-plist "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/Export-options-plist "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/Export-options-plist "Deep Dive") |
| Privacy manifest | Declare required privacy information for the app and included SDKs | Inventory accessed APIs and data practices, inspect third-party manifests, and reconcile binary behavior with store disclosures | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/Privacy-manifest "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/Privacy-manifest "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/Privacy-manifest "Deep Dive") |
| App icons | Supply platform-specific representations of the application identity | Provide every required size through the asset catalog, avoid transparency where prohibited, and inspect icons on devices and store surfaces | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/App-icons "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/App-icons "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/App-icons "Deep Dive") |
| Launch screen | Present a fast, static native experience while Flutter initializes | Keep it lightweight and adaptive, avoid simulated application UI, and test different devices, orientations, and appearances | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/iOS-Release/Launch-screen "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/iOS-Release/Launch-screen "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/iOS-Release/Launch-screen "Deep Dive") |

## Questions

- [Why should a CocoaPods-based Flutter iOS project be opened through the Xcode workspace?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Why-should-a-CocoaPods-based-Flutter-iOS-project-be-opened-through-the-Xcode-workspace%3F)
- [How can native plugin dependencies be installed consistently on developer machines and CI?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/How-can-native-plugin-dependencies-be-installed-consistently-on-developer-machines-and-CI%3F)
- [Which bundle identifiers are needed for production, flavors, tests, widgets, or other extensions?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Which-bundle-identifiers-are-needed-for-production%2C-flavors%2C-tests%2C-widgets%2C-or-other-extensions%3F)
- [What relationship connects an app identifier, entitlements, certificate, and provisioning profile?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/What-relationship-connects-an-app-identifier%2C-entitlements%2C-certificate%2C-and-provisioning-profile%3F)
- [Which certificate and private key must be available to the machine that exports the archive?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Which-certificate-and-private-key-must-be-available-to-the-machine-that-exports-the-archive%3F)
- [What must be configured in App Store Connect before the first build can be delivered?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/What-must-be-configured-in-App-Store-Connect-before-the-first-build-can-be-delivered%3F)
- [How should internal and external TestFlight groups be used during release validation?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/How-should-internal-and-external-TestFlight-groups-be-used-during-release-validation%3F)
- [How can an archive be traced back to its source revision, dependency lockfiles, version, and build number?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/How-can-an-archive-be-traced-back-to-its-source-revision%2C-dependency-lockfiles%2C-version%2C-and-build-number%3F)
- [Which export settings differ between development, ad hoc, enterprise, and App Store distribution?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Which-export-settings-differ-between-development%2C-ad-hoc%2C-enterprise%2C-and-App-Store-distribution%3F)
- [How should first-party code and third-party SDKs be audited for privacy-manifest requirements?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/How-should-first-party-code-and-third-party-SDKs-be-audited-for-privacy-manifest-requirements%3F)
- [How can app icons remain crisp and recognizable across devices and App Store presentation?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/How-can-app-icons-remain-crisp-and-recognizable-across-devices-and-App-Store-presentation%3F)
- [What belongs on a launch screen while the Flutter engine and first frame are starting?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/What-belongs-on-a-launch-screen-while-the-Flutter-engine-and-first-frame-are-starting%3F)
- [How can the team verify that the submitted binary is the same archive tested by release candidates?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/How-can-the-team-verify-that-the-submitted-binary-is-the-same-archive-tested-by-release-candidates%3F)

## Best Practices

- [Open `Runner.xcworkspace` for CocoaPods-integrated builds and keep target configuration changes reviewable](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Open-Runner.xcworkspace-for-CocoaPods-integrated-builds-and-keep-target-configuration-changes-reviewable)
- [Pin native dependencies with the lockfile and reproduce pod installation in continuous integration](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Pin-native-dependencies-with-the-lockfile-and-reproduce-pod-installation-in-continuous-integration)
- [Give every app variant and extension an intentional, stable bundle identifier](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Give-every-app-variant-and-extension-an-intentional%2C-stable-bundle-identifier)
- [Keep capabilities, entitlements, and provisioning profiles aligned](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Keep-capabilities%2C-entitlements%2C-and-provisioning-profiles-aligned)
- [Store signing certificates and private keys in access-controlled secret storage and rotate them deliberately](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Store-signing-certificates-and-private-keys-in-access-controlled-secret-storage-and-rotate-them-deliberately)
- [Prepare App Store Connect roles, agreements, metadata, compliance, and review notes before submission](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Prepare-App-Store-Connect-roles%2C-agreements%2C-metadata%2C-compliance%2C-and-review-notes-before-submission)
- [Exercise the release candidate through TestFlight and promote the tested build rather than rebuilding it](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Exercise-the-release-candidate-through-TestFlight-and-promote-the-tested-build-rather-than-rebuilding-it)
- [Archive an explicit scheme and release configuration, then retain symbols and build provenance](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Archive-an-explicit-scheme-and-release-configuration%2C-then-retain-symbols-and-build-provenance)
- [Keep export configuration deterministic and separate from credentials](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Keep-export-configuration-deterministic-and-separate-from-credentials)
- [Audit privacy manifests and store privacy disclosures whenever code or SDK dependencies change](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Audit-privacy-manifests-and-store-privacy-disclosures-whenever-code-or-SDK-dependencies-change)
- [Validate app icons on representative devices and store previews](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Validate-app-icons-on-representative-devices-and-store-previews)
- [Use a static, adaptive launch screen that transitions cleanly to the application's first Flutter frame](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Use-a-static%2C-adaptive-launch-screen-that-transitions-cleanly-to-the-application's-first-Flutter-frame)
- [Automate repeatable checks for versioning, signing, archive validation, and artifact retention](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Automate-repeatable-checks-for-versioning%2C-signing%2C-archive-validation%2C-and-artifact-retention)
- [Test a clean release build on real supported devices before each submission](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/iOS-Release/Test-a-clean-release-build-on-real-supported-devices-before-each-submission)

[< Back to build & release deployment](../README.md)
