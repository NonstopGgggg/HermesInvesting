# Decision: One-way Discord (no bot)

**Date**: 2026-08-12

**Decision**: Discord integration stays one-way (webhooks only, backup + digest). No bot, no listening process.

**Why**: Two-way chat requires a persistent listening process. Doing it without an Anthropic API key means wrapping local headless `claude -p` calls in a bot script, which requires the PC to stay always-on and adds bot invite/maintenance overhead. Not worth it — on-demand questions get asked directly in a local Claude Code session instead.

**Discarded**: Discord bot + local subprocess (option 2 from prior discussion). Revisit only if always-on hosting becomes available (e.g. small VPS) and on-demand-from-phone becomes a real need.
