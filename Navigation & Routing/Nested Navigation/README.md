# Nested Navigation

Nested navigation gives one region of an application its own route history while
another navigator continues to own the wider application flow. A common example
is a tabbed app in which each primary destination has an independent
`Navigator`: opening details in one tab, switching tabs, and returning should
restore that tab's details instead of resetting every destination to its root.

```text
root Navigator
|
+-- app-wide route (login, full-screen flow, or root dialog)
|
`-- tab shell
    |
    +-- Home tab Navigator:    Home -> Article -> Comments
    |
    +-- Search tab Navigator:  Search -> Result
    |
    `-- Profile tab Navigator: Profile

system back
    -> active tab's nested stack
    -> shell or root stack when the nested stack cannot pop
```

The navigator selected for an operation determines which stack changes.
`Navigator.of(context)` finds the nearest enclosing navigator, which is usually
the active nested navigator when called inside a tab. Use an explicit root
lookup or a root navigator key only when the route or overlay must sit above the
entire shell. For example, `showDialog` uses the root navigator by default; when
the dialog belongs to a tab's local flow, select the nested navigator
deliberately and dismiss it through the same stack.

Shell routes are terminology and abstractions supplied by routing packages, not
a single Flutter framework route type with universal behavior. They commonly
keep shared UI such as a bottom navigation bar around a changing child route
and may place branch routes on nested navigators. Exact branch, restoration,
redirect, and back-button behavior depends on the selected package and its
configuration.

Keeping every tab subtree in an `IndexedStack` preserves mounted widget state
and makes tab switches immediate, but it also keeps inactive subtrees and their
resources alive. It does not by itself create independent route histories;
each tab needs its own stable navigator and key for that. Pause unnecessary
animations, subscriptions, and expensive work in inactive tabs, and consider
lazy construction or restoration when retaining every branch costs too much.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Nested-Navigation) — Focused, bite-sized article covering Nested Navigation
- [Learning Path](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Nested-Navigation) — Step-by-step material that builds practical Nested Navigation knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Nested-Navigation) — Structured, in-depth material for learning about Nested Navigation thoroughly

## Nested Navigation Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Tab navigation | Switches among peer destinations within a stable application shell | Decide whether tabs need only preserved view state or truly independent route stacks | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Nested-Navigation/Tab-navigation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Nested-Navigation/Tab-navigation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Nested-Navigation/Tab-navigation "Deep Dive") |
| Bottom navigation | Connects a bottom destination control to the selected branch | Keep destination order, selected index, visible branch, and back behavior driven by one source of truth | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Nested-Navigation/Bottom-navigation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Nested-Navigation/Bottom-navigation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Nested-Navigation/Bottom-navigation "Deep Dive") |
| Shell routes | Uses a routing-package abstraction to keep shared UI around child routes | Shell APIs and branch semantics are package-specific; verify navigator ownership, deep links, redirects, and restoration | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Nested-Navigation/Shell-routes "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Nested-Navigation/Shell-routes "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Nested-Navigation/Shell-routes "Deep Dive") |
| Nested `Navigator` | Owns a route stack inside part of the widget tree | Give each long-lived stack a stable key and send local pushes and pops to the intended navigator | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Nested-Navigation/Nested-Navigator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Nested-Navigation/Nested-Navigator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Nested-Navigation/Nested-Navigator "Deep Dive") |
| Root navigator | Owns routes and overlays that must cover the complete app shell | Target it explicitly for app-wide flows; otherwise prefer the nearest navigator for branch-local navigation | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Nested-Navigation/Root-navigator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Nested-Navigation/Root-navigator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Nested-Navigation/Root-navigator "Deep Dive") |
| Dialog on root navigator | Presents a modal above every nested branch | Push and dismiss through the same navigator, and avoid using a stale branch context after asynchronous work | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Nested-Navigation/Dialog-on-root-navigator "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Nested-Navigation/Dialog-on-root-navigator "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Nested-Navigation/Dialog-on-root-navigator "Deep Dive") |
| Back stack per tab | Retains a separate history for each primary destination | Back should normally pop the active branch first, with a defined policy for switching tabs or exiting at branch roots | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Nested-Navigation/Back-stack-per-tab "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Nested-Navigation/Back-stack-per-tab "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Nested-Navigation/Back-stack-per-tab "Deep Dive") |
| `IndexedStack` tab preservation | Keeps inactive tab subtrees mounted while showing one child | Preservation improves continuity but retains memory and background work, and does not replace a navigator per stack | [💡](https://app.syntblaze.com/qt/flutter/Navigation-and-Routing/Nested-Navigation/IndexedStack-tab-preservation "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Navigation-and-Routing/Nested-Navigation/IndexedStack-tab-preservation "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Navigation-and-Routing/Nested-Navigation/IndexedStack-tab-preservation "Deep Dive") |

## Questions

- [When should tabs share one route stack, and when should each tab own an independent stack?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/When-should-tabs-share-one-route-stack%2C-and-when-should-each-tab-own-an-independent-stack%3F)
- [How should a bottom navigation selection stay synchronized with the visible route branch?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/How-should-a-bottom-navigation-selection-stay-synchronized-with-the-visible-route-branch%3F)
- [What does a shell route provide, and which parts of its behavior depend on the routing package?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/What-does-a-shell-route-provide%2C-and-which-parts-of-its-behavior-depend-on-the-routing-package%3F)
- [Which `BuildContext` and navigator key cause a route operation to target a nested `Navigator`?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/Which-BuildContext-and-navigator-key-cause-a-route-operation-to-target-a-nested-Navigator%3F)
- [When should a route be pushed onto the root navigator rather than the nearest navigator?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/When-should-a-route-be-pushed-onto-the-root-navigator-rather-than-the-nearest-navigator%3F)
- [How can a dialog cover the full shell and later be dismissed from the stack that presented it?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/How-can-a-dialog-cover-the-full-shell-and-later-be-dismissed-from-the-stack-that-presented-it%3F)
- [What should system back do when the active tab can pop, is at its root, or is not the default tab?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/What-should-system-back-do-when-the-active-tab-can-pop%2C-is-at-its-root%2C-or-is-not-the-default-tab%3F)
- [Which state does `IndexedStack` preserve, and what resource costs remain while a tab is inactive?](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/Which-state-does-IndexedStack-preserve%2C-and-what-resource-costs-remain-while-a-tab-is-inactive%3F)

## Best Practices

- [Use tabs for stable peer destinations and define whether reselection pops, scrolls to top, or does nothing](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/Use-tabs-for-stable-peer-destinations-and-define-whether-reselection-pops%2C-scrolls-to-top%2C-or-does-nothing)
- [Drive bottom-navigation selection and branch visibility from the same state](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/Drive-bottom-navigation-selection-and-branch-visibility-from-the-same-state)
- [Treat shell routes as routing-package configuration and test the chosen package's branch semantics](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/Treat-shell-routes-as-routing-package-configuration-and-test-the-chosen-package's-branch-semantics)
- [Create stable navigator keys outside rebuild paths and assign one key per independent stack](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/Create-stable-navigator-keys-outside-rebuild-paths-and-assign-one-key-per-independent-stack)
- [Keep branch-local routes on the nearest navigator and reserve the root navigator for app-wide presentation](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/Keep-branch-local-routes-on-the-nearest-navigator-and-reserve-the-root-navigator-for-app-wide-presentation)
- [Dismiss a root dialog through the root navigator that presented it](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/Dismiss-a-root-dialog-through-the-root-navigator-that-presented-it)
- [Pop the active tab's history before applying the application's at-root back policy](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/Pop-the-active-tab's-history-before-applying-the-application's-at-root-back-policy)
- [Measure memory and background work before preserving every tab with `IndexedStack`](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/Measure-memory-and-background-work-before-preserving-every-tab-with-IndexedStack)
- [Test tab switching, deep links, state restoration, system and browser back, and process recreation together](https://app.syntblaze.com/qsp/flutter/Navigation-and-Routing/Nested-Navigation/Test-tab-switching%2C-deep-links%2C-state-restoration%2C-system-and-browser-back%2C-and-process-recreation-together)

[< Back to navigation & routing](../README.md)
