## Best Practices

- Read the incoming constraints before reasoning about any widget's eventual size
- Return only geometry that satisfies the active layout protocol
- Let the parent own child offsets and placement policy
- Evaluate width and height constraints independently
- Use constraint helpers instead of duplicating normalization and enforcement logic
- Interpret sliver extents in terms of scroll, paint, cache, and cross axes
- Keep size and position as separate concepts
- Document or preserve the coordinate space when transforming offsets
- Use only the `ParentData` subtype required by the parent render object
- Use tight constraints when an exact dimension is a deliberate part of the parent policy
- Use loose constraints when a child may choose less than the available maximum
- Check boundedness before dividing, expanding, or deriving a size from the available extent
- Give children a finite extent when their layout algorithm cannot operate with an unbounded maximum
- Diagnose layout failures by tracing constraints down, geometry up, and offsets back to the parent
