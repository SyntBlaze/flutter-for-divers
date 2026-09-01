## Best Practices

- Open `Runner.xcworkspace` for CocoaPods-integrated builds and keep target configuration changes reviewable
- Pin native dependencies with the lockfile and reproduce pod installation in continuous integration
- Give every app variant and extension an intentional, stable bundle identifier
- Keep capabilities, entitlements, and provisioning profiles aligned
- Store signing certificates and private keys in access-controlled secret storage and rotate them deliberately
- Prepare App Store Connect roles, agreements, metadata, compliance, and review notes before submission
- Exercise the release candidate through TestFlight and promote the tested build rather than rebuilding it
- Archive an explicit scheme and release configuration, then retain symbols and build provenance
- Keep export configuration deterministic and separate from credentials
- Audit privacy manifests and store privacy disclosures whenever code or SDK dependencies change
- Validate app icons on representative devices and store previews
- Use a static, adaptive launch screen that transitions cleanly to the application's first Flutter frame
- Automate repeatable checks for versioning, signing, archive validation, and artifact retention
- Test a clean release build on real supported devices before each submission
