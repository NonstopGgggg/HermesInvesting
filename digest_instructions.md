# Hermes — 3-Day Digest Job

Run every 3 days. Steps:

1. Check `_Shared/Mailbox/To_Hermes/` for new task memos. Process each, drop result in `_Shared/Mailbox/To_Claude/` if it needs dev follow-up, else resolve directly. Move processed memo to `_Shared/Mailbox/_Archive/`.
2. Read `Portfolio/holdings.md` — current positions.
3. Web search recent news (last 3 days) for each held ticker + general market/macro headlines relevant to investing.
4. Summarize: per-ticker news relevant to holdings, notable macro events, no trading advice — just information.
5. Append entry to `Journal/journal.md` — date, digest summary, any decisions logged.
6. Post digest to Discord via webhook (`webhook_url` stored in `backup.ps1`-style local-only config, not committed to git).
7. Commit vault changes to git (same as backup.ps1 logic — or rely on the existing 3-day backup task to pick this up).

Discord message format:
```
**Hermes Digest — {date}**
Holdings: {ticker list}
News: {per-ticker bullet}
Macro: {bullet}
Mailbox: {n} tasks processed
```
