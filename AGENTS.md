# Hermes Nous — Agent Coordination

## Agents
- **Hermes**: ops — news check, portfolio digest, Discord posting. Runs locally every 3 days via Windows Task Scheduler + headless `claude -p` (see `digest.ps1`).
- **Claude Code**: dev — builds tools, scripts, handles deep research on request (this interactive session).

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

## Secrets
Discord webhook URLs live only in `backup.ps1` / `digest.ps1` locally. Never commit. See `.gitignore`.
