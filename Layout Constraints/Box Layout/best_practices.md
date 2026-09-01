## Best Practices

- Treat incoming constraints as the complete range of legal sizes
- Always choose a finite size that satisfies the active `BoxConstraints`
- Keep child measurement and positioning inside `performLayout()`
- Use `performResize()` only when size depends solely on parent constraints
- Keep dry layout pure and consistent with the committed layout algorithm
- Avoid intrinsic measurement when a single constraint-based layout pass is sufficient
- Measure the cost of intrinsic sizing in deep or repeated child structures
- Expose a baseline only when it has stable meaning for the rendered content
- Apply the inverse paint transform when hit testing transformed children
- Keep hit regions large enough for interaction without creating surprising overlap
- Report all intentional visual overflow in paint bounds
- Keep semantic geometry aligned with the control or content users perceive
- Invalidate only the rendering phase affected by a property change
- Test custom render boxes under tight, loose, bounded, and unbounded constraints
