## Best Practices

- Make route state the single source of truth for the page stack
- Keep parsing and URL generation inverse and deterministic
- Represent unknown, invalid, and unavailable routes explicitly
- Use stable page keys that express route identity
- Notify the router only when navigation-relevant state changes
- Keep router delegates and providers alive across ordinary widget rebuilds
- Assign back-button priority to the visible nested branch
- Choose push versus replace browser-history behavior deliberately
- Test deep links, refreshes, back/forward navigation, and state restoration
- Keep page-list derivation pure; perform navigation side effects elsewhere
