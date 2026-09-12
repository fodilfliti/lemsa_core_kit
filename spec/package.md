# lemsa_core_kit

Primitives every other Lemsa kit shares. No Flutter widgets beyond `flutter/foundation.dart` needs.

## Layers

| Layer | Path | Role |
| --- | --- | --- |
| Barrel | `lib/lemsa_core_kit.dart` | Only public export |
| Failures | `lib/src/failure/` | Sealed `AppFailure` + `AuthReason` |
| Result | `lib/src/result/` | `Result` / `Ok` / `Err` / `guard` |
| Disposables | `lib/src/disposables/` | Reverse-order dispose registry |
| Change | `lib/src/change/` | `Created` / `Updated` / `Deleted` |
| Reporter | `lib/src/reporter/` | `AppReporter` + `NoOpReporter` |
| Logging | `lib/src/logging/` | Thin `AppLogger` |
| Extensions | `lib/src/extensions/` | Pure String/num/bool/list/date helpers |

## Public API

- `AppFailure` hierarchy + `AuthReason`
- `Result<T>`, `Ok`, `Err`, `Result.guard`, `ResultX`
- `Disposables`, `keep`, `keepDisposer`
- `Change<T>`, `Created`, `Updated`, `Deleted`
- `AppReporter`, `NoOpReporter`
- `AppLogger`
- Extensions listed in package README / barrel

## Depends on

Flutter SDK only.

## Must not depend on

`dio`, `supabase_flutter`, `firebase_*`, `drift`, `flutter_riverpod`, `hooks_riverpod`, `auto_route`, `slang`.
