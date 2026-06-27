#STM Knowledge Base
Full of my fav papers and summaries about them

Eventullay will have a socratic guide that can walk you through/quiz on material to increase understanding.


4. **Ingest your first paper with an AI coding agent** (Claude Code, or a CLI
   agent) **under the READ PROTOCOL.** Fetch a PDF, then have the agent read it
   from disk and write a sourced page with a `source_trace`. Step-by-step:
   [`docs/QUICK-START.md`](docs/QUICK-START.md).

5. **Run the lint.**
   ```bash
   bash scripts/lint-kb.sh knowledge
   ```
   It must be clean of **HARD** issues. Warnings (empty dirs, orphan pages on a
   fresh vault) are expected early on.
