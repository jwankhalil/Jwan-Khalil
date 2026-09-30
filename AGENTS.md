# AGENTS.md

## Project
Flutter **web** portfolio for Jwan Khalil (Flutter Developer / Informatics Engineer).
Single-page animated site with Supabase-backed content and a local seed fallback for offline/demo use. Target: Chrome/web, responsive desktop + mobile.

## Tech Stack
- State management: flutter_bloc (Cubit only — no raw Bloc events)
- Navigation: go_router
- Networking: dio
- Dependency injection: get_it
- Functional error handling: dartz (Either<Failure, T>)
- Immutability/equality: freezed (state unions, data models) + equatable (simple domain entities)
- Localization: easy_localization, per-locale JSON files under assets/translations/
- Responsive: flutter_screenutil + custom MediaQuery/LayoutBuilder breakpoint layer
- Backend: Supabase (schema in supabase/, flutter client via dart-define)

Do not introduce an alternative package for anything listed above (e.g. Provider/Riverpod for state, http instead of dio, Navigator 1.0 instead of go_router) without asking first.

## Architecture
- lib/features/<feature>/{data,domain,presentation}
- domain: entities, repository interfaces, use cases — pure Dart, no Flutter/package imports
- data: models (freezed/json_serializable), data sources, repository implementations mapping to domain entities
- presentation: cubit, pages, views/widgets — no business logic
- shared/cross-feature code: lib/core (theme, network client, DI setup, constants, extensions)
- one root injection_container.dart composes each feature's DI registrations
- follow SOLID: single responsibility per class, depend on abstractions not implementations, prefer composition over large classes

## Conventions
- naming: snake_case files matching the class inside; *_cubit.dart/*_state.dart, *_repository.dart (interface) vs *_repository_impl.dart, *_model.dart (data) vs bare entity name (domain), *_usecase.dart
- no hardcoded strings — all user-facing text via easy_localization .tr(), keys added to every locale JSON file at once
- no hardcoded colors/text styles — only from lib/core/theme/app_colors.dart and app_text_styles.dart
- no magic numbers for spacing/sizing — centralized dimens/constants file
- RTL-safe by default: EdgeInsetsDirectional/AlignmentDirectional, never hardcoded left/right
- const constructors wherever possible

## Error Handling
- use cases/repositories return Either<Failure, T>, never throw across layer boundaries
- typed Failure subclasses (ServerFailure, NetworkFailure, CacheFailure, ValidationFailure, AuthFailure) with translation-key messages
- error UI chosen by context: inline for form errors, SnackBar for non-critical action failures, inline retry state for full-screen load failures, Dialog for blocking auth/session failures

## Before Making Changes
- mirror the folder/file pattern of an existing similar feature before creating a new one
- check for an existing repository/use case/widget before adding a new one that might duplicate it
- ask before adding a new third-party package
- when working in a team repo, do not restructure shared/core files without flagging it — other developers depend on them

## Out of Scope for AI Agents
- do not modify CI/CD config, environment secrets, or release signing configuration
- do not change backend API contracts — coordinate with the backend developer on the team first
