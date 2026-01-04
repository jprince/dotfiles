---
name: self-review
description: Add inline PR comments explaining the rationale behind notable changes to streamline code review. Use this skill when the user asks to "annotate the PR", "add review comments", or wants to prepare a PR for reviewers by adding context. Also trigger when the user says things like "mark up the PR" or "add comments for the reviewer".
---

# Self-Review

Add inline comments to a GitHub PR explaining the rationale behind notable changes, so reviewers can understand the "why" without asking.

## Process

1. **Get the PR** for the current branch:
   ```bash
   gh pr view --json number,headRefName --jq '.number'
   ```
   If `gh` is not available, use `mcp__github__pull_request_read` to find the PR for the current branch.

2. **Get the diff** against the base branch:
   ```bash
   gh pr diff <number>
   ```
   If `gh` is not available, use `git diff` against the base branch.

3. **Get the latest commit SHA** (required for creating the review):
   ```bash
   gh api repos/{owner}/{repo}/pulls/{number} --jq '.head.sha'
   ```
   If `gh` is not available, use `mcp__github__pull_request_read` or `git rev-parse HEAD`.

4. **Get existing review comments** so you can reply to them instead of posting duplicates:
   ```bash
   gh api repos/{owner}/{repo}/pulls/{number}/comments --jq '.[] | {id, path, line, body, user: .user.login}'
   ```
   If `gh` is not available, use `mcp__github__pull_request_read` to fetch existing comments.

5. **Identify meaningful changes** in the diff. For each changed file, group related hunks into logical changes. Skip mechanical changes that don't need explanation:
   - Test assertion updates that follow directly from a code change (e.g. updating a string value that appears in both a method and its test)
   - Import additions/removals that are obvious from other changes
   - Formatting-only changes (whitespace, line wrapping)
   - Renames with no behavioral change
   - Any change that is easily understood without explanation or context

6. **Create a pending review** using `mcp__github__pull_request_review_write` with method `create` and the commit SHA.

7. **For each meaningful change**, check if an existing comment already covers that line/range:
   - **If a comment exists on that line** (from anyone — the author, a reviewer, a bot): reply to it using `mcp__github__add_reply_to_pull_request_comment` with the existing comment's ID. Do not create a new inline comment.
   - **If no comment exists**: add a new inline comment using `mcp__github__add_comment_to_pending_review`. For multi-line changes, use `startLine`/`line` to highlight the relevant range. Use `side: RIGHT` for new code.

   Each comment should:
   - Explain **why** the change was made, not **what** changed (the diff already shows that)
   - Be 1-2 sentences

8. **Submit the review** as `COMMENT` with an empty body — the inline comments stand on their own.

## What makes a good self-review comment

The reader is an engineer who can read code. They don't need you to narrate the diff — they need to understand the decision behind it.

**Good** (explains the why):
> Previously the handler always returned a well-formed response, so Lambda reported success even when every message failed. Raising here makes CloudWatch error metrics reflect total batch failures.

**Bad** (restates the diff):
> Added a RuntimeError that raises when all messages fail.

**Good** (connects to a non-obvious consequence):
> Switched from `logger.error` to `logger.exception` so validation failures include the full traceback in CloudWatch.

**Bad** (obvious from the code):
> Changed `logger.error` to `logger.exception`.

## Grouping changes

Multiple related lines often share a single rationale. Use multi-line comment ranges to cover them together rather than adding separate comments per line. For example, if you add `logger.exception()` and also change `error=str(e)` to `error=_format_exception(e)` in the same except block, one comment covering the block is better than two.

Conversely, if a file has two unrelated changes (e.g., a new helper function and a logging fix), comment them separately even though they're in the same file.

## Deduplicating across files

When the same change appears in multiple files (e.g., adding `logger.exception()` to two different executors), only comment on the first occurrence with the full rationale. Do not repeat the same explanation on subsequent files — the reviewer will understand that the same pattern applies. If helpful, leave a brief pointer like "Same fix as above" on the second occurrence, but only if the connection isn't already obvious from the diff context.

## Handling a pre-existing pending review

If creating a pending review fails because one already exists, delete it first with `delete_pending`, then create a new one. This avoids stale comments from a previous attempt.
