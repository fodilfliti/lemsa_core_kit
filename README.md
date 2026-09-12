# lemsa_core_kit

Shared primitives for the Lemsa Flutter family: typed failures, `Result` for branching, disposables, change events, reporting, logging, and pure extensions.

## Install

```yaml
dependencies:
  lemsa_core_kit: ^0.0.1
```

```dart
import 'package:lemsa_core_kit/lemsa_core_kit.dart';
```

## What it owns

- `AppFailure` sealed hierarchy (no user message strings)
- `Result` / `Ok` / `Err` / `Result.guard`
- `Disposables` + `keep` / `keepDisposer`
- `Change` (`Created` / `Updated` / `Deleted`)
- `AppReporter` + `NoOpReporter`
- `AppLogger`
- String / num / bool / list / date extensions

## What it does not own

Validators, form widgets, Riverpod providers, Dio/Supabase mappers, or localization. Those belong in later kits or the app.

## Agent skill

Consumer agents: load `skills/lemsa-core-kit/` (or install via Agent Skills when published).
