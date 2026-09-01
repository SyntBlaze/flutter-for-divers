# Local Storage & Databases

Local persistence keeps data available after a process ends, a device restarts,
or a user returns to the application. The right storage mechanism depends on
the data's sensitivity, structure, size, access patterns, lifetime, and role in
the product—not merely on which API is easiest to call.

```text
Application intent -> repository or persistence boundary -> storage engine
       ^                                                   |
       |                                                   v
Domain data <- validation, migration, and mapping <- stored representation
```

Preferences are suitable for small configuration values such as theme choices
and completed-onboarding flags. Secrets such as refresh tokens and private keys
belong in platform-backed secure storage instead. Neither is a general-purpose
database, and a value being stored locally does not make it an appropriate
source of truth for durable business records.

Path Provider locates platform-appropriate directories, but it does not read,
write, serialize, or protect files. SQL libraries such as Sqflite and Drift fit
relational data and queries, while Hive, Isar, Sembast, and ObjectBox offer
different key-value, document, object, and reactive persistence models.
Hydrated Bloc has a narrower purpose: restoring selected Bloc or Cubit state
across launches rather than acting as the application's primary data store.

## Selection Guidance

Classify the data before choosing a package. Use Shared Preferences for a small
set of non-sensitive scalar settings and Flutter Secure Storage for limited
secret material. Use Path Provider when code needs a reliable location for
application-owned files, then pair it with the file and serialization APIs
appropriate to their format.

Choose Sqflite when direct SQLite control and handwritten queries are desired.
Choose Drift when a SQLite-backed relational model would benefit from typed
queries, reactive result streams, migrations, and generated code. Consider
Hive or Sembast for straightforward key-value or document-shaped records, and
evaluate Isar or ObjectBox when object-oriented persistence, indexing, and
reactive queries fit the product. Before adopting any database, confirm its
supported platforms, maintenance status, migration story, concurrency model,
backup behavior, and licensing against the application's actual requirements.

Persisted UI or feature state can use Hydrated Bloc when automatic restoration
is valuable and the state is safe, compact, and versionable. Keep authoritative
domain data behind repositories even when a database or hydrated state is used
underneath, so storage technology and stored schemas can evolve independently
from the rest of the application.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Local-Storage-and-Databases) — Focused, bite-sized article covering Local Storage & Databases
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Local-Storage-and-Databases) — Step-by-step material that builds practical Local Storage & Databases knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Local-Storage-and-Databases) — Structured, in-depth material for learning about Local Storage & Databases thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Shared Preferences | Platform-backed storage for a small collection of simple preference values | Non-sensitive settings, feature acknowledgements, and lightweight flags | [💡](https://app.syntblaze.com/qt/flutter/Packages/Local-Storage-and-Databases/Shared-Preferences "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Local-Storage-and-Databases/Shared-Preferences "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Local-Storage-and-Databases/Shared-Preferences "Deep Dive") |
| Flutter Secure Storage | Key-value access backed by platform credential and encrypted-storage facilities | Tokens, keys, and other small secrets that must not be kept in plain preferences | [💡](https://app.syntblaze.com/qt/flutter/Packages/Local-Storage-and-Databases/Flutter-Secure-Storage "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Local-Storage-and-Databases/Flutter-Secure-Storage "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Local-Storage-and-Databases/Flutter-Secure-Storage "Deep Dive") |
| Path Provider | Resolves temporary, application-support, documents, cache, and other platform directories | Locating appropriate directories before application code manages files within them | [💡](https://app.syntblaze.com/qt/flutter/Packages/Local-Storage-and-Databases/Path-Provider "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Local-Storage-and-Databases/Path-Provider "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Local-Storage-and-Databases/Path-Provider "Deep Dive") |
| Sqflite | Direct SQLite database access with transactions, batches, and SQL queries | Applications that want explicit control of a local relational schema and SQL | [💡](https://app.syntblaze.com/qt/flutter/Packages/Local-Storage-and-Databases/Sqflite "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Local-Storage-and-Databases/Sqflite "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Local-Storage-and-Databases/Sqflite "Deep Dive") |
| Drift | Typed reactive persistence over SQLite-compatible backends with generated query support | Relational data that benefits from compile-time query checks, streams, and structured migrations | [💡](https://app.syntblaze.com/qt/flutter/Packages/Local-Storage-and-Databases/Drift "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Local-Storage-and-Databases/Drift "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Local-Storage-and-Databases/Drift "Deep Dive") |
| Hive | Lightweight key-value storage built around boxes and optionally typed adapters | Simple local records and caches that do not require relational queries | [💡](https://app.syntblaze.com/qt/flutter/Packages/Local-Storage-and-Databases/Hive "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Local-Storage-and-Databases/Hive "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Local-Storage-and-Databases/Hive "Deep Dive") |
| Isar | Object-oriented local database with indexes, links, transactions, and reactive queries | Structured object graphs and queryable offline data with reactive updates | [💡](https://app.syntblaze.com/qt/flutter/Packages/Local-Storage-and-Databases/Isar "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Local-Storage-and-Databases/Isar "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Local-Storage-and-Databases/Isar "Deep Dive") |
| Sembast | Embedded document database stored in a file with record stores and queries | Dart applications that need a portable, document-shaped local store without SQL | [💡](https://app.syntblaze.com/qt/flutter/Packages/Local-Storage-and-Databases/Sembast "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Local-Storage-and-Databases/Sembast "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Local-Storage-and-Databases/Sembast "Deep Dive") |
| ObjectBox | Object database with generated entity bindings, relations, queries, and reactive observation | Object-oriented persistence where indexed queries and relations are central | [💡](https://app.syntblaze.com/qt/flutter/Packages/Local-Storage-and-Databases/ObjectBox "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Local-Storage-and-Databases/ObjectBox "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Local-Storage-and-Databases/ObjectBox "Deep Dive") |
| Hydrated Bloc | Automatic serialization and restoration of selected Bloc and Cubit states | Recovering compact feature or presentation state across application restarts | [💡](https://app.syntblaze.com/qt/flutter/Packages/Local-Storage-and-Databases/Hydrated-Bloc "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Local-Storage-and-Databases/Hydrated-Bloc "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Local-Storage-and-Databases/Hydrated-Bloc "Deep Dive") |

## Questions

- [What data should an application persist locally?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/What-data-should-an-application-persist-locally%3F)
- [When are shared preferences appropriate?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/When-are-shared-preferences-appropriate%3F)
- [What belongs in secure storage?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/What-belongs-in-secure-storage%3F)
- [Does secure storage encrypt an entire database or file?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Does-secure-storage-encrypt-an-entire-database-or-file%3F)
- [How should application support, documents, cache, and temporary directories differ?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/How-should-application-support%2C-documents%2C-cache%2C-and-temporary-directories-differ%3F)
- [When should I use files instead of a database?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/When-should-I-use-files-instead-of-a-database%3F)
- [When is a relational database the right choice?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/When-is-a-relational-database-the-right-choice%3F)
- [How do direct SQLite access and a typed persistence layer differ?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/How-do-direct-SQLite-access-and-a-typed-persistence-layer-differ%3F)
- [How do key-value, document, and object databases differ?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/How-do-key-value%2C-document%2C-and-object-databases-differ%3F)
- [How should stored models be separated from domain models?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/How-should-stored-models-be-separated-from-domain-models%3F)
- [How should schema and data migrations be designed?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/How-should-schema-and-data-migrations-be-designed%3F)
- [How should concurrent reads and writes be coordinated?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/How-should-concurrent-reads-and-writes-be-coordinated%3F)
- [What should happen when local data is corrupt or unreadable?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/What-should-happen-when-local-data-is-corrupt-or-unreadable%3F)
- [When is Hydrated Bloc appropriate for persistence?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/When-is-Hydrated-Bloc-appropriate-for-persistence%3F)
- [How should local persistence be tested?](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/How-should-local-persistence-be-tested%3F)

## Best Practices

- [Classify data by sensitivity, ownership, lifetime, and access pattern](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Classify-data-by-sensitivity%2C-ownership%2C-lifetime%2C-and-access-pattern)
- [Keep persistence behind a repository or dedicated storage boundary](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Keep-persistence-behind-a-repository-or-dedicated-storage-boundary)
- [Use preferences only for small non-sensitive settings and flags](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Use-preferences-only-for-small-non-sensitive-settings-and-flags)
- [Store only limited secret material in platform-backed secure storage](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Store-only-limited-secret-material-in-platform-backed-secure-storage)
- [Never treat cache or temporary directories as durable storage](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Never-treat-cache-or-temporary-directories-as-durable-storage)
- [Use platform directory APIs instead of hard-coded file paths](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Use-platform-directory-APIs-instead-of-hard-coded-file-paths)
- [Keep stored representations separate from domain models when schemas can evolve](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Keep-stored-representations-separate-from-domain-models-when-schemas-can-evolve)
- [Give every stored schema and serialized state an explicit version](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Give-every-stored-schema-and-serialized-state-an-explicit-version)
- [Make migrations incremental, deterministic, and safe to retry](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Make-migrations-incremental%2C-deterministic%2C-and-safe-to-retry)
- [Back up valuable data before performing a risky migration when possible](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Back-up-valuable-data-before-performing-a-risky-migration-when-possible)
- [Use transactions for changes that must succeed or fail together](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Use-transactions-for-changes-that-must-succeed-or-fail-together)
- [Define indexes from measured query patterns and data volume](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Define-indexes-from-measured-query-patterns-and-data-volume)
- [Keep database work and large serialization tasks off latency-sensitive UI paths](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Keep-database-work-and-large-serialization-tasks-off-latency-sensitive-UI-paths)
- [Treat local data as untrusted and handle corruption or partial writes](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Treat-local-data-as-untrusted-and-handle-corruption-or-partial-writes)
- [Encrypt sensitive records and minimize the sensitive data retained on device](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Encrypt-sensitive-records-and-minimize-the-sensitive-data-retained-on-device)
- [Define cache expiration, invalidation, and eviction policies deliberately](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Define-cache-expiration%2C-invalidation%2C-and-eviction-policies-deliberately)
- [Persist only compact, safe, and reconstructable state with Hydrated Bloc](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Persist-only-compact%2C-safe%2C-and-reconstructable-state-with-Hydrated-Bloc)
- [Test clean installs, upgrades, migrations, failures, and recovery paths](https://app.syntblaze.com/qsp/flutter/Packages/Local-Storage-and-Databases/Test-clean-installs%2C-upgrades%2C-migrations%2C-failures%2C-and-recovery-paths)

[< Back to packages](../README.md)
