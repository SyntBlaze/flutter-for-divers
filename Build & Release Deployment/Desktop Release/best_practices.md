## Best Practices

- Build, package, and test each desktop target on the operating system it supports
- Keep application identity, semantic version, build number, and architecture explicit throughout the pipeline
- Sign the final immutable macOS application and verify every nested executable component
- Automate notarization status checks and staple accepted macOS artifacts where the format supports it
- Treat MSIX identity and publisher values as durable release configuration
- Timestamp Windows signatures and verify them after packaging
- Test AppImages on clean representatives of the oldest and newest supported Linux environments
- Grant snaps only the interfaces required by real application behavior
- Validate deb installation, upgrade, downgrade policy, and removal in disposable systems
- Inventory native dependencies, architectures, licenses, and runtime loading paths
- Smoke test installed packages as a standard user, including first launch, restart, update, and uninstall
- Keep signing keys and credentials outside source control and expose them only to protected release jobs
- Archive checksums, package manifests, signing and notarization evidence, symbols, logs, and source revision for every release
- Test the exact artifact intended for distribution rather than repackaging a previously tested build
