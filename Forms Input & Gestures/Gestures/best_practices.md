## Best Practices

- Prefer semantic gesture callbacks over raw pointer handling for taps, presses, and drags
- Give every interactive target adequate size, semantics, focus behavior, and visible feedback
- Keep pointer callbacks lightweight and release pointer-specific state on cancel
- Use hover as an enhancement, never as the only way to reveal or activate essential behavior
- Choose `AbsorbPointer` and `IgnorePointer` from the desired hit-test result, not just their visual similarity
- Delay irreversible work until a tap is confirmed
- Make double-tap actions discoverable and provide a non-timing-dependent alternative
- Expose progress or cancellation feedback for long-press interactions
- Choose axis-specific drag recognition when the interaction has a single intended direction
- Preserve a transform's gesture-start values when applying scale and rotation updates
- Let recognizers resolve ambiguity through the arena instead of duplicating behavior in raw pointer callbacks
- Test nested detectors, overlapping targets, scrollables, and cancelled pointer sequences
- Verify gestures with touch, mouse, trackpad, stylus, keyboard alternatives, and accessibility services
