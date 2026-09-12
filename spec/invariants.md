# Invariants

- Public export **only** via `lib/lemsa_core_kit.dart`.
- `AppFailure` carries **no message string**. Localization happens at the render site.
- `CancelledFailure` is never reported and never shown.
- `Result` is for branching, not for threading through sequential awaits.
- `Result.guard` catches only `AppFailure`; other exceptions propagate.
- `Disposables.dispose` runs reverse registration order and is safe to call twice.
- Empty `catch` is banned (`empty_catches: error`).
- No Riverpod providers, Dio mappers, validators, or form widgets in this package.
- No English (or any) user-facing strings on failure types.
