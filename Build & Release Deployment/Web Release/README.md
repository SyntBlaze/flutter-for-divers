# Web Release

A Flutter web release is a set of static files that must be compiled for the
intended browser capabilities, served from the correct URL, and delivered with
appropriate routing, security, cache, and cross-origin policies. A successful
`flutter build web` is therefore only the start of deployment: the hosting
configuration is part of the application.

```text
Flutter source + web/ shell
            |
            v
  flutter build web [--wasm]
            |
            +----> JavaScript + CanvasKit
            |
            +----> Wasm/skwasm + JavaScript fallback
            |
            v
       build/web artifacts
            |
            v
 CDN or web server ----> base href + SPA rewrites + MIME/CORS headers
            |                            |
            v                            v
 versioned asset cache            browser compatibility
            |
            v
   controlled rollout and rollback
```

CanvasKit and the Wasm-oriented skwasm backend render Flutter's scene on a
canvas rather than turning the widget tree into a conventional HTML document.
The former HTML renderer is a legacy backend and is no longer available in
current Flutter releases; it remains relevant when maintaining an older pinned
toolchain or planning a migration. A `--wasm` build also emits a JavaScript
fallback, but its faster multithreaded path depends on browser support and
cross-origin isolation headers.

Deploy the contents of `build/web`, not the directory itself, and verify the
release from a real HTTP origin. When the app lives below the origin root, its
base URL, asset paths, redirects, and single-page-application fallback must all
agree. Immutable hashed artifacts can be cached for a long time, while the HTML
entry point, bootstrap files, and any update metadata need shorter or
revalidation-based policies so a new shell does not reference stale assets.

Flutter web is best suited to app-like, highly interactive experiences. Search
engines and assistive technology can use Flutter semantics and metadata, but a
canvas-rendered application does not naturally provide the document structure,
server-rendered route content, or no-script experience expected from an
SEO-first site. Treat discoverability, sharing previews, accessibility, and
browser coverage as explicit release requirements rather than hosting details.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Web-Release) — Focused, bite-sized article covering Web Release
- [Learning Path](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Web-Release) — Step-by-step material that builds practical Web Release knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Web-Release) — Structured, in-depth material for learning about Web Release thoroughly

## Web Release Topics

| Topic | Focus | Key considerations | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| CanvasKit renderer | Ship Flutter's Skia-based web renderer through WebAssembly and browser graphics APIs | Measure initial download, font and asset loading, graphics compatibility, memory, and performance on representative devices | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Web-Release/CanvasKit-renderer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Web-Release/CanvasKit-renderer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Web-Release/CanvasKit-renderer "Deep Dive") |
| HTML renderer | Understand and migrate from Flutter's retired DOM-oriented rendering backend | Current Flutter releases no longer offer this backend; pinning an old SDK preserves old behavior but also preserves its limitations and security risk | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Web-Release/HTML-renderer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Web-Release/HTML-renderer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Web-Release/HTML-renderer "Deep Dive") |
| Wasm renderer | Compile with `--wasm` and use skwasm where the browser supports WasmGC | Audit dependency compatibility, verify JavaScript fallback, configure cross-origin isolation for multithreading, and retain private source maps for diagnostics | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Web-Release/Wasm-renderer "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Web-Release/Wasm-renderer "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Web-Release/Wasm-renderer "Deep Dive") |
| Base href | Locate bootstrap files, routes, and assets when hosting at an origin root or subpath | Keep the trailing slash and deployment prefix correct, then test deep links and nested routes from a clean browser session | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Web-Release/Base-href "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Web-Release/Base-href "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Web-Release/Base-href "Deep Dive") |
| Service worker | Control offline caching and update behavior with an explicitly owned worker | Flutter no longer generates one by default; define scope, activation, invalidation, rollback, and failure behavior before adding one | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Web-Release/Service-worker "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Web-Release/Service-worker "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Web-Release/Service-worker "Deep Dive") |
| PWA manifest | Describe installable application identity and presentation to supporting browsers | Use stable IDs and start URLs, provide complete icons, and validate scope, display mode, colors, and install behavior on each target | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Web-Release/PWA-manifest "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Web-Release/PWA-manifest "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Web-Release/PWA-manifest "Deep Dive") |
| CORS | Authorize cross-origin APIs, fonts, images, and other resources at their serving origin | Configure the resource server rather than the Flutter client, allow only necessary origins and methods, and test credentials and preflight requests | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Web-Release/CORS "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Web-Release/CORS "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Web-Release/CORS "Deep Dive") |
| Hosting cache headers | Balance fast repeat loads with safe rollout of new artifact graphs | Cache content-addressed assets immutably, revalidate entry points, and test upgrade and rollback paths through the actual CDN | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Web-Release/Hosting-cache-headers "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Web-Release/Hosting-cache-headers "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Web-Release/Hosting-cache-headers "Deep Dive") |
| SEO limitations | Set realistic expectations for a client-rendered, canvas-oriented application | Provide route metadata and crawlable public content where practical; use document-centric HTML for content whose discovery is business-critical | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Web-Release/SEO-limitations "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Web-Release/SEO-limitations "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Web-Release/SEO-limitations "Deep Dive") |
| Browser compatibility | Define and continuously test the browser and device matrix a release supports | Include graphics APIs, WasmGC and fallback behavior, accessibility, input methods, private modes, extensions, and constrained hardware | [💡](https://app.syntblaze.com/qt/flutter/Build-and-Release-Deployment/Web-Release/Browser-compatibility "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Build-and-Release-Deployment/Web-Release/Browser-compatibility "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Build-and-Release-Deployment/Web-Release/Browser-compatibility "Deep Dive") |

## Questions

- [When should a standard web build use CanvasKit, and which download and runtime costs should be measured?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/When-should-a-standard-web-build-use-CanvasKit%2C-and-which-download-and-runtime-costs-should-be-measured%3F)
- [What must an application verify when migrating away from the removed HTML renderer?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/What-must-an-application-verify-when-migrating-away-from-the-removed-HTML-renderer%3F)
- [What does `flutter build web --wasm` produce, and when does the browser use its JavaScript fallback?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/What-does-flutter-build-web---wasm-produce%2C-and-when-does-the-browser-use-its-JavaScript-fallback%3F)
- [Which COOP and COEP response headers enable multithreaded Wasm rendering, and how do they affect embedded resources?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Which-COOP-and-COEP-response-headers-enable-multithreaded-Wasm-rendering%2C-and-how-do-they-affect-embedded-resources%3F)
- [How should `<base href>` be configured for a deployment below the origin root?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/How-should-%3Cbase-href%3E-be-configured-for-a-deployment-below-the-origin-root%3F)
- [Why can a deep link work during local development but return a 404 from production hosting?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Why-can-a-deep-link-work-during-local-development-but-return-a-404-from-production-hosting%3F)
- [Does the app need a service worker, and who owns its cache migration and rollback policy?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Does-the-app-need-a-service-worker%2C-and-who-owns-its-cache-migration-and-rollback-policy%3F)
- [Which manifest fields and icon variants make installation reliable across supported browsers?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Which-manifest-fields-and-icon-variants-make-installation-reliable-across-supported-browsers%3F)
- [Why cannot Flutter client code bypass a missing CORS policy on an API or image server?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Why-cannot-Flutter-client-code-bypass-a-missing-CORS-policy-on-an-API-or-image-server%3F)
- [Which files may receive an immutable cache policy, and which must be revalidated?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Which-files-may-receive-an-immutable-cache-policy%2C-and-which-must-be-revalidated%3F)
- [Which public routes require semantic, indexable HTML rather than an application canvas?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Which-public-routes-require-semantic%2C-indexable-HTML-rather-than-an-application-canvas%3F)
- [How should CI and release checks cover browsers that take different JavaScript, Wasm, or graphics paths?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/How-should-CI-and-release-checks-cover-browsers-that-take-different-JavaScript%2C-Wasm%2C-or-graphics-paths%3F)
- [How can a team verify that a newly deployed shell never loads an incompatible older artifact?](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/How-can-a-team-verify-that-a-newly-deployed-shell-never-loads-an-incompatible-older-artifact%3F)

## Best Practices

- [Benchmark CanvasKit startup and interaction on representative low- and high-end devices](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Benchmark-CanvasKit-startup-and-interaction-on-representative-low--and-high-end-devices)
- [Migrate applications and packages away from assumptions specific to the retired HTML renderer](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Migrate-applications-and-packages-away-from-assumptions-specific-to-the-retired-HTML-renderer)
- [Test both the Wasm path and the generated JavaScript fallback before enabling a Wasm release](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Test-both-the-Wasm-path-and-the-generated-JavaScript-fallback-before-enabling-a-Wasm-release)
- [Configure and verify cross-origin isolation when relying on multithreaded skwasm](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Configure-and-verify-cross-origin-isolation-when-relying-on-multithreaded-skwasm)
- [Set the base href and SPA rewrite rules from the final public deployment path](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Set-the-base-href-and-SPA-rewrite-rules-from-the-final-public-deployment-path)
- [Open deep links directly and refresh them against the production-like host](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Open-deep-links-directly-and-refresh-them-against-the-production-like-host)
- [Add a service worker only with explicit ownership of offline, update, eviction, and rollback behavior](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Add-a-service-worker-only-with-explicit-ownership-of-offline%2C-update%2C-eviction%2C-and-rollback-behavior)
- [Keep the PWA manifest identity, scope, start URL, display settings, and icons consistent](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Keep-the-PWA-manifest-identity%2C-scope%2C-start-URL%2C-display-settings%2C-and-icons-consistent)
- [Configure least-privilege CORS at every resource origin and exercise real preflight requests](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Configure-least-privilege-CORS-at-every-resource-origin-and-exercise-real-preflight-requests)
- [Use immutable caching only for content-addressed artifacts and revalidate release entry points](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Use-immutable-caching-only-for-content-addressed-artifacts-and-revalidate-release-entry-points)
- [Keep source maps private while retaining them for the exact deployed release](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Keep-source-maps-private-while-retaining-them-for-the-exact-deployed-release)
- [Use semantic HTML or a hybrid architecture for SEO-critical, document-oriented content](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Use-semantic-HTML-or-a-hybrid-architecture-for-SEO-critical%2C-document-oriented-content)
- [Publish a supported-browser policy and automate smoke tests for every promised browser family](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Publish-a-supported-browser-policy-and-automate-smoke-tests-for-every-promised-browser-family)
- [Serve the release locally over HTTP and inspect network failures, console errors, MIME types, and headers](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Serve-the-release-locally-over-HTTP-and-inspect-network-failures%2C-console-errors%2C-MIME-types%2C-and-headers)
- [Deploy atomically, monitor the rollout, and keep a tested rollback artifact and configuration](https://app.syntblaze.com/qsp/flutter/Build-and-Release-Deployment/Web-Release/Deploy-atomically%2C-monitor-the-rollout%2C-and-keep-a-tested-rollback-artifact-and-configuration)

[< Back to build & release deployment](../README.md)
