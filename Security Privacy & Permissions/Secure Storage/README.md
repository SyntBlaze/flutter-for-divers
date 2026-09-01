# Secure Storage

Secure storage protects small, sensitive values such as tokens and encryption
keys by using facilities provided by the operating system. In Flutter, a
plugin normally bridges to the Apple Keychain or to Android storage whose
cryptographic keys are protected by the Android Keystore. These mechanisms
reduce exposure, but they do not make a compromised or unlocked device a
trusted server.

```text
Authentication server -> access token + refresh token
                               |
                        storage policy
                               |
              +----------------+----------------+
              |                                 |
              v                                 v
       short-lived app state            OS-backed protection
                                                |
                                +---------------+---------------+
                                |                               |
                                v                               v
                         Apple Keychain              encrypted application data
                                                       using a key protected by
                                                       Android Keystore
                                                |
                                      optional biometric policy
                                                |
                                       rotate, revoke, delete
```

The Android Keystore primarily protects cryptographic keys rather than acting
as a general-purpose secret database. Encrypted preferences or another
encrypted store can protect values with those keys. Biometrics can authorize a
key operation or temporarily gate access to application behavior; they do not
replace server-side authentication, token validation, rotation, or revocation.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Secure-Storage) — Focused, bite-sized article covering Secure Storage
- [Learning Path](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Secure-Storage) — Step-by-step material that builds practical Secure Storage knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Secure-Storage) — Structured, in-depth material for learning about Secure Storage thoroughly

## Storage and Access Topics

| Topic | Primary role | Security boundary | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Keychain | Stores small secrets through Apple's protected credential storage | Choose accessibility and synchronization behavior deliberately, and remove items when their lifecycle ends | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Keychain "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Keychain "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Keychain "Deep Dive") |
| Android Keystore | Generates or imports cryptographic keys into an OS-managed container | Use protected keys to perform cryptographic operations; do not treat the keystore as arbitrary value storage | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Android-Keystore "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Android-Keystore "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Android-Keystore "Deep Dive") |
| Encrypted preferences | Encrypts small application values before persistence | Protect the encryption key separately, authenticate ciphertext, and define backup and migration behavior | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Encrypted-preferences "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Encrypted-preferences "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Encrypted-preferences "Deep Dive") |
| Token storage | Limits exposure of access, refresh, and identity tokens at rest and in memory | Match storage and retention to each token's power, lifetime, and recovery path | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Token-storage "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Token-storage "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Token-storage "Deep Dive") |
| Refresh token rotation | Replaces a used refresh token and detects reuse of an invalidated predecessor | Rotation, token-family tracking, reuse handling, and revocation must be enforced by the authorization server | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Refresh-token-rotation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Refresh-token-rotation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Refresh-token-rotation "Deep Dive") |
| Biometric unlock | Authorizes access to a protected local secret or cryptographic operation | Bind protection to OS authentication policy and handle enrollment changes, lockout, fallback, and invalidated keys | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Biometric-unlock "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Biometric-unlock "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Biometric-unlock "Deep Dive") |
| Biometric auth gate | Requires recent local biometric authentication before a sensitive application action | Treat success as a short-lived local gate, not proof of account identity to a backend | [💡](https://app.syntblaze.com/qt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Biometric-auth-gate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Biometric-auth-gate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Security-Privacy-and-Permissions/Secure-Storage/Biometric-auth-gate "Deep Dive") |

## Questions

- [Which Keychain accessibility class and synchronization policy fit the secret's lifecycle?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Which-Keychain-accessibility-class-and-synchronization-policy-fit-the-secret's-lifecycle%3F)
- [What belongs in the Android Keystore, and where should encrypted values be stored?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/What-belongs-in-the-Android-Keystore%2C-and-where-should-encrypted-values-be-stored%3F)
- [How should encrypted preferences handle authentication, backups, key loss, and migration?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/How-should-encrypted-preferences-handle-authentication%2C-backups%2C-key-loss%2C-and-migration%3F)
- [Should an access token remain only in memory, and where should a refresh token live?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Should-an-access-token-remain-only-in-memory%2C-and-where-should-a-refresh-token-live%3F)
- [What should happen when a rotated refresh token is reused?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/What-should-happen-when-a-rotated-refresh-token-is-reused%3F)
- [When should biometric authentication release a key operation rather than merely reveal application state?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/When-should-biometric-authentication-release-a-key-operation-rather-than-merely-reveal-application-state%3F)
- [How long should a biometric gate remain valid, and which actions require it again?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/How-long-should-a-biometric-gate-remain-valid%2C-and-which-actions-require-it-again%3F)
- [Which threats remain after a value is placed in OS-backed secure storage?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Which-threats-remain-after-a-value-is-placed-in-OS-backed-secure-storage%3F)
- [How should sign-out, account deletion, reinstall, backup restore, and device migration affect stored secrets?](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/How-should-sign-out%2C-account-deletion%2C-reinstall%2C-backup-restore%2C-and-device-migration-affect-stored-secrets%3F)

## Best Practices

- [Use the Apple Keychain for small Apple-platform secrets and select the narrowest suitable accessibility](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Use-the-Apple-Keychain-for-small-Apple-platform-secrets-and-select-the-narrowest-suitable-accessibility)
- [Keep non-exportable cryptographic keys in the Android Keystore when platform and device support allow it](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Keep-non-exportable-cryptographic-keys-in-the-Android-Keystore-when-platform-and-device-support-allow-it)
- [Use authenticated encryption and keep encrypted values separate from their protecting key](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Use-authenticated-encryption-and-keep-encrypted-values-separate-from-their-protecting-key)
- [Store only the tokens the application needs and retain them for no longer than necessary](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Store-only-the-tokens-the-application-needs-and-retain-them-for-no-longer-than-necessary)
- [Prefer short-lived access tokens and server-enforced refresh token rotation with reuse detection](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Prefer-short-lived-access-tokens-and-server-enforced-refresh-token-rotation-with-reuse-detection)
- [Use operating-system biometric prompts and key policies instead of handling biometric data](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Use-operating-system-biometric-prompts-and-key-policies-instead-of-handling-biometric-data)
- [Require a fresh biometric gate for high-risk actions and clear its authorization when the app locks](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Require-a-fresh-biometric-gate-for-high-risk-actions-and-clear-its-authorization-when-the-app-locks)
- [Delete secrets on logout and account deletion according to an explicit lifecycle policy](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Delete-secrets-on-logout-and-account-deletion-according-to-an-explicit-lifecycle-policy)
- [Avoid logging, copying, serializing, or exposing secrets through diagnostics and crash reports](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Avoid-logging%2C-copying%2C-serializing%2C-or-exposing-secrets-through-diagnostics-and-crash-reports)
- [Test lockout, cancellation, enrollment changes, key invalidation, restore, migration, and storage failure](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Test-lockout%2C-cancellation%2C-enrollment-changes%2C-key-invalidation%2C-restore%2C-migration%2C-and-storage-failure)
- [Document the threat model and keep privileged secrets on trusted servers](https://app.syntblaze.com/qsp/flutter/Security-Privacy-and-Permissions/Secure-Storage/Document-the-threat-model-and-keep-privileged-secrets-on-trusted-servers)

[< Back to security privacy & permissions](../README.md)
