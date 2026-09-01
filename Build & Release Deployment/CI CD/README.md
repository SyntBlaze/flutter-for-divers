# CI/CD

Continuous integration gives every change the same dependency resolution,
analysis, tests, and build checks. Continuous delivery carries a verified
source revision through versioning, signing, artifact retention, and staged
distribution. For Flutter, a dependable pipeline must also account for the
different host operating systems and native toolchains required by Android,
iOS, web, macOS, Windows, and Linux.

```text
pull request or release tag
            |
            v
 restore tools and dependencies
            |
            v
 format -> analyze -> test -> reports
            |
            v
 assign version + build number
            |
            v
 platform build matrix
   |         |         |
 Android    Apple    web/desktop
   |         |         |
   +---- sign/package -+
            |
            v
 upload immutable artifacts
            |
            v
 internal testing -> staged production release
```

Keep pull-request validation fast enough to remain useful, and reserve costly
platform builds, signing, and publishing for trusted branches or tags. A
release should be traceable from its public version and platform build number
back to one source revision, dependency lockfile, toolchain, changelog entry,
test result set, and set of immutable artifacts.

Provider configuration is only one part of the system. GitHub Actions,
Codemagic, and Bitrise can coordinate jobs; Fastlane can automate native store
workflows; and Melos can manage commands across a multi-package repository.
Whichever tools are selected, keep ordinary build logic in version-controlled
scripts or task definitions, use least-privilege credentials, protect release
environments, and make retries safe.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD) — Focused, bite-sized article covering CI/CD
- [Learning Path](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD) — Step-by-step material that builds practical CI/CD knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD) — Structured, in-depth material for learning about CI/CD thoroughly

## CI/CD Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| GitHub Actions | Automating checks, builds, and releases with repository workflows and hosted or self-hosted runners | Pin third-party actions, constrain token permissions, cache only reproducible inputs, and protect publishing environments | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/GitHub-Actions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/GitHub-Actions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/GitHub-Actions "Deep Dive") |
| Codemagic | Running Flutter-oriented pipelines with managed mobile build infrastructure | Define workflows as code where practical, pin toolchain versions, and verify signing and publishing behavior independently of the dashboard | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/Codemagic "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/Codemagic "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/Codemagic "Deep Dive") |
| Bitrise | Composing mobile CI workflows from steps, scripts, stacks, and integrations | Pin stacks and step versions, make generated configuration reviewable, and keep critical build logic portable | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/Bitrise "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/Bitrise "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/Bitrise "Deep Dive") |
| Fastlane | Automating Apple and Android signing, metadata, screenshots, builds, and store delivery | Pin Ruby dependencies, review lane side effects, and isolate authentication from reusable release logic | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/Fastlane "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/Fastlane "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/Fastlane "Deep Dive") |
| Melos | Coordinating bootstrap, analysis, tests, versioning, and scripts across Dart and Flutter packages | Scope commands deliberately, respect package dependency order, and keep local and CI invocations equivalent | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/Melos "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/Melos "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/Melos "Deep Dive") |
| Version bump | Changing the user-visible semantic or product version for a release | Define who owns the decision, when it occurs, and how every platform and package receives the same intended version | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/Version-bump "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/Version-bump "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/Version-bump "Deep Dive") |
| Build number | Assigning a monotonically increasing platform release identifier | Generate collision-free values that satisfy each store and remain traceable to the CI run and source revision | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/Build-number "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/Build-number "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/Build-number "Deep Dive") |
| Changelog | Recording user-visible changes and release context | Generate from reviewed inputs, separate internal notes from public copy, and allow deliberate editorial changes before publishing | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/Changelog "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/Changelog "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/Changelog "Deep Dive") |
| Artifact upload | Retaining or distributing build outputs, symbols, mappings, checksums, and metadata | Upload once from a trusted job, use clear retention rules, verify checksums, and promote rather than rebuild | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/Artifact-upload "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/Artifact-upload "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/Artifact-upload "Deep Dive") |
| Test reports | Publishing machine-readable and human-readable evidence from automated checks | Preserve reports even when tests fail, merge sharded results carefully, and distinguish flaky retries from clean passes | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/Test-reports "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/Test-reports "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/Test-reports "Deep Dive") |
| Code signing secrets | Protecting certificates, private keys, profiles, passwords, and store API credentials | Use encrypted secret storage, least privilege, protected contexts, rotation procedures, and masked logs | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/Code-signing-secrets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/Code-signing-secrets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/Code-signing-secrets "Deep Dive") |
| Environment variables | Supplying non-source configuration to jobs and build commands | Classify secret and non-secret values, validate required inputs, scope them by environment, and avoid accidental compile-time exposure | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/CI-CD/Environment-variables "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/CI-CD/Environment-variables "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/CI-CD/Environment-variables "Deep Dive") |

## Questions

- [How should GitHub Actions permissions, reusable workflows, matrices, concurrency, and release environments be configured?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/How-should-GitHub-Actions-permissions%2C-reusable-workflows%2C-matrices%2C-concurrency%2C-and-release-environments-be-configured%3F)
- [Which Codemagic workflow settings belong in version control, and which belong in protected project configuration?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Which-Codemagic-workflow-settings-belong-in-version-control%2C-and-which-belong-in-protected-project-configuration%3F)
- [How can Bitrise stacks and steps be pinned while preserving a maintainable upgrade path?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/How-can-Bitrise-stacks-and-steps-be-pinned-while-preserving-a-maintainable-upgrade-path%3F)
- [Which native release tasks should Fastlane own, and which should remain in provider-neutral scripts?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Which-native-release-tasks-should-Fastlane-own%2C-and-which-should-remain-in-provider-neutral-scripts%3F)
- [How should Melos select affected packages and preserve dependency order in a monorepo pipeline?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/How-should-Melos-select-affected-packages-and-preserve-dependency-order-in-a-monorepo-pipeline%3F)
- [When is a version bump created, reviewed, committed, tagged, and propagated to packages and platforms?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/When-is-a-version-bump-created%2C-reviewed%2C-committed%2C-tagged%2C-and-propagated-to-packages-and-platforms%3F)
- [How are build numbers made monotonic when jobs retry or multiple release branches run concurrently?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/How-are-build-numbers-made-monotonic-when-jobs-retry-or-multiple-release-branches-run-concurrently%3F)
- [Which source of truth produces changelog entries, and who approves the public release notes?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Which-source-of-truth-produces-changelog-entries%2C-and-who-approves-the-public-release-notes%3F)
- [Which binaries, symbols, mappings, checksums, manifests, and provenance records must be retained?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Which-binaries%2C-symbols%2C-mappings%2C-checksums%2C-manifests%2C-and-provenance-records-must-be-retained%3F)
- [How are unit, widget, integration, coverage, and platform test reports surfaced when a job fails?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/How-are-unit%2C-widget%2C-integration%2C-coverage%2C-and-platform-test-reports-surfaced-when-a-job-fails%3F)
- [Which jobs may access signing secrets, and how are credentials rotated without interrupting releases?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Which-jobs-may-access-signing-secrets%2C-and-how-are-credentials-rotated-without-interrupting-releases%3F)
- [Which environment variables are runtime configuration, build-time configuration, or secrets?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Which-environment-variables-are-runtime-configuration%2C-build-time-configuration%2C-or-secrets%3F)
- [Can the exact tested artifact be promoted between environments without rebuilding it?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Can-the-exact-tested-artifact-be-promoted-between-environments-without-rebuilding-it%3F)
- [What is the rollback or rollout-halt procedure after a bad production deployment?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/What-is-the-rollback-or-rollout-halt-procedure-after-a-bad-production-deployment%3F)

## Best Practices

- [Pin Flutter, Dart, native SDKs, package managers, runner images, and third-party actions to reviewed versions](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Pin-Flutter%2C-Dart%2C-native-SDKs%2C-package-managers%2C-runner-images%2C-and-third-party-actions-to-reviewed-versions)
- [Run formatting checks, static analysis, and focused tests on every pull request](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Run-formatting-checks%2C-static-analysis%2C-and-focused-tests-on-every-pull-request)
- [Keep provider workflows thin by placing reusable, locally runnable build logic under version control](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Keep-provider-workflows-thin-by-placing-reusable%2C-locally-runnable-build-logic-under-version-control)
- [Use platform-appropriate runners and validate native toolchain changes before adopting a new CI stack](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Use-platform-appropriate-runners-and-validate-native-toolchain-changes-before-adopting-a-new-CI-stack)
- [Lock Fastlane and Ruby dependencies and make publishing lanes explicit about their external side effects](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Lock-Fastlane-and-Ruby-dependencies-and-make-publishing-lanes-explicit-about-their-external-side-effects)
- [Use Melos filters and package scripts consistently on developer machines and CI runners](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Use-Melos-filters-and-package-scripts-consistently-on-developer-machines-and-CI-runners)
- [Separate the public version from the platform build number and document the policy for each](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Separate-the-public-version-from-the-platform-build-number-and-document-the-policy-for-each)
- [Allocate build numbers centrally or derive them from a collision-free monotonic source](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Allocate-build-numbers-centrally-or-derive-them-from-a-collision-free-monotonic-source)
- [Build changelogs from reviewed change metadata and edit them for the release audience](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Build-changelogs-from-reviewed-change-metadata-and-edit-them-for-the-release-audience)
- [Build an artifact once, record its checksum and provenance, and promote that same artifact](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Build-an-artifact-once%2C-record-its-checksum-and-provenance%2C-and-promote-that-same-artifact)
- [Publish test reports and logs on failure as well as success, with secrets redacted](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Publish-test-reports-and-logs-on-failure-as-well-as-success%2C-with-secrets-redacted)
- [Expose signing material only to protected release jobs and rehearse credential rotation and recovery](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Expose-signing-material-only-to-protected-release-jobs-and-rehearse-credential-rotation-and-recovery)
- [Validate required environment variables at job startup and never print sensitive values](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Validate-required-environment-variables-at-job-startup-and-never-print-sensitive-values)
- [Prevent duplicate deployments with concurrency controls, idempotent steps, and explicit environment approvals](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Prevent-duplicate-deployments-with-concurrency-controls%2C-idempotent-steps%2C-and-explicit-environment-approvals)
- [Retain symbol files, obfuscation mappings, dependency locks, tool versions, and release metadata for every shipped build](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Retain-symbol-files%2C-obfuscation-mappings%2C-dependency-locks%2C-tool-versions%2C-and-release-metadata-for-every-shipped-build)
- [Monitor staged releases and define measurable promotion, halt, and rollback criteria](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/CI-CD/Monitor-staged-releases-and-define-measurable-promotion%2C-halt%2C-and-rollback-criteria)

[< Back to build & release deployment](../README.md)
