## Best Practices

- Prefer an Android App Bundle for Google Play and test the APKs generated from it
- Use APKs intentionally for direct installs, automation, or channels that require them
- Pin and review the Gradle wrapper and related Android build-tool versions
- Keep module build configuration readable, variant-aware, and free of committed credentials
- Choose the minimum SDK from product support goals and verified dependency requirements
- Adopt target SDK changes early enough to test permissions, background work, and platform behavior
- Separate debug and release signing, and make an unsigned production build fail clearly
- Encrypt, restrict, and redundantly back up signing keys and their recovery information
- Keep shrinking rules narrow and document why each application-owned rule exists
- Test release builds with R8 enabled and archive each release's mapping and symbol files
- Complete Play Console policy, privacy, content, and tester requirements before the planned release date
- Smoke-test store installation, upgrade paths, deep links, notifications, billing, and authentication internally
- Use closed testing for representative devices, accounts, locales, and production-like services
- Promote a verified artifact through tracks and use a monitored staged production rollout
- Record the source revision, Flutter version, dependency lockfile, build number, and artifact checksums for every release
