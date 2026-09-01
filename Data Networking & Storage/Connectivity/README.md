# Connectivity

Connectivity-aware applications remain useful while access to remote services
is intermittent, constrained, or unavailable. A platform network-interface
signal can describe the current transport, but it does not prove internet or
service reachability: a device may have Wi-Fi while behind a captive portal,
using a broken route, or unable to reach one particular backend. Treat actual
request outcomes as authoritative and use connectivity state only as a hint
for presentation, scheduling, and recovery.

```text
user mutation
     |
     v
local transaction ---- optimistic interface state
     |
     v
persistent request queue ---- idempotency key / version precondition
     |
     +---- offline or captive portal ---- wait for useful trigger
     |
     v
sync worker ---- foreground opportunity / platform background window
     |
     +---- transient failure ---- capped delayed retry
     |
     +---- conflict ---- fetch current state -> reconcile -> conflict retry
     |
     v
remote acknowledgement ---- commit queue item + refresh local state
```

Online and offline are observations, not permanent modes. Keep reads useful
from local state where the product permits it, record mutations durably before
reporting them as pending, and make queue processing safe to resume after a
crash or process termination. A persistent queue needs explicit ordering,
deduplication, authentication, expiry, dependency, cancellation, and poison
item rules; an in-memory list cannot provide reliable offline delivery.

Sync opportunities are also not guarantees. Mobile and desktop platforms may
delay, shorten, coalesce, or entirely skip background work because of lifecycle,
battery, connectivity, and operating-system policy. Design every worker as a
bounded, resumable operation, trigger foreground synchronization as well, and
persist progress before its execution window ends. Replayed mutations need
stable idempotency keys or equivalent server guarantees. A conflict response
must update the worker's assumptions before retrying; repeating the same stale
write with generic backoff only repeats the conflict.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Connectivity) — Focused, bite-sized article covering Connectivity
- [Learning Path](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Connectivity) — Step-by-step material that builds practical Connectivity knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Connectivity) — Structured, in-depth material for learning about Connectivity thoroughly

## Connectivity Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Online state | Represent evidence that remote work may currently succeed | Interface type and connection status are hints, not proof that the internet or a specific service is reachable | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Connectivity/Online-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Connectivity/Online-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Connectivity/Online-state "Deep Dive") |
| Offline state | Preserve useful behavior when remote services cannot be reached | Expose cached state and pending work honestly, and distinguish unavailable connectivity from authentication or server failures | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Connectivity/Offline-state "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Connectivity/Offline-state "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Connectivity/Offline-state "Deep Dive") |
| Captive portal | Handle a network that intercepts traffic until access is granted | Avoid treating an active Wi-Fi interface as reachability; recognize interception without sending sensitive probes or bypassing user consent | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Connectivity/Captive-portal "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Connectivity/Captive-portal "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Connectivity/Captive-portal "Deep Dive") |
| Request queue | Persist deferred operations for later delivery | Store intent, payload, identity, ordering, attempts, and idempotency metadata atomically so work survives restarts | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Connectivity/Request-queue "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Connectivity/Request-queue "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Connectivity/Request-queue "Deep Dive") |
| Sync worker | Deliver queued work and reconcile local and remote state | Make batches bounded, observable, mutually exclusive where required, and safe to stop and resume at any point | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Connectivity/Sync-worker "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Connectivity/Sync-worker "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Connectivity/Sync-worker "Deep Dive") |
| Background refresh | Refresh eligible data outside an active foreground session | Platform scheduling is opportunistic and time-limited, so correctness cannot depend on a worker running at an exact time | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Connectivity/Background-refresh "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Connectivity/Background-refresh "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Connectivity/Background-refresh "Deep Dive") |
| Conflict retry | Retry a rejected change after reconciling newer remote state | Refetch or use the returned current version, apply a domain conflict policy, and retry only with updated preconditions | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Connectivity/Conflict-retry "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Connectivity/Conflict-retry "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Connectivity/Conflict-retry "Deep Dive") |
| Idempotent mutation | Make repeated delivery produce one intended effect | Reuse a stable operation identifier across attempts and define the server's deduplication scope, retention, and response behavior | [💡](https://app.syntblaze.com/qt/flutter/Data-Networking-and-Storage/Connectivity/Idempotent-mutation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Data-Networking-and-Storage/Connectivity/Idempotent-mutation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Data-Networking-and-Storage/Connectivity/Idempotent-mutation "Deep Dive") |

## Questions

- [Which observations influence the online indicator, and which request outcome remains authoritative?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Which-observations-influence-the-online-indicator%2C-and-which-request-outcome-remains-authoritative%3F)
- [Which features remain available offline, and how are stale data and pending changes communicated?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Which-features-remain-available-offline%2C-and-how-are-stale-data-and-pending-changes-communicated%3F)
- [How can the application distinguish a captive portal from a backend outage or DNS failure?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/How-can-the-application-distinguish-a-captive-portal-from-a-backend-outage-or-DNS-failure%3F)
- [Which queued operations require strict ordering, dependency tracking, replacement, cancellation, or expiry?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Which-queued-operations-require-strict-ordering%2C-dependency-tracking%2C-replacement%2C-cancellation%2C-or-expiry%3F)
- [How does the worker claim work without duplicate processors delivering the same item concurrently?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/How-does-the-worker-claim-work-without-duplicate-processors-delivering-the-same-item-concurrently%3F)
- [What useful unit of work fits inside an unpredictable background execution window?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/What-useful-unit-of-work-fits-inside-an-unpredictable-background-execution-window%3F)
- [Which remote version or precondition is needed before a conflicted mutation can be rebuilt?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Which-remote-version-or-precondition-is-needed-before-a-conflicted-mutation-can-be-rebuilt%3F)
- [How long does the server retain idempotency records, and what response is returned for a duplicate key?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/How-long-does-the-server-retain-idempotency-records%2C-and-what-response-is-returned-for-a-duplicate-key%3F)
- [What happens to pending operations when credentials expire, an account changes, or a user signs out?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/What-happens-to-pending-operations-when-credentials-expire%2C-an-account-changes%2C-or-a-user-signs-out%3F)
- [Which telemetry explains queue age, retry decisions, conflicts, and permanently failed work without exposing sensitive payloads?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Which-telemetry-explains-queue-age%2C-retry-decisions%2C-conflicts%2C-and-permanently-failed-work-without-exposing-sensitive-payloads%3F)
- [Can every synchronization step resume safely after termination between its local and remote effects?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Can-every-synchronization-step-resume-safely-after-termination-between-its-local-and-remote-effects%3F)
- [Which product conflicts can merge automatically, and which require an explicit user choice?](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Which-product-conflicts-can-merge-automatically%2C-and-which-require-an-explicit-user-choice%3F)

## Best Practices

- [Treat interface connectivity as a scheduling hint and real request results as reachability evidence](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Treat-interface-connectivity-as-a-scheduling-hint-and-real-request-results-as-reachability-evidence)
- [Model offline, unauthenticated, captive, degraded, and server-failure outcomes separately](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Model-offline%2C-unauthenticated%2C-captive%2C-degraded%2C-and-server-failure-outcomes-separately)
- [Keep offline reads honest about freshness and show whether local mutations are pending or failed](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Keep-offline-reads-honest-about-freshness-and-show-whether-local-mutations-are-pending-or-failed)
- [Avoid sending credentials or private data to an endpoint until captive interception is ruled out](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Avoid-sending-credentials-or-private-data-to-an-endpoint-until-captive-interception-is-ruled-out)
- [Persist a queue item atomically with the local state change that makes it visible](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Persist-a-queue-item-atomically-with-the-local-state-change-that-makes-it-visible)
- [Store stable operation identifiers and enough immutable intent to reconstruct each request](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Store-stable-operation-identifiers-and-enough-immutable-intent-to-reconstruct-each-request)
- [Make queue claiming, acknowledgement, retry scheduling, and dead-letter handling crash-safe](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Make-queue-claiming%2C-acknowledgement%2C-retry-scheduling%2C-and-dead-letter-handling-crash-safe)
- [Process bounded batches and persist checkpoints so workers can stop whenever the platform requires](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Process-bounded-batches-and-persist-checkpoints-so-workers-can-stop-whenever-the-platform-requires)
- [Use foreground, lifecycle, push, timer, and connectivity events as opportunities rather than guarantees](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Use-foreground%2C-lifecycle%2C-push%2C-timer%2C-and-connectivity-events-as-opportunities-rather-than-guarantees)
- [Respect platform battery and background limits instead of relying on exact execution times](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Respect-platform-battery-and-background-limits-instead-of-relying-on-exact-execution-times)
- [Apply capped exponential backoff with jitter to transient failures and honor server retry guidance](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Apply-capped-exponential-backoff-with-jitter-to-transient-failures-and-honor-server-retry-guidance)
- [Do not retry validation, authorization, or permanent failures as though they were connectivity failures](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Do-not-retry-validation%2C-authorization%2C-or-permanent-failures-as-though-they-were-connectivity-failures)
- [Resolve conflicts against current remote state before attempting a replacement mutation](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Resolve-conflicts-against-current-remote-state-before-attempting-a-replacement-mutation)
- [Preserve one idempotency key across every delivery attempt, timeout, restart, and worker handoff](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Preserve-one-idempotency-key-across-every-delivery-attempt%2C-timeout%2C-restart%2C-and-worker-handoff)
- [Keep server-side idempotency records long enough to cover the client's maximum replay window](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Keep-server-side-idempotency-records-long-enough-to-cover-the-client's-maximum-replay-window)
- [Test process death, duplicate delivery, reordered work, account changes, captive portals, and conflicts](https://app.syntblaze.com/qsp/flutter/Data-Networking-and-Storage/Connectivity/Test-process-death%2C-duplicate-delivery%2C-reordered-work%2C-account-changes%2C-captive-portals%2C-and-conflicts)

[< Back to data networking & storage](../README.md)
