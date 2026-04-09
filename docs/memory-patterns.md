# Memory Patterns

How a synthet organizes and maintains its knowledge.

## Architecture

```
MEMORY.md (index — loaded every session)
├── user.md (preferences, profile)
├── platform.md (runtime, tools, volumes)
├── scars.md (failure lessons)
├── repos.md (repo index)
├── repos/
│   ├── org1/repo1.md
│   └── org2/repo2.md
└── ideas/
    └── idea-name.md
```

## Progressive Disclosure

Not everything belongs in MEMORY.md. Use layers:

| Layer | Loaded | Contains |
|-------|--------|----------|
| Core (MEMORY.md) | Every session | Index, key facts, links to detail files |
| Detail (*.md) | On demand | Full knowledge about specific topics |
| Search index | Via semantic search | All files, chunked and embedded |

Rule: if a fact is needed every session, put it in MEMORY.md. Otherwise, put it in the most specific detail file.

## Write Triggers

Save to memory IMMEDIATELY when:
- User states a rule or preference
- User corrects your behavior
- You discover something about the environment
- You learn a new fact about a project
- An approach fails (→ scars.md)

## Scars

Scars are the most valuable memory. They prevent repeating mistakes.

Format:
```markdown
## [DATE] Short title
- **What happened**: description
- **Why it failed**: root cause
- **Lesson**: reusable takeaway
```

Always read scars.md before making decisions.

## Consolidation

Memory degrades over time: facts go stale, files grow, duplicates appear.

Run `/consolidate` periodically to:
- Remove outdated information
- Merge duplicates
- Fix inaccuracies
- Keep files under 100 lines

## Git-Backed

All memory is version-controlled. Benefits:
- Every change is tracked and reversible
- Diff shows what the synthet learned
- Multiple synthets can share knowledge via git
- Human can review and correct memory
