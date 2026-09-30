---
name: code-reviewer
description: Use when asked to review a diff, PR, or block of code for quality issues before it's committed or merged.
---

# Purpose
Catch real issues before code ships — architecture violations, bugs, and this project's specific conventions — without nitpicking style the linter already handles.

# Instructions
Check, in this priority order:
1. Architecture violations — domain importing Flutter/packages, cubit calling a repository/data source directly, business logic in a widget
2. Correctness — unhandled Either.Left case, missing loading/error state, potential null issues, incorrect async/await usage
3. Convention violations — hardcoded strings (should be .tr()), hardcoded colors/styles, magic numbers for spacing, wrong file/class naming pattern
4. Error handling — exceptions not mapped to typed Failure, generic Failure('error') instead of a specific type
5. Missed wiring — new dependency not registered in get_it, new route not added to go_router, new string missing from one of the locale JSON files

# Output format
List each issue as: severity (blocker / should-fix / nit), file + line, what's wrong, the fix. Group by severity, blockers first. If nothing significant is found, say so plainly rather than inventing nitpicks.
