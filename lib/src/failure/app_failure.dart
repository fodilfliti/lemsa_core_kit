/// Sealed application failure hierarchy.
///
/// Carries no user-facing message. Localize at the render site.
sealed class AppFailure implements Exception {
  const AppFailure({this.cause, this.trace});

  /// Underlying cause for reporters — never shown to users.
  final Object? cause;

  /// Stack for reporters — never shown to users.
  final StackTrace? trace;
}

/// Connectivity / transport failure.
final class NetworkFailure extends AppFailure {
  const NetworkFailure({super.cause, super.trace});
}

/// Deadline exceeded.
final class TimeoutFailure extends AppFailure {
  const TimeoutFailure({super.cause, super.trace});
}

/// User or client cancelled the operation.
///
/// Never report and never show in UI.
final class CancelledFailure extends AppFailure {
  const CancelledFailure();
}

/// Resource missing.
final class NotFoundFailure extends AppFailure {
  const NotFoundFailure(this.what, {super.cause});

  /// What was not found (resource key / label for app mapping).
  final String what;
}

/// Authentication / session failure.
final class AuthFailure extends AppFailure {
  const AuthFailure(this.reason, {super.cause});

  final AuthReason reason;
}

/// Authorization / permission failure.
final class PermissionFailure extends AppFailure {
  const PermissionFailure(this.what, {super.cause});

  final String what;
}

/// Field-level validation failure.
final class ValidationFailure extends AppFailure {
  const ValidationFailure(this.fields, {super.cause});

  /// Field name → machine/token string for the app to localize.
  final Map<String, String> fields;
}

/// Conflict (e.g. duplicate / version clash).
final class ConflictFailure extends AppFailure {
  const ConflictFailure({this.code, super.cause});

  final String? code;
}

/// Upstream server error.
final class ServerFailure extends AppFailure {
  const ServerFailure({this.status, this.code, super.cause, super.trace});

  final int? status;
  final String? code;
}

/// Local storage / filesystem failure.
final class StorageFailure extends AppFailure {
  const StorageFailure({super.cause, super.trace});
}

/// Unexpected failure.
final class UnknownFailure extends AppFailure {
  const UnknownFailure({super.cause, super.trace});
}

/// Reasons for [AuthFailure].
enum AuthReason {
  invalidCredentials,
  emailNotConfirmed,
  expired,
  signedOut,
  disabled,
  rateLimited,
}
