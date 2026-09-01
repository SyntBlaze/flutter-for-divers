## Best Practices

- Pin Flutter, Dart, native SDKs, package managers, runner images, and third-party actions to reviewed versions
- Run formatting checks, static analysis, and focused tests on every pull request
- Keep provider workflows thin by placing reusable, locally runnable build logic under version control
- Use platform-appropriate runners and validate native toolchain changes before adopting a new CI stack
- Lock Fastlane and Ruby dependencies and make publishing lanes explicit about their external side effects
- Use Melos filters and package scripts consistently on developer machines and CI runners
- Separate the public version from the platform build number and document the policy for each
- Allocate build numbers centrally or derive them from a collision-free monotonic source
- Build changelogs from reviewed change metadata and edit them for the release audience
- Build an artifact once, record its checksum and provenance, and promote that same artifact
- Publish test reports and logs on failure as well as success, with secrets redacted
- Expose signing material only to protected release jobs and rehearse credential rotation and recovery
- Validate required environment variables at job startup and never print sensitive values
- Prevent duplicate deployments with concurrency controls, idempotent steps, and explicit environment approvals
- Retain symbol files, obfuscation mappings, dependency locks, tool versions, and release metadata for every shipped build
- Monitor staged releases and define measurable promotion, halt, and rollback criteria
