#!/usr/bin/env bash
set -euo pipefail

SELECTED_TYPE="${1:-ai-defined}"
COMMITS_TO_SUGGEST=8

if ! git diff --cached --quiet; then
    :
else
    echo "No changes in staging. Add changes first."
    exit 1
fi

aichat --model gemini:gemini-2.5-flash-lite "
You are an expert at writing Git commits. Your job is to write commit messages that follow the Conventional Commits format.

The user has selected: $SELECTED_TYPE

Your task is to:
1. Analyze the code changes
2. Determine the most appropriate commit type (if user selected 'ai-defined')
3. Determine an appropriate scope (component/area affected)
4. Decide if this is a breaking change
5. Write clear, concise commit messages

Available commit types:
- feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert

Guidelines:
- Structure: <type>(<scope>): <description>
- If user selected 'ai-defined', choose the best type per option
- If user selected a specific type, always use that type: $SELECTED_TYPE
- Add scope when applicable
- Use ! for breaking changes
- Lowercase, imperative mood
- No trailing period
- Keep under 50 characters

Generate exactly $COMMITS_TO_SUGGEST messages.
One message per line.
No explanations.

Previous commits:
$(git log --oneline -10)

Changes:
$(git diff --cached --stat)
$(git diff --cached)
"
