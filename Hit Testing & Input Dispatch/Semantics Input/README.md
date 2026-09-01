# Semantics Input

Semantics input is the accessibility counterpart to direct pointer and keyboard
input. Flutter exposes an annotated semantics tree that describes controls,
values, bounds, and supported actions. Assistive technology navigates that tree
and asks the platform to invoke an action on a particular semantics node; the
engine and framework then dispatch the request to the callback registered for
that node.

```text
render objects and widgets
        |
        v
semantics tree -> platform accessibility tree -> assistive technology
        ^                                           |
        |                                           v
next semantics update <- app state <- node callback <- semantics action
                              ^
                              |
                 accessibility hit testing
                 selects a semantics node
```

Semantics hit testing is related to, but distinct from, render-object pointer
hit testing. A pointer event targets a path of render objects, while an
accessibility action normally names a semantics node and is delivered according
to that node's advertised capabilities. The semantics tree may merge, exclude,
or reorder visual descendants, so its interactive structure must remain
meaningful even when it does not mirror the render tree exactly.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input) — Focused, bite-sized article covering Semantics Input
- [Learning Path](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input) — Step-by-step material that builds practical Semantics Input knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input) — Structured, in-depth material for learning about Semantics Input thoroughly

## Topics

| Topic | Primary role | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Semantics hit testing | Determines which accessible node corresponds to a location during accessibility exploration | Bounds, transforms, clipping, traversal order, and merged nodes can make the result differ from pointer hit testing | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Semantics-hit-testing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Semantics-hit-testing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Semantics-hit-testing "Deep Dive") |
| `SemanticsAction` | Identifies a standard action that a semantics node can advertise and handle | Expose only actions that are currently available and implement their callbacks consistently | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/SemanticsAction "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/SemanticsAction "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/SemanticsAction "Deep Dive") |
| `CustomSemanticsAction` | Describes an application-specific accessibility action with a localized label | Prefer standard actions when one expresses the behavior because platforms understand them more consistently | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/CustomSemanticsAction "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/CustomSemanticsAction "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/CustomSemanticsAction "Deep Dive") |
| Accessibility tap action | Activates the semantics node's primary operation without requiring a physical pointer tap | Keep its result equivalent to the control's ordinary activation behavior | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Accessibility-tap-action "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Accessibility-tap-action "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Accessibility-tap-action "Deep Dive") |
| Accessibility scroll action | Requests directional or extent-based movement through accessible content | Report scrollability and updated position accurately, and handle boundaries without misleading feedback | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Accessibility-scroll-action "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Accessibility-scroll-action "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Accessibility-scroll-action "Deep Dive") |

## Questions

- [How does semantics hit testing differ from render-object hit testing?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/How-does-semantics-hit-testing-differ-from-render-object-hit-testing%3F)
- [How do transforms, clipping, merging, and traversal order affect an accessible target?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/How-do-transforms%2C-clipping%2C-merging%2C-and-traversal-order-affect-an-accessible-target%3F)
- [How does a platform accessibility request reach a Flutter semantics callback?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/How-does-a-platform-accessibility-request-reach-a-Flutter-semantics-callback%3F)
- [Which standard actions can a semantics node advertise?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Which-standard-actions-can-a-semantics-node-advertise%3F)
- [When is a custom semantics action justified?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/When-is-a-custom-semantics-action-justified%3F)
- [How should a custom action be named for assistive-technology users?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/How-should-a-custom-action-be-named-for-assistive-technology-users%3F)
- [Should accessibility activation behave like tapping the same control?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Should-accessibility-activation-behave-like-tapping-the-same-control%3F)
- [What should happen when an accessibility tap action is unavailable?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/What-should-happen-when-an-accessibility-tap-action-is-unavailable%3F)
- [How are directional accessibility scroll requests represented?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/How-are-directional-accessibility-scroll-requests-represented%3F)
- [How should scroll boundaries and position changes be announced?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/How-should-scroll-boundaries-and-position-changes-be-announced%3F)
- [Why can the semantics tree differ from the render tree?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Why-can-the-semantics-tree-differ-from-the-render-tree%3F)
- [When should a semantics update follow an input action?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/When-should-a-semantics-update-follow-an-input-action%3F)

## Best Practices

- [Keep semantic bounds and transforms aligned with the visible interactive area](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Keep-semantic-bounds-and-transforms-aligned-with-the-visible-interactive-area)
- [Preserve a predictable accessibility traversal and hit-test order](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Preserve-a-predictable-accessibility-traversal-and-hit-test-order)
- [Advertise only actions that the control can currently perform](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Advertise-only-actions-that-the-control-can-currently-perform)
- [Use standard semantics actions whenever they accurately describe the operation](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Use-standard-semantics-actions-whenever-they-accurately-describe-the-operation)
- [Give custom actions short, localized, verb-oriented labels](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Give-custom-actions-short%2C-localized%2C-verb-oriented-labels)
- [Avoid duplicating a standard action with a custom action](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Avoid-duplicating-a-standard-action-with-a-custom-action)
- [Make accessibility tap invoke the same underlying command as ordinary activation](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Make-accessibility-tap-invoke-the-same-underlying-command-as-ordinary-activation)
- [Do not require gesture timing or pointer precision for semantics activation](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Do-not-require-gesture-timing-or-pointer-precision-for-semantics-activation)
- [Expose scroll actions only in directions where meaningful movement is possible](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Expose-scroll-actions-only-in-directions-where-meaningful-movement-is-possible)
- [Update scroll position and semantics promptly after a successful action](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Update-scroll-position-and-semantics-promptly-after-a-successful-action)
- [Test with the platform screen reader and other supported accessibility services](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Test-with-the-platform-screen-reader-and-other-supported-accessibility-services)
- [Verify merged, excluded, hidden, disabled, and dynamically changing semantics states](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Semantics-Input/Verify-merged%2C-excluded%2C-hidden%2C-disabled%2C-and-dynamically-changing-semantics-states)

[< Back to hit testing & input dispatch](../README.md)
