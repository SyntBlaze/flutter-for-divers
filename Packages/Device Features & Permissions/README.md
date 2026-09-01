# Device Features & Permissions

Device integration connects a Flutter application to operating-system services
such as location, biometrics, sensors, battery information, sharing, external
applications, and incoming links. These APIs cross a trust boundary: support,
permission state, application lifecycle, privacy expectations, and behavior can
differ by platform and device.

```text
User intent
  -> check platform and capability support
  -> explain why access is needed
  -> inspect or request permission when required
  -> perform the device operation
  -> handle success, denial, cancellation, and lifecycle changes
  -> expose a domain result to application state and UI
```

Choose packages by the capability the feature actually needs. Permission
Handler coordinates runtime permissions, while feature packages such as
Geolocator, Local Auth, and Sensors Plus perform specific operations and may
also expose their own readiness checks. URL Launcher, Share Plus, and App Links
integrate with other applications; Package Info Plus, Device Info Plus, and
Battery Plus provide environment metadata. Geocoding translates between
coordinates and human-readable addresses but does not acquire the device's
position.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions) — Focused, bite-sized article covering Device Features & Permissions
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions) — Step-by-step material that builds practical Device Features & Permissions knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions) — Structured, in-depth material for learning about Device Features & Permissions thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Permission Handler | Unified API for checking, requesting, and responding to platform permission states | Features that need explicit runtime permission flows across supported platforms | [💡](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions/Permission-Handler "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions/Permission-Handler "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions/Permission-Handler "Deep Dive") |
| URL Launcher | Opens supported URLs through installed applications or platform handlers | Web pages, email, phone, SMS, and custom external URL schemes | [💡](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions/URL-Launcher "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions/URL-Launcher "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions/URL-Launcher "Deep Dive") |
| Share Plus | Invokes the platform share interface for text, links, and files | User-initiated sharing through applications and services installed on the device | [💡](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions/Share-Plus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions/Share-Plus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions/Share-Plus "Deep Dive") |
| Package Info Plus | Reads metadata about the running application package | Displaying application name, version, build number, and installer-related information | [💡](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions/Package-Info-Plus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions/Package-Info-Plus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions/Package-Info-Plus "Deep Dive") |
| Device Info Plus | Exposes platform-specific device and operating-system information | Diagnostics, compatibility decisions, and environment-aware behavior | [💡](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions/Device-Info-Plus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions/Device-Info-Plus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions/Device-Info-Plus "Deep Dive") |
| Geolocator | Provides location services, permission checks, position streams, and distance utilities | Current position, continuous location updates, and location-service readiness | [💡](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions/Geolocator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions/Geolocator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions/Geolocator "Deep Dive") |
| Geocoding | Uses platform geocoding services to translate addresses and coordinates | Place lookup and presenting human-readable location information | [💡](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions/Geocoding "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions/Geocoding "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions/Geocoding "Deep Dive") |
| Local Auth | Wraps platform biometric and device-credential authentication | Confirming a present user's identity before sensitive in-app actions | [💡](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions/Local-Auth "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions/Local-Auth "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions/Local-Auth "Deep Dive") |
| Sensors Plus | Streams readings from supported motion and environmental sensors | Motion-aware experiences, orientation input, and sensor-driven features | [💡](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions/Sensors-Plus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions/Sensors-Plus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions/Sensors-Plus "Deep Dive") |
| Battery Plus | Reports battery level, charging state, and related platform events where available | Adapting optional work and presenting device power status | [💡](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions/Battery-Plus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions/Battery-Plus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions/Battery-Plus "Deep Dive") |
| App Links | Receives and observes incoming deep links and universal or app links | Routing users into specific application content from verified or custom links | [💡](https://app.syntblaze.com/qt/flutter/Packages/Device-Features-and-Permissions/App-Links "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Device-Features-and-Permissions/App-Links "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Device-Features-and-Permissions/App-Links "Deep Dive") |

## Questions

- [How are capability support, service availability, and permission state different?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/How-are-capability-support%2C-service-availability%2C-and-permission-state-different%3F)
- [When should a permission be requested?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/When-should-a-permission-be-requested%3F)
- [How should temporary and permanently denied permissions be handled?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/How-should-temporary-and-permanently-denied-permissions-be-handled%3F)
- [Should a feature use its package's permission API or Permission Handler?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Should-a-feature-use-its-package's-permission-API-or-Permission-Handler%3F)
- [How can an application safely open an external URL?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/How-can-an-application-safely-open-an-external-URL%3F)
- [How should cancellation or unavailable share targets be represented?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/How-should-cancellation-or-unavailable-share-targets-be-represented%3F)
- [Which application and device metadata is appropriate to collect?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Which-application-and-device-metadata-is-appropriate-to-collect%3F)
- [How does one-time location differ from a position stream?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/How-does-one-time-location-differ-from-a-position-stream%3F)
- [Why can geocoding results vary across platforms and regions?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Why-can-geocoding-results-vary-across-platforms-and-regions%3F)
- [Is local biometric authentication the same as signing a user into an account?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Is-local-biometric-authentication-the-same-as-signing-a-user-into-an-account%3F)
- [How should noisy sensor streams be sampled and interpreted?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/How-should-noisy-sensor-streams-be-sampled-and-interpreted%3F)
- [Can battery state be relied on to schedule critical work?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Can-battery-state-be-relied-on-to-schedule-critical-work%3F)
- [What happens when an app link arrives before or after application startup?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/What-happens-when-an-app-link-arrives-before-or-after-application-startup%3F)
- [Which native manifests, entitlements, and declarations does a capability require?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Which-native-manifests%2C-entitlements%2C-and-declarations-does-a-capability-require%3F)
- [How should device-dependent features be tested without assuming specific hardware?](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/How-should-device-dependent-features-be-tested-without-assuming-specific-hardware%3F)

## Best Practices

- [Request a capability only after a clear user action makes its value apparent](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Request-a-capability-only-after-a-clear-user-action-makes-its-value-apparent)
- [Check platform support and hardware availability before presenting a feature](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Check-platform-support-and-hardware-availability-before-presenting-a-feature)
- [Distinguish unavailable services from denied permissions and operation failures](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Distinguish-unavailable-services-from-denied-permissions-and-operation-failures)
- [Ask only for the narrowest permission required by the current feature](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Ask-only-for-the-narrowest-permission-required-by-the-current-feature)
- [Provide context before the system permission dialog without coercing the user](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Provide-context-before-the-system-permission-dialog-without-coercing-the-user)
- [Keep the application useful when optional access is denied](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Keep-the-application-useful-when-optional-access-is-denied)
- [Offer settings guidance only when the operating system will not show another prompt](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Offer-settings-guidance-only-when-the-operating-system-will-not-show-another-prompt)
- [Never loop, surprise, or repeatedly pressure users with permission requests](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Never-loop%2C-surprise%2C-or-repeatedly-pressure-users-with-permission-requests)
- [Declare matching manifest entries, usage descriptions, and entitlements per platform](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Declare-matching-manifest-entries%2C-usage-descriptions%2C-and-entitlements-per-platform)
- [Treat permission and service state as changeable after backgrounding the application](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Treat-permission-and-service-state-as-changeable-after-backgrounding-the-application)
- [Pause subscriptions and release device resources according to the application lifecycle](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Pause-subscriptions-and-release-device-resources-according-to-the-application-lifecycle)
- [Cancel sensor and location streams when their owning feature is disposed](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Cancel-sensor-and-location-streams-when-their-owning-feature-is-disposed)
- [Minimize collection, precision, retention, and transmission of device-derived data](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Minimize-collection%2C-precision%2C-retention%2C-and-transmission-of-device-derived-data)
- [Avoid logging coordinates, identifiers, authentication results, and incoming-link secrets](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Avoid-logging-coordinates%2C-identifiers%2C-authentication-results%2C-and-incoming-link-secrets)
- [Validate external URLs and incoming links before acting on their contents](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Validate-external-URLs-and-incoming-links-before-acting-on-their-contents)
- [Use package and device metadata for compatibility, not fragile device-model assumptions](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Use-package-and-device-metadata-for-compatibility%2C-not-fragile-device-model-assumptions)
- [Model success, denial, cancellation, unsupported hardware, and platform errors explicitly](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Model-success%2C-denial%2C-cancellation%2C-unsupported-hardware%2C-and-platform-errors-explicitly)
- [Test first run, denial, revocation, interrupted flows, and platform-specific behavior on real devices](https://app.syntblaze.com/qsp/flutter/Packages/Device-Features-and-Permissions/Test-first-run%2C-denial%2C-revocation%2C-interrupted-flows%2C-and-platform-specific-behavior-on-real-devices)

[< Back to packages](../README.md)
