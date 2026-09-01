# Semantics Tree

The semantics tree is Flutter's accessibility-facing description of the
interface. Render objects contribute semantic properties and relationships;
the framework combines those contributions into `SemanticsNode` objects that
platform accessibility services can inspect and act upon. The resulting tree
can merge, omit, block, or reorder information independently of the visual
widget hierarchy.

```text
Semantics widgets and render objects
              │ contribute
              ▼
    SemanticsConfiguration
              │ compiled into
              ▼
        SemanticsNode tree
              │ managed by
              ▼
         SemanticsOwner
              │ sends updates to
              ▼
 Platform accessibility services
```

Widgets such as `Semantics`, `MergeSemantics`, and `ExcludeSemantics` influence
what render objects contribute, but they are not themselves the runtime
semantics nodes exposed to the platform. A semantics tree is produced when
semantics are enabled and updated during the semantics phase of the rendering
pipeline.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Semantics-Tree) — Focused, bite-sized article covering Semantics Tree
- [Learning Path](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Semantics-Tree) — Step-by-step material that builds practical Semantics Tree knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Semantics-Tree) — Structured, in-depth material for learning about Semantics Tree thoroughly

## Semantics Tree Nodes

| Topic | Role in the semantics tree | Quick Bite | Learning Path | Deep Dive |
| --- | --- | :---: | :---: | :---: |
| Semantics | Annotates a widget subtree with accessibility properties, actions, and structural hints | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Semantics-Tree/Semantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Semantics-Tree/Semantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Semantics-Tree/Semantics "Deep Dive") |
| SemanticsNode | Stores a retained node's semantic data, geometry, actions, and child relationships | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Semantics-Tree/SemanticsNode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Semantics-Tree/SemanticsNode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Semantics-Tree/SemanticsNode "Deep Dive") |
| SemanticsOwner | Owns semantics nodes and coordinates dirty-node updates to the platform | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Semantics-Tree/SemanticsOwner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Semantics-Tree/SemanticsOwner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Semantics-Tree/SemanticsOwner "Deep Dive") |
| SemanticsConfiguration | Collects the semantic properties and actions contributed by a render object | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Semantics-Tree/SemanticsConfiguration "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Semantics-Tree/SemanticsConfiguration "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Semantics-Tree/SemanticsConfiguration "Deep Dive") |
| MergeSemantics | Requests that descendant semantics be presented as one merged node when possible | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Semantics-Tree/MergeSemantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Semantics-Tree/MergeSemantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Semantics-Tree/MergeSemantics "Deep Dive") |
| ExcludeSemantics | Removes descendant semantics while optionally allowing replacement semantics on the wrapper | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Semantics-Tree/ExcludeSemantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Semantics-Tree/ExcludeSemantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Semantics-Tree/ExcludeSemantics "Deep Dive") |
| BlockSemantics | Prevents earlier-painted sibling semantics from being exposed beneath the same semantic container | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Semantics-Tree/BlockSemantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Semantics-Tree/BlockSemantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Semantics-Tree/BlockSemantics "Deep Dive") |
| IndexedSemantics | Assigns an explicit semantic index used to order or describe indexed children | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Semantics-Tree/IndexedSemantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Semantics-Tree/IndexedSemantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Semantics-Tree/IndexedSemantics "Deep Dive") |
| CustomSemanticsAction | Defines an application-specific accessibility action with a localized label | [💡](https://app.syntblaze.com/qt/flutter/Trees/Core-Trees/Semantics-Tree/CustomSemanticsAction "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Trees/Core-Trees/Semantics-Tree/CustomSemanticsAction "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Trees/Core-Trees/Semantics-Tree/CustomSemanticsAction "Deep Dive") |

## Questions

- [How is the semantics tree related to the widget and render-object trees?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/How-is-the-semantics-tree-related-to-the-widget-and-render-object-trees%3F)
- [When does Flutter build and update the semantics tree?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/When-does-Flutter-build-and-update-the-semantics-tree%3F)
- [How does a `Semantics` widget add labels, values, flags, and actions?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/How-does-a-Semantics-widget-add-labels%2C-values%2C-flags%2C-and-actions%3F)
- [What information does a `SemanticsNode` retain and send to the platform?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/What-information-does-a-SemanticsNode-retain-and-send-to-the-platform%3F)
- [How do render objects populate a `SemanticsConfiguration`?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/How-do-render-objects-populate-a-SemanticsConfiguration%3F)
- [When should descendant semantics be merged into a single accessible item?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/When-should-descendant-semantics-be-merged-into-a-single-accessible-item%3F)
- [What is the difference between excluding semantics and blocking earlier sibling semantics?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/What-is-the-difference-between-excluding-semantics-and-blocking-earlier-sibling-semantics%3F)
- [Why can some descendant semantics not be merged?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Why-can-some-descendant-semantics-not-be-merged%3F)
- [How does `IndexedSemantics` affect accessible ordering and collection positions?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/How-does-IndexedSemantics-affect-accessible-ordering-and-collection-positions%3F)
- [When is a `CustomSemanticsAction` preferable to a standard semantics action?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/When-is-a-CustomSemanticsAction-preferable-to-a-standard-semantics-action%3F)
- [Why can the accessible structure differ from the visual widget structure?](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Why-can-the-accessible-structure-differ-from-the-visual-widget-structure%3F)

## Best Practices

- [Prefer meaningful visible text before adding duplicate semantic labels](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Prefer-meaningful-visible-text-before-adding-duplicate-semantic-labels)
- [Use concise labels, values, hints, and state descriptions](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Use-concise-labels%2C-values%2C-hints%2C-and-state-descriptions)
- [Expose standard semantic actions whenever they describe the interaction](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Expose-standard-semantic-actions-whenever-they-describe-the-interaction)
- [Use custom actions only when no standard accessibility action fits](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Use-custom-actions-only-when-no-standard-accessibility-action-fits)
- [Merge semantics only when descendants form one coherent accessible control](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Merge-semantics-only-when-descendants-form-one-coherent-accessible-control)
- [Exclude decorative or deliberately replaced semantics, not useful content](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Exclude-decorative-or-deliberately-replaced-semantics%2C-not-useful-content)
- [Use blocking semantics for modal or otherwise obscuring UI](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Use-blocking-semantics-for-modal-or-otherwise-obscuring-UI)
- [Keep semantic indexes aligned with the user's logical reading order](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Keep-semantic-indexes-aligned-with-the-user's-logical-reading-order)
- [Mark semantics dirty when a custom render object's accessible meaning changes](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Mark-semantics-dirty-when-a-custom-render-object's-accessible-meaning-changes)
- [Test with platform screen readers and Flutter's semantics debugging tools](https://app.syntblaze.com/qsp/flutter/Trees/Core-Trees/Semantics-Tree/Test-with-platform-screen-readers-and-Flutter's-semantics-debugging-tools)

[< Back to Core Trees](../README.md)
