# Widget Tree

The widget tree is Flutter's immutable description of a user interface. Each
widget stores configuration for part of the UI; during build, the framework
inflates or updates a corresponding element and, where necessary, configures a
render object. Rebuilding replaces widget instances while elements preserve
location and state when identity still matches.

```text
Widget
├── StatelessWidget ───────────────> StatelessElement
├── StatefulWidget ── creates ─────> State ── builds ──> Widget
├── ProxyWidget
│   └── InheritedWidget ───────────> shares data with descendants
├── ParentDataWidget ──────────────> configures a child's ParentData
└── RenderObjectWidget ────────────> creates or updates a RenderObject
    ├── LeafRenderObjectWidget
    ├── SingleChildRenderObjectWidget
    ├── MultiChildRenderObjectWidget
    └── SlottedMultiChildRenderObjectWidget
```

Widgets are temporary configuration objects, not the long-lived runtime nodes
that perform layout or painting. Their concrete base class communicates how
the framework should create children, retain mutable state, propagate ambient
configuration, or bridge into the render-object tree.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree) — Focused, bite-sized article covering Widget Tree
- [Learning Path](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree) — Step-by-step material that builds practical Widget Tree knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree) — Structured, in-depth material for learning about Widget Tree thoroughly

## Widget Tree Nodes

| Topic | Role in the widget tree | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| Widget | Immutable configuration and common base class for every widget | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/Widget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/Widget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/Widget "Deep Dive") |
| StatelessWidget | Describes UI entirely from constructor inputs and ambient dependencies | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/StatelessWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/StatelessWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/StatelessWidget "Deep Dive") |
| StatefulWidget | Supplies immutable configuration for a separately retained `State` object | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/StatefulWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/StatefulWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/StatefulWidget "Deep Dive") |
| State | Holds mutable lifecycle state and builds the current configuration for a `StatefulWidget` | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/State "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/State "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/State "Deep Dive") |
| ProxyWidget | Base class for widgets that wrap one child and proxy configuration through the tree | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/ProxyWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/ProxyWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/ProxyWidget "Deep Dive") |
| InheritedWidget | Efficiently exposes ambient data to dependent descendant elements | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/InheritedWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/InheritedWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/InheritedWidget "Deep Dive") |
| InheritedModel | Lets descendants depend on selected aspects of inherited data | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/InheritedModel "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/InheritedModel "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/InheritedModel "Deep Dive") |
| InheritedNotifier | Rebuilds dependents when a wrapped `Listenable` sends a notification | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/InheritedNotifier "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/InheritedNotifier "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/InheritedNotifier "Deep Dive") |
| ParentDataWidget | Writes layout-specific parent data onto a descendant render object | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/ParentDataWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/ParentDataWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/ParentDataWidget "Deep Dive") |
| RenderObjectWidget | Bridges widget configuration to creation and updates of a render object | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/RenderObjectWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/RenderObjectWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/RenderObjectWidget "Deep Dive") |
| LeafRenderObjectWidget | Configures a render object that has no widget children | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/LeafRenderObjectWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/LeafRenderObjectWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/LeafRenderObjectWidget "Deep Dive") |
| SingleChildRenderObjectWidget | Configures a render object with at most one child | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/SingleChildRenderObjectWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/SingleChildRenderObjectWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/SingleChildRenderObjectWidget "Deep Dive") |
| MultiChildRenderObjectWidget | Configures a render object whose children form an ordered list | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/MultiChildRenderObjectWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/MultiChildRenderObjectWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/MultiChildRenderObjectWidget "Deep Dive") |
| SlottedMultiChildRenderObjectWidget | Assigns multiple children to distinct named or typed slots | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/SlottedMultiChildRenderObjectWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/SlottedMultiChildRenderObjectWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/SlottedMultiChildRenderObjectWidget "Deep Dive") |
| PreferredSizeWidget | Reports a preferred size for use by a parent such as `Scaffold` | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Widget-Tree/PreferredSizeWidget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Widget-Tree/PreferredSizeWidget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Widget-Tree/PreferredSizeWidget "Deep Dive") |

## Questions

- [What does a widget represent if it does not render pixels itself?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/What-does-a-widget-represent-if-it-does-not-render-pixels-itself%3F)
- [Why are widget objects immutable and frequently recreated?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Why-are-widget-objects-immutable-and-frequently-recreated%3F)
- [When should UI be implemented with a `StatelessWidget`?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/When-should-UI-be-implemented-with-a-StatelessWidget%3F)
- [How do `StatefulWidget` and `State` divide configuration from mutable state?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/How-do-StatefulWidget-and-State-divide-configuration-from-mutable-state%3F)
- [Why can a `State` object outlive a particular widget instance?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Why-can-a-State-object-outlive-a-particular-widget-instance%3F)
- [When does the framework call a `State` object's `build` method again?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/When-does-the-framework-call-a-State-object's-build-method-again%3F)
- [What role does `ProxyWidget` play in one-child wrappers?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/What-role-does-ProxyWidget-play-in-one-child-wrappers%3F)
- [How does an `InheritedWidget` register and notify dependent descendants?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/How-does-an-InheritedWidget-register-and-notify-dependent-descendants%3F)
- [When is `InheritedModel` more selective than `InheritedWidget`?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/When-is-InheritedModel-more-selective-than-InheritedWidget%3F)
- [How does `InheritedNotifier` connect a `Listenable` to inherited dependencies?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/How-does-InheritedNotifier-connect-a-Listenable-to-inherited-dependencies%3F)
- [Why must a `ParentDataWidget` be placed under the correct render-object widget?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Why-must-a-ParentDataWidget-be-placed-under-the-correct-render-object-widget%3F)
- [How does `RenderObjectWidget` connect the widget and render-object trees?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/How-does-RenderObjectWidget-connect-the-widget-and-render-object-trees%3F)
- [Which render-object widget base class fits zero, one, list, or slotted children?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Which-render-object-widget-base-class-fits-zero%2C-one%2C-list%2C-or-slotted-children%3F)
- [Does `PreferredSizeWidget` force its child to use the preferred size?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Does-PreferredSizeWidget-force-its-child-to-use-the-preferred-size%3F)

## Best Practices

- [Keep widget fields immutable and constructor-focused](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Keep-widget-fields-immutable-and-constructor-focused)
- [Keep build methods declarative and free of side effects](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Keep-build-methods-declarative-and-free-of-side-effects)
- [Use `StatefulWidget` only when state belongs to that tree location](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Use-StatefulWidget-only-when-state-belongs-to-that-tree-location)
- [Check `mounted` before using a `State` after an asynchronous gap](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Check-mounted-before-using-a-State-after-an-asynchronous-gap)
- [Release controllers, focus nodes, and subscriptions in `dispose`](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Release-controllers%2C-focus-nodes%2C-and-subscriptions-in-dispose)
- [Make inherited update notifications as selective as the data allows](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Make-inherited-update-notifications-as-selective-as-the-data-allows)
- [Use aspects to avoid unrelated rebuilds with `InheritedModel`](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Use-aspects-to-avoid-unrelated-rebuilds-with-InheritedModel)
- [Dispose an owned notifier at the layer that created it](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Dispose-an-owned-notifier-at-the-layer-that-created-it)
- [Use the framework's parent-data widgets instead of mutating parent data directly](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Use-the-framework's-parent-data-widgets-instead-of-mutating-parent-data-directly)
- [Prefer composition before implementing a custom render-object widget](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Prefer-composition-before-implementing-a-custom-render-object-widget)
- [Match the render-object widget base class to its actual child model](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Match-the-render-object-widget-base-class-to-its-actual-child-model)
- [Treat preferred size as a parent-consumed hint, not a layout guarantee](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Widget-Tree/Treat-preferred-size-as-a-parent-consumed-hint%2C-not-a-layout-guarantee)

[< Back to Core Trees](../README.md)
