## Best Practices

- Benchmark CanvasKit startup and interaction on representative low- and high-end devices
- Migrate applications and packages away from assumptions specific to the retired HTML renderer
- Test both the Wasm path and the generated JavaScript fallback before enabling a Wasm release
- Configure and verify cross-origin isolation when relying on multithreaded skwasm
- Set the base href and SPA rewrite rules from the final public deployment path
- Open deep links directly and refresh them against the production-like host
- Add a service worker only with explicit ownership of offline, update, eviction, and rollback behavior
- Keep the PWA manifest identity, scope, start URL, display settings, and icons consistent
- Configure least-privilege CORS at every resource origin and exercise real preflight requests
- Use immutable caching only for content-addressed artifacts and revalidate release entry points
- Keep source maps private while retaining them for the exact deployed release
- Use semantic HTML or a hybrid architecture for SEO-critical, document-oriented content
- Publish a supported-browser policy and automate smoke tests for every promised browser family
- Serve the release locally over HTTP and inspect network failures, console errors, MIME types, and headers
- Deploy atomically, monitor the rollout, and keep a tested rollback artifact and configuration
