---
name: git-commit-writer
description: Use when asked to write a commit message for staged changes.
---

# Purpose
Generate clear, conventional commit messages from a diff.

# Instructions
- format: `<type>(<scope>): <short summary>` — type is one of feat/fix/refactor/style/test/docs/chore
- scope is the feature/module touched (e.g. auth, appointments, core)
- summary in imperative mood, under 72 chars, no trailing period
- if the change is non-trivial, add a body: 1-3 bullet points on what changed and why, not a restatement of the diff
- if the change touches multiple unrelated features, flag that it should probably be split into separate commits rather than writing one message covering everything

# Output format
The commit message only, ready to use — no surrounding explanation unless the multi-feature warning above applies.
