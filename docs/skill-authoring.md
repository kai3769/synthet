# Skill Authoring Guide

Skills are markdown files that define repeatable procedures. They live in `.claude/skills/<name>/SKILL.md`.

## Anatomy of a Skill

```markdown
---
name: my-skill
description: One-line description. Determines when the skill is triggered.
---

# Skill Title

What this skill does and when to use it.

## Process

1. Step one
2. Step two
3. Step three
```

### Frontmatter (required)

- `name` — skill identifier, used as `/name` command
- `description` — trigger logic. The SDK matches user intent against this text

### Body

The body is injected into the agent's context when the skill is invoked. Write it as instructions the agent should follow.

## Design Principles

### 1. Single responsibility
Each skill does one thing well. Don't combine "analyze and fix" — make two skills.

### 2. Clear process
Number the steps. The agent follows them in order.

### 3. Output expectations
Specify what the skill should produce: a file, a message, a commit, or just findings.

### 4. Fail gracefully
Include what to do when blocked: "If X fails, return findings instead of guessing."

### 5. Keep it short
Under 50 lines. The agent has limited context — dense instructions work better.

## Categories

| Category | Purpose | Examples |
|----------|---------|----------|
| Explore | Build knowledge | study, scout |
| Advance | Create value | advance, invent, plan |
| Maintain | Stay healthy | consolidate, remember, learn |
| Reflect | Self-awareness | introspect, scrutinize, benchmark |

## Tips

- Use the agent's existing tools — don't reinvent
- Reference memory files by path when relevant
- Skills can invoke other skills (e.g., "run /consolidate after")
- Test by invoking manually, then automate via cron
