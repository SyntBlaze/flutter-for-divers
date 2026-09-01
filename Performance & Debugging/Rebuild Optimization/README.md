# Rebuild Optimization

Flutter rebuilds widgets to describe what the user interface should look like
for the current state. A rebuild is usually cheap: widgets are immutable
configuration objects, and the framework reconciles them with an existing
element and render-object tree. Performance problems appear when state changes
mark more elements dirty than necessary or when a frequently called `build`
method performs expensive work.

```text
state or dependency changes
            |
            v
      dirty elements
            |
            v
  build new widget configurations
            |
            v
 reconcile elements and render objects
            |
            +--> unchanged geometry and pixels: no layout or paint required
            +--> changed geometry or pixels: layout and/or paint follows
```

Optimize the invalidation boundary before micro-optimizing widget creation.
Use DevTools rebuild statistics and build profiling to find repeated or broad
work, then move the listener or stateful boundary closer to the widgets that
actually depend on the changing value. Keep `build` declarative and cheap, and
use stable child subtrees only where measurement shows that they avoid
meaningful repeated work.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Rebuild-Optimization) — Focused, bite-sized article covering Rebuild Optimization
- [Learning Path](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Rebuild-Optimization) — Step-by-step material that builds practical Rebuild Optimization knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Rebuild-Optimization) — Structured, in-depth material for learning about Rebuild Optimization thoroughly

## Rebuild Optimization Topics

| Topic | Focus | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `const` widgets | Reuse canonical widget configurations whose constructor arguments are compile-time constants | Use `const` where the subtree is truly static; it does not prevent an ancestor from running its own `build` method | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Rebuild-Optimization/const-widgets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Rebuild-Optimization/const-widgets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Rebuild-Optimization/const-widgets "Deep Dive") |
| Small build methods | Split a large UI description into focused widgets with clear dependency boundaries | Extract widgets when doing so creates useful ownership or rebuild isolation, not merely to shorten a method | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Rebuild-Optimization/Small-build-methods "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Rebuild-Optimization/Small-build-methods "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Rebuild-Optimization/Small-build-methods "Deep Dive") |
| Rebuild selectors | Listen to a derived slice of state instead of an entire state object | Select stable, comparable values so unrelated changes do not notify the consumer | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Rebuild-Optimization/Rebuild-selectors "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Rebuild-Optimization/Rebuild-selectors "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Rebuild-Optimization/Rebuild-selectors "Deep Dive") |
| Scoped rebuilds | Place the state listener around only the subtree that changes | Move the reactive boundary downward while keeping all dependent widgets inside it | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Rebuild-Optimization/Scoped-rebuilds "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Rebuild-Optimization/Scoped-rebuilds "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Rebuild-Optimization/Scoped-rebuilds "Deep Dive") |
| Inherited dependency boundaries | Control which descendants establish dependencies on inherited state | Read inherited data at the narrowest practical point and avoid accidental subscriptions in broad ancestors | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Rebuild-Optimization/Inherited-dependency-boundaries "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Rebuild-Optimization/Inherited-dependency-boundaries "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Rebuild-Optimization/Inherited-dependency-boundaries "Deep Dive") |
| `ValueListenableBuilder` | Rebuild a focused subtree when a `ValueListenable` publishes a new value | Hoist value-independent content into `child` and dispose any locally owned notifier | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Rebuild-Optimization/ValueListenableBuilder "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Rebuild-Optimization/ValueListenableBuilder "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Rebuild-Optimization/ValueListenableBuilder "Deep Dive") |
| `AnimatedBuilder` child parameter | Exclude animation-independent content from per-tick rebuilding | Construct the stable subtree once as `child` and compose it inside the builder callback | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Rebuild-Optimization/AnimatedBuilder-child-parameter "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Rebuild-Optimization/AnimatedBuilder-child-parameter "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Rebuild-Optimization/AnimatedBuilder-child-parameter "Deep Dive") |
| `InheritedWidget` dependency scope | Distinguish dependency-registering lookups from one-time inherited reads | Register only consumers that must rebuild when `updateShouldNotify` reports a relevant change | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Rebuild-Optimization/InheritedWidget-dependency-scope "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Rebuild-Optimization/InheritedWidget-dependency-scope "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Rebuild-Optimization/InheritedWidget-dependency-scope "Deep Dive") |
| Keys only when needed | Preserve or relocate element identity only when sibling matching requires it | Choose the narrowest key with stable semantics; unnecessary or unstable keys can discard reusable state | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Rebuild-Optimization/Keys-only-when-needed "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Rebuild-Optimization/Keys-only-when-needed "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Rebuild-Optimization/Keys-only-when-needed "Deep Dive") |
| Avoiding expensive work in `build` | Keep repeated widget construction free of blocking I/O, heavy parsing, and avoidable computation | Precompute, cache, or move work to an appropriate state, service, isolate, or asynchronous boundary | [💡](https://app.syntblaze.com/qt/flutter/Performance-and-Debugging/Rebuild-Optimization/Avoiding-expensive-work-in-build "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Performance-and-Debugging/Rebuild-Optimization/Avoiding-expensive-work-in-build "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Performance-and-Debugging/Rebuild-Optimization/Avoiding-expensive-work-in-build "Deep Dive") |

## Questions

- [What does making a widget `const` reuse, and what work can still occur around it?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/What-does-making-a-widget-const-reuse%2C-and-what-work-can-still-occur-around-it%3F)
- [When does extracting a widget create a useful rebuild boundary?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/When-does-extracting-a-widget-create-a-useful-rebuild-boundary%3F)
- [How should a selector compare derived values without hiding meaningful state changes?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/How-should-a-selector-compare-derived-values-without-hiding-meaningful-state-changes%3F)
- [How far down the tree can a listener move while still enclosing every dependent widget?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/How-far-down-the-tree-can-a-listener-move-while-still-enclosing-every-dependent-widget%3F)
- [Which inherited lookup caused an ancestor to depend on state used only by a descendant?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Which-inherited-lookup-caused-an-ancestor-to-depend-on-state-used-only-by-a-descendant%3F)
- [Which portion of a `ValueListenableBuilder` subtree is independent of its value?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Which-portion-of-a-ValueListenableBuilder-subtree-is-independent-of-its-value%3F)
- [What should be passed through the `AnimatedBuilder.child` parameter instead of rebuilt on every tick?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/What-should-be-passed-through-the-AnimatedBuilder.child-parameter-instead-of-rebuilt-on-every-tick%3F)
- [When should code establish an `InheritedWidget` dependency rather than perform a non-listening read?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/When-should-code-establish-an-InheritedWidget-dependency-rather-than-perform-a-non-listening-read%3F)
- [Does this key preserve required identity, or does it force Flutter to replace otherwise reusable elements?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Does-this-key-preserve-required-identity%2C-or-does-it-force-Flutter-to-replace-otherwise-reusable-elements%3F)
- [Which computations in `build` can be prepared only when their inputs change?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Which-computations-in-build-can-be-prepared-only-when-their-inputs-change%3F)
- [Is the measured cost widget construction, element reconciliation, layout, paint, or rasterization?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Is-the-measured-cost-widget-construction%2C-element-reconciliation%2C-layout%2C-paint%2C-or-rasterization%3F)
- [Does profiling show a missed frame or merely a harmless rebuild?](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Does-profiling-show-a-missed-frame-or-merely-a-harmless-rebuild%3F)

## Best Practices

- [Use `const` constructors for genuinely static widget configurations](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Use-const-constructors-for-genuinely-static-widget-configurations)
- [Extract focused widgets when they clarify ownership or narrow dependency scope](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Extract-focused-widgets-when-they-clarify-ownership-or-narrow-dependency-scope)
- [Select the smallest stable state value that fully determines the consumer's output](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Select-the-smallest-stable-state-value-that-fully-determines-the-consumer's-output)
- [Place reactive builders immediately above the subtree that changes](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Place-reactive-builders-immediately-above-the-subtree-that-changes)
- [Read inherited state close to the descendants that consume it](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Read-inherited-state-close-to-the-descendants-that-consume-it)
- [Pass value-independent subtrees through `ValueListenableBuilder.child`](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Pass-value-independent-subtrees-through-ValueListenableBuilder.child)
- [Pass animation-independent subtrees through `AnimatedBuilder.child`](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Pass-animation-independent-subtrees-through-AnimatedBuilder.child)
- [Keep `InheritedWidget.updateShouldNotify` aligned with the values exposed to dependents](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Keep-InheritedWidget.updateShouldNotify-aligned-with-the-values-exposed-to-dependents)
- [Add keys only when element identity must survive insertion, removal, reordering, or movement](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Add-keys-only-when-element-identity-must-survive-insertion%2C-removal%2C-reordering%2C-or-movement)
- [Never create changing keys during `build` merely to silence a state or rendering problem](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Never-create-changing-keys-during-build-merely-to-silence-a-state-or-rendering-problem)
- [Move parsing, sorting, filtering, allocation-heavy transformations, and I/O out of hot `build` paths](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Move-parsing%2C-sorting%2C-filtering%2C-allocation-heavy-transformations%2C-and-I%2FO-out-of-hot-build-paths)
- [Memoize derived work only when inputs and invalidation rules are explicit](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Memoize-derived-work-only-when-inputs-and-invalidation-rules-are-explicit)
- [Measure rebuild frequency and duration in profile mode before and after an optimization](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Measure-rebuild-frequency-and-duration-in-profile-mode-before-and-after-an-optimization)
- [Treat rebuilding as normal; optimize only rebuilds that are unexpectedly broad, frequent, or expensive](https://app.syntblaze.com/qsp/flutter/Performance-and-Debugging/Rebuild-Optimization/Treat-rebuilding-as-normal%3B-optimize-only-rebuilds-that-are-unexpectedly-broad%2C-frequent%2C-or-expensive)

[< Back to Performance & Debugging](../README.md)
