## Best Practices

- Design the permission-free fallback before adding a permission request
- Request only the capability, precision, data scope, and duration required by the current feature
- Prefer system pickers and user-selected data over broad photo or contact access
- Ask in response to a clear user action, close to the operation that needs access
- Explain a concrete benefit before the system prompt without implying that consent is required for unrelated features
- Keep optional features usable after denial, cancellation, restriction, or limited access
- Treat camera and microphone capture as visible, user-controlled sessions and release their resources promptly
- Use foreground, approximate location unless a documented feature truly requires greater scope
- Request background location separately and only for an essential, user-understood behavior
- Defer notification permission until the user understands which useful alerts they can receive
- Keep Bluetooth authorization distinct from adapter, service, pairing, and device-connection failures
- Model granted, limited, denied, restricted, unavailable, and no-further-prompt outcomes explicitly
- Do not loop permission prompts or repeatedly pressure a person after denial
- Offer settings only after an explicit action, with a feature-specific explanation and a cancel path
- Recheck permission and service state after application resume and before each sensitive operation
- Stop streams, capture, scanning, and observation when the owning feature ends or access is revoked
- Keep native declarations and usage descriptions aligned with actual behavior on every supported platform
- Test first request, denial, limited access, revocation, settings return, OS upgrades, and unsupported hardware on real devices
