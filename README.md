# 🧠 LLM Wiki Starter

> A personal knowledge base where the LLM does the maintenance. You just read.

Based on [Andrej Karpathy's LLM Wiki idea](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f).

---

## The Problem This Solves

Every note-taking app fails the same way: **you** are responsible for filing,
cross-referencing, and maintaining the knowledge. That's exactly why everyone
abandons their Notion databases and Roam graphs.

This flips it. The LLM does all the maintenance. You just read.

**RAG** re-derives knowledge from scratch on every query.
**LLM Wiki** compiles it once and keeps it current — knowledge that compounds.

---

## How It Works

```
You read  →  Drop notes into raw/  →  Tell LLM to ingest
         →  LLM creates 8-15 wiki pages  →  You browse in Obsidian
         →  Ask questions  →  File good answers back as pages
         →  Repeat  →  Knowledge compounds
```

Three layers:
- **`raw/`** — Your source documents. Immutable. LLM reads but never edits.
- **`wiki/`** — LLM-maintained markdown pages. Concepts, entities, summaries.
- **`CLAUDE.md`** — The schema. Tells the LLM exactly how to behave.

---

## Quick Start

### 1. Clone this repo
```bash
git clone https://github.com/yourusername/llm-wiki-starter
cd llm-wiki-starter
```

### 2. Open as Obsidian vault
Open Obsidian → "Open folder as vault" → select `llm-wiki-starter/`

### 3. Install Claude Code
```bash
npm install -g @anthropic-ai/claude-code
```
OR Use 
```bash
npm i -g opencode-ai
```

### 4. Start your first session
```bash
cd llm-wiki-starter
claude
```

First message every session:
```
Read CLAUDE.md and wiki/log.md tail.
What's the current state of the wiki?
```

### 5. Add your first source
Drop any markdown file into `raw/articles/` then:
```
Ingest raw/articles/your-article.md
```

That's it. Claude creates all the wiki pages.

---

## Directory Structure

```
llm-wiki-starter/
├── CLAUDE.md              ← Master schema — read this first always
├── PROMPTS.md             ← Copy-paste prompts for every situation
├── README.md              ← This file
├── raw/                   ← YOUR sources (LLM never edits these)
│   ├── articles/          ← Web articles, blog posts
│   ├── books/             ← Book chapter notes
│   ├── papers/            ← Research papers
│   ├── podcasts/          ← Podcast notes/transcripts
│   ├── videos/            ← Video notes
│   └── assets/            ← Images referenced in sources
├── wiki/                  ← LLM writes here
│   ├── index.md           ← Master catalog (read this to navigate)
│   ├── log.md             ← Append-only activity log
│   ├── overview.md        ← Big-picture synthesis
│   ├── concepts/          ← Topic/idea pages
│   ├── entities/          ← People, tools, companies, books
│   ├── sources/           ← One summary per raw source
│   ├── queries/           ← Filed answers to good questions
│   └── comparisons/       ← Side-by-side analysis pages
└── scripts/
    └── wiki.sh            ← CLI helper (stats, orphans, search)
```

---

## Three Operations

### 📥 Ingest — Adding a source
```
Ingest raw/articles/filename.md
Create all missing pages without asking for confirmation.
Link aggressively to existing pages.
```
One source → 8-15 wiki pages created or updated automatically.

### 🔍 Query — Asking a question
```
Query: How does X relate to Y based on everything in my wiki?
File the answer as a wiki page if it's valuable.
```

### 🩺 Lint — Health check
```
Run a lint pass. Find orphans, stale claims, missing links.
Suggest 3 new questions and 2 new sources to find.
```
Run every 10-15 ingests.

---

## Supported Source Types

| What you read | Where it goes | Naming convention |
|---|---|---|
| Web article | `raw/articles/` | `author-title.md` |
| Book chapter | `raw/books/` | `bookname-ch01.md` |
| Research paper | `raw/papers/` | `author-year-title.md` |
| Podcast notes | `raw/podcasts/` | `show-episode-title.md` |
| Gemini/ChatGPT conversation | `raw/articles/` | `topic-gemini-notes.md` |
| Handwritten notes (photo) | Attach to Claude | Claude transcribes → `raw/books/` |

---

## Making Notes

**Physical book** → Voice notes on phone → paste into Claude Code
**PDF** → Highlight → drag PDF to Claude Code, it reads directly
**Web article** → Obsidian Web Clipper (one click → `raw/articles/`)
**Gemini/ChatGPT chat** → Export JSON → attach here → Claude extracts concepts
**Handwritten notes** → Photo → attach to Claude → Claude transcribes and ingests

---

## WSL2 Setup

Files live in Linux, Obsidian reads via `\\wsl$` path:

```bash
# Install Claude Code in WSL2
npm install -g @anthropic-ai/claude-code

# Add alias to ~/.bashrc
echo "alias wiki='cd ~/llm-wiki-starter && claude'" >> ~/.bashrc
source ~/.bashrc

# Start a session from anywhere
wiki
```

Open Obsidian on Windows → vault path: `\\wsl$\Ubuntu\home\username\llm-wiki-starter`

---

## CLI Helper

```bash
chmod +x scripts/wiki.sh

./scripts/wiki.sh stats      # pages, sources, concepts count
./scripts/wiki.sh log        # last 10 activity entries
./scripts/wiki.sh orphans    # pages with no inbound links
./scripts/wiki.sh search "keyword"   # search wiki content
./scripts/wiki.sh pending    # raw sources not yet ingested
```

---

## What Your Graph Looks Like After a Month

After 10-15 ingests across different topics, the Obsidian graph view
shows cross-domain connections the LLM made automatically — connections
you never explicitly asked for. This is the compounding.

Example from real usage:
- `gradient-descent` → `fallibilism` (Deutsch + ML saying the same thing)
- `prisoners-dilemma` → `behavioral-sink` (Game Theory + psychology)
- `emergence` → `neural-networks` (philosophy + ML connected)

---

## Also Works Without Claude Code

Using Claude.ai instead:

```
1. Paste source content into Claude.ai
2. Say: "Create wiki pages from this following CLAUDE.md conventions"
3. Manually copy the output into your wiki files
```

Slower but no CLI setup needed.

---

## Credits

- Pattern by [Andrej Karpathy](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- Inspired by Vannevar Bush's Memex (1945)
- Built and documented by [Your Name]

---

## License

MIT — use freely, adapt for your own knowledge system.
