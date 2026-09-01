# Static Quality

Static quality checks find defects and inconsistency without exercising the
application as a user. In a Flutter project, analyzer diagnostics, lint rules,
canonical formatting, automated fixes, dependency review, dead-code removal,
and coverage reports form a fast feedback layer around the executable test
suite.

```text
source + analysis_options.yaml + pubspec
                  |
                  v
       format -> analyze -> test
          |          |         |
          v          v         v
      clean diff  diagnostics  coverage
          \          |         /
           \         v        /
            dependency audit
                    |
                    v
            review and cleanup
                    |
                    v
             merge / release
```

Run cheap, deterministic checks early and enforce the same commands locally
and in continuous integration. Treat warnings, unused dependencies, and
unexplained coverage changes as review signals rather than isolated numbers:
the goal is maintainable, trustworthy code, not a dashboard that stays green
by weakening the policy.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Static-Quality) — Focused, bite-sized article covering Static Quality
- [Learning Path](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Static-Quality) — Step-by-step material that builds practical Static Quality knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Static-Quality) — Structured, in-depth material for learning about Static Quality thoroughly

## Static Quality Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `flutter analyze` | Run Dart analyzer diagnostics across a Flutter project | Use the same SDK, generated sources, and analysis configuration in local development and CI so results agree | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Static-Quality/flutter-analyze "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Static-Quality/flutter-analyze "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Static-Quality/flutter-analyze "Deep Dive") |
| `analysis_options.yaml` | Configure analyzer settings, exclusions, plugins, and lint policy | Keep configuration intentional and explain exceptions instead of broadly excluding difficult code | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Static-Quality/analysis-options.yaml "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Static-Quality/analysis-options.yaml "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Static-Quality/analysis-options.yaml "Deep Dive") |
| lints | Apply shared static rules for correctness, consistency, and maintainability | Start from a maintained baseline, then tune rules to the project's risks and language version | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Static-Quality/lints "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Static-Quality/lints "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Static-Quality/lints "Deep Dive") |
| custom lint rules | Encode project-specific constraints that standard lints cannot express | Reserve custom rules for stable, valuable conventions and provide clear diagnostics and migration guidance | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Static-Quality/custom-lint-rules "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Static-Quality/custom-lint-rules "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Static-Quality/custom-lint-rules "Deep Dive") |
| `dart format` | Rewrite Dart source into the canonical formatter style | Check formatting in CI and avoid hand-tuning layout that the formatter owns | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Static-Quality/dart-format "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Static-Quality/dart-format "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Static-Quality/dart-format "Deep Dive") |
| `dart fix` | Preview and apply analyzer-supported automated fixes | Review the dry-run and resulting diff, then rerun analysis and tests before accepting bulk changes | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Static-Quality/dart-fix "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Static-Quality/dart-fix "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Static-Quality/dart-fix "Deep Dive") |
| dependency audit | Review dependency freshness, security, ownership, and necessity | Evaluate changelogs and constraints rather than upgrading blindly, and remove packages with no remaining use | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Static-Quality/dependency-audit "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Static-Quality/dependency-audit "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Static-Quality/dependency-audit "Deep Dive") |
| dead code cleanup | Remove unused, unreachable, obsolete, and superseded implementation paths | Confirm that reflection, generated registration, platform entry points, and build variants do not reference code indirectly | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Static-Quality/dead-code-cleanup "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Static-Quality/dead-code-cleanup "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Static-Quality/dead-code-cleanup "Deep Dive") |
| code coverage | Report which executable lines or branches a test run exercises | Use coverage to find risk-bearing gaps; a percentage alone does not show assertion quality or important scenarios | [💡](https://app.syntblaze.com/qt/flutter/Testing-and-Quality/Static-Quality/code-coverage "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Testing-and-Quality/Static-Quality/code-coverage "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Testing-and-Quality/Static-Quality/code-coverage "Deep Dive") |

## Questions

- [Which diagnostics should make `flutter analyze` fail in continuous integration?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Which-diagnostics-should-make-flutter-analyze-fail-in-continuous-integration%3F)
- [Where should shared analyzer options live in a multi-package repository?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Where-should-shared-analyzer-options-live-in-a-multi-package-repository%3F)
- [How should a team choose, enable, and phase in lint rules?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/How-should-a-team-choose%2C-enable%2C-and-phase-in-lint-rules%3F)
- [When does a project convention justify the maintenance cost of a custom lint?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/When-does-a-project-convention-justify-the-maintenance-cost-of-a-custom-lint%3F)
- [How can CI verify formatting without rewriting the working tree?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/How-can-CI-verify-formatting-without-rewriting-the-working-tree%3F)
- [Why should automated fixes be previewed and applied in reviewable groups?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Why-should-automated-fixes-be-previewed-and-applied-in-reviewable-groups%3F)
- [What should a dependency audit check beyond whether a newer version exists?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/What-should-a-dependency-audit-check-beyond-whether-a-newer-version-exists%3F)
- [How can apparently unused code still be reached through generated or platform-specific entry points?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/How-can-apparently-unused-code-still-be-reached-through-generated-or-platform-specific-entry-points%3F)
- [Which untested paths matter more than the overall coverage percentage?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Which-untested-paths-matter-more-than-the-overall-coverage-percentage%3F)
- [In what order should formatting, analysis, tests, and coverage run for useful feedback?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/In-what-order-should-formatting%2C-analysis%2C-tests%2C-and-coverage-run-for-useful-feedback%3F)
- [How should temporary analyzer or coverage exceptions be documented and retired?](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/How-should-temporary-analyzer-or-coverage-exceptions-be-documented-and-retired%3F)

## Best Practices

- [Run `flutter analyze` with a pinned project SDK in local and CI workflows](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Run-flutter-analyze-with-a-pinned-project-SDK-in-local-and-CI-workflows)
- [Keep analyzer configuration version-controlled and scoped as narrowly as possible](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Keep-analyzer-configuration-version-controlled-and-scoped-as-narrowly-as-possible)
- [Adopt maintained lint baselines and make project-specific changes explicit](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Adopt-maintained-lint-baselines-and-make-project-specific-changes-explicit)
- [Give custom lint diagnostics actionable messages and test both matches and non-matches](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Give-custom-lint-diagnostics-actionable-messages-and-test-both-matches-and-non-matches)
- [Make `dart format` a routine pre-review check](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Make-dart-format-a-routine-pre-review-check)
- [Preview `dart fix`, inspect its diff, and verify the changed behavior](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Preview-dart-fix%2C-inspect-its-diff%2C-and-verify-the-changed-behavior)
- [Review direct and transitive dependencies on a regular schedule](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Review-direct-and-transitive-dependencies-on-a-regular-schedule)
- [Remove obsolete dependencies, assets, flags, and tests together with dead implementation code](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Remove-obsolete-dependencies%2C-assets%2C-flags%2C-and-tests-together-with-dead-implementation-code)
- [Generate coverage from a reproducible test command and compare like-for-like reports](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Generate-coverage-from-a-reproducible-test-command-and-compare-like-for-like-reports)
- [Prioritize meaningful tests for critical branches over a universal percentage target](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Prioritize-meaningful-tests-for-critical-branches-over-a-universal-percentage-target)
- [Keep generated code exclusions precise and verify that generation is reproducible](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Keep-generated-code-exclusions-precise-and-verify-that-generation-is-reproducible)
- [Require an owner, rationale, and removal condition for every quality-policy exception](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Require-an-owner%2C-rationale%2C-and-removal-condition-for-every-quality-policy-exception)
- [Rerun formatting, analysis, and relevant tests after automated cleanup](https://app.syntblaze.com/qsp/flutter/Testing-and-Quality/Static-Quality/Rerun-formatting%2C-analysis%2C-and-relevant-tests-after-automated-cleanup)

[< Back to testing & quality](../README.md)
