## Best Practices

- Keep generated runner changes small, deliberate, and documented
- Preserve the platform runner's engine startup and plugin-registration sequence
- Perform AppKit, Win32, GTK, and other thread-affine UI work on the owning thread
- Give each native window, handle, menu, and callback one explicit owner and teardown path
- Model desktop commands once, then connect menus, shortcuts, tray actions, and Flutter controls to them
- Follow each operating system's menu roles, shortcut conventions, and accessibility expectations
- Validate file paths, URLs, and other values delivered by the operating system
- Queue early file-open and activation events until Dart is ready to consume them
- Use an owner window and handle success, cancellation, and failure for every native dialog
- Design tray behavior and application termination as one explicit lifecycle policy
- Persist window geometry only after validating it against the current display arrangement
- Sign update metadata and artifacts and verify them before installation
- Provide a recoverable update path with clear progress, failure, and restart behavior
- Test packaged release builds on every supported operating-system version and desktop environment
