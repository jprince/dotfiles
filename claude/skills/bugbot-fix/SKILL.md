---
name: bugbot-fix
description: Address bugbot review comments on a PR, commit fixes, push, and trigger another review cycle. Use when bugbot has left feedback on a PR that needs to be addressed.
---

# Bugbot Fix Workflow

This skill automates the cycle of addressing bugbot feedback on a pull request.

## Arguments

- **PR number or URL** (optional): The PR to fix. If not provided, uses the current branch's PR.

## Workflow

### Step 1: Identify the PR

If no PR is specified:
1. Get the current branch name
2. Find the associated PR using the github MCP

If a PR number or URL is provided, use that directly.

### Step 2: Fetch Bugbot Comments

1. Use the GitHub API to get all review comments on the PR
2. Filter for comments from bugbot (look for "bugbot" in the username or comments with specific bugbot patterns)
3. Parse each comment to understand:
   - The file and line being commented on
   - The issue being raised
   - Any suggested fix

### Step 3: Address Each Issue

For each bugbot comment:
1. Read the relevant file
2. Understand the issue being raised
3. Implement the fix following project patterns
4. Track what was fixed

### Step 4: Commit and Push

1. Stage all modified files
2. Create a commit with message summarizing the bugbot fixes:
   ```
   Address bugbot feedback

   - [Brief description of fix 1]
   - [Brief description of fix 2]
   ...

   Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
   ```
3. Push to the remote branch

### Step 5: Trigger New Review

Add a comment to the PR to trigger another bugbot review:
```
bugbot run
```

### Step 6: Report Summary

Provide a summary of:
- How many issues were addressed
- What files were modified
- Any issues that could not be automatically fixed (require manual attention)

## Example Usage

```
/bugbot-fix
/bugbot-fix 9634
/bugbot-fix https://github.com/Censinet/censinet/pull/9634
```

## Notes

- Always read the file before making changes
- Follow existing project patterns and conventions
- If a bugbot comment is unclear or the fix is non-trivial, ask the user for guidance
- Do not fix issues that are false positives - flag them for user review instead
- Use `mcp__github__add_issue_comment` to add the "bugbot run" comment
