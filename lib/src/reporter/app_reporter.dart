import 'package:lemsa_core_kit/src/failure/app_failure.dart';

/// Crash / failure reporting sink used by kits without depending on a vendor SDK.
abstract interface class AppReporter {
  /// Expected, handled [AppFailure].
  void failure(AppFailure f, StackTrace? trace);

  /// Unexpected error.
  void crash(Object error, StackTrace trace);

  /// Lightweight trail for diagnostics.
  void breadcrumb(String message, {Map<String, Object?> data = const {}});
}

/// Default reporter that does nothing.
final class NoOpReporter implements AppReporter {
  const NoOpReporter();

  @override
  void failure(AppFailure f, StackTrace? trace) {}

  @override
  void crash(Object error, StackTrace trace) {}

  @override
  void breadcrumb(String message, {Map<String, Object?> data = const {}}) {}
}
