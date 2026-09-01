# Local Storage

Local storage keeps application data on the device, but different storage
locations make very different promises. Choose a mechanism from the data's
required lifetime, sensitivity, ownership, structure, volume, query patterns,
and recovery path. A convenient API is not evidence that a store is durable,
secure, backed up, or suitable as a source of truth.

```text
classify the data
      |
      +-- small, non-sensitive setting ----------> key-value storage
      |
      +-- small secret --------------------------> secure storage
      |
      +-- application-owned bytes or text ------> file storage
      |                                              |
      |                                              +-- must survive cleanup
      |                                              |      -> app documents
      |                                              |
      |                                              +-- disposable work
      |                                              |      -> temporary directory
      |                                              |
      |                                              +-- reproducible data
      |                                                     -> cache directory
      |
      +-- structured, queryable records ----------> database
                                                     |
                                                     +-- relational -> SQLite
                                                     +-- object graph -> object database
                                                     +-- flexible records -> document database

write -> validate -> commit atomically / transactionally -> read -> migrate -> expire or delete
             |                                              |
             +-- sensitivity requires protection ----------+-> encrypted database
                                                                  |
                                                       separate key lifecycle
```

Durability is a storage contract, not merely persistence across one process
restart. Temporary and cache locations may be removed by the operating system;
cache data must therefore be reproducible. Application documents are intended
for durable, user-relevant content, but backup, synchronization, uninstall, and
device-migration behavior still varies by platform and policy. Decide whether
each item may be backed up, must be excluded from backup, or can be restored
from another source.

Separate sensitivity from shape. Key-value storage may fit a preference but
not a credential. Platform secure storage is intended for a limited amount of
secret material, while larger sensitive datasets may require an encrypted
file or database. Encryption is only as strong as its key management: keep
keys separate from ciphertext, use platform-protected keys where possible,
define rotation and recovery, and expect keys to become unavailable after
logout, restore, enrollment changes, or device security changes.

Choose database models from access patterns. SQLite is relational and supports
explicit schemas, joins, constraints, and transactions. Object databases map
records and relationships toward application objects, while document
databases store independently shaped records that can evolve with fewer global
schema constraints. Every persistent representation still needs versioning,
incremental migrations, indexes derived from real queries, corruption handling,
and tests that cover upgrades as well as clean installs.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Local-Storage) — Focused, bite-sized article covering Local Storage
- [Learning Path](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Local-Storage) — Step-by-step material that builds practical Local Storage knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Local-Storage) — Structured, in-depth material for learning about Local Storage thoroughly

## Local Storage Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Key-value storage | Persist small values under stable keys | Use it for compact settings and flags, not queryable datasets or secrets; define defaults, type evolution, and deletion semantics | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Local-Storage/Key-value-storage "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Local-Storage/Key-value-storage "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Local-Storage/Key-value-storage "Deep Dive") |
| Secure storage | Protect a limited set of sensitive values with operating-system facilities | Minimize retained secrets and define access policy, backup behavior, rotation, revocation, and key-loss recovery | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Local-Storage/Secure-storage "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Local-Storage/Secure-storage "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Local-Storage/Secure-storage "Deep Dive") |
| File storage | Read and write application-owned byte or text files | Choose a directory by lifetime, validate paths and contents, and use temporary writes plus atomic replacement where supported | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Local-Storage/File-storage "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Local-Storage/File-storage "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Local-Storage/File-storage "Deep Dive") |
| App documents directory | Retain durable, user-relevant application files | Do not assume backup or cross-device behavior; specify ownership, export, deletion, and restore policy for every file | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Local-Storage/App-documents-directory "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Local-Storage/App-documents-directory "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Local-Storage/App-documents-directory "Deep Dive") |
| Temporary directory | Hold intermediate data that may disappear at any time | Treat every item as disposable, avoid secrets where possible, and clean up completed or abandoned work | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Local-Storage/Temporary-directory "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Local-Storage/Temporary-directory "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Local-Storage/Temporary-directory "Deep Dive") |
| Cache directory | Keep reproducible files for faster access across operations or launches | Expect system eviction and enforce explicit freshness, size, invalidation, and rebuild rules | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Local-Storage/Cache-directory "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Local-Storage/Cache-directory "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Local-Storage/Cache-directory "Deep Dive") |
| SQLite database | Store relational records with SQL queries, constraints, indexes, and transactions | Version the schema, migrate incrementally, use transactions for invariants, and measure queries before adding indexes | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Local-Storage/SQLite-database "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Local-Storage/SQLite-database "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Local-Storage/SQLite-database "Deep Dive") |
| Object database | Persist object-shaped records, references, and indexed properties | Keep persistence objects separate when useful and understand identity, relationship, transaction, generated-code, and migration semantics | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Local-Storage/Object-database "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Local-Storage/Object-database "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Local-Storage/Object-database "Deep Dive") |
| Document database | Store independently structured document records and query selected fields | Govern schema variation with validation and versioning, and plan index, update, concurrency, and migration behavior | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Local-Storage/Document-database "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Local-Storage/Document-database "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Local-Storage/Document-database "Deep Dive") |
| Encrypted database | Protect structured data at rest with database-level encryption | Use authenticated, supported encryption; keep keys outside the database and define generation, storage, rotation, backup, and loss behavior | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Local-Storage/Encrypted-database "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Local-Storage/Encrypted-database "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Local-Storage/Encrypted-database "Deep Dive") |

## Questions

- [Which data must survive a process restart, device reboot, system cleanup, reinstall, backup restore, or account change?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Which-data-must-survive-a-process-restart%2C-device-reboot%2C-system-cleanup%2C-reinstall%2C-backup-restore%2C-or-account-change%3F)
- [Is the value a small non-sensitive setting, or has key-value storage become an accidental database?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Is-the-value-a-small-non-sensitive-setting%2C-or-has-key-value-storage-become-an-accidental-database%3F)
- [Which values are sufficiently sensitive to require platform-backed secure storage?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Which-values-are-sufficiently-sensitive-to-require-platform-backed-secure-storage%3F)
- [Does a file need atomic replacement, integrity validation, coordinated access, or crash recovery?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Does-a-file-need-atomic-replacement%2C-integrity-validation%2C-coordinated-access%2C-or-crash-recovery%3F)
- [Are documents user-owned, exportable, backed up, synchronized, or deleted with the application?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Are-documents-user-owned%2C-exportable%2C-backed-up%2C-synchronized%2C-or-deleted-with-the-application%3F)
- [Can every temporary file be lost before the next read without affecting correctness?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Can-every-temporary-file-be-lost-before-the-next-read-without-affecting-correctness%3F)
- [Can every cached item be reproduced, and what limits its age and total disk use?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Can-every-cached-item-be-reproduced%2C-and-what-limits-its-age-and-total-disk-use%3F)
- [Do the data and query patterns require relations, constraints, joins, and multi-record transactions?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Do-the-data-and-query-patterns-require-relations%2C-constraints%2C-joins%2C-and-multi-record-transactions%3F)
- [Would object identity and relationships simplify persistence, or couple domain code too closely to one engine?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Would-object-identity-and-relationships-simplify-persistence%2C-or-couple-domain-code-too-closely-to-one-engine%3F)
- [How will document versions be validated when records do not all share one rigid schema?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/How-will-document-versions-be-validated-when-records-do-not-all-share-one-rigid-schema%3F)
- [Which schema versions can exist in the field, and can each migration be resumed or safely retried after interruption?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Which-schema-versions-can-exist-in-the-field%2C-and-can-each-migration-be-resumed-or-safely-retried-after-interruption%3F)
- [Where does the encryption key live, when does it rotate, and what happens when it is lost or unavailable?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Where-does-the-encryption-key-live%2C-when-does-it-rotate%2C-and-what-happens-when-it-is-lost-or-unavailable%3F)
- [Should local data participate in platform backup, and can restored data still be decrypted and associated with the correct account?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Should-local-data-participate-in-platform-backup%2C-and-can-restored-data-still-be-decrypted-and-associated-with-the-correct-account%3F)
- [How will clean installs, upgrades, low-disk conditions, eviction, corruption, partial writes, and logout be tested?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/How-will-clean-installs%2C-upgrades%2C-low-disk-conditions%2C-eviction%2C-corruption%2C-partial-writes%2C-and-logout-be-tested%3F)

## Best Practices

- [Classify each item by sensitivity, durability, ownership, size, structure, and access pattern before choosing storage](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Classify-each-item-by-sensitivity%2C-durability%2C-ownership%2C-size%2C-structure%2C-and-access-pattern-before-choosing-storage)
- [Keep storage behind an application-owned boundary so platform APIs and database engines can change](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Keep-storage-behind-an-application-owned-boundary-so-platform-APIs-and-database-engines-can-change)
- [Use key-value storage only for a bounded set of compact, non-sensitive settings and flags](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Use-key-value-storage-only-for-a-bounded-set-of-compact%2C-non-sensitive-settings-and-flags)
- [Store only necessary secret material in secure storage and remove it when its authorization lifecycle ends](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Store-only-necessary-secret-material-in-secure-storage-and-remove-it-when-its-authorization-lifecycle-ends)
- [Use platform directory APIs and never construct important paths from hard-coded device locations](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Use-platform-directory-APIs-and-never-construct-important-paths-from-hard-coded-device-locations)
- [Write important files to a sibling temporary target, flush and validate when required, then replace atomically where supported](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Write-important-files-to-a-sibling-temporary-target%2C-flush-and-validate-when-required%2C-then-replace-atomically-where-supported)
- [Document backup, export, restore, retention, and deletion rules for durable user-relevant files](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Document-backup%2C-export%2C-restore%2C-retention%2C-and-deletion-rules-for-durable-user-relevant-files)
- [Assume temporary and cache files can disappear between any two operations](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Assume-temporary-and-cache-files-can-disappear-between-any-two-operations)
- [Bound cache size and age, and make cache misses and eviction ordinary recoverable states](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Bound-cache-size-and-age%2C-and-make-cache-misses-and-eviction-ordinary-recoverable-states)
- [Use transactions for related database changes that must preserve an invariant](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Use-transactions-for-related-database-changes-that-must-preserve-an-invariant)
- [Separate stored records from domain entities when persistence annotations or schema evolution would leak across boundaries](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Separate-stored-records-from-domain-entities-when-persistence-annotations-or-schema-evolution-would-leak-across-boundaries)
- [Validate document shape on every boundary instead of treating flexible schema as absent schema](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Validate-document-shape-on-every-boundary-instead-of-treating-flexible-schema-as-absent-schema)
- [Assign explicit versions to stored formats and make migrations incremental, deterministic, observable, and failure-safe](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Assign-explicit-versions-to-stored-formats-and-make-migrations-incremental%2C-deterministic%2C-observable%2C-and-failure-safe)
- [Test migrations with representative data from every supported prior version before release](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Test-migrations-with-representative-data-from-every-supported-prior-version-before-release)
- [Treat local files and database records as untrusted input and handle corruption without destructive recovery by default](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Treat-local-files-and-database-records-as-untrusted-input-and-handle-corruption-without-destructive-recovery-by-default)
- [Keep encryption keys separate from encrypted data and protect them with operating-system facilities when available](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Keep-encryption-keys-separate-from-encrypted-data-and-protect-them-with-operating-system-facilities-when-available)
- [Plan key generation, access control, rotation, backup, restore, revocation, and unrecoverable loss before encrypting production data](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Plan-key-generation%2C-access-control%2C-rotation%2C-backup%2C-restore%2C-revocation%2C-and-unrecoverable-loss-before-encrypting-production-data)
- [Minimize retained personal data and erase account-scoped data and keys according to explicit logout and deletion policies](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Local-Storage/Minimize-retained-personal-data-and-erase-account-scoped-data-and-keys-according-to-explicit-logout-and-deletion-policies)

[< Back to data networking & storage](../README.md)
