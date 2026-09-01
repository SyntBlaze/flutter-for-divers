# Native Interop

Native interop lets Dart and Flutter code call libraries implemented outside
the Dart runtime. Foreign function interfaces bind C-compatible application
binary interfaces directly, while generated Java, Objective-C, and Swift
bindings adapt richer platform APIs. Native assets and build hooks connect
those bindings to the correct compiled artifacts for each target.

```text
Dart / Flutter code
        |
        +-> generated bindings (`ffigen`, `jnigen`)
        |             |
        |             +-> C ABI / Java / Objective-C / Swift APIs
        |
        +-> `dart:ffi` -> symbols -> native library
                              |          |
                              |          +-> static or dynamic linking
                              v
                    pointers, callbacks, native memory
                              ^
                              |
                native assets + build hooks
```

Interop crosses language, memory, and build-system boundaries. Dart's garbage
collector does not automatically own native allocations, native callbacks can
arrive on threads with runtime restrictions, and symbol availability depends
on the target architecture and linking model. Keep the boundary narrow,
generate bindings when possible, and make ownership and lifetime rules
explicit on both sides.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Platform-Integration/Native-Interop) — Focused, bite-sized article covering Native Interop
- [Learning Path](https://app.syntblaze.com/lt/flutter/Platform-Integration/Native-Interop) — Step-by-step material that builds practical Native Interop knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Platform-Integration/Native-Interop) — Structured, in-depth material for learning about Native Interop thoroughly

## Interop Components

| Topic | Primary role | Key consideration | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| `dart:ffi` | Calls C-compatible native functions and works with native data from Dart | Signatures, calling conventions, layouts, and symbol names must match the native ABI exactly | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Native-Interop/dart-ffi "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Native-Interop/dart-ffi "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Native-Interop/dart-ffi "Deep Dive") |
| FFI packages | Package bindings, loading logic, and native artifacts for reuse | Published packages must account for supported platforms, architectures, and artifact delivery | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Native-Interop/FFI-packages "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Native-Interop/FFI-packages "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Native-Interop/FFI-packages "Deep Dive") |
| `ffigen` | Generates Dart FFI bindings from C header files | Header selection, compiler options, type mappings, and generated output must be reproducible | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Native-Interop/ffigen "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Native-Interop/ffigen "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Native-Interop/ffigen "Deep Dive") |
| `jnigen` | Generates Dart bindings for Java APIs | Java classpaths, API visibility, conversions, and runtime attachment shape the generated surface | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Native-Interop/jnigen "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Native-Interop/jnigen "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Native-Interop/jnigen "Deep Dive") |
| Objective-C and Swift interop | Exposes Apple-platform frameworks and libraries to Dart | Objective-C runtime visibility and Swift interoperability constraints determine which APIs can be bound | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Native-Interop/Objective-C-and-Swift-interop "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Native-Interop/Objective-C-and-Swift-interop "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Native-Interop/Objective-C-and-Swift-interop "Deep Dive") |
| Native assets | Declare and bundle native code artifacts with Dart or Flutter packages | Assets must be built for every supported target and resolved consistently at runtime | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Native-Interop/Native-assets "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Native-Interop/Native-assets "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Native-Interop/Native-assets "Deep Dive") |
| Build hooks | Run package-defined native build steps during an application build | Hooks should be deterministic, target-aware, and explicit about inputs and outputs | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Native-Interop/Build-hooks "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Native-Interop/Build-hooks "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Native-Interop/Build-hooks "Deep Dive") |
| Static and dynamic linking | Determines when native symbols are combined with or loaded by an application | Distribution, startup, symbol visibility, updates, and platform policy differ by linking model | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Native-Interop/Static-and-dynamic-linking "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Native-Interop/Static-and-dynamic-linking "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Native-Interop/Static-and-dynamic-linking "Deep Dive") |
| Native memory | Manages allocations whose lifetime is outside Dart's managed heap | Every allocation needs clear ownership, bounds, initialization, and deallocation rules | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Native-Interop/Native-memory "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Native-Interop/Native-memory "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Native-Interop/Native-memory "Deep Dive") |
| Pointers and callbacks | Passes addresses and callable functions across the native boundary | Pointer validity, callback lifetime, thread entry, and reentrancy must be controlled carefully | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Native-Interop/Pointers-and-callbacks "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Native-Interop/Pointers-and-callbacks "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Native-Interop/Pointers-and-callbacks "Deep Dive") |

## Questions

- [When is `dart:ffi` a better fit than a platform channel?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/When-is-dart%3Affi-a-better-fit-than-a-platform-channel%3F)
- [How should an FFI package ship native code for several targets?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/How-should-an-FFI-package-ship-native-code-for-several-targets%3F)
- [How does `ffigen` translate C declarations into Dart bindings?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/How-does-ffigen-translate-C-declarations-into-Dart-bindings%3F)
- [How does `jnigen` expose Java classes and methods to Dart?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/How-does-jnigen-expose-Java-classes-and-methods-to-Dart%3F)
- [Which Objective-C and Swift APIs can be reached from Dart?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Which-Objective-C-and-Swift-APIs-can-be-reached-from-Dart%3F)
- [How are native assets selected for a target platform and architecture?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/How-are-native-assets-selected-for-a-target-platform-and-architecture%3F)
- [What work belongs in a native build hook?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/What-work-belongs-in-a-native-build-hook%3F)
- [When should a native library be linked statically or loaded dynamically?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/When-should-a-native-library-be-linked-statically-or-loaded-dynamically%3F)
- [Who owns native memory passed into or returned from Dart?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Who-owns-native-memory-passed-into-or-returned-from-Dart%3F)
- [How long must a native pointer remain valid?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/How-long-must-a-native-pointer-remain-valid%3F)
- [What restrictions apply when native code calls back into Dart?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/What-restrictions-apply-when-native-code-calls-back-into-Dart%3F)
- [How should ABI compatibility be tested across release targets?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/How-should-ABI-compatibility-be-tested-across-release-targets%3F)

## Best Practices

- [Keep the native boundary small and expose domain-focused wrappers](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Keep-the-native-boundary-small-and-expose-domain-focused-wrappers)
- [Publish an explicit platform and architecture support matrix](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Publish-an-explicit-platform-and-architecture-support-matrix)
- [Generate bindings from pinned headers and checked-in configuration](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Generate-bindings-from-pinned-headers-and-checked-in-configuration)
- [Regenerate and review bindings whenever upstream native APIs change](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Regenerate-and-review-bindings-whenever-upstream-native-APIs-change)
- [Prefer stable interop surfaces over language-specific implementation details](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Prefer-stable-interop-surfaces-over-language-specific-implementation-details)
- [Build and verify native assets for every supported target](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Build-and-verify-native-assets-for-every-supported-target)
- [Make build hooks deterministic, cacheable, and free of hidden environment assumptions](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Make-build-hooks-deterministic%2C-cacheable%2C-and-free-of-hidden-environment-assumptions)
- [Choose a linking strategy that matches platform distribution rules](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Choose-a-linking-strategy-that-matches-platform-distribution-rules)
- [Pair every native allocation with one documented owner and release path](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Pair-every-native-allocation-with-one-documented-owner-and-release-path)
- [Validate pointer bounds, alignment, nullability, and lifetime before dereferencing](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Validate-pointer-bounds%2C-alignment%2C-nullability%2C-and-lifetime-before-dereferencing)
- [Keep callback objects alive for as long as native code can invoke them](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Keep-callback-objects-alive-for-as-long-as-native-code-can-invoke-them)
- [Exercise bindings on real release architectures, not only a development host](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Native-Interop/Exercise-bindings-on-real-release-architectures%2C-not-only-a-development-host)

[< Back to platform integration](../README.md)
