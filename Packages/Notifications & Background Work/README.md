# Notifications & Background Work

Notifications let an application communicate with people outside its active UI,
while background work lets it perform limited tasks when no screen is in the
foreground. The operating system controls both capabilities: application code
can request delivery or execution, but it cannot assume an exact time, an
unlimited runtime, or even that a task will run before its deadline.

```text
Local event or remote service
            |
            v
   create message or work request
            |
            v
OS scheduler / push transport / notification service
            |
            +----> display notification ----> user action
            |                                  |
            |                                  v
            |                         payload router -> app screen
            |
            +----> start background callback -> restore state -> do bounded work
                                                        |
                                                        v
                                               persist result and finish
```

Separate message delivery from work execution. A notification is a user-facing
surface and should carry only enough data to identify and route an event. A
background task is an opportunity to perform bounded, restart-safe work. Remote
push delivery can prompt either behavior, but it is not a durable job queue; any
important work should also be recoverable from persisted application or server
state.

Use Flutter Local Notifications when the application needs to display, schedule,
or respond to local notifications. Awesome Notifications is an alternative for
applications that want a more feature-oriented notification API. Firebase Cloud
Messaging connects an application to remote push delivery. Keep the notification
presentation layer independent from the push provider so foreground, background,
and user-tap paths can share one payload-routing policy.

Use Workmanager for deferrable background jobs expressed through the platform's
work scheduling facilities. Background Fetch fits opportunistic refresh work that
can run when the system grants background time. Android Alarm Manager Plus is for
Android-specific alarm callbacks when an alarm-oriented API matches the
requirement. Before choosing any scheduler, define whether the work must be exact,
periodic, network-constrained, user-visible, or recoverable after process death,
then confirm that the target platforms can provide those semantics.

Background entry points may run without the application's existing widget tree,
dependency container, or in-memory state. Initialize only what the task needs,
pass stable identifiers instead of large objects, make every operation safe to
repeat, persist progress, and always report completion through the package's
expected lifecycle.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Notifications-and-Background-Work) — Focused, bite-sized article covering Notifications & Background Work
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Notifications-and-Background-Work) — Step-by-step material that builds practical Notifications & Background Work knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Notifications-and-Background-Work) — Structured, in-depth material for learning about Notifications & Background Work thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Flutter Local Notifications | Cross-platform API for displaying, scheduling, grouping, and handling local notifications | Applications that need direct control over local notification presentation and interactions | [💡](https://app.syntblaze.com/qt/flutter/Packages/Notifications-and-Background-Work/Flutter-Local-Notifications "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Notifications-and-Background-Work/Flutter-Local-Notifications "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Notifications-and-Background-Work/Flutter-Local-Notifications "Deep Dive") |
| Firebase Cloud Messaging | Remote push messaging with device registration and message delivery through Firebase | Server-driven alerts, data updates, and push-triggered application flows | [💡](https://app.syntblaze.com/qt/flutter/Packages/Notifications-and-Background-Work/Firebase-Cloud-Messaging "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Notifications-and-Background-Work/Firebase-Cloud-Messaging "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Notifications-and-Background-Work/Firebase-Cloud-Messaging "Deep Dive") |
| Workmanager | Flutter interface to platform-managed deferrable background work | Restart-safe synchronization, uploads, cleanup, and other bounded jobs | [💡](https://app.syntblaze.com/qt/flutter/Packages/Notifications-and-Background-Work/Workmanager "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Notifications-and-Background-Work/Workmanager "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Notifications-and-Background-Work/Workmanager "Deep Dive") |
| Background Fetch | Periodic or event-driven background execution opportunities managed by the operating system | Lightweight refresh work that can tolerate opportunistic timing | [💡](https://app.syntblaze.com/qt/flutter/Packages/Notifications-and-Background-Work/Background-Fetch "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Notifications-and-Background-Work/Background-Fetch "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Notifications-and-Background-Work/Background-Fetch "Deep Dive") |
| Android Alarm Manager Plus | Android alarm scheduling with Dart callbacks | Android-specific alarm-driven callbacks and scheduled application work | [💡](https://app.syntblaze.com/qt/flutter/Packages/Notifications-and-Background-Work/Android-Alarm-Manager-Plus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Notifications-and-Background-Work/Android-Alarm-Manager-Plus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Notifications-and-Background-Work/Android-Alarm-Manager-Plus "Deep Dive") |
| Awesome Notifications | Notification API covering local presentation, schedules, channels, actions, and event handling | Applications that prefer an integrated, feature-oriented notification workflow | [💡](https://app.syntblaze.com/qt/flutter/Packages/Notifications-and-Background-Work/Awesome-Notifications "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Notifications-and-Background-Work/Awesome-Notifications "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Notifications-and-Background-Work/Awesome-Notifications "Deep Dive") |

## Questions

- [What is the difference between a notification and a background task?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/What-is-the-difference-between-a-notification-and-a-background-task%3F)
- [When should a notification be local rather than remotely delivered?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/When-should-a-notification-be-local-rather-than-remotely-delivered%3F)
- [How should foreground, background, and notification-tap messages be routed?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/How-should-foreground%2C-background%2C-and-notification-tap-messages-be-routed%3F)
- [How should notification channels and categories be designed?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/How-should-notification-channels-and-categories-be-designed%3F)
- [What belongs in a notification payload?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/What-belongs-in-a-notification-payload%3F)
- [How should notification permission be requested and explained?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/How-should-notification-permission-be-requested-and-explained%3F)
- [When should I choose Flutter Local Notifications or Awesome Notifications?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/When-should-I-choose-Flutter-Local-Notifications-or-Awesome-Notifications%3F)
- [When should I choose Workmanager, Background Fetch, or an alarm API?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/When-should-I-choose-Workmanager%2C-Background-Fetch%2C-or-an-alarm-API%3F)
- [Can background work run at an exact time or fixed interval?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Can-background-work-run-at-an-exact-time-or-fixed-interval%3F)
- [How should a background callback initialize application dependencies?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/How-should-a-background-callback-initialize-application-dependencies%3F)
- [How can a background task remain safe when it is retried?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/How-can-a-background-task-remain-safe-when-it-is-retried%3F)
- [How should failed work be retried without draining resources?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/How-should-failed-work-be-retried-without-draining-resources%3F)
- [Where should task inputs, progress, and results be persisted?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Where-should-task-inputs%2C-progress%2C-and-results-be-persisted%3F)
- [How should deep links from notification actions be validated?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/How-should-deep-links-from-notification-actions-be-validated%3F)
- [How can notification and background behavior be tested reliably?](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/How-can-notification-and-background-behavior-be-tested-reliably%3F)

## Best Practices

- [Ask for notification permission in context and explain the user benefit](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Ask-for-notification-permission-in-context-and-explain-the-user-benefit)
- [Keep the application useful when notification permission is denied](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Keep-the-application-useful-when-notification-permission-is-denied)
- [Treat platform notification settings as user-owned preferences](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Treat-platform-notification-settings-as-user-owned-preferences)
- [Create stable channels and categories around user-facing notification types](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Create-stable-channels-and-categories-around-user-facing-notification-types)
- [Avoid changing channel semantics after users have configured them](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Avoid-changing-channel-semantics-after-users-have-configured-them)
- [Route every message and action through one typed payload parser](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Route-every-message-and-action-through-one-typed-payload-parser)
- [Validate payload versions, identifiers, destinations, and authorization](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Validate-payload-versions%2C-identifiers%2C-destinations%2C-and-authorization)
- [Keep sensitive data out of notification titles, bodies, and payloads](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Keep-sensitive-data-out-of-notification-titles%2C-bodies%2C-and-payloads)
- [Persist important events instead of treating push delivery as a job queue](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Persist-important-events-instead-of-treating-push-delivery-as-a-job-queue)
- [Make background operations idempotent and safe after partial completion](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Make-background-operations-idempotent-and-safe-after-partial-completion)
- [Use stable task identifiers to prevent duplicate scheduling and processing](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Use-stable-task-identifiers-to-prevent-duplicate-scheduling-and-processing)
- [Design for operating-system delays, cancellation, and missed execution windows](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Design-for-operating-system-delays%2C-cancellation%2C-and-missed-execution-windows)
- [Retry only transient failures with bounded backoff and a clear terminal state](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Retry-only-transient-failures-with-bounded-backoff-and-a-clear-terminal-state)
- [Keep background callbacks short, resource-conscious, and independently initialized](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Keep-background-callbacks-short%2C-resource-conscious%2C-and-independently-initialized)
- [Pass identifiers across isolates and reload authoritative state inside the task](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Pass-identifiers-across-isolates-and-reload-authoritative-state-inside-the-task)
- [Persist task inputs and progress before depending on in-memory state](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Persist-task-inputs-and-progress-before-depending-on-in-memory-state)
- [Report task completion and release subscriptions, clients, and other resources](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Report-task-completion-and-release-subscriptions%2C-clients%2C-and-other-resources)
- [Test permission states, delivery modes, process restarts, duplicate events, and user actions](https://app.syntblaze.com/qsp/flutter/Packages/Notifications-and-Background-Work/Test-permission-states%2C-delivery-modes%2C-process-restarts%2C-duplicate-events%2C-and-user-actions)

[< Back to packages](../README.md)
