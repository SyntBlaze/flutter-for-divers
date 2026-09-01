## Best Practices

- Trace constraints down, geometry up, and parent-owned offsets when diagnosing layout
- Return box sizes and sliver geometry that satisfy every active constraint
- Keep width and height reasoning independent when handling `BoxConstraints`
- Interpret sliver extents in the correct axis and growth directions
- Use the precise `ParentData` subtype required by the parent render object
- Call `markNeedsLayout()` only for changes that can affect geometry
- Pass `parentUsesSize: true` only when the parent's layout actually depends on the child's size
- Keep child positioning under the ownership of the parent render object
- Reserve `sizedByParent` and `performResize()` for sizes determined entirely by incoming constraints
- Avoid assuming that a repaint boundary also isolates layout invalidation
- Prefer a direct constraint-based layout over intrinsic passes when both satisfy the design
- Keep dry-layout calculations pure and consistent with real layout
- Handle unavailable baselines explicitly instead of assuming every child provides one
- Avoid reading stale geometry before the pipeline has completed layout
- Profile on representative content before optimizing relayout boundaries or measurement logic
