#!/bin/bash
# Guard against autonomous MCP PR creation.
# Returns "ask" so the user gets a confirmation prompt.

echo '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask"},"systemMessage":"PR creation requires user approval."}'
exit 0
