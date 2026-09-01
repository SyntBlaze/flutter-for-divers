## Best Practices

- Request access only when the user starts a feature that needs it
- Prefer system pickers when broad photo or file access is unnecessary
- Explain permission value before requesting it and handle every denial state
- Treat picker paths, URLs, extensions, and MIME hints as untrusted input
- Validate file size, content, and supported format before processing or uploading
- Copy content into application-owned storage when it must outlive temporary access
- Construct and inspect paths with platform-aware utilities
- Decode images near their rendered dimensions and avoid retaining oversized buffers
- Use bounded caches and provide a policy for expiration and removal
- Show explicit loading, empty, unavailable, and failure states
- Pause, resume, and reinitialize capture or playback around lifecycle changes
- Dispose controllers, streams, subscriptions, and native media resources promptly
- Handle audio interruptions, focus changes, and route changes deliberately
- Preserve aspect ratio and rotation metadata when presenting or transforming media
- Provide captions, transcripts, semantic labels, and controls usable without gestures alone
- Move expensive decoding, hashing, and transformation work away from frame-critical UI paths
- Use unique, collision-resistant names and atomic writes for application-owned files
- Test missing permissions, low storage, corrupt input, offline loading, and interrupted playback
