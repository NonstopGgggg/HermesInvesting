# Hermes Nous — Agent Coordination

## Agents
- **Hermes**: ops — news check, portfolio digest, Discord posting, daily on-demand ops questions. Two entry points:
  - Scheduled: every 3 days via Windows Task Scheduler + headless `claude -p` (see `digest.ps1`)
  - Interactive: double-click **Hermes** shortcut on Desktop — opens `claude` in this vault, `CLAUDE.md` here sets ops-only scope
- **Claude Code**: dev — builds tools, scripts, deep research on request. Runs in coding project folders, not this vault.

## Vault layout
- `_Shared/Mailbox/To_Hermes/` — Claude drops tasks here for Hermes
- `_Shared/Mailbox/To_Claude/` — Hermes drops tasks here for Claude
- `_Shared/Mailbox/_Archive/` — processed memos moved here
- `04_Decision_Logs/` — one-pager per infra/architecture decision
- `Portfolio/holdings.md` — manual position entry
- `Journal/journal.md` — digest history + trade decisions

## Memo format
Markdown file, filename `YYYY-MM-DD_short-title.md`. Include: task, context, expected output.

## Rule
Check own inbox at start of session. Archive after processing.

## Usage caution
Don't run Hermes (interactive or scheduled) and a Claude Code dev session at the same time — concurrent sessions can exceed plan-included usage, triggering pay-per-token "extra usage" overage instead of stopping. Check claude.ai/settings/usage if unexpected billing message appears.

## Secrets
Discord webhook URLs live only in `backup.ps1` / `digest.ps1` locally. Never commit. See `.gitignore`.
