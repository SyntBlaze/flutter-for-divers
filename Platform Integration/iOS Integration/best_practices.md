## Best Practices

- Keep `AppDelegate` focused on process-level startup and callback coordination
- Put per-window state and scene lifecycle work in `SceneDelegate` when scenes are enabled
- Treat `Info.plist` values as reviewed, typed application configuration
- Keep the iOS deployment target consistent across Flutter, Xcode, CocoaPods, and dependencies
- Prefer small native adapters with explicit data and error contracts
- Annotate nullability and interoperability boundaries in mixed Swift and Objective-C code
- Perform UIKit presentation and view-controller containment on the main thread
- Forward lifecycle callbacks to Flutter and plugins before adding app-specific branching
- Validate and normalize incoming URLs before using their parameters
- Test Universal Links from a signed, installed build against the production association file
- Grant only the entitlements required by the target's actual capabilities
- Write specific, user-facing privacy descriptions that match the feature requesting access
- Test cold start, warm resume, backgrounding, scene reconnection, and terminated-state routing
- Verify release signing and archived application configuration, not only debug behavior
