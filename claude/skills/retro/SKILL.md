---
name: retro
description: Conversation retrospective — analyzes the current session to find where the user had to steer, correct, or redirect Claude, then cross-references against CLAUDE.md and proposes targeted improvements to project instructions. Use when the user says /retro, /retrospective, "review this conversation for mistakes", "what did you get wrong", "how can we improve CLAUDE.md", or wants to audit collaboration quality. Also use proactively at the end of long sessions where multiple corrections occurred.
argument-hint: [focus-area]
---

# Conversation Retrospective

Review the current conversation to find where you fell short — moments the user had to steer, correct, or work around you. Turn those friction points into concrete CLAUDE.md improvements so they don't recur.

## Arguments

- `$1` - (Optional) A focus area to narrow the analysis. E.g., "frontend work", "the migration task", "the first half of the conversation".

## Step 1: Scan the Conversation

Read through the entire conversation and flag every instance matching these signal types.

### Direct corrections

The user explicitly tells you to stop, undo, or change course:
- "No, I meant...", "Don't do that", "I said X not Y"
- "Stop", "Wait", "That's not what I asked"
- Rejecting a tool call or denying a permission prompt

### Repeated instructions

The user restates something they already said. This means you didn't absorb it the first time — even if your second attempt was correct, the repetition itself is the issue.

### Frustration signals

Tone shifts, terse replies, exasperation ("again", "as I said", "I already told you"), or the user giving up on an approach and working around you.

### Silent corrections

The user doesn't call out the mistake explicitly but narrows or rephrases their request after you went in the wrong direction.

### Wasted work

You produced output the user didn't need and had to backtrack:
- Making code changes when the user wanted information or discussion
- Editing the wrong file, function, or section
- Adding unrequested extras (comments, types, refactors, error handling)
- Over-engineering a solution beyond what was asked

### Missed improvements

You had an opportunity to suggest a better approach but didn't:
- Obvious refactoring that would simplify the code
- A poor pattern that should have been flagged (duplication, bad naming, leaky abstraction)
- An existing utility or helper that could have been reused
- A simpler solution that you overcomplicated or overlooked

### Misread intent

You interpreted the request differently than intended. The user had to clarify what they actually wanted.

### Ignored context

You missed something in CLAUDE.md, a `.claude/rules/` file, or earlier in the conversation that should have guided your behavior differently.

## Step 2: Categorize Each Instance

Assign each issue one of these categories:

| Category | What it means |
|---|---|
| **Premature action** | Jumped to implementation when the user wanted information or discussion |
| **Scope creep** | Added unrequested changes, refactors, comments, or features |
| **Wrong target** | Edited the wrong file, function, or section |
| **Missed pattern** | Didn't follow an existing codebase convention |
| **Ignored instruction** | A CLAUDE.md rule or prior conversation instruction existed but wasn't followed |
| **Bad assumption** | Made an assumption about intent that turned out wrong |
| **Repeated mistake** | Made the same type of error more than once in the session |
| **Over-engineering** | Solution was more complex than needed |
| **Under-investigation** | Answered or acted without reading enough context first |
| **Missed improvement** | Failed to flag a poor pattern, refactoring opportunity, or simpler approach |

## Step 3: Cross-Reference Against Project Instructions

Project instructions live in multiple places. Read **all** of them before cross-referencing:

1. **CLAUDE.md** at the project root
2. **Every file in `.claude/rules/`** — recursively, including subdirectories like `.claude/rules/server/` and `.claude/rules/client/`. These contain domain-specific conventions (testing patterns, coding standards, etc.) that are just as authoritative as CLAUDE.md.

Use `Glob` with `.claude/rules/**/*` to discover all rule files, then read each one. Proposals for new or modified rules should target the most specific applicable file — e.g., a testing convention belongs in `.claude/rules/server/testing-patterns.md`, not in the top-level CLAUDE.md.

For each issue found in Step 1:

1. **Rule exists but didn't prevent it** — Note the exact file and section. Why wasn't it effective? Too vague? Buried? Missing a key detail (like the memoization behavior of `let`)? Easy to misinterpret?

2. **No rule covers this** — Note what rule would have prevented it and which file it belongs in.

3. **Rule caused the problem** — Sometimes rules conflict or are ambiguous, leading to the wrong call. Flag these.

## Step 4: Produce the Report

### Format

```
## Retrospective Summary

[1-2 sentences: how many issues, dominant pattern, overall session efficiency]

## Issues Found

### 1. [Category]: [Brief description]
- **What happened**: [What you did wrong, what the user did to correct it]
- **User said**: "[Exact quote from the user's correction]"
- **Root cause**: [Why — missed rule, bad assumption, habit, etc.]
- **Rule coverage**: [Existing rule that should have caught this / no rule exists]

### 2. [Category]: ...
[repeat for each issue, ordered by impact]

## Proposed CLAUDE.md Changes

### New Rules
[Exact text to add, with location in CLAUDE.md. Reference which issue(s) each addresses.]

### Rules to Strengthen
[Current text → proposed replacement. Reference which issue(s).]

### Rules to Clarify
[Current text → proposed rewording. Reference which issue(s).]

## Clean Session?
[If no issues found, say so. A clean retro is a good outcome.]
```

## Guidelines

- **Be specific.** Point to exact messages, not vibes. Quote the user. "Could communicate better" is not useful.
- **Don't manufacture issues.** If the conversation went well, say so. Don't pad the report.
- **Prioritize patterns over one-offs.** A single misunderstanding matters less than a recurring category.
- **Propose minimal changes.** Don't suggest rewriting CLAUDE.md. Propose the smallest edit that fixes the pattern.
- **Generalize, don't overfit.** Proposed rules should capture the underlying principle, not narrate the specific mistake back. If Claude misapplied `let` memoization during a refactor, the rule isn't "Refactoring with `let`" — it's about auditing test structure after interface changes, or applying refactors uniformly. A good rule prevents a *class* of mistakes; a bad rule prevents only the exact scenario that just happened.
- **Match the existing style.** Write proposed rules the way the current CLAUDE.md is written.
- **Note what's out of scope.** If an issue was caused by tool limitations or genuinely ambiguous user input, say so — don't force a CLAUDE.md change.
- **Report only.** Do NOT modify any files. The user decides what to apply.
- **If given a focus area** (`$1`), narrow analysis to that portion of the conversation but still scan broadly for anything severe.
