# Assets, Media, and Files

Assets, media, and files move data between an application, its bundle, the
device, and remote services. This category covers selecting user-owned content,
capturing photos and video, rendering images and vector graphics, playing audio
and video, browsing media libraries, and interpreting file paths and media
types.

```text
Bundle, device, picker, camera, or network
                    |
                    v
          permission and acquisition
                    |
                    v
       validate -> identify -> transform
                    |
                    v
        cache, store, display, or play
                    |
                    v
       pause, dispose, or remove safely
```

Treat acquired content as data with a lifecycle, not merely as a path or URL.
The application needs to know who owns it, whether access is temporary, how
large it may be, which formats are supported, and when resources should be
released. Platform permissions, application lifecycle changes, accessibility,
and storage limits all affect a reliable media experience.

## Selection Guidance

Choose first by where the content comes from and what the application must do
with it. Image Picker offers a focused system flow for choosing images and
videos or taking a new capture, while File Picker is suited to general files and
document-provider workflows. Camera provides direct control over capture inside
the application. Photo Manager is a better fit when the application needs to
browse and query the device's media library rather than request one item through
a system picker.

For presentation, Cached Network Image combines network image loading with
caching, and Flutter SVG renders vector assets. Video Player supplies core video
playback; Chewie adds a ready-made control layer around it. Just Audio focuses
on audio playback, while Audio Session coordinates audio behavior with the
operating system and other audio-producing applications. Path helps manipulate
path strings in a platform-aware way, and MIME helps identify or describe a
file's media type. These packages often complement one another, but add only the
layers the feature actually needs and verify support on every target platform.

## Learn More

- [Quick Bite](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files) — Focused, bite-sized article covering Assets, Media, and Files
- [Learning Path](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files) — Step-by-step material that builds practical Assets, Media, and Files knowledge
- [Deep Dive](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files) — Structured, in-depth material for learning about Assets, Media, and Files thoroughly

## Packages

| Package | Approach | Best for | Quick Bite | Learning Path | Deep Dive |
| --- | --- | --- | :---: | :---: | :---: |
| Image Picker | System-mediated image and video selection with optional camera capture | Letting a user choose or capture a small number of photos or videos through familiar platform UI | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/Image-Picker "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/Image-Picker "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/Image-Picker "Deep Dive") |
| File Picker | Native file and directory selection across supported platforms | Import, export, attachment, and document workflows involving general file types | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/File-Picker "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/File-Picker "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/File-Picker "Deep Dive") |
| Cached Network Image | Network image loading with persistent caching and placeholder or error states | Repeatedly displaying remote images while reducing redundant transfers and handling loading UI | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/Cached-Network-Image "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/Cached-Network-Image "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/Cached-Network-Image "Deep Dive") |
| Flutter SVG | Parsing and rendering SVG vector graphics in Flutter | Resolution-independent icons, illustrations, and other vector assets | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/Flutter-SVG "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/Flutter-SVG "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/Flutter-SVG "Deep Dive") |
| Video Player | Platform-backed video controllers and rendering widgets | Building custom video experiences with explicit playback and lifecycle control | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/Video-Player "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/Video-Player "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/Video-Player "Deep Dive") |
| Chewie | Configurable Material and Cupertino controls around Video Player | Adding a conventional video-player interface without building every control from scratch | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/Chewie "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/Chewie "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/Chewie "Deep Dive") |
| Just Audio | Audio playback from files, assets, streams, and playlists | Music, speech, and other audio experiences that need flexible playback control | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/Just-Audio "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/Just-Audio "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/Just-Audio "Deep Dive") |
| Audio Session | Coordination of audio focus, interruptions, routing, and session policy | Audio features that must coexist correctly with calls, alarms, headphones, and other applications | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/Audio-Session "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/Audio-Session "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/Audio-Session "Deep Dive") |
| Camera | In-application camera preview, capture, and device control | Custom photo or video capture flows that need more control than a system picker | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/Camera "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/Camera "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/Camera "Deep Dive") |
| Photo Manager | Queries and access abstractions for the device photo and video library | Gallery browsers, media organizers, and multi-item library selection experiences | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/Photo-Manager "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/Photo-Manager "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/Photo-Manager "Deep Dive") |
| Path | Platform-aware path joining, normalization, parsing, and extension handling | Manipulating path strings without assuming one operating system's separators or conventions | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/Path "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/Path "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/Path "Deep Dive") |
| MIME | Media-type lookup from filenames and byte signatures | Classifying files for validation, upload metadata, routing, or presentation decisions | [💡](https://app.syntblaze.com/qt/flutter/Packages/Assets-Media-and-Files/MIME "Quick Bite") | [👣](https://app.syntblaze.com/lt/flutter/Packages/Assets-Media-and-Files/MIME "Learning Path") | [📖](https://app.syntblaze.com/dt/flutter/Packages/Assets-Media-and-Files/MIME "Deep Dive") |

## Questions

- [What is the difference between a bundled asset, a local file, and a content URI?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/What-is-the-difference-between-a-bundled-asset%2C-a-local-file%2C-and-a-content-URI%3F)
- [When should an application use a system picker instead of requesting broad library access?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/When-should-an-application-use-a-system-picker-instead-of-requesting-broad-library-access%3F)
- [How do temporary picker results differ from files owned by the application?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/How-do-temporary-picker-results-differ-from-files-owned-by-the-application%3F)
- [Which permissions are required for capture, playback, and media-library access?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Which-permissions-are-required-for-capture%2C-playback%2C-and-media-library-access%3F)
- [How should permission denial and restricted access be presented to the user?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/How-should-permission-denial-and-restricted-access-be-presented-to-the-user%3F)
- [When should media be streamed, cached, copied, or kept only in memory?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/When-should-media-be-streamed%2C-cached%2C-copied%2C-or-kept-only-in-memory%3F)
- [How can large images be decoded without exhausting memory?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/How-can-large-images-be-decoded-without-exhausting-memory%3F)
- [What should happen to playback when the application is paused or interrupted?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/What-should-happen-to-playback-when-the-application-is-paused-or-interrupted%3F)
- [How are audio focus, output routing, and headset changes handled?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/How-are-audio-focus%2C-output-routing%2C-and-headset-changes-handled%3F)
- [When is a system video player sufficient, and when are custom controls needed?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/When-is-a-system-video-player-sufficient%2C-and-when-are-custom-controls-needed%3F)
- [How should unsupported, corrupt, or partially downloaded media be handled?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/How-should-unsupported%2C-corrupt%2C-or-partially-downloaded-media-be-handled%3F)
- [Why is a filename extension not enough to establish a file's type or safety?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Why-is-a-filename-extension-not-enough-to-establish-a-file's-type-or-safety%3F)
- [How should file paths be constructed and stored across platforms?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/How-should-file-paths-be-constructed-and-stored-across-platforms%3F)
- [How can image, audio, and video experiences remain accessible?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/How-can-image%2C-audio%2C-and-video-experiences-remain-accessible%3F)
- [How should media workflows be tested without depending on a developer's personal library?](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/How-should-media-workflows-be-tested-without-depending-on-a-developer's-personal-library%3F)

## Best Practices

- [Request access only when the user starts a feature that needs it](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Request-access-only-when-the-user-starts-a-feature-that-needs-it)
- [Prefer system pickers when broad photo or file access is unnecessary](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Prefer-system-pickers-when-broad-photo-or-file-access-is-unnecessary)
- [Explain permission value before requesting it and handle every denial state](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Explain-permission-value-before-requesting-it-and-handle-every-denial-state)
- [Treat picker paths, URLs, extensions, and MIME hints as untrusted input](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Treat-picker-paths%2C-URLs%2C-extensions%2C-and-MIME-hints-as-untrusted-input)
- [Validate file size, content, and supported format before processing or uploading](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Validate-file-size%2C-content%2C-and-supported-format-before-processing-or-uploading)
- [Copy content into application-owned storage when it must outlive temporary access](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Copy-content-into-application-owned-storage-when-it-must-outlive-temporary-access)
- [Construct and inspect paths with platform-aware utilities](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Construct-and-inspect-paths-with-platform-aware-utilities)
- [Decode images near their rendered dimensions and avoid retaining oversized buffers](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Decode-images-near-their-rendered-dimensions-and-avoid-retaining-oversized-buffers)
- [Use bounded caches and provide a policy for expiration and removal](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Use-bounded-caches-and-provide-a-policy-for-expiration-and-removal)
- [Show explicit loading, empty, unavailable, and failure states](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Show-explicit-loading%2C-empty%2C-unavailable%2C-and-failure-states)
- [Pause, resume, and reinitialize capture or playback around lifecycle changes](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Pause%2C-resume%2C-and-reinitialize-capture-or-playback-around-lifecycle-changes)
- [Dispose controllers, streams, subscriptions, and native media resources promptly](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Dispose-controllers%2C-streams%2C-subscriptions%2C-and-native-media-resources-promptly)
- [Handle audio interruptions, focus changes, and route changes deliberately](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Handle-audio-interruptions%2C-focus-changes%2C-and-route-changes-deliberately)
- [Preserve aspect ratio and rotation metadata when presenting or transforming media](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Preserve-aspect-ratio-and-rotation-metadata-when-presenting-or-transforming-media)
- [Provide captions, transcripts, semantic labels, and controls usable without gestures alone](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Provide-captions%2C-transcripts%2C-semantic-labels%2C-and-controls-usable-without-gestures-alone)
- [Move expensive decoding, hashing, and transformation work away from frame-critical UI paths](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Move-expensive-decoding%2C-hashing%2C-and-transformation-work-away-from-frame-critical-UI-paths)
- [Use unique, collision-resistant names and atomic writes for application-owned files](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Use-unique%2C-collision-resistant-names-and-atomic-writes-for-application-owned-files)
- [Test missing permissions, low storage, corrupt input, offline loading, and interrupted playback](https://app.syntblaze.com/qsp/flutter/Packages/Assets-Media-and-Files/Test-missing-permissions%2C-low-storage%2C-corrupt-input%2C-offline-loading%2C-and-interrupted-playback)

[< Back to packages](../README.md)
