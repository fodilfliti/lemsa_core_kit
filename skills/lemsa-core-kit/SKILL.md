---
name: lemsa-core-kit
description: >
  Use lemsa_core_kit when adding AppFailure, Result, Disposables, Change,
  AppReporter, AppLogger, or pure String/num/bool/list/date extensions in a
  Lemsa Flutter app. Activate for typed failures, Result.guard branching,
  reverse-order dispose registries, and core helpers — not for validators,
  form widgets, Riverpod, Dio, or Supabase mappers.
license: MIT
metadata:
  author: fodilfliti
  version: "0.0.1"
  homepage: https://pub.dev/packages/lemsa_core_kit
---

# lemsa_core_kit (consumer)

## When to import

```dart
import 'package:lemsa_core_kit/lemsa_core_kit.dart';
```

Use this package for:

- Sealed `AppFailure` / `AuthReason` (map vendor errors in data adapters, catch in controllers)
- `Result.guard` when the **caller must branch** on Ok vs Err
- `Disposables.keep` / `keepDisposer` for page-owned resources
- `Change` events (`Created` / `Updated` / `Deleted`)
- `AppReporter` / `NoOpReporter` and `AppLogger`
- Pure extensions (`isNullOrEmpty`, `toDoubleValue`, `isZero`, `nonNullsList`, `toDate`, …)

## Rules

- Do **not** put user-facing messages on `AppFailure`. Localize in the app (`failureText` switch).
- Do **not** report or show `CancelledFailure`.
- Do **not** wrap every await in `Result` — throw/catch per step for pipelines.
- Empty `catch` is banned. Handle, rethrow, or report.

## Do not put in core

These belong elsewhere:

| Concern | Where |
| --- | --- |
| Validators / EmailField | `flutter_input_kit` |
| PageData / shells / busy | `flutter_page_kit` |
| Dio / Supabase mappers | `flutter_data_kit_*` |
| Riverpod providers | app / `flutter_app_kit` / nav kit |
| slang / i18n strings | app |

## Quick examples

```dart
final result = await Result.guard(() => auth.login(email, password));
switch (result) {
  case Ok():
    break;
  case Err(failure: AuthFailure(reason: AuthReason.emailNotConfirmed)):
    showResendConfirmation();
  case Err(:final failure):
    this.failure.value = failure;
}
```

```dart
final disposables = Disposables();
late final title = disposables.keep(TextEditingController());
disposables.keepDisposer(subscription.cancel);
// later:
disposables.dispose(); // reverse order
```
