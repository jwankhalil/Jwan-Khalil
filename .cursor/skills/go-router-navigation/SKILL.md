---
name: go-router-navigation
description: Use when adding routes, setting up navigation, or handling deep links/route guards with go_router in this project.
---

# Purpose
Keep navigation consistent: centralized routes, named constants, correct guard placement.

# Instructions
- every route is declared in the central router file, never inline in a widget
- route paths live as named constants in an AppRoutes class — never a raw string literal at the call site
- each feature exposes its own *_routes.dart with its GoRoute definitions; the central router file only aggregates them via `routes: [...AuthRoutes.routes, ...HomeRoutes.routes]`
- navigate with context.go() for a full navigation (clears stack to that point) vs context.push() for a stacked screen (e.g. detail view) — pick based on whether back should return to the previous screen or not
- pass data via route `extra` or path/query parameters — not global state — unless the data is already owned by a Cubit/repository the destination screen also reads from
- auth/session guards go in GoRouter's top-level `redirect` callback, checking a single source of truth (e.g. an auth Cubit's state via get_it), never duplicated per-page in initState
- nested routes for a feature's sub-screens (e.g. list → detail) use ShellRoute or nested GoRoute children to preserve navigation hierarchy

# Output format
Return the route definition(s) and any AppRoutes constant additions. If a redirect/guard is involved, state which auth state it reads and where.
