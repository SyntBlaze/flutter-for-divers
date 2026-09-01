## Best Practices

- Use `dart:convert` for representation conversion, not as schema validation
- Pass only JSON-compatible values to `jsonEncode` and keep custom conversion explicit
- Validate decoded container shapes and field types at the system boundary
- Make `fromJson` parsing policy consistent and cover malformed payloads with tests
- Keep `toJson` output deterministic and aligned with the documented wire contract
- Use DTOs to isolate transport naming, compatibility, and optional fields
- Keep entities focused on domain meaning, valid state, and behavior
- Write pure, deterministic mappers and test both normal and lossy conversions
- Use sealed response variants for a finite set of outcomes that callers must handle
- Avoid passing `dynamic` JSON maps beyond the boundary layer
- Preserve unknown-field tolerance when compatible APIs may evolve independently
- Never log complete payloads when they may contain credentials or personal data
- Test round trips only where bidirectional equivalence is actually part of the contract
