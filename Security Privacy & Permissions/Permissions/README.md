# Permissions

Permissions let an application use operating-system capabilities that can
expose personal data or affect a person's surroundings. They are not a one-time
startup checklist. A Flutter feature should request the narrowest access it
needs, at the moment the user invokes it, and remain useful when access is
limited, denied, revoked, restricted, or unavailable.

```text
user starts a feature
  -> check platform, hardware, service, and current permission state
  -> use a permission-free or narrower system picker when possible
  -> explain the immediate benefit in application language
  -> request once through the operating-system prompt
       | granted / limited -> perform only the requested operation
       | denied           -> preserve fallback and allow a later retry
       | no prompt again  -> offer an optional, explicit settings path
  -> recheck after resume; stop access when state or feature ownership changes
```

Permission names and states are not identical across platforms. Apple
platforms can report states such as limited or restricted, while Android
behavior depends on the OS version, declared manifest permissions, permission
group, and whether another prompt may be shown. A package's `permanentlyDenied`
value is therefore a platform interpretation, not a universal operating-system
state. Capability support, hardware or service readiness, permission state,
and operation failure must be modeled separately.

Avoid requesting broad library, contact, or location access when a system
picker or user-selected item satisfies the feature. Recheck permission and
service state when the app resumes because users can change settings while the
app is backgrounded. A settings redirect should be user-initiated, explain the
specific feature that remains unavailable, and never block unrelated use or
promise that access will be granted.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Permissions) — Focused, bite-sized article covering Permissions
- [Learning Path](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Permissions) — Step-by-step material that builds practical Permissions knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Permissions) — Structured, in-depth material for learning about Permissions thoroughly

## Permission Topics

| Topic | Scope | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Camera permission | Captures images or video from available cameras | Ask from the capture flow, distinguish permission from camera availability, and release the camera when the feature ends | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Permissions/Camera-permission "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Permissions/Camera-permission "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Permissions/Camera-permission "Deep Dive") |
| Microphone permission | Captures audio for recording, calling, or media | Request only when recording is about to start and make active capture visible and stoppable | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Permissions/Microphone-permission "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Permissions/Microphone-permission "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Permissions/Microphone-permission "Deep Dive") |
| Photos permission | Reads or adds media through the platform photo library | Prefer system pickers and selected-item or add-only access over full-library access | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Permissions/Photos-permission "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Permissions/Photos-permission "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Permissions/Photos-permission "Deep Dive") |
| Location permission | Reads approximate or precise location in the foreground or background | Match precision and duration to purpose; background access needs separate, exceptional justification | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Permissions/Location-permission "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Permissions/Location-permission "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Permissions/Location-permission "Deep Dive") |
| Contacts permission | Reads or changes a person's address book | Prefer user-selected contact data and avoid copying the whole address book | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Permissions/Contacts-permission "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Permissions/Contacts-permission "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Permissions/Contacts-permission "Deep Dive") |
| Notifications permission | Allows alerts, sounds, badges, or related delivery behavior | Ask after the user understands the notification type and value; keep in-app status available when denied | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Permissions/Notifications-permission "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Permissions/Notifications-permission "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Permissions/Notifications-permission "Deep Dive") |
| Bluetooth permission | Discovers or communicates with nearby Bluetooth devices | Separate authorization from adapter state, device support, pairing, and Android version-specific nearby-device or location rules | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Permissions/Bluetooth-permission "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Permissions/Bluetooth-permission "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Permissions/Bluetooth-permission "Deep Dive") |
| Permission rationale | Explains why a capability is needed before a system request | Be specific, timely, truthful, and non-coercive; do not imitate or obscure the system dialog | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Permissions/Permission-rationale "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Permissions/Permission-rationale "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Permissions/Permission-rationale "Deep Dive") |
| Permanent denial | Represents a state in which the app should not immediately request again | Interpret it per platform, provide a fallback, and wait for deliberate user action before offering recovery | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Permissions/Permanent-denial "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Permissions/Permanent-denial "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Permissions/Permanent-denial "Deep Dive") |
| Settings redirect | Opens the application's system-settings page for manual changes | Offer it contextually and explicitly, then recheck state on resume without assuming a change | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Permissions/Settings-redirect "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Permissions/Settings-redirect "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Permissions/Settings-redirect "Deep Dive") |

## Questions

- [Can the feature use a system picker or user-selected item without requesting broad access?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Can-the-feature-use-a-system-picker-or-user-selected-item-without-requesting-broad-access%3F)
- [When should camera or microphone access be requested and released?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/When-should-camera-or-microphone-access-be-requested-and-released%3F)
- [How can active audio capture remain obvious and controllable?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/How-can-active-audio-capture-remain-obvious-and-controllable%3F)
- [How should selected or limited photo access differ from full-library access?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/How-should-selected-or-limited-photo-access-differ-from-full-library-access%3F)
- [Does the location feature require precise, continuous, or background access?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Does-the-location-feature-require-precise%2C-continuous%2C-or-background-access%3F)
- [Can contact selection replace reading the entire address book?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Can-contact-selection-replace-reading-the-entire-address-book%3F)
- [When has the user seen enough value to make a notification request meaningful?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/When-has-the-user-seen-enough-value-to-make-a-notification-request-meaningful%3F)
- [How are Bluetooth permission, adapter state, hardware support, and pairing different?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/How-are-Bluetooth-permission%2C-adapter-state%2C-hardware-support%2C-and-pairing-different%3F)
- [What should a pre-permission rationale say without pressuring the user?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/What-should-a-pre-permission-rationale-say-without-pressuring-the-user%3F)
- [What do denied, restricted, limited, and permanently denied mean on each supported platform?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/What-do-denied%2C-restricted%2C-limited%2C-and-permanently-denied-mean-on-each-supported-platform%3F)
- [When should the app offer settings rather than another system request?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/When-should-the-app-offer-settings-rather-than-another-system-request%3F)
- [Which permission and service states must be rechecked when the application resumes?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Which-permission-and-service-states-must-be-rechecked-when-the-application-resumes%3F)
- [How should tests cover OS versions, revocation, partial grants, and interrupted requests?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/How-should-tests-cover-OS-versions%2C-revocation%2C-partial-grants%2C-and-interrupted-requests%3F)

## Best Practices

- [Design the permission-free fallback before adding a permission request](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Design-the-permission-free-fallback-before-adding-a-permission-request)
- [Request only the capability, precision, data scope, and duration required by the current feature](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Request-only-the-capability%2C-precision%2C-data-scope%2C-and-duration-required-by-the-current-feature)
- [Prefer system pickers and user-selected data over broad photo or contact access](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Prefer-system-pickers-and-user-selected-data-over-broad-photo-or-contact-access)
- [Ask in response to a clear user action, close to the operation that needs access](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Ask-in-response-to-a-clear-user-action%2C-close-to-the-operation-that-needs-access)
- [Explain a concrete benefit before the system prompt without implying that consent is required for unrelated features](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Explain-a-concrete-benefit-before-the-system-prompt-without-implying-that-consent-is-required-for-unrelated-features)
- [Keep optional features usable after denial, cancellation, restriction, or limited access](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Keep-optional-features-usable-after-denial%2C-cancellation%2C-restriction%2C-or-limited-access)
- [Treat camera and microphone capture as visible, user-controlled sessions and release their resources promptly](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Treat-camera-and-microphone-capture-as-visible%2C-user-controlled-sessions-and-release-their-resources-promptly)
- [Use foreground, approximate location unless a documented feature truly requires greater scope](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Use-foreground%2C-approximate-location-unless-a-documented-feature-truly-requires-greater-scope)
- [Request background location separately and only for an essential, user-understood behavior](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Request-background-location-separately-and-only-for-an-essential%2C-user-understood-behavior)
- [Defer notification permission until the user understands which useful alerts they can receive](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Defer-notification-permission-until-the-user-understands-which-useful-alerts-they-can-receive)
- [Keep Bluetooth authorization distinct from adapter, service, pairing, and device-connection failures](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Keep-Bluetooth-authorization-distinct-from-adapter%2C-service%2C-pairing%2C-and-device-connection-failures)
- [Model granted, limited, denied, restricted, unavailable, and no-further-prompt outcomes explicitly](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Model-granted%2C-limited%2C-denied%2C-restricted%2C-unavailable%2C-and-no-further-prompt-outcomes-explicitly)
- [Do not loop permission prompts or repeatedly pressure a person after denial](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Do-not-loop-permission-prompts-or-repeatedly-pressure-a-person-after-denial)
- [Offer settings only after an explicit action, with a feature-specific explanation and a cancel path](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Offer-settings-only-after-an-explicit-action%2C-with-a-feature-specific-explanation-and-a-cancel-path)
- [Recheck permission and service state after application resume and before each sensitive operation](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Recheck-permission-and-service-state-after-application-resume-and-before-each-sensitive-operation)
- [Stop streams, capture, scanning, and observation when the owning feature ends or access is revoked](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Stop-streams%2C-capture%2C-scanning%2C-and-observation-when-the-owning-feature-ends-or-access-is-revoked)
- [Keep native declarations and usage descriptions aligned with actual behavior on every supported platform](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Keep-native-declarations-and-usage-descriptions-aligned-with-actual-behavior-on-every-supported-platform)
- [Test first request, denial, limited access, revocation, settings return, OS upgrades, and unsupported hardware on real devices](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Permissions/Test-first-request%2C-denial%2C-limited-access%2C-revocation%2C-settings-return%2C-OS-upgrades%2C-and-unsupported-hardware-on-real-devices)

[< Back to security privacy & permissions](../README.md)
