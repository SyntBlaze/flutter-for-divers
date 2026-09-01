## Best Practices

- Define frame deadlines from the refresh rates the product supports
- Report frame-time distributions and missed-frame counts, not only averages
- Leave scheduling headroom beneath the nominal 60 Hz interval
- Verify 120 Hz behavior on representative high-refresh-rate hardware
- Measure widget build duration and rebuild frequency for named interactions
- Exercise layout targets with production-like tree depth, text, and collection sizes
- Separate paint recording regressions from rasterization regressions
- Correlate raster spikes with the exact visual state and timeline events that produced them
- Measure GPU work at realistic resolution and under controlled thermal conditions
- Define and track cold, warm, and resumed startup scenarios independently
- Track steady state, peak use, and post-interaction retention during long-running memory tests
- Compare reproducible release artifacts with the same target, architecture, symbols, and store assumptions
- Profile on representative physical devices in profile or release mode
- Record build revision, device, operating system, refresh rate, scenario, content, and measurement method with every result
- Use percentile-based budgets and repeat enough runs to expose variance
- Establish per-device-class baselines and fail continuous checks on meaningful regressions
- Review target changes as product tradeoffs with explicit user impact
