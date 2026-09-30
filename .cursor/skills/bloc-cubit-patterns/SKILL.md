---
name: bloc-cubit-patterns
description: Use when writing, reviewing, or testing Cubit-based state management in this project. Covers state design, emit discipline, and testing with bloc_test.
---

# Purpose
Ensure Cubit code follows consistent patterns and is testable, matching this project's state-management rules.

# Instructions
When writing a Cubit:
- state is a freezed sealed union (Initial, Loading, Success(data), Error(failure)) — never a single mutable class with nullable fields
- constructor takes only domain use cases/repositories, injected via get_it — never a data source or dio client directly
- every method that does async work: emit Loading first (unless it's a background refresh that shouldn't block UI), call the use case, fold() the Either result into Success or Error
- never emit the same state instance twice in a row without a real Success/Error transition (fold() handles this naturally)
- override close() to dispose any stream subscriptions the Cubit holds

When testing a Cubit, use bloc_test:
- mock the use case(s), not the repository or data source
- `blocTest` structure: build (create Cubit with mocked use case), act (call the method under test), expect (list of expected states in order)
- test both the Right (success) and Left (failure) paths for every method
- verify() the mocked use case was called with expected parameters

# Output format
When generating a Cubit or its test, return the complete file(s). When reviewing existing Cubit code, list violations found (state shape, emit discipline, DI dependencies) with the file/line and the fix.
