---
name: change-request
description: Post a change request to the #change_control Slack channel. Use this skill when the user says "post a change request", "submit a CR", "change request", or wants to notify the team about an infrastructure or config change that needs approval. Also trigger when the user mentions "change control" in the context of deploying or applying changes.
---

# Change Request

Post a formatted change request to `#change_control` in Slack for team review and approval.

## Process

1. **Gather context** from the current branch/PR:
   - PR title and description (if a PR exists for the current branch)
   - The git diff against main, focused on the actual config/code changes (not the full diff output — extract the meaningful lines)
   - Any Jira ticket linked in the PR

2. **Draft the message** using the template below. Auto-populate what you can from context:
   - **Issue**: From PR title or Jira ticket summary
   - **Proposed Fix**: The specific config or code change from the diff — show the relevant lines, not the entire diff
   - **Target Date**: Default to "As soon as approved" unless the user specifies otherwise (e.g., "after hours", "next maintenance window")
   - **Rollback Plan**: Infer if obvious (e.g., reverting a config value), otherwise ask the user
   - **Tested**: Default to "In CS" unless the user specifies otherwise

3. **Show the draft** to the user using AskUserQuestion and let them confirm or edit before posting. Present it as a single option with the formatted message so they can see exactly what will be posted.

4. **Find the channel**: Use `slack_search_channels` to search for `change_control` and get the channel ID.

5. **Post the message**: Use `slack_send_message` with the channel ID. Set `unfurl_links: false` and `unfurl_media: false`.

## Message Template

The message uses Slack markdown formatting:

```
**Issue:** {issue description}
**Proposed Fix:**
```{code block with the specific change}```
**Target Date:** {target date}
**Rollback Plan:** {rollback plan}
**Tested:** {how it was tested}
```

## Rules

- Always show the draft to the user before posting — never post without confirmation
- Keep the code block focused on the meaningful change, not the entire diff
- If the Slack MCP is unavailable or the send fails, provide the formatted message so the user can post manually
- For the Proposed Fix code block, use the actual config/code syntax (e.g., YAML for infrastructure changes)
