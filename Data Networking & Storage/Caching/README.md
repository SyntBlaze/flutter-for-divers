# Caching

Caching keeps a reusable representation of data closer to the code that needs
it. A cache can reduce latency, network traffic, server load, and repeated
computation, but every cached value is a copy with an explicit freshness and
ownership contract. A cache is therefore not merely storage: it is a policy for
reading, validating, replacing, evicting, and recovering data.

```text
read request
     |
     v
memory cache -- hit and fresh -------------------------> result
     |
     +-- miss / stale
     v
disk cache ---- hit and acceptable --------------------> result
     |
     +-- miss / revalidate
     v
HTTP request -- cache headers + ETag --> remote service
     |                                      |
     | 304 Not Modified                     | changed representation
     v                                      v
reuse cached value                    update disk + memory
     |                                      |
     +---------------------> result <-------+

offline-first mutation:
UI -> optimistic state -> local source of truth -> sync queue -> server
          ^                       |                              |
          +-- rollback/reconcile -+---- conflict resolution <---+
```

Memory and disk caches are application-managed copies with different lifetime,
capacity, and persistence characteristics. An HTTP cache follows protocol
metadata such as `Cache-Control`, `Expires`, `Age`, `Vary`, and validators; it
must not be treated as equivalent to an arbitrary key-value store. An `ETag`
does not itself cache a response or define its lifetime—it identifies a selected
representation so a client can revalidate it conditionally.

Cache invalidation decides when an existing copy can no longer satisfy a read.
Time-based expiration is only one approach: writes, account changes, query
parameters, schema versions, authorization scope, and server validators may all
affect validity. Stale-while-revalidate deliberately serves an allowed stale
copy while refreshing it in the background, so the UI needs rules for refresh
failures and for preventing older responses from replacing newer state.

Optimistic update is a user-experience and state-transition technique, not a
cache type. It exposes an expected mutation result before the server confirms
it, then commits, rolls back, or reconciles that speculative state. Offline-first
sync goes further: a durable local store commonly acts as the application's
working source of truth while synchronization exchanges operations or records
with a remote authority. Conflicts are domain decisions about concurrent
changes, identity, ordering, and intent; silently choosing the latest timestamp
is not a universal resolution strategy.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Caching) — Focused, bite-sized article covering Caching
- [Learning Path](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Caching) — Step-by-step material that builds practical Caching knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Caching) — Structured, in-depth material for learning about Caching thoroughly

## Caching Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Memory cache | Keep reusable values in process for the lowest-latency reads | Bound size and lifetime, define eviction, prevent duplicate loads, and assume all entries disappear when the process ends | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Caching/Memory-cache "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Caching/Memory-cache "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Caching/Memory-cache "Deep Dive") |
| Disk cache | Persist reconstructable cached data across process restarts | Use atomic writes, version the stored format, enforce size and age limits, and recover safely from corruption or eviction | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Caching/Disk-cache "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Caching/Disk-cache "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Caching/Disk-cache "Deep Dive") |
| HTTP cache headers | Apply protocol metadata that controls freshness, reuse, validation, and cache scope | Interpret directives together, include `Vary` dimensions in cache identity, and distinguish private client caching from shared intermediary caching | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Caching/HTTP-cache-headers "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Caching/HTTP-cache-headers "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Caching/HTTP-cache-headers "Deep Dive") |
| ETag | Validate whether a selected HTTP representation has changed | Store the validator with the exact variant and send conditional requests; weak and strong validators have different comparison semantics | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Caching/ETag "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Caching/ETag "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Caching/ETag "Deep Dive") |
| Cache invalidation | Mark or remove copies that no longer satisfy their validity contract | Derive invalidation from ownership and mutation events, and include identity, query, user, locale, and schema dimensions in cache keys | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Caching/Cache-invalidation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Caching/Cache-invalidation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Caching/Cache-invalidation "Deep Dive") |
| Stale-while-revalidate | Return permitted stale data immediately while refreshing it asynchronously | Deduplicate refreshes, communicate stale state when it matters, and prevent late refreshes from overwriting newer data | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Caching/Stale-while-revalidate "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Caching/Stale-while-revalidate "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Caching/Stale-while-revalidate "Deep Dive") |
| Optimistic update | Reflect an expected mutation locally before remote confirmation | Preserve enough prior state or operation intent to commit, roll back, or reconcile without losing intervening user changes | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Caching/Optimistic-update "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Caching/Optimistic-update "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Caching/Optimistic-update "Deep Dive") |
| Offline-first sync | Use durable local data as the working source of truth and synchronize with a remote system | Persist pending operations, define ordering and idempotency, resume after interruption, and expose meaningful sync state | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Caching/Offline-first-sync "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Caching/Offline-first-sync "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Caching/Offline-first-sync "Deep Dive") |
| Conflict resolution | Resolve concurrent local and remote changes according to domain rules | Track versions and causality where needed, distinguish mergeable fields from invariants, and involve the user when intent cannot be inferred safely | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Caching/Conflict-resolution "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Caching/Conflict-resolution "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Caching/Conflict-resolution "Deep Dive") |

## Questions

- [Which data is safe and useful to keep in a memory cache?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Which-data-is-safe-and-useful-to-keep-in-a-memory-cache%3F)
- [Should a disk entry survive restart, logout, application upgrade, or low-storage cleanup?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Should-a-disk-entry-survive-restart%2C-logout%2C-application-upgrade%2C-or-low-storage-cleanup%3F)
- [Who may cache this HTTP response, for how long, and which request headers select its representation?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Who-may-cache-this-HTTP-response%2C-for-how-long%2C-and-which-request-headers-select-its-representation%3F)
- [When should the client revalidate with `If-None-Match` instead of downloading the response again?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/When-should-the-client-revalidate-with-If-None-Match-instead-of-downloading-the-response-again%3F)
- [Which event makes each cached representation invalid, and how is that event propagated?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Which-event-makes-each-cached-representation-invalid%2C-and-how-is-that-event-propagated%3F)
- [How stale may the UI become while revalidation runs or repeatedly fails?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/How-stale-may-the-UI-become-while-revalidation-runs-or-repeatedly-fails%3F)
- [What is the exact commit, rollback, or reconciliation path for an optimistic mutation?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/What-is-the-exact-commit%2C-rollback%2C-or-reconciliation-path-for-an-optimistic-mutation%3F)
- [Is the local database an authoritative working source of truth or merely a disposable cache?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Is-the-local-database-an-authoritative-working-source-of-truth-or-merely-a-disposable-cache%3F)
- [Are pending changes stored as operations, snapshots, patches, or another mergeable form?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Are-pending-changes-stored-as-operations%2C-snapshots%2C-patches%2C-or-another-mergeable-form%3F)
- [How are retries made idempotent when a prior server acknowledgement was lost?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/How-are-retries-made-idempotent-when-a-prior-server-acknowledgement-was-lost%3F)
- [Which conflicts can merge automatically, and which require domain-specific or user-guided resolution?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Which-conflicts-can-merge-automatically%2C-and-which-require-domain-specific-or-user-guided-resolution%3F)
- [How do account, authorization, locale, filters, and schema version affect cache identity?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/How-do-account%2C-authorization%2C-locale%2C-filters%2C-and-schema-version-affect-cache-identity%3F)
- [How are stale responses prevented from overwriting a newer mutation or refresh?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/How-are-stale-responses-prevented-from-overwriting-a-newer-mutation-or-refresh%3F)

## Best Practices

- [Define the owner, source, lifetime, and freshness contract for every cached value](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Define-the-owner%2C-source%2C-lifetime%2C-and-freshness-contract-for-every-cached-value)
- [Keep memory caches bounded and clear them when their owning scope ends](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Keep-memory-caches-bounded-and-clear-them-when-their-owning-scope-ends)
- [Coalesce concurrent misses for the same key instead of starting duplicate loads](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Coalesce-concurrent-misses-for-the-same-key-instead-of-starting-duplicate-loads)
- [Treat disk cache contents as disposable, versioned, and potentially corrupt](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Treat-disk-cache-contents-as-disposable%2C-versioned%2C-and-potentially-corrupt)
- [Write disk entries atomically and enforce explicit capacity and eviction policies](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Write-disk-entries-atomically-and-enforce-explicit-capacity-and-eviction-policies)
- [Honor HTTP freshness, validation, privacy, and `Vary` semantics as one protocol contract](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Honor-HTTP-freshness%2C-validation%2C-privacy%2C-and-Vary-semantics-as-one-protocol-contract)
- [Store an `ETag` with the exact response variant it validates](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Store-an-ETag-with-the-exact-response-variant-it-validates)
- [Use conditional requests to revalidate without treating `304 Not Modified` as a new representation](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Use-conditional-requests-to-revalidate-without-treating-304-Not-Modified-as-a-new-representation)
- [Build cache keys from every input that can change the selected data](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Build-cache-keys-from-every-input-that-can-change-the-selected-data)
- [Invalidate or update related entries as part of the mutation workflow](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Invalidate-or-update-related-entries-as-part-of-the-mutation-workflow)
- [Deduplicate background revalidation and reject out-of-order refresh results](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Deduplicate-background-revalidation-and-reject-out-of-order-refresh-results)
- [Represent freshness, loading, and refresh failure separately when the UI needs those distinctions](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Represent-freshness%2C-loading%2C-and-refresh-failure-separately-when-the-UI-needs-those-distinctions)
- [Keep optimistic state identifiable and retain enough information for deterministic recovery](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Keep-optimistic-state-identifiable-and-retain-enough-information-for-deterministic-recovery)
- [Do not discard a successful intervening change when rolling back an earlier optimistic mutation](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Do-not-discard-a-successful-intervening-change-when-rolling-back-an-earlier-optimistic-mutation)
- [Use a durable local source of truth and persist the sync queue for offline-first features](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Use-a-durable-local-source-of-truth-and-persist-the-sync-queue-for-offline-first-features)
- [Make synchronized mutations idempotent and preserve operation ordering where the domain requires it](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Make-synchronized-mutations-idempotent-and-preserve-operation-ordering-where-the-domain-requires-it)
- [Record server versions or other causality metadata needed to detect concurrent edits](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Record-server-versions-or-other-causality-metadata-needed-to-detect-concurrent-edits)
- [Resolve conflicts with explicit domain rules and surface ambiguity rather than silently losing data](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Resolve-conflicts-with-explicit-domain-rules-and-surface-ambiguity-rather-than-silently-losing-data)
- [Partition and clear user-scoped cached data on logout or account change](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Partition-and-clear-user-scoped-cached-data-on-logout-or-account-change)
- [Test eviction, expiry, revalidation, corruption, offline restart, retry, races, and conflict paths](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Caching/Test-eviction%2C-expiry%2C-revalidation%2C-corruption%2C-offline-restart%2C-retry%2C-races%2C-and-conflict-paths)

[< Back to data networking & storage](../README.md)
