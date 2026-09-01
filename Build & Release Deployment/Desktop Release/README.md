# Desktop Release

Desktop release work turns a Flutter application into a platform-native product
that operating systems can install, trust, update, and run. The Flutter build is
only the first stage: each target also needs suitable metadata, packaged native
dependencies, a distribution format, and platform-specific signing or trust
checks.

```text
Flutter source + platform runners + native dependencies
                         |
                         v
              release build for target OS
                         |
              +----------+----------+
              |          |          |
              v          v          v
          macOS .app   Windows app  Linux bundle
              |          |          |
              v          v          v
         code signing  MSIX/signing  AppImage | snap | deb
              |
              v
        notarization + stapling
              |          |          |
              +----------+----------+
                         v
             install, update, and smoke test
                         |
                         v
                    distribution
```

The package is part of the product contract, not merely a container. It carries
the application identity, version, icons, permissions, architecture, dependency
requirements, and update behavior. macOS relies on code signing and, for common
outside-store distribution, notarization to establish trust. Windows packages
can use MSIX for declared identity, installation, and update semantics, while
Authenticode signing lets users and Windows verify the publisher and integrity.

Linux distribution is more varied. AppImage favors a portable application file,
snap favors a managed and sandbox-aware package, and deb integrates with Debian-
based package management. Each format makes different assumptions about bundled
libraries and the host system. On every platform, native plugins and other
libraries must match the target architecture and be present in the final package
without violating runtime paths, licenses, or platform policy.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Desktop-Release) — Focused, bite-sized article covering Desktop Release
- [Learning Path](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Desktop-Release) — Step-by-step material that builds practical Desktop Release knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Desktop-Release) — Structured, in-depth material for learning about Desktop Release thoroughly

## Desktop Release Topics

| Topic | Focus | Key considerations | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| macOS signing | Establish the identity and integrity of a macOS application and its nested code | Use the intended distribution identity, sign nested components consistently, configure entitlements deliberately, and verify the completed app | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Desktop-Release/macOS-signing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Desktop-Release/macOS-signing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Desktop-Release/macOS-signing "Deep Dive") |
| macOS notarization | Submit a signed macOS build for Apple's automated security checks | Notarize the exact distributable, retain submission evidence, wait for acceptance, staple where supported, and test Gatekeeper behavior | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Desktop-Release/macOS-notarization "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Desktop-Release/macOS-notarization "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Desktop-Release/macOS-notarization "Deep Dive") |
| Windows MSIX | Package a Windows application with installable identity and metadata | Keep package identity, publisher, version, architecture, capabilities, assets, and update strategy consistent | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Desktop-Release/Windows-MSIX "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Desktop-Release/Windows-MSIX "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Desktop-Release/Windows-MSIX "Deep Dive") |
| Windows signing | Apply and verify an Authenticode signature on Windows artifacts | Protect the private key, use an appropriate trusted certificate and timestamp, and verify after all packaging changes | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Desktop-Release/Windows-signing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Desktop-Release/Windows-signing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Desktop-Release/Windows-signing "Deep Dive") |
| Linux AppImage | Produce a portable Linux application image | Bundle required user-space libraries carefully, preserve executable permissions, test desktop integration, and exercise multiple distributions | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Desktop-Release/Linux-AppImage "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Desktop-Release/Linux-AppImage "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Desktop-Release/Linux-AppImage "Deep Dive") |
| Linux snap | Build a snap package with declared confinement and interfaces | Define plugs and slots from actual access needs, choose confinement deliberately, and validate revisions through channels | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Desktop-Release/Linux-snap "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Desktop-Release/Linux-snap "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Desktop-Release/Linux-snap "Deep Dive") |
| Linux deb | Package an application for Debian-based systems | Declare package metadata and dependencies accurately, follow filesystem conventions, and test install, upgrade, and removal paths | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Desktop-Release/Linux-deb "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Desktop-Release/Linux-deb "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Desktop-Release/Linux-deb "Deep Dive") |
| Native dependencies | Ship plugins, shared libraries, frameworks, and runtimes required by the desktop app | Match OS and architecture, manage runtime search paths and ABI compatibility, include licenses, and test on clean machines | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Desktop-Release/Native-dependencies "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Desktop-Release/Native-dependencies "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Desktop-Release/Native-dependencies "Deep Dive") |

## Questions

- [Which macOS identity, entitlements, and signing order should a distribution build use?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Which-macOS-identity%2C-entitlements%2C-and-signing-order-should-a-distribution-build-use%3F)
- [When should a macOS artifact be notarized and stapled?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/When-should-a-macOS-artifact-be-notarized-and-stapled%3F)
- [How should MSIX identity, capabilities, versions, and update behavior be defined?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/How-should-MSIX-identity%2C-capabilities%2C-versions%2C-and-update-behavior-be-defined%3F)
- [Which Windows artifacts need signing, and how should signatures and timestamps be verified?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Which-Windows-artifacts-need-signing%2C-and-how-should-signatures-and-timestamps-be-verified%3F)
- [Which libraries belong inside an AppImage, and which should remain host-provided?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Which-libraries-belong-inside-an-AppImage%2C-and-which-should-remain-host-provided%3F)
- [Which snap confinement level and interfaces does the application actually require?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Which-snap-confinement-level-and-interfaces-does-the-application-actually-require%3F)
- [How should a deb declare dependencies and behave during installation, upgrade, and removal?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/How-should-a-deb-declare-dependencies-and-behave-during-installation%2C-upgrade%2C-and-removal%3F)
- [How can native libraries and plugins be validated across operating systems and CPU architectures?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/How-can-native-libraries-and-plugins-be-validated-across-operating-systems-and-CPU-architectures%3F)
- [Should one release pipeline produce every desktop package format?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Should-one-release-pipeline-produce-every-desktop-package-format%3F)
- [How can a release be tested without relying on dependencies already installed on a developer machine?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/How-can-a-release-be-tested-without-relying-on-dependencies-already-installed-on-a-developer-machine%3F)
- [Which application identity and version values must stay aligned across Flutter, native projects, packages, and update services?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Which-application-identity-and-version-values-must-stay-aligned-across-Flutter%2C-native-projects%2C-packages%2C-and-update-services%3F)
- [What evidence should be retained so a shipped desktop artifact can be reproduced and audited?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/What-evidence-should-be-retained-so-a-shipped-desktop-artifact-can-be-reproduced-and-audited%3F)

## Best Practices

- [Build, package, and test each desktop target on the operating system it supports](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Build%2C-package%2C-and-test-each-desktop-target-on-the-operating-system-it-supports)
- [Keep application identity, semantic version, build number, and architecture explicit throughout the pipeline](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Keep-application-identity%2C-semantic-version%2C-build-number%2C-and-architecture-explicit-throughout-the-pipeline)
- [Sign the final immutable macOS application and verify every nested executable component](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Sign-the-final-immutable-macOS-application-and-verify-every-nested-executable-component)
- [Automate notarization status checks and staple accepted macOS artifacts where the format supports it](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Automate-notarization-status-checks-and-staple-accepted-macOS-artifacts-where-the-format-supports-it)
- [Treat MSIX identity and publisher values as durable release configuration](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Treat-MSIX-identity-and-publisher-values-as-durable-release-configuration)
- [Timestamp Windows signatures and verify them after packaging](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Timestamp-Windows-signatures-and-verify-them-after-packaging)
- [Test AppImages on clean representatives of the oldest and newest supported Linux environments](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Test-AppImages-on-clean-representatives-of-the-oldest-and-newest-supported-Linux-environments)
- [Grant snaps only the interfaces required by real application behavior](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Grant-snaps-only-the-interfaces-required-by-real-application-behavior)
- [Validate deb installation, upgrade, downgrade policy, and removal in disposable systems](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Validate-deb-installation%2C-upgrade%2C-downgrade-policy%2C-and-removal-in-disposable-systems)
- [Inventory native dependencies, architectures, licenses, and runtime loading paths](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Inventory-native-dependencies%2C-architectures%2C-licenses%2C-and-runtime-loading-paths)
- [Smoke test installed packages as a standard user, including first launch, restart, update, and uninstall](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Smoke-test-installed-packages-as-a-standard-user%2C-including-first-launch%2C-restart%2C-update%2C-and-uninstall)
- [Keep signing keys and credentials outside source control and expose them only to protected release jobs](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Keep-signing-keys-and-credentials-outside-source-control-and-expose-them-only-to-protected-release-jobs)
- [Archive checksums, package manifests, signing and notarization evidence, symbols, logs, and source revision for every release](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Archive-checksums%2C-package-manifests%2C-signing-and-notarization-evidence%2C-symbols%2C-logs%2C-and-source-revision-for-every-release)
- [Test the exact artifact intended for distribution rather than repackaging a previously tested build](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Desktop-Release/Test-the-exact-artifact-intended-for-distribution-rather-than-repackaging-a-previously-tested-build)

[< Back to build & release deployment](../README.md)
