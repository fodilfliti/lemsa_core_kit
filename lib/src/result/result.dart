import 'package:lemsa_core_kit/src/failure/app_failure.dart';

/// Outcome of a call that must **branch** on success vs typed failure.
///
/// Prefer throwing [AppFailure] for sequential pipelines; use [Result.guard]
/// at the one site that needs an exhaustive Ok/Err switch.
sealed class Result<T> {
  const Result();

  /// Runs [body] and maps thrown [AppFailure] to [Err].
  ///
  /// Other exceptions propagate.
  static Future<Result<T>> guard<T>(Future<T> Function() body) async {
    try {
      return Ok(await body());
    } on AppFailure catch (f) {
      return Err(f);
    }
  }
}

/// Successful [Result].
final class Ok<T> extends Result<T> {
  const Ok(this.value);

  final T value;
}

/// Failed [Result] carrying an [AppFailure].
final class Err<T> extends Result<T> {
  const Err(this.failure);

  final AppFailure failure;
}

/// Helpers for branching on [Result].
extension ResultX<T> on Result<T> {
  bool get isOk => this is Ok<T>;

  T? get valueOrNull => switch (this) {
        Ok(:final value) => value,
        Err() => null,
      };

  AppFailure? get failureOrNull => switch (this) {
        Ok() => null,
        Err(:final failure) => failure,
      };

  T orElse(T Function(AppFailure failure) recover) => switch (this) {
        Ok(:final value) => value,
        Err(:final failure) => recover(failure),
      };
}
