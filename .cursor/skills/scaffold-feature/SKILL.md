---
name: scaffold-feature
description: Use when creating a brand new feature/module in this Flutter app. Covers the full set of files and wiring steps in the correct order — domain, data, presentation, DI, routing, localization.
---

# Purpose
Scaffold a new feature end-to-end following this project's Clean Architecture conventions, without skipping a wiring step.

# Instructions
Follow this exact order — do not skip steps, do not reorder:

1. **Domain layer** (lib/features/<feature>/domain/)
   - entity (plain Dart class, equatable if simple, no freezed unless it has variants)
   - repository interface (abstract class, returns Either<Failure, T> from dartz)
   - use case(s) — one class per action, single `call()` method

2. **Data layer** (lib/features/<feature>/data/)
   - model (freezed + json_serializable), with toEntity()/fromEntity() mapping to the domain entity
   - remote data source (dio calls) and/or local data source
   - repository implementation: catches exceptions at this boundary, maps to typed Failure subclasses, returns Either

3. **Presentation layer** (lib/features/<feature>/presentation/)
   - cubit + freezed state (sealed union: Initial/Loading/Success/Error)
   - page/view widget, using BlocBuilder/BlocListener as appropriate
   - extract reusable widgets into their own files per clean-code-widgets.mdc (~40 line threshold) — don't let the page file keep growing

4. **Wiring — do not forget these**
   - register data source, repository, use cases, and cubit in get_it (injection_container.dart for the feature, or the root locator)
   - add the route in the go_router config (named route constant, not a string literal)
   - add any new user-facing strings to BOTH en.json and ar.json under a namespaced key matching the feature name

5. **Sanity check before finishing**
   - confirm domain layer has zero Flutter/package imports
   - confirm the cubit only calls use cases, never a repository or data source directly
   - confirm every user-facing string uses .tr(), none hardcoded

# Output format
List the files created/modified, in the order above, with a one-line note per file on what it contains. Flag explicitly if any wiring step (get_it, go_router, localization) was skipped and why.
