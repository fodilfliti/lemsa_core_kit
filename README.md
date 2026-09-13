# lemsa_core_kit

[![pub package](https://img.shields.io/pub/v/lemsa_core_kit.svg)](https://pub.dev/packages/lemsa_core_kit)

Shared primitives for the Lemsa Flutter family: typed failures, `Result` for branching, disposables, change events, reporting, logging, and pure extensions.

**Platforms:** Android, iOS, Linux, macOS, Web, Windows  
**Requires:** Flutter `>=3.44.0`, Dart `^3.12.0`

## Install

```yaml
dependencies:
  lemsa_core_kit: ^1.0.0
```

```dart
import 'package:lemsa_core_kit/lemsa_core_kit.dart';
```

## What it owns

- `AppFailure` sealed hierarchy (no user message strings — localize at the UI)
- `Result` / `Ok` / `Err` / `Result.guard`
- `Disposables` + `keep` / `keepDisposer`
- `Change` (`Created` / `Updated` / `Deleted`)
- `AppReporter` / `NoOpReporter`
- `AppLogger`
- String / num / bool / list / date extensions

## What it does not own

Validators, form widgets, Riverpod, Dio/Supabase/Firebase/Drift, or localization.

## Agent skill

```bash
npx skills add fodilfliti/lemsa_core_kit
# or full family: npx skills add fodilfliti/lemsa-skills
```

## Links

- [GitHub](https://github.com/fodilfliti/lemsa_core_kit)
- [Lemsa skills / docs](https://github.com/fodilfliti/lemsa-skills)
