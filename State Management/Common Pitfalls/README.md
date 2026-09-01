# Common Pitfalls

State-management failures often come from mismatched lifetimes, invisible
mutation, overly broad subscriptions, or side effects coupled to rendering. The
symptom may appear far from the cause: a disposed widget receives a late result,
an in-place list mutation produces no notification, or one global listener
rebuilds a large subtree for an unrelated field.

```text
asynchronous work ----late result----> disposed owner
shared mutable value -silent change--> stale consumer
broad notification ---> large subtree rebuild
build callback --------effect--------> repeated work
```

Flutter build methods may run whenever the framework needs them, so they must
remain repeatable descriptions of UI. Network calls, navigation, notifications,
and other commands need a controlled owner and trigger. Similarly,
`BuildContext` identifies a particular element location and should not be held
by objects whose lifetime can exceed that element.

Cleanup alone is not always cancellation. Removing a stream subscription stops
that listener, but a future, request, or worker may need its own cancellation or
stale-result guard. Design the completion path at the same time as startup so a
late callback cannot publish into an owner that has ended or moved on.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls) — Focused, bite-sized article covering Common Pitfalls
- [Learning Path](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls) — Step-by-step material that builds practical Common Pitfalls knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls) — Structured, in-depth material for learning about Common Pitfalls thoroughly

## Common Pitfalls Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Calling setState after dispose | A late callback attempts to update a `State` whose element is no longer mounted | Cancel owned work during disposal and guard unavoidable asynchronous gaps before updating | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Calling-setState-after-dispose "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Calling-setState-after-dispose "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Calling-setState-after-dispose "Deep Dive") |
| Reading inherited state above its scope | A context performs lookup from outside or above the provider it expects | Use a descendant context created below the scope and choose listening behavior deliberately | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Reading-inherited-state-above-its-scope "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Reading-inherited-state-above-its-scope "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Reading-inherited-state-above-its-scope "Deep Dive") |
| Mutating state in place | Shared data changes without a replacement value or observable transition | Create a new snapshot or use a mutation API that reliably notifies every dependent consumer | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Mutating-state-in-place "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Mutating-state-in-place "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Mutating-state-in-place "Deep Dive") |
| Over-rebuilding large subtrees | Broad dependencies or builders redo work unrelated to the changed value | Select narrow values, split consumers, and hoist invariant children | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Over-rebuilding-large-subtrees "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Over-rebuilding-large-subtrees "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Over-rebuilding-large-subtrees "Deep Dive") |
| Triggering effects during build | Rendering starts work that can repeat on any rebuild | Start effects from explicit intent or controlled lifecycle/listener boundaries | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Triggering-effects-during-build "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Triggering-effects-during-build "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Triggering-effects-during-build "Deep Dive") |
| Retaining BuildContext too long | A long-lived owner stores a handle tied to one element and its ancestors | Pass values or callbacks across layers and check mounting after asynchronous gaps | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Retaining-BuildContext-too-long "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Retaining-BuildContext-too-long "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Retaining-BuildContext-too-long "Deep Dive") |
| Mixing UI and domain logic | Widgets, state owners, or repositories absorb responsibilities from other layers | Separate presentation, application policy, and data access behind testable contracts | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Mixing-UI-and-domain-logic "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Mixing-UI-and-domain-logic "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Mixing-UI-and-domain-logic "Deep Dive") |
| Uncancelled subscriptions | A listener outlives its owner, leaks resources, or publishes late events | Store subscription handles, cancel them once, and guard other work cancellation cannot stop | [💡](https://app.syntblaze.com/qt/flutter/State-Management/Common-Pitfalls/Uncancelled-subscriptions "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/State-Management/Common-Pitfalls/Uncancelled-subscriptions "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/State-Management/Common-Pitfalls/Uncancelled-subscriptions "Deep Dive") |

## Questions

- [Which operation can complete after the state object's disposal?](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Which-operation-can-complete-after-the-state-object's-disposal%3F)
- [Is the lookup context actually a descendant of the intended inherited provider?](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Is-the-lookup-context-actually-a-descendant-of-the-intended-inherited-provider%3F)
- [Will consumers observe an in-place collection or model mutation?](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Will-consumers-observe-an-in-place-collection-or-model-mutation%3F)
- [Which exact value does each rebuilding subtree depend on?](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Which-exact-value-does-each-rebuilding-subtree-depend-on%3F)
- [Can the build method execute the effect more than once?](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Can-the-build-method-execute-the-effect-more-than-once%3F)
- [Can the retained context outlive, move away from, or no longer find its element?](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Can-the-retained-context-outlive%2C-move-away-from%2C-or-no-longer-find-its-element%3F)
- [Which decisions are presentation concerns, domain policy, or data access?](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Which-decisions-are-presentation-concerns%2C-domain-policy%2C-or-data-access%3F)
- [Who owns each subscription and what event ends its lifetime?](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Who-owns-each-subscription-and-what-event-ends-its-lifetime%3F)

## Best Practices

- [Cancel owned timers, listeners, subscriptions, and requests during disposal](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Cancel-owned-timers%2C-listeners%2C-subscriptions%2C-and-requests-during-disposal)
- [Check `mounted` or `context.mounted` after asynchronous gaps where appropriate](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Check-mounted-or-context.mounted-after-asynchronous-gaps-where-appropriate)
- [Reject stale completions even when underlying work cannot be cancelled](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Reject-stale-completions-even-when-underlying-work-cannot-be-cancelled)
- [Obtain inherited dependencies from a context below their provider](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Obtain-inherited-dependencies-from-a-context-below-their-provider)
- [Replace immutable snapshots and collections instead of mutating in place](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Replace-immutable-snapshots-and-collections-instead-of-mutating-in-place)
- [Select the smallest state slice each consumer requires](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Select-the-smallest-state-slice-each-consumer-requires)
- [Hoist invariant widget subtrees out of reactive builders](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Hoist-invariant-widget-subtrees-out-of-reactive-builders)
- [Keep build methods pure, fast, and safe to repeat](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Keep-build-methods-pure%2C-fast%2C-and-safe-to-repeat)
- [Trigger effects from explicit events or lifecycle-aware listeners](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Trigger-effects-from-explicit-events-or-lifecycle-aware-listeners)
- [Pass durable values or callbacks instead of retaining `BuildContext`](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Pass-durable-values-or-callbacks-instead-of-retaining-BuildContext)
- [Separate UI rendering, application rules, and data access](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Separate-UI-rendering%2C-application-rules%2C-and-data-access)
- [Test disposal, rapid replacement, duplicate events, and out-of-order completion](https://app.syntblaze.com/qsp/flutter/State-Management/Common-Pitfalls/Test-disposal%2C-rapid-replacement%2C-duplicate-events%2C-and-out-of-order-completion)

[< Back to State Management](../README.md)
