# Hit Testing

Hit testing converts a pointer position into an ordered path of framework
objects that can receive the event. The process starts at a render-tree root,
walks through candidates whose geometry contains the position, and records a
`HitTestEntry` for each participating target in a `HitTestResult`. Dispatch can
then deliver the event along that stable path from the most specific target
toward its ancestors.

```text
pointer position
       |
       v
render-tree root -> hitTest(position)
                         |
                         +-> reject outside bounds
                         |
                         +-> hitTestChildren() -- reverse paint order
                         |
                         +-> hitTestSelf()
                         v
              HitTestResult.path
              [leaf entry, ..., root entry]
                         |
                         v
                    event dispatch
```

Render boxes hit test in two-dimensional Cartesian coordinates, while render
slivers account for a scrolling axis and sliver geometry. Specialized result
types carry the coordinate helpers needed by those protocols. When traversal
crosses a translation, transform, or other coordinate boundary, the hit-test
machinery maps the position into the child's local space and preserves the
corresponding transform for later event delivery.

Hit testing follows visual stacking rules rather than child declaration order.
Containers normally examine children in reverse paint order so the visually
frontmost eligible target gets the first chance to join the path. A target may
still participate with its ancestors; hit testing identifies the path, while
later dispatch and gesture recognition decide how the pointer event is handled.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing) — Focused, bite-sized article covering Hit Testing
- [Learning Path](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing) — Step-by-step material that builds practical Hit Testing knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing) — Structured, in-depth material for learning about Hit Testing thoroughly

## Hit Testing Topics

| Topic | Role | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `HitTestResult` | Collects the ordered entries produced by a hit test | Treat the completed path as the dispatch route for that pointer interaction | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/HitTestResult "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/HitTestResult "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/HitTestResult "Deep Dive") |
| `HitTestEntry` | Associates a hit-test target with coordinate-transform information | Event positions must be interpreted in the target's local coordinate space | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/HitTestEntry "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/HitTestEntry "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/HitTestEntry "Deep Dive") |
| `BoxHitTestResult` | Adds helpers for traversing and transforming box hit tests | Use its transform-aware helpers when entering a child's coordinate system | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/BoxHitTestResult "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/BoxHitTestResult "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/BoxHitTestResult "Deep Dive") |
| `SliverHitTestResult` | Carries the result and coordinate helpers used by sliver hit testing | Preserve main-axis and cross-axis meaning while traversing scrolling geometry | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/SliverHitTestResult "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/SliverHitTestResult "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/SliverHitTestResult "Deep Dive") |
| RenderObject hit testing | Defines how render-tree targets participate in hit testing and event handling | The concrete render protocol determines the geometry and coordinate rules | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/RenderObject-hit-testing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/RenderObject-hit-testing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/RenderObject-hit-testing "Deep Dive") |
| RenderBox hit testing | Tests two-dimensional box geometry, descendants, and the box itself | Reject positions outside the box before traversing its children | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/RenderBox-hit-testing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/RenderBox-hit-testing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/RenderBox-hit-testing "Deep Dive") |
| RenderSliver hit testing | Tests children within sliver layout and scrolling coordinates | Use sliver geometry rather than assuming ordinary box bounds | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/RenderSliver-hit-testing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/RenderSliver-hit-testing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/RenderSliver-hit-testing "Deep Dive") |
| `hitTest()` | Coordinates bounds checks, descendant testing, self testing, and path insertion | Keep the method consistent with the render object's paint and layout geometry | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/hitTest-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/hitTest-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/hitTest-method "Deep Dive") |
| `hitTestSelf()` | Reports whether the current render object is a target at the tested position | Return true only when the object itself should receive pointer events | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/hitTestSelf-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/hitTestSelf-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/hitTestSelf-method "Deep Dive") |
| `hitTestChildren()` | Traverses eligible descendants and reports whether one was hit | Visit overlapping children from front to back according to paint order | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/hitTestChildren-method "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/hitTestChildren-method "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/hitTestChildren-method "Deep Dive") |
| Transform-aware hit testing | Maps positions across coordinate systems and retains the inverse mapping for dispatch | Reuse result helpers instead of manually applying unrelated paint and hit-test transforms | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Transform-aware-hit-testing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Transform-aware-hit-testing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Transform-aware-hit-testing "Deep Dive") |
| Paint order hit testing | Aligns target precedence with the order in which content is visually stacked | Test the last-painted eligible child first | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Paint-order-hit-testing "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Paint-order-hit-testing "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Paint-order-hit-testing "Deep Dive") |
| Hit test path | Represents the leaf-to-root route used to deliver a pointer event | Preserve path order and include every target that should observe dispatch | [💡](https://app.syntblaze.com/qt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Hit-test-path "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Hit-test-path "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Hit-test-path "Deep Dive") |

## Questions

- [What information does a `HitTestResult` retain after traversal finishes?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/What-information-does-a-HitTestResult-retain-after-traversal-finishes%3F)
- [How does a `HitTestEntry` help express an event in local coordinates?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/How-does-a-HitTestEntry-help-express-an-event-in-local-coordinates%3F)
- [When should code use `BoxHitTestResult` rather than the base result type?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/When-should-code-use-BoxHitTestResult-rather-than-the-base-result-type%3F)
- [How do `SliverHitTestResult` coordinates differ from box coordinates?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/How-do-SliverHitTestResult-coordinates-differ-from-box-coordinates%3F)
- [Which responsibilities belong to a render object during hit testing?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Which-responsibilities-belong-to-a-render-object-during-hit-testing%3F)
- [Why does `RenderBox` reject positions outside its size before testing descendants?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Why-does-RenderBox-reject-positions-outside-its-size-before-testing-descendants%3F)
- [How do scroll direction and sliver geometry affect a sliver hit test?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/How-do-scroll-direction-and-sliver-geometry-affect-a-sliver-hit-test%3F)
- [How does `hitTest()` combine child and self participation?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/How-does-hitTest()-combine-child-and-self-participation%3F)
- [When should `hitTestSelf()` return true?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/When-should-hitTestSelf()-return-true%3F)
- [Why can `hitTestChildren()` stop after finding the frontmost hit child?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Why-can-hitTestChildren()-stop-after-finding-the-frontmost-hit-child%3F)
- [How is a global pointer position mapped through nested transforms?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/How-is-a-global-pointer-position-mapped-through-nested-transforms%3F)
- [Why are overlapping children tested in reverse paint order?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Why-are-overlapping-children-tested-in-reverse-paint-order%3F)
- [In what order are targets stored in the hit test path?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/In-what-order-are-targets-stored-in-the-hit-test-path%3F)
- [How is geometric target discovery different from gesture recognition?](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/How-is-geometric-target-discovery-different-from-gesture-recognition%3F)

## Best Practices

- [Keep hit-test geometry consistent with layout and paint geometry](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Keep-hit-test-geometry-consistent-with-layout-and-paint-geometry)
- [Reject out-of-bounds positions before traversing expensive box subtrees](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Reject-out-of-bounds-positions-before-traversing-expensive-box-subtrees)
- [Use the sliver protocol for scrolling children instead of approximating them as boxes](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Use-the-sliver-protocol-for-scrolling-children-instead-of-approximating-them-as-boxes)
- [Use `BoxHitTestResult` helpers when adding offsets or paint transforms](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Use-BoxHitTestResult-helpers-when-adding-offsets-or-paint-transforms)
- [Preserve coordinate transforms so dispatched events expose correct local positions](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Preserve-coordinate-transforms-so-dispatched-events-expose-correct-local-positions)
- [Test overlapping children from visually frontmost to backmost](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Test-overlapping-children-from-visually-frontmost-to-backmost)
- [Make child traversal order agree with the render object's actual paint order](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Make-child-traversal-order-agree-with-the-render-object's-actual-paint-order)
- [Return true from `hitTestSelf()` only for an intentionally interactive target](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Return-true-from-hitTestSelf()-only-for-an-intentionally-interactive-target)
- [Add the current target to the path only when its hit-test contract is satisfied](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Add-the-current-target-to-the-path-only-when-its-hit-test-contract-is-satisfied)
- [Avoid allocations and unrelated state changes in frequently executed hit-test code](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Avoid-allocations-and-unrelated-state-changes-in-frequently-executed-hit-test-code)
- [Keep custom transform logic invertible and handle transforms that cannot be inverted](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Keep-custom-transform-logic-invertible-and-handle-transforms-that-cannot-be-inverted)
- [Treat hit testing as route construction, not as gesture acceptance](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Treat-hit-testing-as-route-construction%2C-not-as-gesture-acceptance)
- [Verify custom hit testing with overlapping, clipped, transformed, and scrolled content](https://app.syntblaze.com/qsp/flutter/Hit-Testing-and-Input-Dispatch/Hit-Testing/Verify-custom-hit-testing-with-overlapping%2C-clipped%2C-transformed%2C-and-scrolled-content)

[< Back to hit testing & input dispatch](../README.md)
