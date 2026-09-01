# Desktop Integration

Flutter desktop applications run inside native macOS, Windows, or Linux host
processes. Each runner creates an operating-system window, embeds a Flutter
engine, registers plugins, and connects Dart code to desktop conventions such
as application menus, keyboard commands, file opening, dialogs, and tray UI.

```text
launcher / opened file / operating-system event
                       |
                       v
        +--------------+---------------+
        |              |               |
        v              v               v
 macOS Runner    Windows Runner    Linux Runner
   AppKit         Win32 shell       GTK shell
        |              |               |
        +--------------+---------------+
                       v
             native window + Flutter engine
                       |
                       v
             Dart / Flutter application

menus + shortcuts + dialogs + system tray <-> native runner / plugins
file associations + updater configuration -> packaged desktop application
```

The generated runners are intentionally small native application shells, but
they still own resources and lifecycle events outside Flutter's widget tree.
Window state, menu commands, file-open requests, and updater behavior must be
coordinated across the runner, plugins, packaging metadata, and Dart state.
Platform policies also differ: AppKit objects, Win32 handles, and GTK objects
have distinct threading, ownership, and teardown rules.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Platform-Integration/Desktop-Integration) — Focused, bite-sized article covering Desktop Integration
- [Learning Path](https://app.syntblaze.com/lt/flutter/Platform-Integration/Desktop-Integration) — Step-by-step material that builds practical Desktop Integration knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Platform-Integration/Desktop-Integration) — Structured, in-depth material for learning about Desktop Integration thoroughly

## Desktop Hosts and System Features

| Topic | Primary responsibility | Boundary or constraint | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| macOS Runner | Hosts Flutter in an AppKit application and supplies the macOS startup, window, and plugin-registration code | AppKit main-thread affinity, application lifecycle, sandboxing, signing, and bundle configuration apply | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Desktop-Integration/macOS-Runner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Desktop-Integration/macOS-Runner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Desktop-Integration/macOS-Runner "Deep Dive") |
| Windows Runner | Hosts Flutter in a native Windows executable and owns the Win32 window and message loop | `HWND` ownership, message dispatch, COM use, DPI behavior, and native resource lifetimes must remain coordinated | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Desktop-Integration/Windows-Runner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Desktop-Integration/Windows-Runner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Desktop-Integration/Windows-Runner "Deep Dive") |
| Linux Runner | Hosts Flutter in a Linux desktop process, commonly using GTK and GLib | GTK main-loop ownership, distribution dependencies, desktop environment differences, and packaging affect behavior | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Desktop-Integration/Linux-Runner "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Desktop-Integration/Linux-Runner "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Desktop-Integration/Linux-Runner "Deep Dive") |
| Native menus | Exposes application and context commands through operating-system menu surfaces | Command state, focus, roles, localization, and platform menu conventions differ from an in-widget menu | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Desktop-Integration/Native-menus "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Desktop-Integration/Native-menus "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Desktop-Integration/Native-menus "Deep Dive") |
| Window management | Controls creation, size, position, visibility, focus, fullscreen state, and multiple windows | Window-manager authority, display changes, persisted geometry, and per-window engine ownership must be respected | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Desktop-Integration/Window-management "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Desktop-Integration/Window-management "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Desktop-Integration/Window-management "Deep Dive") |
| File associations | Registers document types or URI schemes and delivers open requests to the application | Installer or bundle metadata, operating-system registration, untrusted paths, and cold versus warm delivery must agree | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Desktop-Integration/File-associations "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Desktop-Integration/File-associations "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Desktop-Integration/File-associations "Deep Dive") |
| System tray | Provides a persistent status item, notification-area icon, and related menu | Availability varies by desktop environment, and icon, menu, and callback lifetimes may outlive visible windows | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Desktop-Integration/System-tray "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Desktop-Integration/System-tray "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Desktop-Integration/System-tray "Deep Dive") |
| Keyboard shortcuts | Maps platform key combinations to application commands | Focus, text input, menu accelerators, keyboard layout, repeat behavior, and accessibility can affect dispatch | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Desktop-Integration/Keyboard-shortcuts "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Desktop-Integration/Keyboard-shortcuts "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Desktop-Integration/Keyboard-shortcuts "Deep Dive") |
| Native dialogs | Presents operating-system file choosers, alerts, and other modal desktop surfaces | Dialogs require a valid owner window, native-thread access, asynchronous cancellation, and platform-specific permissions | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Desktop-Integration/Native-dialogs "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Desktop-Integration/Native-dialogs "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Desktop-Integration/Native-dialogs "Deep Dive") |
| Auto update | Discovers, verifies, installs, and activates desktop application updates | Signing, package format, distribution channel, rollback, permissions, and updater lifecycle are platform-specific | [💡](https://app.syntblaze.com/qt/flutter/Platform-Integration/Desktop-Integration/Auto-update "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Platform-Integration/Desktop-Integration/Auto-update "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Platform-Integration/Desktop-Integration/Auto-update "Deep Dive") |

## Questions

- [What responsibilities belong in a macOS runner instead of Dart or a plugin?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/What-responsibilities-belong-in-a-macOS-runner-instead-of-Dart-or-a-plugin%3F)
- [How does the Windows runner integrate Flutter with the Win32 message loop?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/How-does-the-Windows-runner-integrate-Flutter-with-the-Win32-message-loop%3F)
- [How does a Linux GTK runner coordinate the GLib loop with a Flutter engine?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/How-does-a-Linux-GTK-runner-coordinate-the-GLib-loop-with-a-Flutter-engine%3F)
- [When should a command appear in a native application menu rather than only in Flutter UI?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/When-should-a-command-appear-in-a-native-application-menu-rather-than-only-in-Flutter-UI%3F)
- [How should a desktop app restore a window when displays or scale factors have changed?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/How-should-a-desktop-app-restore-a-window-when-displays-or-scale-factors-have-changed%3F)
- [How are file-open requests delivered at cold start and while the application is already running?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/How-are-file-open-requests-delivered-at-cold-start-and-while-the-application-is-already-running%3F)
- [Should closing the last window also terminate an application that owns a system-tray item?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Should-closing-the-last-window-also-terminate-an-application-that-owns-a-system-tray-item%3F)
- [How should native menu accelerators and Flutter shortcuts share command handling?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/How-should-native-menu-accelerators-and-Flutter-shortcuts-share-command-handling%3F)
- [How should cancellation and errors from native file or alert dialogs be represented in Dart?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/How-should-cancellation-and-errors-from-native-file-or-alert-dialogs-be-represented-in-Dart%3F)
- [Which update strategy is compatible with the application's signing and distribution channel?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Which-update-strategy-is-compatible-with-the-application's-signing-and-distribution-channel%3F)
- [When does an application need multiple native windows or multiple Flutter engines?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/When-does-an-application-need-multiple-native-windows-or-multiple-Flutter-engines%3F)
- [Which native resources must be released when a window or engine shuts down?](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Which-native-resources-must-be-released-when-a-window-or-engine-shuts-down%3F)

## Best Practices

- [Keep generated runner changes small, deliberate, and documented](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Keep-generated-runner-changes-small%2C-deliberate%2C-and-documented)
- [Preserve the platform runner's engine startup and plugin-registration sequence](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Preserve-the-platform-runner's-engine-startup-and-plugin-registration-sequence)
- [Perform AppKit, Win32, GTK, and other thread-affine UI work on the owning thread](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Perform-AppKit%2C-Win32%2C-GTK%2C-and-other-thread-affine-UI-work-on-the-owning-thread)
- [Give each native window, handle, menu, and callback one explicit owner and teardown path](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Give-each-native-window%2C-handle%2C-menu%2C-and-callback-one-explicit-owner-and-teardown-path)
- [Model desktop commands once, then connect menus, shortcuts, tray actions, and Flutter controls to them](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Model-desktop-commands-once%2C-then-connect-menus%2C-shortcuts%2C-tray-actions%2C-and-Flutter-controls-to-them)
- [Follow each operating system's menu roles, shortcut conventions, and accessibility expectations](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Follow-each-operating-system's-menu-roles%2C-shortcut-conventions%2C-and-accessibility-expectations)
- [Validate file paths, URLs, and other values delivered by the operating system](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Validate-file-paths%2C-URLs%2C-and-other-values-delivered-by-the-operating-system)
- [Queue early file-open and activation events until Dart is ready to consume them](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Queue-early-file-open-and-activation-events-until-Dart-is-ready-to-consume-them)
- [Use an owner window and handle success, cancellation, and failure for every native dialog](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Use-an-owner-window-and-handle-success%2C-cancellation%2C-and-failure-for-every-native-dialog)
- [Design tray behavior and application termination as one explicit lifecycle policy](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Design-tray-behavior-and-application-termination-as-one-explicit-lifecycle-policy)
- [Persist window geometry only after validating it against the current display arrangement](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Persist-window-geometry-only-after-validating-it-against-the-current-display-arrangement)
- [Sign update metadata and artifacts and verify them before installation](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Sign-update-metadata-and-artifacts-and-verify-them-before-installation)
- [Provide a recoverable update path with clear progress, failure, and restart behavior](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Provide-a-recoverable-update-path-with-clear-progress%2C-failure%2C-and-restart-behavior)
- [Test packaged release builds on every supported operating-system version and desktop environment](https://app.syntblaze.com/qsp/flutter/Platform-Integration/Desktop-Integration/Test-packaged-release-builds-on-every-supported-operating-system-version-and-desktop-environment)

[< Back to platform integration](../README.md)
