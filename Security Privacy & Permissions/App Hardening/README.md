# App Hardening

Application hardening raises the effort required to inspect, tamper with, or
extract sensitive data from a released Flutter application. It combines
release-build controls, platform protections, careful handling of sensitive
surfaces, and automated checks. It cannot make code or data delivered to an
untrusted device confidential, and it must not become the application's
authorization boundary.

```text
Dart and native source
        |
        v
release build --obfuscate --split-debug-info=<private directory>
        |                              |
        v                              v
signed distributable            retained symbol artifacts
(harder to inspect,              (access-controlled, matched
 not impossible)                 to the exact release)
        |                              |
        +------------+-----------------+
                     v
          symbolicated production diagnostics

device-integrity signals + server risk context -> proportionate response
sensitive screen, clipboard, and log data       -> minimize and redact
source, history, dependencies, and build output -> scan for exposed secrets
```

Flutter's `--obfuscate` release option renames Dart symbols on supported build
targets; it does not encrypt the binary, hide string literals and bundled
assets, obfuscate every native component, or prevent modification. Pair it
with `--split-debug-info` and retain the output for each exact release so
obfuscated stack traces can be decoded with Flutter's symbolization tooling.
Treat those files as restricted release artifacts: losing them can make
production diagnostics permanently unreadable, while publishing them reduces
the value of obfuscation.

Root and jailbreak detection are bypassable signals collected on a device an
attacker may control. Use them as one input to risk decisions, combine them
with server-side authorization and abuse controls, and plan behavior for false
positives and unsupported platforms. Likewise, screenshot restrictions vary
by operating system: Android can mark a window as secure, while Apple
platforms generally require capture detection and careful UI handling rather
than offering a universal screenshot-prevention guarantee. Web and desktop
targets have different capture and integrity boundaries again.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/App-Hardening) — Focused, bite-sized article covering App Hardening
- [Learning Path](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/App-Hardening) — Step-by-step material that builds practical App Hardening knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/App-Hardening) — Structured, in-depth material for learning about App Hardening thoroughly

## App Hardening Topics

| Topic | Primary role | Limitation or boundary | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Obfuscation | Renames symbols in supported Flutter release builds to increase analysis effort | Does not conceal embedded data, protect every native component, or stop a determined analyst | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/App-Hardening/Obfuscation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/App-Hardening/Obfuscation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/App-Hardening/Obfuscation "Deep Dive") |
| Split debug info | Separates symbol information needed to decode obfuscated production traces | Artifacts must be retained securely and matched to the exact platform, architecture, and release | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/App-Hardening/Split-debug-info "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/App-Hardening/Split-debug-info "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/App-Hardening/Split-debug-info "Deep Dive") |
| Root detection | Adds Android device-compromise heuristics to a wider risk assessment | Results can be hidden, forged, or wrong and must not replace server authorization | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/App-Hardening/Root-detection "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/App-Hardening/Root-detection "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/App-Hardening/Root-detection "Deep Dive") |
| Jailbreak detection | Adds Apple device-integrity heuristics to a wider risk assessment | A modified runtime can bypass checks, and legitimate environments can trigger false positives | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/App-Hardening/Jailbreak-detection "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/App-Hardening/Jailbreak-detection "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/App-Hardening/Jailbreak-detection "Deep Dive") |
| Screenshot prevention | Reduces accidental or casual capture of sensitive screens where a platform supports it | Platform coverage differs, external cameras remain possible, and Apple platforms offer no universal prevention switch | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/App-Hardening/Screenshot-prevention "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/App-Hardening/Screenshot-prevention "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/App-Hardening/Screenshot-prevention "Deep Dive") |
| Clipboard hygiene | Limits sensitive values placed on a shared, observable system surface | Clearing is best effort and cannot retract data already read, synchronized, or retained elsewhere | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/App-Hardening/Clipboard-hygiene "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/App-Hardening/Clipboard-hygiene "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/App-Hardening/Clipboard-hygiene "Deep Dive") |
| Log redaction | Removes credentials, personal data, and sensitive payload fields before recording diagnostics | Redaction must happen before data reaches loggers, crash SDKs, platform consoles, or network interceptors | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/App-Hardening/Log-redaction "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/App-Hardening/Log-redaction "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/App-Hardening/Log-redaction "Deep Dive") |
| Secret scanning | Detects credential patterns in source, history, configuration, and build workflows | Findings require validation, and any real exposed secret must be revoked or rotated rather than merely deleted | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/App-Hardening/Secret-scanning "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/App-Hardening/Secret-scanning "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/App-Hardening/Secret-scanning "Deep Dive") |
| Reverse engineering limits | Sets realistic expectations for controls applied to a distributed client | Attackers can inspect, instrument, patch, replay, or replace client behavior, so trusted services enforce security decisions | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/App-Hardening/Reverse-engineering-limits "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/App-Hardening/Reverse-engineering-limits "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/App-Hardening/Reverse-engineering-limits "Deep Dive") |

## Questions

- [Which Flutter build targets and artifacts are actually covered by Dart obfuscation?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Which-Flutter-build-targets-and-artifacts-are-actually-covered-by-Dart-obfuscation%3F)
- [Which strings, assets, metadata, native code, and runtime behavior remain observable after obfuscation?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Which-strings%2C-assets%2C-metadata%2C-native-code%2C-and-runtime-behavior-remain-observable-after-obfuscation%3F)
- [How are split-debug-info artifacts named, access-controlled, backed up, and mapped to an exact release?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/How-are-split-debug-info-artifacts-named%2C-access-controlled%2C-backed-up%2C-and-mapped-to-an-exact-release%3F)
- [How will an obfuscated crash trace be symbolicated during an incident?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/How-will-an-obfuscated-crash-trace-be-symbolicated-during-an-incident%3F)
- [What proportionate action should follow a weak, uncertain, or conflicting root signal?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/What-proportionate-action-should-follow-a-weak%2C-uncertain%2C-or-conflicting-root-signal%3F)
- [How can jailbreak heuristics be tested without treating a passing check as proof of integrity?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/How-can-jailbreak-heuristics-be-tested-without-treating-a-passing-check-as-proof-of-integrity%3F)
- [Which sensitive screens need protection, and what does each supported platform permit?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Which-sensitive-screens-need-protection%2C-and-what-does-each-supported-platform-permit%3F)
- [How are app-switcher snapshots, screen recording, screen sharing, and external capture handled?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/How-are-app-switcher-snapshots%2C-screen-recording%2C-screen-sharing%2C-and-external-capture-handled%3F)
- [Can a sensitive value avoid the clipboard entirely, and what is the fallback if it cannot?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Can-a-sensitive-value-avoid-the-clipboard-entirely%2C-and-what-is-the-fallback-if-it-cannot%3F)
- [Are tokens and personal fields removed before logs, breadcrumbs, and crash events are created?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Are-tokens-and-personal-fields-removed-before-logs%2C-breadcrumbs%2C-and-crash-events-are-created%3F)
- [Does secret scanning cover commits, repository history, generated files, CI configuration, and packaged artifacts?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Does-secret-scanning-cover-commits%2C-repository-history%2C-generated-files%2C-CI-configuration%2C-and-packaged-artifacts%3F)
- [What is the revocation and rotation procedure when a scanner finds a real credential?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/What-is-the-revocation-and-rotation-procedure-when-a-scanner-finds-a-real-credential%3F)
- [Which decisions and secrets must remain on trusted services because the client can be modified?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Which-decisions-and-secrets-must-remain-on-trusted-services-because-the-client-can-be-modified%3F)
- [How do release signing, server-side controls, telemetry, and incident response complete the defense-in-depth design?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/How-do-release-signing%2C-server-side-controls%2C-telemetry%2C-and-incident-response-complete-the-defense-in-depth-design%3F)

## Best Practices

- [Obfuscate supported release builds when the added analysis cost serves the threat model](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Obfuscate-supported-release-builds-when-the-added-analysis-cost-serves-the-threat-model)
- [Never treat obfuscation as encryption or embed a privileged shared secret in the application](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Never-treat-obfuscation-as-encryption-or-embed-a-privileged-shared-secret-in-the-application)
- [Generate split debug information in the same build as the distributed artifact](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Generate-split-debug-information-in-the-same-build-as-the-distributed-artifact)
- [Store symbols under restricted access with release, platform, architecture, and source-revision metadata](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Store-symbols-under-restricted-access-with-release%2C-platform%2C-architecture%2C-and-source-revision-metadata)
- [Exercise the production crash-symbolication path before shipping and retain symbols for the supported release lifetime](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Exercise-the-production-crash-symbolication-path-before-shipping-and-retain-symbols-for-the-supported-release-lifetime)
- [Treat root and jailbreak checks as bypassable, fallible risk signals](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Treat-root-and-jailbreak-checks-as-bypassable%2C-fallible-risk-signals)
- [Keep high-value authorization, entitlement, rate-limit, and fraud decisions on trusted services](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Keep-high-value-authorization%2C-entitlement%2C-rate-limit%2C-and-fraud-decisions-on-trusted-services)
- [Use proportionate responses and recovery paths instead of crashing or revealing detection details](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Use-proportionate-responses-and-recovery-paths-instead-of-crashing-or-revealing-detection-details)
- [Minimize sensitive information on screen and apply platform capture controls only where they provide useful coverage](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Minimize-sensitive-information-on-screen-and-apply-platform-capture-controls-only-where-they-provide-useful-coverage)
- [Protect app-switcher snapshots and clear sensitive UI when the session locks or the app backgrounds](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Protect-app-switcher-snapshots-and-clear-sensitive-UI-when-the-session-locks-or-the-app-backgrounds)
- [Avoid copying passwords, tokens, recovery codes, and private keys to the system clipboard](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Avoid-copying-passwords%2C-tokens%2C-recovery-codes%2C-and-private-keys-to-the-system-clipboard)
- [Redact at the event source and use allowlists for diagnostic fields carrying user or request context](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Redact-at-the-event-source-and-use-allowlists-for-diagnostic-fields-carrying-user-or-request-context)
- [Disable verbose diagnostics in release builds and test that failure paths do not expose sensitive values](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Disable-verbose-diagnostics-in-release-builds-and-test-that-failure-paths-do-not-expose-sensitive-values)
- [Run secret scanning before commit and in CI, then scan history and release artifacts at appropriate boundaries](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Run-secret-scanning-before-commit-and-in-CI%2C-then-scan-history-and-release-artifacts-at-appropriate-boundaries)
- [Revoke and rotate exposed credentials immediately; deleting the matching text is not remediation](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Revoke-and-rotate-exposed-credentials-immediately%3B-deleting-the-matching-text-is-not-remediation)
- [Layer signing, least privilege, short-lived credentials, server validation, abuse detection, and revocation around client controls](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Layer-signing%2C-least-privilege%2C-short-lived-credentials%2C-server-validation%2C-abuse-detection%2C-and-revocation-around-client-controls)
- [Test hardening on real release builds for every supported platform and document unsupported behavior](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/App-Hardening/Test-hardening-on-real-release-builds-for-every-supported-platform-and-document-unsupported-behavior)

[< Back to security privacy & permissions](../README.md)
