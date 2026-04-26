# LLM Wiki — Prompts Cheatsheet

Copy-paste these into Claude Code or Claude.ai.
Save this file. You'll use it every session.

---

## 🔁 SESSION START (use every single time)

```
Read CLAUDE.md and the last 10 entries of wiki/log.md.
Give me a 3 line summary of the current state of the wiki.
Then ask me what I want to do today.
```

---

## 📥 INGEST PROMPTS

### Ingest a file
```
Ingest raw/articles/[filename].md
Follow CLAUDE.md conventions strictly.
Create ALL missing concept and entity pages without asking for confirmation.
Link aggressively to existing pages.
List everything created and updated at the end.
```

### Ingest a book chapter
```
Ingest raw/books/[bookname-chXX].md
This is Chapter X of [Book Title] by [Author].
Create concept pages for every named idea.
Update existing pages if this chapter adds nuance.
Link to existing wiki pages wherever relevant.
Do not ask for confirmation — create all missing pages.
List everything at the end.
```

### Create file from pasted content then ingest
```
Create raw/books/[filename].md with the following content,
then immediately ingest it following CLAUDE.md conventions:

[paste your notes here]
```

### Stop talking, just write the files
```
Stop explaining. Write the files now.
```

---

## 🔍 QUERY PROMPTS

### Ask a question
```
Query: [your question]
Read wiki/index.md first to find relevant pages.
Synthesize an answer using what's in my wiki.
Cite which wiki pages you used.
Then ask if I want to file this as a wiki page.
```

### Cross-chapter synthesis
```
Based on everything in my wiki about [topic],
write a synthesis connecting all related concept pages.
Show how the ideas build on each other.
File it as wiki/queries/[descriptive-name].md
```

### Connect two topics
```
How does [topic A] connect to [topic B] based on my wiki?
Show me connections I might not have noticed.
File the answer as a query page.
```

---

## 📚 REVISION PROMPTS

### Quiz me
```
Quiz me on [topic/chapter/concept].
Ask one question at a time.
Wait for my answer before asking the next.
After each answer tell me: what I got right, what I missed,
and which wiki page has the full explanation.
```

### Feynman check
```
Explain [concept] from my wiki as if I'm a complete beginner.
Use a simple real-world example NOT in my notes.
```

### Generate revision sheet
```
Based on my wiki pages about [topic/book],
create a revision sheet at wiki/queries/[topic]-revision.md with:
1. Key concepts (one line each)
2. How they connect to each other
3. 5 exam-style questions with answers
4. 3 things commonly misunderstood
```

### Spaced repetition
```
Before we discuss the new chapter, quiz me on concepts
from previous chapters that this one builds on.
```

---

## 🩺 LINT PROMPTS

### Full lint pass
```
Run a full lint pass on the wiki. Find:
1. Orphan pages with no inbound links
2. Concepts mentioned but lacking their own page
3. Contradictions between pages
4. Missing cross-references between related pages
Suggest 3 new questions to investigate.
Suggest 2 new sources to find.
Append the lint report to wiki/log.md
```

### Quick orphan fix
```
Find all orphan pages in the wiki.
For each one, find 2 existing pages that should link to it
and add the links.
```

---

## 📝 NOTE-MAKING PROMPTS

### From Gemini/ChatGPT conversation
```
I'm pasting my Gemini conversation about [topic/chapter].
Extract all key concepts, entities, and my reactions.
Create raw/[books or articles]/[filename].md with clean notes.
Then ingest it immediately.
Do not ask for confirmation on any page creation.
```

### From handwritten notes photo
```
[attach photo]
Transcribe my handwritten notes from Chapter X of [Book].
Save as raw/books/[bookname-chXX].md
Then ingest it following CLAUDE.md conventions.
```

### Add personal notes to existing file
```
Add my personal notes to raw/books/[filename].md
under a new section called "## My personal notes":

[your notes here]

Then re-ingest the file — update existing pages with
any new insights. Don't recreate pages that already exist.
```

---

## 🔧 MAINTENANCE PROMPTS

### Update CLAUDE.md
```
Update CLAUDE.md to add [new rule/page type/convention].
Show me the change before making it.
```

### Fix template ghost nodes
```
The _template.md files have placeholder wikilinks like
[[ConceptA]], [[EntityA]], [[source-slug]].
Remove all placeholder links from every _template.md file.
```

### Re-ingest with updates
```
Re-ingest raw/books/[filename].md
Update existing pages with new content.
Do not recreate pages — only update them.
```

---

## 💡 USEFUL ONE-LINERS

```
What are the most connected pages in my wiki?
```
```
Which concepts appear in the most sources?
```
```
What topics am I missing that would connect my existing pages better?
```
```
Summarize my entire wiki in one page for someone who hasn't read it.
```
```
What should I read next based on gaps in my wiki?
```
