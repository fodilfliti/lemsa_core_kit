# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-09-13

### Added

- First stable pub.dev release.
- Sealed `AppFailure` hierarchy and `AuthReason` (no message field).
- `Result` / `Ok` / `Err` with `Result.guard` and helpers.
- `Disposables` registry (`keep`, `keepDisposer`) with reverse-order dispose.
- Sealed `Change` (`Created`, `Updated`, `Deleted`).
- `AppReporter` / `NoOpReporter` and thin `AppLogger`.
- Pure extensions for `String?`, `num?`, `bool?`, `List<T?>`, and `DateTime`.

## [0.0.1] - 2026-09-12

### Added

- Initial local package surface (pre-publish).
