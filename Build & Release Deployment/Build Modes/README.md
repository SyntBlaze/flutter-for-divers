# Build Modes

Flutter build modes control how Dart code is compiled, which runtime services
are available, and how aggressively an application is optimized. Choose the
mode for the job: debug for rapid development, profile for representative
performance measurement, and release for distribution and final validation.

```text
source code
    |
    +----> debug -----> JIT* -----> hot reload / hot restart
    |
    +----> profile ---> AOT ------> performance tracing with limited diagnostics
    |
    +----> release ---> AOT ------> tree shaking + optional obfuscation
                                      |
                                      +----> split debug info / symbols

* JIT is used for Flutter debug development on supported targets; target
  platform constraints can change the available compilation strategy.
```

Mode selection affects assertions, service extensions, observability, startup,
binary size, and execution speed. Debug timings and memory behavior are not a
reliable prediction of a shipped application. Profile mode retains the tooling
needed to measure performance while using release-like compilation, and release
mode removes development services and enables production optimizations.

Compilation and packaging options are related but distinct. JIT and AOT
describe when code is compiled; hot reload and hot restart describe development
workflows; tree shaking removes unreachable code; and obfuscation changes symbol
names. When obfuscating, split debug information must be stored securely and
retained for the exact build so production stack traces can be symbolicated.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Build-Modes) — Focused, bite-sized article covering Build Modes
- [Learning Path](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Build-Modes) — Step-by-step material that builds practical Build Modes knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Build-Modes) — Structured, in-depth material for learning about Build Modes thoroughly

## Build Modes Topics

| Topic | Focus | Key considerations | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Debug mode | Iterate with assertions, service extensions, and development tooling | Use for coding and functional debugging; do not use its performance or size as release evidence | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Build-Modes/Debug-mode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Build-Modes/Debug-mode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Build-Modes/Debug-mode "Deep Dive") |
| Profile mode | Measure performance with release-like execution and tracing support | Test on representative physical hardware; profile builds are not distribution artifacts | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Build-Modes/Profile-mode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Build-Modes/Profile-mode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Build-Modes/Profile-mode "Deep Dive") |
| Release mode | Produce optimized artifacts intended for validation and distribution | Verify signing, configuration, observability, and behavior without debug-only checks | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Build-Modes/Release-mode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Build-Modes/Release-mode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Build-Modes/Release-mode "Deep Dive") |
| JIT compilation | Compile Dart code during a development session | Enables fast iteration and runtime code updates, with overhead unsuitable for production measurement | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Build-Modes/JIT-compilation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Build-Modes/JIT-compilation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Build-Modes/JIT-compilation "Deep Dive") |
| AOT compilation | Compile application code ahead of execution | Improves startup and predictable runtime performance but removes JIT-based development workflows | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Build-Modes/AOT-compilation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Build-Modes/AOT-compilation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Build-Modes/AOT-compilation "Deep Dive") |
| Hot reload | Inject changed code while preserving the running app state where possible | Reassemble widgets after code changes; structural or native changes can require a restart | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Build-Modes/Hot-reload "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Build-Modes/Hot-reload "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Build-Modes/Hot-reload "Deep Dive") |
| Hot restart | Restart Dart execution without rebuilding the native host application | Resets application state and reruns `main`; plugin or platform changes still require a full restart | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Build-Modes/Hot-restart "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Build-Modes/Hot-restart "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Build-Modes/Hot-restart "Deep Dive") |
| Tree shaking | Remove code and resources proven unreachable from the production artifact | Dynamic references and entry-point annotations can affect reachability; compare release artifacts | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Build-Modes/Tree-shaking "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Build-Modes/Tree-shaking "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Build-Modes/Tree-shaking "Deep Dive") |
| Obfuscation | Rename Dart symbols to make production code harder to inspect | It is not encryption; preserve symbols and build identity for crash diagnosis | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Build-Modes/Obfuscation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Build-Modes/Obfuscation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Build-Modes/Obfuscation "Deep Dive") |
| Split debug info | Store debugging symbols separately from the shipped artifact | Keep each build's output immutable, private, backed up, and associated with its version and build number | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Build-Modes/Split-debug-info "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Build-Modes/Split-debug-info "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Build-Modes/Split-debug-info "Deep Dive") |

## Questions

- [When should an app run in debug, profile, or release mode?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/When-should-an-app-run-in-debug%2C-profile%2C-or-release-mode%3F)
- [Why should frame timing and startup performance be measured in profile mode on a physical device?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Why-should-frame-timing-and-startup-performance-be-measured-in-profile-mode-on-a-physical-device%3F)
- [Which development services, assertions, and diagnostics differ in a release build?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Which-development-services%2C-assertions%2C-and-diagnostics-differ-in-a-release-build%3F)
- [How does JIT compilation make iterative development faster?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/How-does-JIT-compilation-make-iterative-development-faster%3F)
- [Why is AOT compilation used for production Flutter applications?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Why-is-AOT-compilation-used-for-production-Flutter-applications%3F)
- [Which code changes can hot reload apply without losing current state?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Which-code-changes-can-hot-reload-apply-without-losing-current-state%3F)
- [When is hot restart sufficient, and when is a full application restart required?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/When-is-hot-restart-sufficient%2C-and-when-is-a-full-application-restart-required%3F)
- [How can reflection-like or dynamically referenced entry points affect tree shaking?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/How-can-reflection-like-or-dynamically-referenced-entry-points-affect-tree-shaking%3F)
- [What does obfuscation protect, and what does it leave visible?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/What-does-obfuscation-protect%2C-and-what-does-it-leave-visible%3F)
- [How are production stack traces symbolicated with split debug information?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/How-are-production-stack-traces-symbolicated-with-split-debug-information%3F)
- [Which build mode should CI use for unit tests, performance tests, and distributable artifacts?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Which-build-mode-should-CI-use-for-unit-tests%2C-performance-tests%2C-and-distributable-artifacts%3F)
- [How can a team prove that it can diagnose a crash from an obfuscated release build?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/How-can-a-team-prove-that-it-can-diagnose-a-crash-from-an-obfuscated-release-build%3F)

## Best Practices

- [Use debug mode for iteration, assertions, and interactive diagnostics](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Use-debug-mode-for-iteration%2C-assertions%2C-and-interactive-diagnostics)
- [Measure performance in profile mode on representative physical hardware](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Measure-performance-in-profile-mode-on-representative-physical-hardware)
- [Run release-mode smoke tests before distributing an artifact](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Run-release-mode-smoke-tests-before-distributing-an-artifact)
- [Treat JIT behavior and timings as development feedback rather than production evidence](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Treat-JIT-behavior-and-timings-as-development-feedback-rather-than-production-evidence)
- [Validate AOT-only code paths and target-specific constraints early](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Validate-AOT-only-code-paths-and-target-specific-constraints-early)
- [Keep widget state out of build methods so hot reload can preserve useful context](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Keep-widget-state-out-of-build-methods-so-hot-reload-can-preserve-useful-context)
- [Use hot restart when initialization or global state must be rerun](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Use-hot-restart-when-initialization-or-global-state-must-be-rerun)
- [Measure artifact contents and size instead of assuming tree shaking removed a dependency](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Measure-artifact-contents-and-size-instead-of-assuming-tree-shaking-removed-a-dependency)
- [Use obfuscation as one defense-in-depth measure, never as secret storage](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Use-obfuscation-as-one-defense-in-depth-measure%2C-never-as-secret-storage)
- [Archive split debug information with the exact version, build number, and source revision](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Archive-split-debug-information-with-the-exact-version%2C-build-number%2C-and-source-revision)
- [Keep mode-specific configuration explicit and reviewable](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Keep-mode-specific-configuration-explicit-and-reviewable)
- [Do not ship secrets in any build mode; client binaries cannot keep embedded credentials private](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Do-not-ship-secrets-in-any-build-mode%3B-client-binaries-cannot-keep-embedded-credentials-private)
- [Automate reproducible release builds and retain their provenance](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Automate-reproducible-release-builds-and-retain-their-provenance)
- [Exercise crash reporting and symbolication before the first production incident](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Build-Modes/Exercise-crash-reporting-and-symbolication-before-the-first-production-incident)

[< Back to build & release deployment](../README.md)
