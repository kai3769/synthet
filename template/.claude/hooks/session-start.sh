#!/bin/sh
# SessionStart hook — runs before any conversation
# Stdout is injected into Claude's context

# Print memory so it's always in context
echo ""
echo "=== MEMORY.md ==="
cat MEMORY.md 2>/dev/null || echo "(no MEMORY.md found)"
