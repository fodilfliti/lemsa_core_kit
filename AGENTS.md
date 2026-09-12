# Agent instructions — Lemsa Core Kit

This is a **Flutter package** (`lemsa_core_kit`), not an application.

## Load context

1. Read `spec/README.md`, then the spec file that matches the task (`package.md`, `invariants.md`, `decisions.md`).
2. Use **code** under `lib/` as implementation truth.
3. Do **not** ingest `README.md` as working memory. It is user documentation.

## Working rules

- Keep the public barrel (`lib/lemsa_core_kit.dart`) the only public API.
- No runtime deps beyond Flutter SDK. Forbidden: dio, supabase, firebase_*, drift, riverpod, auto_route, slang.
- `AppFailure` carries **no message string**. Localization is app-side.
- `CancelledFailure` is never reported and never shown.
- `empty_catches` is an analyzer **error**. Never drop a catch silently.
- After behavior changes: update `spec/` (and `CHANGELOG.md` when user-visible). Update `skills/lemsa-core-kit/` for public API changes.

## Flutter SDK

Pinned in `.fvmrc` to **3.35.7**. Use `fvm flutter` / `fvm dart`. Never run `flutter upgrade` / `flutter channel` on `C:\Users\lemsa\Documents\flutter`. Package constraints: Dart `^3.7.2`, Flutter `>=3.29.0`.

## Out of scope unless asked

Publishing to pub.dev, bumping version for release, migrating lab / reference apps, starting `flutter_page_kit` or `flutter_input_kit`.
