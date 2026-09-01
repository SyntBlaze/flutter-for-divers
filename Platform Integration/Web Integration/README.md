# Web Integration

Flutter web applications run inside the browser and share its document,
navigation, security, storage, and installation model. The generated web
bootstrap loads the Flutter runtime from `index.html`, selects a renderer, and
attaches the application to browser APIs through Dart and JavaScript interop.

```text
browser request
      |
      v
`index.html` -> Flutter bootstrap -> Dart application
      |                  |                 |
      |                  |                 +-> JavaScript / Wasm interop
      |                  |                 +-> browser history and permissions
      |                  |
      |                  +-> CanvasKit / web renderer -> canvas and DOM
      |
      +-> web manifest -> PWA metadata and install
      +-> service worker -> cached application resources

network resources <-> CORS and browser security policies
```

The browser remains the host platform. URLs participate in its history,
network requests obey origin policy, privileged capabilities require secure
contexts or user permission, and service-worker updates follow an independent
lifecycle. Integrations should preserve those browser conventions instead of
assuming the access or lifecycle of a native application.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Platform-Integration/Web-Integration) — Focused, bite-sized article covering Web Integration
- [Learning Path](https://app.syntblaze.com/lt/flutter/Platform-Integration/Web-Integration) — Step-by-step material that builds practical Web Integration knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Platform-Integration/Web-Integration) — Structured, in-depth material for learning about Web Integration thoroughly

## Browser Surfaces and Runtime Boundaries

| Topic | Primary responsibility | Boundary or constraint | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `index.html` | Provides the host document and starts Flutter's generated web bootstrap | Script ordering, base URL, metadata, content security policy, and custom loading code affect startup and routing | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Web-Integration/index.html "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Web-Integration/index.html "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Web-Integration/index.html "Deep Dive") |
| JavaScript interop | Lets Dart call browser or JavaScript APIs and expose callable values in the other direction | Types, object lifetimes, asynchronous errors, and generated bindings must cross the language boundary deliberately | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Web-Integration/JavaScript-interop "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Web-Integration/JavaScript-interop "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Web-Integration/JavaScript-interop "Deep Dive") |
| Wasm interop | Connects web builds with WebAssembly modules and compatible JavaScript glue | Module loading, memory representation, browser support, and cross-origin isolation can constrain integration | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Web-Integration/Wasm-interop "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Web-Integration/Wasm-interop "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Web-Integration/Wasm-interop "Deep Dive") |
| Browser history | Maps application navigation to browser URLs, back and forward actions, and deep links | Path strategy, server fallback, base URL, and state restoration must agree with the deployment host | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Web-Integration/Browser-history "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Web-Integration/Browser-history "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Web-Integration/Browser-history "Deep Dive") |
| Service worker | Runs a browser-managed worker that can cache resources and handle eligible network requests | Installation, activation, cache invalidation, offline behavior, and updates occur outside the Flutter widget lifecycle | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Web-Integration/Service-worker "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Web-Integration/Service-worker "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Web-Integration/Service-worker "Deep Dive") |
| Web manifest | Describes installable-app metadata such as name, icons, start URL, and display mode | Manifest URLs, icon assets, scope, and deployment paths must remain consistent | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Web-Integration/Web-manifest "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Web-Integration/Web-manifest "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Web-Integration/Web-manifest "Deep Dive") |
| CanvasKit | Supplies a WebAssembly-backed graphics renderer for Flutter web | Download size, caching, browser graphics support, and rendering performance influence the deployment choice | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Web-Integration/CanvasKit "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Web-Integration/CanvasKit "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Web-Integration/CanvasKit "Deep Dive") |
| CORS | Controls whether browser code can read cross-origin network responses | The destination server must return suitable headers; application-side request code cannot bypass browser enforcement | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Web-Integration/CORS "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Web-Integration/CORS "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Web-Integration/CORS "Deep Dive") |
| Browser permissions | Gate access to capabilities such as notifications, location, camera, and microphone | Availability, secure-context rules, user gestures, and denial persistence vary by browser | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Web-Integration/Browser-permissions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Web-Integration/Browser-permissions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Web-Integration/Browser-permissions "Deep Dive") |
| PWA install | Makes a compatible web application installable through browser or platform UI | Installability signals, manifest quality, service-worker behavior, and browser policy determine the experience | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Web-Integration/PWA-install "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Web-Integration/PWA-install "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Web-Integration/PWA-install "Deep Dive") |

## Questions

- [What belongs in a Flutter web application's `index.html`?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/What-belongs-in-a-Flutter-web-application's-index.html%3F)
- [How should Dart code call a browser API or an existing JavaScript library?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/How-should-Dart-code-call-a-browser-API-or-an-existing-JavaScript-library%3F)
- [How can a Flutter web application load and exchange data with a WebAssembly module?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/How-can-a-Flutter-web-application-load-and-exchange-data-with-a-WebAssembly-module%3F)
- [How do Flutter routes interact with browser back, forward, refresh, and deep links?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/How-do-Flutter-routes-interact-with-browser-back%2C-forward%2C-refresh%2C-and-deep-links%3F)
- [When does a service-worker update become active for returning users?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/When-does-a-service-worker-update-become-active-for-returning-users%3F)
- [Which fields and assets make a web manifest useful across install surfaces?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Which-fields-and-assets-make-a-web-manifest-useful-across-install-surfaces%3F)
- [What tradeoffs come with using CanvasKit for Flutter web rendering?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/What-tradeoffs-come-with-using-CanvasKit-for-Flutter-web-rendering%3F)
- [Why can a request succeed outside a browser but fail because of CORS in Flutter web?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Why-can-a-request-succeed-outside-a-browser-but-fail-because-of-CORS-in-Flutter-web%3F)
- [When may a web application request camera, location, notification, or microphone access?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/When-may-a-web-application-request-camera%2C-location%2C-notification%2C-or-microphone-access%3F)
- [What makes a Flutter web application eligible for PWA installation?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/What-makes-a-Flutter-web-application-eligible-for-PWA-installation%3F)
- [How should a web deployment serve deep links that do not correspond to physical files?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/How-should-a-web-deployment-serve-deep-links-that-do-not-correspond-to-physical-files%3F)
- [Which web resources must be versioned together to avoid a stale application shell?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Which-web-resources-must-be-versioned-together-to-avoid-a-stale-application-shell%3F)

## Best Practices

- [Keep custom `index.html` changes compatible with Flutter's generated bootstrap contract](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Keep-custom-index.html-changes-compatible-with-Flutter's-generated-bootstrap-contract)
- [Set the document base URL and deployment path deliberately](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Set-the-document-base-URL-and-deployment-path-deliberately)
- [Prefer typed, narrowly scoped JavaScript bindings over unstructured global access](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Prefer-typed%2C-narrowly-scoped-JavaScript-bindings-over-unstructured-global-access)
- [Validate Wasm module loading and memory assumptions in every supported browser](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Validate-Wasm-module-loading-and-memory-assumptions-in-every-supported-browser)
- [Make navigation produce meaningful, shareable, and restorable URLs](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Make-navigation-produce-meaningful%2C-shareable%2C-and-restorable-URLs)
- [Design service-worker updates so users do not run mismatched cached assets](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Design-service-worker-updates-so-users-do-not-run-mismatched-cached-assets)
- [Version caches and remove obsolete entries during service-worker activation](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Version-caches-and-remove-obsolete-entries-during-service-worker-activation)
- [Provide complete manifest metadata and appropriately sized icons](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Provide-complete-manifest-metadata-and-appropriately-sized-icons)
- [Measure renderer startup, download, and frame performance on representative devices](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Measure-renderer-startup%2C-download%2C-and-frame-performance-on-representative-devices)
- [Configure CORS on the server with the narrowest required origins, methods, and headers](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Configure-CORS-on-the-server-with-the-narrowest-required-origins%2C-methods%2C-and-headers)
- [Request browser permissions in context and handle denial as a normal outcome](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Request-browser-permissions-in-context-and-handle-denial-as-a-normal-outcome)
- [Use secure origins for production features that require a secure context](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Use-secure-origins-for-production-features-that-require-a-secure-context)
- [Test installation, offline behavior, refresh, and updates independently](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Test-installation%2C-offline-behavior%2C-refresh%2C-and-updates-independently)
- [Verify web behavior across the browsers and deployment paths the application supports](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Web-Integration/Verify-web-behavior-across-the-browsers-and-deployment-paths-the-application-supports)

[< Back to platform integration](../README.md)
