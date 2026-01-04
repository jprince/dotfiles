#!/bin/bash
# Guard against autonomous git push / gh pr create.
# Returns "ask" so the user gets a confirmation prompt.

input=$(cat)
command=$(echo "$input" | python3 -c "import sys,json; print(json.load(sys.stdin).get('tool_input',{}).get('command',''))" 2>/dev/null)

if echo "$command" | grep -qiP 'git\s+push'; then
  echo '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask"},"systemMessage":"Git push requires user approval."}'
  exit 0
fi
if echo "$command" | grep -qiP 'gh\s+pr\s+create'; then
  echo '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask"},"systemMessage":"PR creation requires user approval."}'
  exit 0
fi

echo '{}'
exit 0
