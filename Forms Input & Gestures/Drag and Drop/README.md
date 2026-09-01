# Drag and Drop

Flutter drag-and-drop interactions separate the source, the data being moved,
the visual feedback, and the destination. `Draggable<T>` and
`LongPressDraggable<T>` start a drag and carry a typed value, while
`DragTarget<T>` decides whether that value is eligible and commits it only when
the pointer is released over an accepting target. `Dismissible` and
`ReorderableListView` package the same broad interaction pattern for common
list operations.

```text
pointer gesture -> source starts -> feedback inserted in an Overlay
                                      |
pointer moves ------------------------+-> target hit testing
                                          |
                              target entered / acceptance checked
                                     /                  \
                         candidate data              rejected data
                              |                           |
release over target -> accept + update model       cancel / leave
                              \                           /
                               source drag ends + feedback removed
```

The drag payload and the feedback widget serve different purposes: `data` is
the domain value offered to targets, while `feedback` is only the visual drag
avatar. Target detection uses a global hit-test position derived from the
pointer plus `feedbackOffset`; the feedback's overlay position also depends on
the chosen drag anchor. Keep those coordinate decisions explicit when feedback
is transformed, placed in a root overlay, or differs in size from the source.

Pointer dragging must not be the only way to complete an important action.
Expose equivalent buttons, menus, or keyboard operations; preserve logical
focus; label controls and destinations; and announce successful state changes
where the updated interface does not make them clear to assistive technology.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Drag-and-Drop) — Focused, bite-sized article covering Drag and Drop
- [Learning Path](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Drag-and-Drop) — Step-by-step material that builds practical Drag and Drop knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Drag-and-Drop) — Structured, in-depth material for learning about Drag and Drop thoroughly

## Drag and Drop Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `Draggable` | Starts an immediate drag, carries `T`, and displays an overlay feedback widget | Use a meaningful payload type compatible with its targets, set non-null data for normal acceptance callbacks, and distinguish `axis` from gesture `affinity` | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Draggable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Draggable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Draggable "Deep Dive") |
| `LongPressDraggable` | Starts a drag after a long-press recognizer wins | Use delayed initiation where it helps coexist with scrolling, but provide discoverable non-gesture and keyboard alternatives | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/LongPressDraggable "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/LongPressDraggable "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/LongPressDraggable "Deep Dive") |
| `DragTarget` | Evaluates hovering payloads and accepts eligible drops | Prefer the details callbacks, keep eligibility checks side-effect free, and mutate application state only after an accepted drop | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/DragTarget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/DragTarget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/DragTarget "Deep Dive") |
| `Dismissible` | Turns a directional drag into a confirmable removal or secondary action | Use a stable key, gate destructive work with `confirmDismiss`, and remove the item from the model promptly in `onDismissed` | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Dismissible "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Dismissible "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Dismissible "Deep Dive") |
| `ReorderableListView` | Provides drag handles and list-item reordering | Assign every item a stable unique key and update the backing collection correctly for the reported old and new indices | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/ReorderableListView "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/ReorderableListView "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/ReorderableListView "Deep Dive") |
| Feedback widget | Represents the moving item in an overlay without being the payload itself | Keep it lightweight, visually legible, and correctly themed; decide deliberately whether it participates in pointer hit testing or semantics | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Feedback-widget "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Feedback-widget "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Feedback-widget "Deep Dive") |
| Drag anchor strategy | Computes the offset between the pointer and feedback origin | Choose child or pointer anchoring to match the visual model, and account separately for `feedbackOffset`, which changes target hit testing | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Drag-anchor-strategy "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Drag-anchor-strategy "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Drag-anchor-strategy "Deep Dive") |
| Accepted data | Payloads currently eligible for a target and values committed on drop | Render hover affordances from `candidateData`, then handle the non-null typed value and global drop offset in `onAcceptWithDetails` | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Accepted-data "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Accepted-data "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Accepted-data "Deep Dive") |
| Rejected data | Hovering payloads that a target has declined | Use `rejectedData` only for reversible visual feedback, and leave both source and domain state intact when the drag leaves or ends unaccepted | [💡](https://app.syntblaze.com/qt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Rejected-data "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Rejected-data "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Rejected-data "Deep Dive") |

## Questions

- [What is the difference between a draggable's typed data, child, child-while-dragging, and feedback?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/What-is-the-difference-between-a-draggable's-typed-data%2C-child%2C-child-while-dragging%2C-and-feedback%3F)
- [When does long-press initiation reduce conflicts with scrolling, and when does it hurt discoverability?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/When-does-long-press-initiation-reduce-conflicts-with-scrolling%2C-and-when-does-it-hurt-discoverability%3F)
- [How do type matching, `onWillAcceptWithDetails`, and `onAcceptWithDetails` divide target responsibilities?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/How-do-type-matching%2C-onWillAcceptWithDetails%2C-and-onAcceptWithDetails-divide-target-responsibilities%3F)
- [How should a destructive dismissal be confirmed, cancelled, and reflected in the backing model?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/How-should-a-destructive-dismissal-be-confirmed%2C-cancelled%2C-and-reflected-in-the-backing-model%3F)
- [Why do reorderable children need stable keys, and how are move indices applied to a list?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Why-do-reorderable-children-need-stable-keys%2C-and-how-are-move-indices-applied-to-a-list%3F)
- [Where is feedback rendered, and should it participate in hit testing or the semantics tree?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Where-is-feedback-rendered%2C-and-should-it-participate-in-hit-testing-or-the-semantics-tree%3F)
- [How do child and pointer anchor strategies change the feedback's position?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/How-do-child-and-pointer-anchor-strategies-change-the-feedback's-position%3F)
- [What appears in `candidateData`, and when should accepting a value mutate application state?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/What-appears-in-candidateData%2C-and-when-should-accepting-a-value-mutate-application-state%3F)
- [What appears in `rejectedData`, and how should a target communicate that a drop is invalid?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/What-appears-in-rejectedData%2C-and-how-should-a-target-communicate-that-a-drop-is-invalid%3F)
- [How do `dragAnchorStrategy`, `feedbackOffset`, and `DragTargetDetails.offset` relate to coordinate spaces?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/How-do-dragAnchorStrategy%2C-feedbackOffset%2C-and-DragTargetDetails.offset-relate-to-coordinate-spaces%3F)
- [Which keyboard, button, or menu alternative lets a user complete the same operation without dragging?](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Which-keyboard%2C-button%2C-or-menu-alternative-lets-a-user-complete-the-same-operation-without-dragging%3F)

## Best Practices

- [Carry a small domain identifier or value as typed drag data instead of deriving meaning from the feedback widget](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Carry-a-small-domain-identifier-or-value-as-typed-drag-data-instead-of-deriving-meaning-from-the-feedback-widget)
- [Use one intentional generic payload type across each source-target contract and avoid null drag data](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Use-one-intentional-generic-payload-type-across-each-source-target-contract-and-avoid-null-drag-data)
- [Keep target eligibility checks fast, deterministic, and free of model mutations](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Keep-target-eligibility-checks-fast%2C-deterministic%2C-and-free-of-model-mutations)
- [Commit changes only after acceptance, and make rejected or cancelled drags leave the model unchanged](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Commit-changes-only-after-acceptance%2C-and-make-rejected-or-cancelled-drags-leave-the-model-unchanged)
- [Use lightweight feedback that remains visible across the intended overlay and does not accidentally intercept hit tests](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Use-lightweight-feedback-that-remains-visible-across-the-intended-overlay-and-does-not-accidentally-intercept-hit-tests)
- [Test transformed, differently sized, nested-overlay, and root-overlay feedback with the intended anchor and hit-test offset](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Test-transformed%2C-differently-sized%2C-nested-overlay%2C-and-root-overlay-feedback-with-the-intended-anchor-and-hit-test-offset)
- [Use stable item keys and test upward, downward, first, and last reorders](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Use-stable-item-keys-and-test-upward%2C-downward%2C-first%2C-and-last-reorders)
- [Confirm destructive dismissals when appropriate and provide undo for recoverable actions](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Confirm-destructive-dismissals-when-appropriate-and-provide-undo-for-recoverable-actions)
- [Limit simultaneous drags when the interface or data model cannot represent concurrent operations safely](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Limit-simultaneous-drags-when-the-interface-or-data-model-cannot-represent-concurrent-operations-safely)
- [Provide non-drag equivalents, visible focus, useful semantics, and clear accepted/rejected state](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Provide-non-drag-equivalents%2C-visible-focus%2C-useful-semantics%2C-and-clear-accepted%2Frejected-state)
- [Test touch, mouse, trackpad, keyboard, screen reader, cancellation, and drag-versus-scroll behavior](https://app.syntblaze.com/qsp/flutter/Forms-Input-and-Gestures/Drag-and-Drop/Test-touch%2C-mouse%2C-trackpad%2C-keyboard%2C-screen-reader%2C-cancellation%2C-and-drag-versus-scroll-behavior)

[< Back to forms input & gestures](../README.md)
