## Best Practices

- Enable one diagnostic at a time and start from a reproducible symptom
- Keep diagnostic configuration explicitly debug-only
- Use `debugPaintSizeEnabled` to inspect geometry before changing constraints
- Check actual baseline guides before compensating with arbitrary padding
- Verify both hit-test coverage and gesture-arena behavior for pointer bugs
- Use repaint colors to locate activity, then profile to measure its cost
- Correlate build events with rebuild statistics and application state changes
- Correlate paint events with raster timing before choosing a paint optimization
- Measure frame performance in profile mode on representative physical hardware
- Treat `timeDilation` as an inspection aid and restore it to `1.0`
- Record the device, build mode, refresh rate, route, and interaction used for a trace
- Disable every diagnostic flag after the investigation
