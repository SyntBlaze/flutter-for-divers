# Privacy

Privacy engineering controls what personal or sensitive data a Flutter
application collects, why it uses that data, where it sends it, and when it is
deleted. The boundary includes Dart and native code, application backends,
third-party SDKs, support tools, analytics and crash systems, and the Apple and
Google store declarations. A permission prompt or privacy policy does not by
itself make unnecessary collection appropriate.

```text
feature and purpose
       |
       v
data and SDK inventory -> necessity, notice, consent, and regional review
       |                                      |
       v                                      v
collect the minimum -----------------> record user choice
       |
       v
process / transmit -> service providers and other recipients
       |
       v
retention limit -> export, correction, or deletion workflow
       |
       +----> verify Apple and Google declarations against release behavior
```

Consent is context-specific: some processing may require an informed choice,
while other necessary processing may have a different valid basis. The app
should not initialize optional analytics, crash-reporting, advertising, or
tracking behavior before the applicable choice is known. Withdrawal should be
as accessible as acceptance and should stop future optional processing; it
does not necessarily erase data already retained for another valid reason.

Privacy requirements depend on the data, purpose, users, regions, contracts,
and current law and store policy. These notes are engineering guidance, not
legal advice. Work with qualified privacy and legal reviewers to define the
application's obligations, response deadlines, exceptions, identity
verification, and records.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Privacy) — Focused, bite-sized article covering Privacy
- [Learning Path](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Privacy) — Step-by-step material that builds practical Privacy knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Privacy) — Structured, in-depth material for learning about Privacy thoroughly

## Privacy Topics

| Topic | Primary responsibility | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Data minimization | Limit collection, access, precision, transmission, and retention to a defined feature purpose | Inventory actual app, SDK, backend, and operational behavior rather than relying only on intended use | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Privacy/Data-minimization "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Privacy/Data-minimization "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Privacy/Data-minimization "Deep Dive") |
| Analytics consent | Control optional measurement from one durable consent state | Prevent event queues, identifiers, and SDK initialization from collecting before the applicable choice | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Privacy/Analytics-consent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Privacy/Analytics-consent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Privacy/Analytics-consent "Deep Dive") |
| Crash reporting consent | Govern diagnostic uploads and the context attached to failures | Redact credentials and personal data, minimize breadcrumbs, and honor the configured choice before upload | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Privacy/Crash-reporting-consent "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Privacy/Crash-reporting-consent "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Privacy/Crash-reporting-consent "Deep Dive") |
| Tracking transparency | Coordinate Apple's App Tracking Transparency flow with tracking behavior | Determine whether behavior meets Apple's tracking definition; the system response is not a general-purpose privacy consent | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Privacy/Tracking-transparency "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Privacy/Tracking-transparency "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Privacy/Tracking-transparency "Deep Dive") |
| GDPR deletion | Execute a verified erasure workflow across systems and processors | Discover copies, propagate deletion, handle backups and justified exceptions, and record completion without retaining excess request data | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Privacy/GDPR-deletion "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Privacy/GDPR-deletion "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Privacy/GDPR-deletion "Deep Dive") |
| CCPA export | Produce a verified, understandable response covering applicable personal information | Scope categories, sources, purposes, recipients, and portable records according to the reviewed request process | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Privacy/CCPA-export "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Privacy/CCPA-export "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Privacy/CCPA-export "Deep Dive") |
| Privacy manifest | Maintain Apple privacy manifests for required-reason APIs and applicable SDK declarations | Inspect native dependencies and merged release artifacts; a package's declaration does not replace review of how the app uses it | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Privacy/Privacy-manifest "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Privacy/Privacy-manifest "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Privacy/Privacy-manifest "Deep Dive") |
| Data safety form | Describe Google Play data collection, sharing, protection, and deletion practices | Include third-party libraries and off-device processing, and update answers whenever release behavior changes | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Privacy/Data-safety-form "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Privacy/Data-safety-form "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Privacy/Data-safety-form "Deep Dive") |
| App privacy details | Describe App Store data collection, linkage, tracking, and purposes | Reconcile answers with the released binary, backend behavior, and every integrated third-party partner | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Privacy/App-privacy-details "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Privacy/App-privacy-details "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Privacy/App-privacy-details "Deep Dive") |

## Questions

- [How can a team build a data inventory that includes Flutter plugins, native SDKs, backends, and support tools?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/How-can-a-team-build-a-data-inventory-that-includes-Flutter-plugins%2C-native-SDKs%2C-backends%2C-and-support-tools%3F)
- [Which fields, precision, frequency, recipients, and retention periods are necessary for each feature purpose?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Which-fields%2C-precision%2C-frequency%2C-recipients%2C-and-retention-periods-are-necessary-for-each-feature-purpose%3F)
- [When must an optional analytics SDK remain disabled until the user has chosen?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/When-must-an-optional-analytics-SDK-remain-disabled-until-the-user-has-chosen%3F)
- [How should consent state be synchronized across devices and changed after withdrawal?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/How-should-consent-state-be-synchronized-across-devices-and-changed-after-withdrawal%3F)
- [Which crash breadcrumbs, attachments, identifiers, and user fields are safe to collect?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Which-crash-breadcrumbs%2C-attachments%2C-identifiers%2C-and-user-fields-are-safe-to-collect%3F)
- [When does Apple's App Tracking Transparency requirement apply, and when does it not?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/When-does-Apple's-App-Tracking-Transparency-requirement-apply%2C-and-when-does-it-not%3F)
- [How should an app behave after tracking authorization is denied or restricted?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/How-should-an-app-behave-after-tracking-authorization-is-denied-or-restricted%3F)
- [How can deletion reach primary stores, derived data, vendors, caches, and backups?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/How-can-deletion-reach-primary-stores%2C-derived-data%2C-vendors%2C-caches%2C-and-backups%3F)
- [How should a requester be verified without collecting disproportionate new identity data?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/How-should-a-requester-be-verified-without-collecting-disproportionate-new-identity-data%3F)
- [What data and explanatory context belong in an access or export response?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/What-data-and-explanatory-context-belong-in-an-access-or-export-response%3F)
- [How are required-reason API uses from Flutter plugins represented in an Apple privacy manifest?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/How-are-required-reason-API-uses-from-Flutter-plugins-represented-in-an-Apple-privacy-manifest%3F)
- [How can a release process detect that Google Play Data safety answers no longer match the app?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/How-can-a-release-process-detect-that-Google-Play-Data-safety-answers-no-longer-match-the-app%3F)
- [How do App Store privacy details account for data collected by third-party SDKs?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/How-do-App-Store-privacy-details-account-for-data-collected-by-third-party-SDKs%3F)
- [Why can Apple and Google disclosures differ even when they describe the same application?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Why-can-Apple-and-Google-disclosures-differ-even-when-they-describe-the-same-application%3F)
- [Who owns a data practice when an SDK or service provider performs the collection?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Who-owns-a-data-practice-when-an-SDK-or-service-provider-performs-the-collection%3F)

## Best Practices

- [Maintain a versioned inventory of data fields, purposes, sources, recipients, regions, and retention](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Maintain-a-versioned-inventory-of-data-fields%2C-purposes%2C-sources%2C-recipients%2C-regions%2C-and-retention)
- [Review every Flutter plugin and native SDK for collection that occurs automatically](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Review-every-Flutter-plugin-and-native-SDK-for-collection-that-occurs-automatically)
- [Collect the least precise data at the lowest frequency that still supports the feature](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Collect-the-least-precise-data-at-the-lowest-frequency-that-still-supports-the-feature)
- [Centralize consent state and make optional SDK startup depend on it](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Centralize-consent-state-and-make-optional-SDK-startup-depend-on-it)
- [Keep acceptance and withdrawal equally understandable and accessible](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Keep-acceptance-and-withdrawal-equally-understandable-and-accessible)
- [Do not treat operating-system permission as consent for unrelated analytics or tracking](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Do-not-treat-operating-system-permission-as-consent-for-unrelated-analytics-or-tracking)
- [Redact tokens, message contents, form values, URLs, and personal identifiers before crash upload](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Redact-tokens%2C-message-contents%2C-form-values%2C-URLs%2C-and-personal-identifiers-before-crash-upload)
- [Separate essential diagnostics from optional diagnostic enrichment where the product requires different choices](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Separate-essential-diagnostics-from-optional-diagnostic-enrichment-where-the-product-requires-different-choices)
- [Request tracking authorization only in context and preserve full non-tracking functionality after denial](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Request-tracking-authorization-only-in-context-and-preserve-full-non-tracking-functionality-after-denial)
- [Authenticate rights requests proportionately and prevent exports or deletions from becoming account-takeover paths](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Authenticate-rights-requests-proportionately-and-prevent-exports-or-deletions-from-becoming-account-takeover-paths)
- [Map deletion and export workflows across application services, processors, derived datasets, and backups](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Map-deletion-and-export-workflows-across-application-services%2C-processors%2C-derived-datasets%2C-and-backups)
- [Define retention periods and enforce them with automated deletion rather than policy text alone](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Define-retention-periods-and-enforce-them-with-automated-deletion-rather-than-policy-text-alone)
- [Keep processor contracts, SDK configuration, and production behavior aligned with documented purposes](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Keep-processor-contracts%2C-SDK-configuration%2C-and-production-behavior-aligned-with-documented-purposes)
- [Inspect Apple privacy manifests from the release dependency graph and retain required-reason evidence](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Inspect-Apple-privacy-manifests-from-the-release-dependency-graph-and-retain-required-reason-evidence)
- [Revalidate Google Play Data safety answers for every material data-flow or SDK change](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Revalidate-Google-Play-Data-safety-answers-for-every-material-data-flow-or-SDK-change)
- [Revalidate App Store privacy details against the archived application and server-side behavior](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Revalidate-App-Store-privacy-details-against-the-archived-application-and-server-side-behavior)
- [Test first launch, consent withdrawal, offline queues, account deletion, export, reinstall, and upgrade paths](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Test-first-launch%2C-consent-withdrawal%2C-offline-queues%2C-account-deletion%2C-export%2C-reinstall%2C-and-upgrade-paths)
- [Record privacy decisions and obtain qualified review for jurisdiction-specific obligations](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Privacy/Record-privacy-decisions-and-obtain-qualified-review-for-jurisdiction-specific-obligations)

[< Back to security privacy & permissions](../README.md)
