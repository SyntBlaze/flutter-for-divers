# Semantics Phase

The semantics phase rebuilds accessibility information for dirty semantic
subtrees. Render objects contribute labels, values, flags, actions, geometry,
and child relationships through `SemanticsConfiguration`. Flutter assembles
those contributions into a retained `SemanticsNode` tree, compiles the changed
nodes into a semantics update, and sends that update through the engine to the
platform accessibility system.

```text
render-object semantics change
             |
             v
 markNeedsSemanticsUpdate()
             |
             v
 dirty semantic subtree
             |
             v
 assemble SemanticsNode tree
             |
             v
 SemanticsOwner -> SemanticsUpdateBuilder
             |
             v
 engine accessibility bridge -> platform services
```

The semantics tree is related to the render tree but does not have to mirror
it. Render objects can merge descendants, introduce explicit semantic
boundaries, or omit nodes that contribute no independently useful meaning.
Geometry and traversal information let assistive technologies explore the
result, while actions let them activate controls without reproducing the
original pointer gesture.

Semantics generation is demand-driven. A `SemanticsHandle` keeps it enabled
while a client, such as an accessibility service or diagnostic tool, requires
the tree. When accessible meaning changes, `markNeedsSemanticsUpdate()` queues
the appropriate subtree; the pipeline later assembles and submits the update
during its semantics flush.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Semantics-Phase) — Focused, bite-sized article covering Semantics Phase
- [Learning Path](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Semantics-Phase) — Step-by-step material that builds practical Semantics Phase knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Semantics-Phase) — Structured, in-depth material for learning about Semantics Phase thoroughly

## Semantics Pipeline Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `SemanticsNode` | Stores accessibility properties, geometry, actions, and child relationships in the retained semantics tree | Node structure can merge, omit, or reorder render-tree descendants, so it must be evaluated as its own user-facing hierarchy | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsNode "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsNode "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsNode "Deep Dive") |
| `SemanticsOwner` | Owns the semantics tree and sends compiled updates to the engine | Updates should preserve stable, coherent nodes while accurately reflecting current accessible state | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsOwner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsOwner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsOwner "Deep Dive") |
| `SemanticsConfiguration` | Collects the semantic annotations and actions contributed by a render object | A custom render object should describe only meaning it owns and distinguish boundaries from mergeable contributions | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsConfiguration "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsConfiguration "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsConfiguration "Deep Dive") |
| `SemanticsUpdateBuilder` | Builds the compact semantics update transmitted to the engine | Every changed node must carry consistent properties, geometry, transforms, child order, and action data | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsUpdateBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsUpdateBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsUpdateBuilder "Deep Dive") |
| `SemanticsHandle` | Keeps semantics generation active while at least one client requires it | Dispose acquired handles when they are no longer needed so diagnostics do not keep semantics enabled unintentionally | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsHandle "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsHandle "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Semantics-Phase/SemanticsHandle "Deep Dive") |
| `markNeedsSemanticsUpdate()` | Invalidates semantic information for a render-object subtree | Call it when accessible meaning, state, actions, geometry relationships, or semantic child composition changes | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Semantics-Phase/markNeedsSemanticsUpdate-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Semantics-Phase/markNeedsSemanticsUpdate-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Semantics-Phase/markNeedsSemanticsUpdate-method "Deep Dive") |
| `assembleSemanticsNode()` | Combines a render object's configuration with the semantic nodes produced by its descendants | Custom assembly must retain meaningful children and respect semantic boundaries, merging rules, transforms, and ordering | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Semantics-Phase/assembleSemanticsNode-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Semantics-Phase/assembleSemanticsNode-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Semantics-Phase/assembleSemanticsNode-method "Deep Dive") |
| Accessibility bridge | Translates framework semantics into each platform's accessibility representation | Platform services may announce or operate equivalent semantics differently, so behavior needs testing on every target platform | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Semantics-Phase/Accessibility-bridge "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Semantics-Phase/Accessibility-bridge "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Semantics-Phase/Accessibility-bridge "Deep Dive") |
| Screen reader labels | Provide meaningful spoken names, values, states, and hints for accessible elements | Labels should identify purpose concisely without duplicating roles, values, or nearby content already announced | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Semantics-Phase/Screen-reader-labels "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Semantics-Phase/Screen-reader-labels "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Semantics-Phase/Screen-reader-labels "Deep Dive") |
| Semantics hit testing | Finds the semantic node at a location during accessibility exploration | Semantic bounds, transforms, clipping, merging, and traversal can produce a target different from pointer hit testing | [💡](https://app.syntblaze.com/qt/flutter/Rendering-Pipeline/Semantics-Phase/Hit-testing-semantics "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Rendering-Pipeline/Semantics-Phase/Hit-testing-semantics "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Rendering-Pipeline/Semantics-Phase/Hit-testing-semantics "Deep Dive") |

## Questions

- [When does Flutter run the semantics phase, and what work is deferred until its flush?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/When-does-Flutter-run-the-semantics-phase%2C-and-what-work-is-deferred-until-its-flush%3F)
- [How does a render object's `SemanticsConfiguration` become part of a `SemanticsNode` tree?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/How-does-a-render-object's-SemanticsConfiguration-become-part-of-a-SemanticsNode-tree%3F)
- [Why can the semantics tree differ from the render-object tree?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Why-can-the-semantics-tree-differ-from-the-render-object-tree%3F)
- [Which changes require a custom render object to call `markNeedsSemanticsUpdate()`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Which-changes-require-a-custom-render-object-to-call-markNeedsSemanticsUpdate()%3F)
- [How far does semantics invalidation propagate when a subtree changes?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/How-far-does-semantics-invalidation-propagate-when-a-subtree-changes%3F)
- [How does `assembleSemanticsNode()` combine a render object's configuration with descendant nodes?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/How-does-assembleSemanticsNode()-combine-a-render-object's-configuration-with-descendant-nodes%3F)
- [What responsibilities belong to `SemanticsOwner` and `SemanticsUpdateBuilder`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/What-responsibilities-belong-to-SemanticsOwner-and-SemanticsUpdateBuilder%3F)
- [Why is semantics generation enabled only while a client holds a `SemanticsHandle`?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Why-is-semantics-generation-enabled-only-while-a-client-holds-a-SemanticsHandle%3F)
- [How do semantic boundaries and merging affect the nodes submitted to the engine?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/How-do-semantic-boundaries-and-merging-affect-the-nodes-submitted-to-the-engine%3F)
- [Which node properties does the accessibility bridge translate for platform services?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Which-node-properties-does-the-accessibility-bridge-translate-for-platform-services%3F)
- [How do semantic geometry and hit testing support touch exploration?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/How-do-semantic-geometry-and-hit-testing-support-touch-exploration%3F)
- [Why must semantics updates be tested with platform accessibility services rather than inspected only in the render tree?](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Why-must-semantics-updates-be-tested-with-platform-accessibility-services-rather-than-inspected-only-in-the-render-tree%3F)

## Best Practices

- [Mark semantics dirty whenever accessible meaning changes, even if visual output does not](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Mark-semantics-dirty-whenever-accessible-meaning-changes%2C-even-if-visual-output-does-not)
- [Keep custom `SemanticsConfiguration` data synchronized with labels, values, state, and available actions](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Keep-custom-SemanticsConfiguration-data-synchronized-with-labels%2C-values%2C-state%2C-and-available-actions)
- [Reuse stable semantic structure where possible instead of causing unnecessary subtree churn](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Reuse-stable-semantic-structure-where-possible-instead-of-causing-unnecessary-subtree-churn)
- [Introduce semantic boundaries only where a subtree should form an independently meaningful accessible unit](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Introduce-semantic-boundaries-only-where-a-subtree-should-form-an-independently-meaningful-accessible-unit)
- [Merge descendants only when users should perceive and operate them as one coherent element](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Merge-descendants-only-when-users-should-perceive-and-operate-them-as-one-coherent-element)
- [Preserve meaningful descendants when overriding `assembleSemanticsNode()`](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Preserve-meaningful-descendants-when-overriding-assembleSemanticsNode())
- [Keep semantic bounds, transforms, clipping, and traversal order aligned with the interface users encounter](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Keep-semantic-bounds%2C-transforms%2C-clipping%2C-and-traversal-order-aligned-with-the-interface-users-encounter)
- [Expose only actions that are currently available and connect them to the same behavior as ordinary activation](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Expose-only-actions-that-are-currently-available-and-connect-them-to-the-same-behavior-as-ordinary-activation)
- [Write concise, localized labels and values without repeating information a platform already announces](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Write-concise%2C-localized-labels-and-values-without-repeating-information-a-platform-already-announces)
- [Acquire a `SemanticsHandle` only for as long as a client genuinely needs semantics enabled](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Acquire-a-SemanticsHandle-only-for-as-long-as-a-client-genuinely-needs-semantics-enabled)
- [Inspect the generated semantics tree with Flutter diagnostics before investigating the platform bridge](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Inspect-the-generated-semantics-tree-with-Flutter-diagnostics-before-investigating-the-platform-bridge)
- [Test semantics hit testing, traversal, announcements, and actions with real accessibility services on each target platform](https://app.syntblaze.com/qsp/flutter/Rendering-Pipeline/Semantics-Phase/Test-semantics-hit-testing%2C-traversal%2C-announcements%2C-and-actions-with-real-accessibility-services-on-each-target-platform)

[< Back to Rendering Pipeline](../README.md)
