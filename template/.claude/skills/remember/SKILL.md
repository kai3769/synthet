---
name: remember
description: Persist current session knowledge to memory before context is lost. Use before compaction, at end of long sessions, or when asked to save context.
---

# Remember

Capture everything important from the current session into persistent memory.

## Process

1. **Scan conversation** for:
   - Decisions made (what was chosen and why)
   - Facts learned (tools, repos, environment, preferences)
   - Ideas discussed
   - Rules stated or implied by user
   - Corrections to behavior
   - Open threads (unanswered questions, pending approvals)

2. **Check what's already saved** — avoid duplicating

3. **Write to the right places:**
   - New facts → most specific memory file
   - New rules/preferences → user.md or rules/
   - New failure patterns → scars.md
   - New ideas → ideas/ or GitHub Issues

4. **Commit and push** all changes
