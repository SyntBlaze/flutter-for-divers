## Best Practices

- Check `mounted` after every relevant asynchronous gap before mutating a `State`
- Check `context.mounted` immediately before using that context after `await`
- Cancel owned subscriptions and detach listeners when their lifecycle ends
- Close or dispose only controllers owned by the current object
- Stop timers, listeners, animations, and subscriptions that could call `setState` after disposal
- State the concurrency policy explicitly instead of relying on completion timing
- Deduplicate only semantically equivalent requests and clear in-flight entries on both success and failure
- Pair cancellation with an identity or generation check before committing results
- Cancel pending debounce work in `dispose` and avoid retaining a dead context
- Document leading and trailing throttle behavior and test boundary timing
- Keep loading, data, empty, and error transitions consistent when an operation is ignored or superseded
