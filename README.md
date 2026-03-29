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

## Getting Started

> ⚠️ Synthet is in early development. Currently, the reference implementation is [Kai](https://github.com/hiqsol/kai_memory) — a personal synthet running on [nanokai](https://github.com/hiqsol/nanokai).

### Prerequisites

- Docker
- [nanokai](https://github.com/hiqsol/nanokai) or [nanoclaw](https://github.com/qwibitai/nanoclaw) host
- Claude Max subscription (or API key)
- Telegram bot (for communication)

### Quick Start

1. Fork this template repository
2. Customize `CLAUDE.md` with your synthet's personality
3. Add memory files for your context
4. Deploy via nanokai with your Telegram bot
5. Let it grow

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
