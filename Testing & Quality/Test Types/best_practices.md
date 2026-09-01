## Best Practices

- Use the narrowest test that faithfully covers the risk
- Build most behavioral coverage from fast, deterministic tests
- Test widgets through visible states and user interactions
- Reserve integration tests for collaboration and runtime behavior that narrower tests cannot prove
- Keep test data, time, randomness, and external responses under explicit control
- Treat golden changes as reviewed interface changes, not automatic updates
- Run a small, stable smoke suite against every release candidate
- Write a failing regression test before fixing a reproducible defect
- Express contracts in terms both provider and consumer can verify
- Prefer focused snapshots that reveal why output changed
- Make manual QA steps repeatable with clear setup, action, and expected result
- Give every test independent setup and cleanup so execution order does not matter
- Quarantine or repair flaky tests promptly instead of normalizing retries
- Track suite duration and move redundant scenarios to the cheapest reliable level
- Include accessibility, localization, error states, and relevant device variants in the strategy
