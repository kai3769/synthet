# Getting Started

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed
- A runtime host ([nanokai](https://github.com/hiqsol/nanokai) or [nanoclaw](https://github.com/qwibitai/nanoclaw))
- A communication channel (Telegram bot, Slack, CLI)

## Create Your Synthet

### 1. Fork the template

```bash
# Clone the synthet framework
git clone https://github.com/kai3769/synthet.git

# Copy the template to create your instance
cp -r synthet/template my-synthet
cd my-synthet
git init
```

### 2. Customize identity

Edit `CLAUDE.md`:
- Replace `{{NAME}}` with your synthet's name
- Replace `{{CHANNEL}}` with your communication channel
- Add personality traits, voice, formatting preferences

Edit `user.md`:
- Fill in your profile, timezone, preferences
- List your active projects

### 3. Configure runtime

Mount your instance repo into the runtime container as `/workspace/group/`.

### 4. Start talking

Your synthet starts with empty memory. Over the first sessions:
- It learns your preferences
- Profiles your repositories
- Builds vocabulary and scars
- Develops autonomous work patterns

## What's Included

### Memory files
- `MEMORY.md` — top-level index, loaded every session
- `user.md` — your profile and preferences
- `platform.md` — runtime environment details
- `scars.md` — failure lessons
- `repos.md` — repository index

### Skills (5 core)
- `/remember` — persist session knowledge
- `/consolidate` — clean up memory
- `/learn` — extract patterns from experience
- `/study` — analyze repos
- `/introspect` — multi-perspective self-reflection

### Agents (4 types)
- `studier` — read-only repo analysis
- `critic` — find flaws and waste
- `researcher` — web + code research
- `implementer` — full tool access

### Rules
- `git.md` — commit workflow
- `memory.md` — when and where to save knowledge

### Hooks
- `session-start.sh` — loads memory into context

## Growing Your Synthet

Week 1: Basic learning — preferences, repos, vocabulary
Week 2: Autonomous tasks, scars accumulate, skills refine
Month 1: Deep project knowledge, anticipates needs
Ongoing: Continuous improvement via explore → advance → maintain → reflect
