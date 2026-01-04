  ---
  name: workflow
  description: Quick-reference guide for the Claude Code development workflow and available skills. Use when the user wants to remember their workflow, see what skills are available, asks "what's next", "what should I do next", "what's my workflow", "where am I", or needs a reminder of the development lifecycle steps. Also use when the user seems unsure which
  skill to invoke next.
  ---

  # Development Workflow Reminder

  This skill has two modes:

  - **Full workflow** (default): Print the entire workflow as a reference guide. Use this mode when the user says `/workflow`, `/workflow all`, "show me my workflow", or just wants to see everything.
  - **Where am I**: Detect the current phase and recommend the next skill. Use this mode when the user says `/workflow next`, "what's next", "where am I", or seems unsure which skill to call.

  If the intent is ambiguous, default to the full workflow.

  ---

  ## Mode 1: Full Workflow

  Print the workflow exactly as written below — no phase detection, no markers. Just the docs.

  ---

  ## Mode 2: Where Am I

  Run these checks to infer the current phase (do all checks in parallel):

  | Signal | How to check | What it means |
  |---|---|---|
  | Clean main branch, no feature branch | `git branch --show-current` returns `main`, working tree clean | Phase 1 — not started yet |
  | Feature branch exists, no commits ahead of main | `git log main..HEAD --oneline` is empty | Phase 2–3 — speccing or early build |
  | Feature branch with commits, no PR | `git log main..HEAD --oneline` has commits; `gh pr list --head $(git branch --show-current) --json number` is empty | Phase 4 — ready for review |
  | Draft PR exists | `gh pr list --head $(git branch --show-current) --json number,isDraft` shows a draft | Phase 5–6 — PR open, running reviews |
  | PR has review comments | `gh pr view --json reviewRequests,reviews` shows reviews | Phase 7–8 — addressing feedback |
  | PR approved / merged | `gh pr view --json state,reviewDecision` shows APPROVED or MERGED | Phase 9–10 — post-merge |
  | Working tree is clean and on main after recent merge | Recent merge commit in `git log --oneline -5` | Phase 11 — retro time |

  Use the most advanced phase that matches. If signals are ambiguous, state your best guess and ask the user to confirm.

  Print the full workflow with the detected current phase marked with **→** and bold. After the list, print a one-liner like:

  > **Next up:** `/pr-review-toolkit:review-pr` — review your changes before opening a PR.

  If phase detection fails or is ambiguous, print the full list without a marker and ask: "Where are you in the workflow?"

  ---

  ## The Workflow

  ### 1. Create Tickets
  `/jira:create-bug` — file a bug
  `/jira:create-task` — create a task

  ### 2. Write Spec
  `/planning:write-spec` — interactive spec interview

  ### 3. Build
  `/feature-dev:feature-dev` — guided 7-phase feature development

  ### 4. Review
  `/pr-review-toolkit:review-pr` — full specialized review
  `/code-review` — lighter style/guidelines check

  ### 5. Open PR
  `/github:open-pr` — push branch and open a draft PR

  ### 6. Run Reviews
  `/github:bugbots-rollout` — trigger bugbot reviewers on the PR

  ### 7. Address Review Feedback
  _TODO: replace bugbot-fix_

  ### 8. Self Review
  `/self-review` — annotate PR with inline context for reviewers

  ### 9. Human Review
  No skill — request review from a teammate.

  ### 10. Post PR
  `/slack:post-pr` — announce the merged PR in Slack

  ### 11. Self-Improve
  `/retro` — analyze the session and propose CLAUDE.md improvements
