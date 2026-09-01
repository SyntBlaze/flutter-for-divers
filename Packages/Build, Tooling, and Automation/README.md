# Build, Tooling, and Automation

Build and automation tools turn project intent into repeatable source code,
assets, application bundles, and releases. This category covers code generation,
workspace orchestration, project and feature scaffolding, flavor configuration,
brand-asset generation, and delivery of controlled code updates.

```text
source inputs
     |
     v
configuration (manifests, schemas, flavors, and tool settings)
     |
     v
generation (Dart code, assets, icons, splash screens, and scaffolds)
     |
     v
build (analyze, test, compile, sign, and package)
     |
     v
release (publish, observe, promote, patch, or roll back)
```

Automation should make the same declared inputs produce the same reviewable
result on a developer machine and in continuous integration. Generated output
still belongs to the software supply chain: teams need to know which tool owns
it, whether it is committed, when it must be regenerated, and how unexpected
changes are reviewed. Release automation also crosses trust boundaries through
signing identities, store credentials, environment secrets, and production
rollouts, so convenience must not weaken auditability or recovery.

## Selection Guidance

Choose tools according to the boundary being automated. Build Runner coordinates
builders that derive Dart artifacts from annotated source, while FlutterGen
Runner creates typed accessors for assets, fonts, and related resources. Very
Good CLI scaffolds opinionated Flutter and Dart projects; Mason CLI applies
reusable bricks at smaller or custom architectural boundaries. Use Melos when a
repository contains multiple interdependent packages that need coordinated
bootstrap, scripts, versioning, or publishing workflows.

Flutter Launcher Icons and Flutter Native Splash automate narrow pieces of app
branding from declarative configuration. Flutter Flavorizr generates much of
the platform and Dart setup needed for distinct application flavors, but its
output still needs review alongside bundle identifiers, signing, entitlements,
and service configuration. Shorebird Code Push addresses post-release delivery
of compatible Dart-code patches; treat it as a release channel with staged
rollout, monitoring, rollback, and platform-policy checks rather than as a
substitute for normal store releases. Prefer the smallest tool that clearly
owns a step, and avoid overlapping generators that rewrite the same files.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Build-Tooling-and-Automation) — Focused, bite-sized article covering Build, Tooling, and Automation
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Build-Tooling-and-Automation) — Step-by-step material that builds practical Build, Tooling, and Automation knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Build-Tooling-and-Automation) — Structured, in-depth material for learning about Build, Tooling, and Automation thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Build Runner | Coordinates source generation through registered builders and a dependency graph | Projects that use annotation-driven generators for models, serializers, dependency injection, or other derived Dart code | [💡](https://app.syntblaze.com/qt/flutter/Packages/Build-Tooling-and-Automation/Build-Runner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Build-Tooling-and-Automation/Build-Runner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Build-Tooling-and-Automation/Build-Runner "Deep Dive") |
| FlutterGen Runner | Generates type-safe Dart accessors from declared Flutter assets, fonts, and related resources | Replacing fragile string literals with discoverable, compiler-checked resource references | [💡](https://app.syntblaze.com/qt/flutter/Packages/Build-Tooling-and-Automation/FlutterGen-Runner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Build-Tooling-and-Automation/FlutterGen-Runner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Build-Tooling-and-Automation/FlutterGen-Runner "Deep Dive") |
| Very Good CLI | Creates and manages opinionated Flutter or Dart project scaffolds and workflows | Starting projects with a consistent architecture, testing setup, and team conventions | [💡](https://app.syntblaze.com/qt/flutter/Packages/Build-Tooling-and-Automation/Very-Good-CLI "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Build-Tooling-and-Automation/Very-Good-CLI "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Build-Tooling-and-Automation/Very-Good-CLI "Deep Dive") |
| Melos | Orchestrates scripts and package workflows across a multi-package Dart or Flutter repository | Monorepos that need coordinated dependency setup, analysis, testing, generation, versioning, or publishing | [💡](https://app.syntblaze.com/qt/flutter/Packages/Build-Tooling-and-Automation/Melos "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Build-Tooling-and-Automation/Melos "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Build-Tooling-and-Automation/Melos "Deep Dive") |
| Mason CLI | Generates files from parameterized, reusable brick templates | Repeatable feature, module, test, or organization-specific scaffolding within and across projects | [💡](https://app.syntblaze.com/qt/flutter/Packages/Build-Tooling-and-Automation/Mason-CLI "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Build-Tooling-and-Automation/Mason-CLI "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Build-Tooling-and-Automation/Mason-CLI "Deep Dive") |
| Flutter Launcher Icons | Generates platform launcher-icon resources from declarative image configuration | Keeping Android, iOS, web, and desktop app icons synchronized from approved source artwork | [💡](https://app.syntblaze.com/qt/flutter/Packages/Build-Tooling-and-Automation/Flutter-Launcher-Icons "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Build-Tooling-and-Automation/Flutter-Launcher-Icons "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Build-Tooling-and-Automation/Flutter-Launcher-Icons "Deep Dive") |
| Flutter Native Splash | Generates native launch-screen resources and platform configuration | Providing consistent startup branding before Flutter renders its first frame | [💡](https://app.syntblaze.com/qt/flutter/Packages/Build-Tooling-and-Automation/Flutter-Native-Splash "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Build-Tooling-and-Automation/Flutter-Native-Splash "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Build-Tooling-and-Automation/Flutter-Native-Splash "Deep Dive") |
| Flutter Flavorizr | Generates flavor-aware Dart and native project configuration from a central specification | Applications with development, staging, production, white-label, or other build variants | [💡](https://app.syntblaze.com/qt/flutter/Packages/Build-Tooling-and-Automation/Flutter-Flavorizr "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Build-Tooling-and-Automation/Flutter-Flavorizr "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Build-Tooling-and-Automation/Flutter-Flavorizr "Deep Dive") |
| Shorebird Code Push | Delivers compatible Dart-code patches to already released Flutter applications | Carefully controlled fixes that need a faster delivery path than a complete store release | [💡](https://app.syntblaze.com/qt/flutter/Packages/Build-Tooling-and-Automation/Shorebird-Code-Push "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Build-Tooling-and-Automation/Shorebird-Code-Push "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Build-Tooling-and-Automation/Shorebird-Code-Push "Deep Dive") |

## Questions

- [Which project artifacts are authored source, configuration, generated output, or build output?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Which-project-artifacts-are-authored-source%2C-configuration%2C-generated-output%2C-or-build-output%3F)
- [When should generated files be committed, and when should CI recreate them?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/When-should-generated-files-be-committed%2C-and-when-should-CI-recreate-them%3F)
- [How can CI detect generated code that is stale or differs from a clean regeneration?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/How-can-CI-detect-generated-code-that-is-stale-or-differs-from-a-clean-regeneration%3F)
- [What must be pinned to make local and CI builds reproducible?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/What-must-be-pinned-to-make-local-and-CI-builds-reproducible%3F)
- [When is a project scaffold preferable to a smaller feature template?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/When-is-a-project-scaffold-preferable-to-a-smaller-feature-template%3F)
- [How should a team evolve templates without silently rewriting existing projects?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/How-should-a-team-evolve-templates-without-silently-rewriting-existing-projects%3F)
- [When does a repository benefit from monorepo orchestration?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/When-does-a-repository-benefit-from-monorepo-orchestration%3F)
- [How can scripts run only for packages affected by a change?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/How-can-scripts-run-only-for-packages-affected-by-a-change%3F)
- [Which flavor properties belong in source control, and which must remain secret?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Which-flavor-properties-belong-in-source-control%2C-and-which-must-remain-secret%3F)
- [How are bundle identifiers, signing identities, entitlements, and backend configuration aligned per flavor?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/How-are-bundle-identifiers%2C-signing-identities%2C-entitlements%2C-and-backend-configuration-aligned-per-flavor%3F)
- [What source artwork and platform constraints govern launcher icons and splash screens?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/What-source-artwork-and-platform-constraints-govern-launcher-icons-and-splash-screens%3F)
- [How should generated native changes be reviewed after a Flutter or platform-toolchain upgrade?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/How-should-generated-native-changes-be-reviewed-after-a-Flutter-or-platform-toolchain-upgrade%3F)
- [Which checks must pass before automation can publish an artifact or package?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Which-checks-must-pass-before-automation-can-publish-an-artifact-or-package%3F)
- [Which changes are safe and policy-compliant to deliver through code push?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Which-changes-are-safe-and-policy-compliant-to-deliver-through-code-push%3F)
- [How are staged rollout, monitoring, and rollback handled when a patch misbehaves?](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/How-are-staged-rollout%2C-monitoring%2C-and-rollback-handled-when-a-patch-misbehaves%3F)

## Best Practices

- [Pin the Flutter SDK, Dart SDK, package lockfiles, and automation tool versions](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Pin-the-Flutter-SDK%2C-Dart-SDK%2C-package-lockfiles%2C-and-automation-tool-versions)
- [Run generators from declared configuration instead of undocumented local commands](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Run-generators-from-declared-configuration-instead-of-undocumented-local-commands)
- [Document the owner, inputs, outputs, and invocation for every generated artifact](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Document-the-owner%2C-inputs%2C-outputs%2C-and-invocation-for-every-generated-artifact)
- [Choose one policy for generated files and enforce it consistently in reviews and CI](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Choose-one-policy-for-generated-files-and-enforce-it-consistently-in-reviews-and-CI)
- [Fail CI when clean regeneration produces an uncommitted diff](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Fail-CI-when-clean-regeneration-produces-an-uncommitted-diff)
- [Keep generated output separate from hand-authored code and never edit it directly](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Keep-generated-output-separate-from-hand-authored-code-and-never-edit-it-directly)
- [Make automation scripts deterministic, non-interactive, and safe to run repeatedly](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Make-automation-scripts-deterministic%2C-non-interactive%2C-and-safe-to-run-repeatedly)
- [Cache dependencies and build products only when cache keys include every relevant input](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Cache-dependencies-and-build-products-only-when-cache-keys-include-every-relevant-input)
- [Use the same checked-in commands locally and in CI](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Use-the-same-checked-in-commands-locally-and-in-CI)
- [Scope monorepo scripts to dependency order and affected packages where correctness permits](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Scope-monorepo-scripts-to-dependency-order-and-affected-packages-where-correctness-permits)
- [Require analysis and tests at both package boundaries and representative integrated-app boundaries](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Require-analysis-and-tests-at-both-package-boundaries-and-representative-integrated-app-boundaries)
- [Keep flavor names and non-secret mappings declarative while injecting secrets through protected environments](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Keep-flavor-names-and-non-secret-mappings-declarative-while-injecting-secrets-through-protected-environments)
- [Separate signing credentials and production publishing authority from ordinary build jobs](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Separate-signing-credentials-and-production-publishing-authority-from-ordinary-build-jobs)
- [Generate icons and splash screens from approved high-resolution sources and review every platform result](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Generate-icons-and-splash-screens-from-approved-high-resolution-sources-and-review-every-platform-result)
- [Review generated native configuration whenever platform targets or toolchains change](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Review-generated-native-configuration-whenever-platform-targets-or-toolchains-change)
- [Publish immutable, traceable artifacts with source revision, toolchain, and configuration metadata](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Publish-immutable%2C-traceable-artifacts-with-source-revision%2C-toolchain%2C-and-configuration-metadata)
- [Stage code-push rollouts, define health signals, and keep a tested rollback path](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Stage-code-push-rollouts%2C-define-health-signals%2C-and-keep-a-tested-rollback-path)
- [Restrict code-push patches to compatible changes allowed by platform policy and verify them on release builds](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Restrict-code-push-patches-to-compatible-changes-allowed-by-platform-policy-and-verify-them-on-release-builds)
- [Retain logs for generation, signing, publishing, promotion, patching, and rollback actions](https://app.syntblaze.com/qsp/flutter/Packages/Build-Tooling-and-Automation/Retain-logs-for-generation%2C-signing%2C-publishing%2C-promotion%2C-patching%2C-and-rollback-actions)

[< Back to packages](../README.md)
