# Agent memory map

This folder is the durable brain for agents working on **lemsa_core_kit**.
It is not user documentation.

| File | Read when |
| --- | --- |
| [package.md](package.md) | Starting a task: what the package is, public surface |
| [invariants.md](invariants.md) | Changing failures, Result, Disposables, exports |
| [decisions.md](decisions.md) | Changing architecture trade-offs |
| [tasks/](tasks/) | Build / follow-up task order |

## Truth order

1. **Code** in `lib/` — implementation truth.
2. **This folder** — product intent, invariants, and why.
3. **`CHANGELOG.md`** — what changed recently.
4. **`README.md`** — user-facing docs only. Do not load as session memory.

When code and spec disagree, **fix the spec** after confirming the code is intentional.

## Consumer apps

Agents **using** this package should load `skills/lemsa-core-kit/`. That skill is usage, not package internals.
