# Decisions

## D1 — Typed throwable failures; Result only for branching

**Choice:** Sealed `AppFailure implements Exception`. Adapters throw it. Controllers catch per step. `Result.guard` is for the one call site that must branch.

**Why:** Result-everywhere forces unwrap noise. Typed throws keep sequential code linear while keeping exhaustive switches.

**Do not:** Thread `Result` through a chain of awaits, or put a `message` on `AppFailure`.

## D2 — Disposables registry instead of hand dispose lists

**Choice:** `keep` for `ChangeNotifier`s and `keepDisposer` for arbitrary cleanup. Reverse-order dispose.

**Why:** Hand-written dispose lists fail silently. Page controllers will create fields through helpers that register here.

## D3 — No redact dependency in v1 AppLogger

**Choice:** Thin `dart:developer` wrapper only.

**Why:** Keep runtime deps at Flutter SDK. Optional redact hook can land later without breaking the API.

## D4 — Omit AppFailure.custom in v1

**Choice:** Ship only the sealed hierarchy from the family errors contract.

**Why:** Kits do not need an app escape hatch; apps that need local kinds can map into `UnknownFailure` or wait for a documented custom type later.
