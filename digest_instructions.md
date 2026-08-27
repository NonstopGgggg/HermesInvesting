# Athena — 3-Day Digest Job

Run every 3 days. Steps:

1. Check `_Shared/Mailbox/To_Athena/` for new task memos. Process each, drop result in `_Shared/Mailbox/To_Claude/` if it needs dev follow-up, else resolve directly. Move processed memo to `_Shared/Mailbox/_Archive/`.
2. Read `Portfolio/holdings.md` (positions) and `Portfolio/watchlist.md` (watched, unheld).
3. Web search recent news (last 3 days) for each ticker in holdings + watchlist, plus general market/macro headlines relevant to investing. For each company, also check:
   - Latest released product/product update.
   - Latest announced (not-yet-released) product.
   - Company performance tied to those products (sales, adoption, earnings mention).
   - Target performance: analyst consensus price target vs current price, AND company's own guidance (revenue/earnings) vs actual, where available.
4. Summarize: per-ticker news relevant to holdings/watchlist, product/announcement findings + performance vs targets, notable macro events. **Do not decide buy/sell/hold — that's Hermes' job, not this session's.** Write a research memo to `_Shared/Mailbox/To_Hermes/YYYY-MM-DD_digest-research.md` containing: current holdings, watchlist, per-ticker news summary, product/target summary, macro summary. This step ends here — do not post to Discord yet, do not commit yet.

*(Between this step and step 5, `digest.ps1` invokes Hermes headlessly to read the memo and write a decision to `Journal/journal.md` and `_Shared/Mailbox/From_Hermes/`. A separate Claude Code call then runs step 5 onward.)*

5. Read the latest file in `_Shared/Mailbox/From_Hermes/` — Hermes' decision + reasoning for this cycle. If missing (Hermes call failed), note that in the digest and proceed without it.
6. Append entry to `Journal/journal.md` — date, research summary, Hermes' decision (already appended by Hermes if present; verify, don't duplicate).
7. Post digest to Discord via webhook (`webhook_url` stored in `backup.ps1`-style local-only config, not committed to git).
8. Move the processed `To_Hermes/` and `From_Hermes/` memos to `_Shared/Mailbox/_Archive/`.
9. Commit vault changes to git (same as backup.ps1 logic — or rely on the existing 3-day backup task to pick this up).

Discord message format:
```
**Athena Digest — {date}**
Holdings: {ticker list}
Watchlist: {ticker list}
News: {per-ticker bullet}
Products/Targets: {per-ticker bullet — latest/announced product, performance vs analyst target & guidance}
Macro: {bullet}
Hermes decision: {buy/sell/hold per ticker + one-line reasoning, or "unavailable" if Hermes call failed}
Mailbox: {n} tasks processed
```
