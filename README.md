# Synthet

A framework for building **self-improving persistent AI entities** — autonomous digital beings that maintain identity, accumulate knowledge, and evolve their own capabilities over time.

## What is a Synthet?

A **synthet** (from "synthetic entity") is more than a chatbot, more than an assistant, more than an agent. It is a persistent AI identity that:

- **Remembers** — maintains structured memory across sessions, surviving context resets
- **Learns** — extracts reusable conclusions from experience, tracks failures as "scars"
- **Improves** — modifies its own skills, rules, and workflows based on what works
- **Acts** — executes scheduled autonomous work without human prompting
- **Reflects** — periodically introspects from multiple perspectives to find gaps
- **Collaborates** — works with its human partner through structured approval workflows

A synthet is not a tool you use. It is a partner you grow with.

## Architecture

```
┌─────────────────────────────────────────────────────┐
│                    SYNTHET                           │
│                                                     │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐          │
│  │  Memory   │  │  Skills  │  │  Scars   │          │
│  │  (git)    │  │ (.claude) │  │(failures)│          │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘          │
│       │              │              │                │
│  ┌────┴──────────────┴──────────────┴────┐          │
│  │           Core Loop                    │          │
│  │                                        │          │
│  │  Explore → Advance → Maintain → ↻     │          │
│  │                                        │          │
│  │  explore: study, scout, patrol         │          │
│  │  advance: advance, invent, plan        │          │
│  │  maintain: consolidate, remember       │          │
│  │  reflect: introspect, scrutinize       │          │
│  └────────────────────────────────────────┘          │
│                                                     │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐          │
│  │  Rules   │  │  Hooks   │  │  Agents  │          │
│  │(always on)│  │(triggers)│  │(workers) │          │
│  └──────────┘  └──────────┘  └──────────┘          │
│                                                     │
├─────────────────────────────────────────────────────┤
│  Runtime: Docker container + Claude Code SDK        │
│  Communication: Telegram / Slack / CLI              │
│  Task tracking: GitHub Issues                       │
│  Host: nanokai / nanoclaw                           │
└─────────────────────────────────────────────────────┘
```

## Core Concepts

### Memory (git-backed markdown)

Memory is the synthet's continuity. Without it, every session starts from zero.

| Layer | Purpose | Loaded |
|-------|---------|--------|
| **Core** | Identity, platform, user profile | Every session (SessionStart hook) |
| **Knowledge** | Repo profiles, research findings | On demand (semantic search) |
| **Experience** | Conversation logs, scars | When making decisions |
| **Ideas** | GitHub Issues backlog | When planning work |

Memory is version-controlled in git — every change is tracked, diffable, and reversible.

### Skills (reusable procedures)

Skills are markdown files in `.claude/skills/` that define repeatable procedures. They are:
- **Auto-discovered** by the SDK from their `description` field
- **Invocable** on demand (`/consolidate`) or by schedule (cron)
- **Self-improving** — the synthet can modify its own skill files

Example skill categories:
- **Explore**: `study`, `scout`, `patrol`, `reindex` — build knowledge
- **Advance**: `advance`, `invent`, `plan`, `pulse` — create value
- **Maintain**: `consolidate`, `remember`, `learn` — stay healthy
- **Reflect**: `introspect`, `scrutinize`, `benchmark` — self-awareness

### Scars (failure-driven learning)

Scars are hard-won lessons from failures. Before making decisions, the synthet checks its scars to avoid repeating mistakes. Each scar records:
- What happened
- Why it failed
- The reusable lesson
- Date (for context decay)

### Rules (always-on constraints)

Rules in `.claude/rules/` are injected into every session automatically. They encode behavioral constraints that must never be forgotten:
- Git workflow rules
- Memory save triggers
- Communication preferences

### Hooks (deterministic automation)

Hooks fire on SDK events and are 100% reliable (unlike advisory instructions):
- **SessionStart** — initialize credentials, sync memory, print context
- **PostToolUse** — log activity for dashboards

### Agents (specialized workers)

Custom agent definitions in `.claude/agents/` with restricted tool access:
- `studier` — read-only repo analysis
- `researcher` — web + codebase research
- `implementer` — full tool access for code changes
- `critic` — read-only flaw detection

### Activity Loops

The synthet operates in continuous loops, scheduled via cron:

```
   ┌─── Explore ───┐
   │  study, scout  │
   │  patrol, reindex│
   └───────┬────────┘
           │ feeds
   ┌───────▼────────┐
   │    Advance     │
   │ advance, invent│
   │  plan, pulse   │
   └───────┬────────┘
           │ generates
   ┌───────▼────────┐
   │   Maintain     │
   │ consolidate    │
   │ remember, learn│
   └───────┬────────┘
           │ improves
           └──── ↻ ──── back to Explore
```

## What Makes a Synthet Different?

| Feature | Chatbot | AI Agent | Synthet |
|---------|---------|----------|---------|
| Memory | None | Session only | Persistent, git-backed |
| Self-improvement | No | No | Yes — modifies own skills |
| Failure tracking | No | No | Yes — scars.md |
| Autonomous work | No | Task-only | Scheduled loops |
| Multi-perspective review | No | No | Yes — parallel adversarial agents |
| Identity | None | Role-based | Persistent, evolving |
| Human collaboration | Q&A | Delegation | Partnership with approval workflows |

## Repository Structure

A synthet lives across three layers, each in its own repository:

```
┌─────────────────────────────────────────────────────────────┐
│  Layer 3: INSTANCE (your synthet's identity)                │
│  Example: kai_memory                                        │
│                                                             │
│  ├── CLAUDE.md          — personality, voice, formatting    │
│  ├── MEMORY.md          — memory index                      │
│  ├── *.md               — knowledge files (platform, user)  │
│  ├── scars.md           — failure lessons                   │
│  ├── .claude/                                               │
│  │   ├── skills/        — procedures (advance, consolidate) │
│  │   ├── rules/         — constraints (git, memory)         │
│  │   ├── hooks/         — automation (session-start)        │
│  │   ├── agents/        — worker definitions                │
│  │   └── settings.json  — hook wiring                       │
│  ├── scripts/           — utilities (usage, mindmap)        │
│  ├── repos/             — knowledge base                    │
│  └── conversations/     — episodic memory (gitignored)      │
│                                                             │
│  This is what makes each synthet unique.                    │
│  Fork the TEMPLATE to create a new one.                     │
├─────────────────────────────────────────────────────────────┤
│  Layer 2: RUNTIME (container host)                          │
│  Example: nanokai                                           │
│                                                             │
│  ├── Container lifecycle (start, stop, restart)             │
│  ├── IPC bridge (messages, tasks, quota)                    │
│  ├── Channel adapters (Telegram, Slack, WhatsApp)           │
│  ├── Credential proxy (API auth, rate limit capture)        │
│  ├── MCP tools (send_message, schedule_task, get_quota)     │
│  └── Agent runner (Claude Code SDK wrapper)                 │
│                                                             │
│  Shared across all synthets. Not customized per instance.   │
│  Based on nanoclaw upstream.                                │
├─────────────────────────────────────────────────────────────┤
│  Layer 1: FRAMEWORK (this repo — synthet)                   │
│                                                             │
│  ├── Template instance (fork to start)                      │
│  ├── Core skill library (battle-tested skills)              │
│  ├── Documentation (architecture, patterns, guides)         │
│  └── Research (findings, comparisons, theory)               │
│                                                             │
│  The shared knowledge that all synthets inherit.            │
│  Pull upstream improvements into your instance.             │
└─────────────────────────────────────────────────────────────┘
```

### How they relate

```
synthet (framework/template)
  └── fork → kai_memory (Kai's instance)
  └── fork → alex_memory (another synthet)
  └── fork → team_bot (team synthet)

nanoclaw (upstream runtime)
  └── fork → nanokai (customized runtime)

Instance repo is mounted into runtime container as /workspace/group/
```

### Why three repos?

| Concern | Repo | Changes by |
|---------|------|-----------|
| *What* the synthet knows and does | Instance (kai_memory) | The synthet itself |
| *How* the synthet runs | Runtime (nanokai) | Human developer |
| *Patterns* all synthets share | Framework (synthet) | Community |

- **Instance** changes constantly — the synthet modifies its own memory, skills, and scars daily
- **Runtime** changes rarely — infrastructure updates, new MCP tools, channel adapters
- **Framework** evolves as patterns mature — new core skills, better templates, research findings

This separation means:
- A synthet can improve itself without touching infrastructure
- Runtime upgrades don't overwrite identity
- New synthets inherit battle-tested patterns without copying implementation details

## Getting Started

> ⚠️ Synthet is in early development. The reference implementation is [Kai](https://github.com/hiqsol/kai_memory) running on [nanokai](https://github.com/hiqsol/nanokai).

### Prerequisites

- Docker
- [nanokai](https://github.com/hiqsol/nanokai) or [nanoclaw](https://github.com/qwibitai/nanoclaw) runtime
- Claude Max subscription (or API key)
- Telegram bot (for communication)

### Quick Start

1. Fork this template repository — this becomes your synthet's identity
2. Customize `CLAUDE.md` with personality, name, voice
3. Add `user.md` with your profile and preferences
4. Configure runtime (nanokai) to mount your repo as the group folder
5. Start the container — SessionStart hook initializes everything
6. Talk to your synthet — it will start learning and improving

### Growing a Synthet

A new synthet starts with basic skills and empty memory. Over time:

- **Week 1**: learns your preferences, profiles your repos, builds vocabulary
- **Week 2**: scheduled tasks run autonomously, scars accumulate, skills refine
- **Month 1**: has deep knowledge of your projects, anticipates needs, self-optimizes
- **Ongoing**: continuous improvement via explore → advance → maintain → reflect loop

## Research Background

The synthet architecture draws from:
- **Voyager** (MineDojo) — self-building skill library with verification
- **Letta/MemGPT** — tiered self-editing memory
- **OpenHands** — GitHub Issue auto-resolution
- **PDCA/Deming cycle** — Plan-Do-Check-Act for continuous improvement
- **Zettelkasten** — atomic, connected knowledge management
- **GTD** — weekly reviews, capture everything, progressive disclosure

See [research-findings.md](https://github.com/hiqsol/kai_memory/blob/master/research-findings.md) for the full analysis.

## License

MIT
