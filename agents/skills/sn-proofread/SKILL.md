---
name: sn-proofread
description: Proofread text files for spelling, grammar and wording issues, fixing typos automatically and suggesting other improvements. Use when asked to proofread, check writing, or review wording in a file or folder.
---

Proofread prose for spelling, grammar, punctuation, capitalization, wording and sentence structure.

**Goal:** text that is correct, clear and consistent in style.

**Typos and spelling:** fix all immediately without asking, then report the changes made.
**Wording, phrasing, sentence structure, consistency:** collect every finding first, then present as a numbered list. The user decides per item before any edit is applied.

## Phase 1: Determine target files

- If a file path is given as an argument, check that file only.
- Otherwise, fall back to every text/prose file (e.g. `.md`, `.txt`) in the current directory (non-recursive).
- Before proceeding, output the list of target files.

## Phase 2: Fix typos immediately

Fix all spelling errors without asking. Report each change as: file path, line, old → new.

## Phase 3: Collect wording and structure issues

Check the remaining text for:

**Grammar**
- Missing/incorrect articles, subject-verb agreement, tense mix-ups

**Punctuation**
- Comma splices, missing/extra commas, apostrophe misuse, inconsistent dash/hyphen use

**Capitalization**
- Inconsistent heading case, proper nouns not capitalized, mid-sentence capitalization that doesn't belong

**Clarity**
- Phrasing with two reasonable readings — flag and ask what was meant rather than guessing
- Vague or unsupported claims

**Wording**
- Wordy or awkward phrasing that could be tightened without changing meaning

**Consistency**
- Inconsistent terminology for the same concept

## Phase 4: Present findings

Present numbered findings with the current text, the issue, and a suggested fix. Then present them using the standard format defined in AGENTS.md.

## Constraints

- Complete Phase 3 in full before presenting anything.
- Apply only the content changes the user accepts.
- Do not change the meaning or scope of the content — this is a proofreading pass, not a content review.
