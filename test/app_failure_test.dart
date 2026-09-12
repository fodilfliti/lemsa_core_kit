import 'package:flutter_test/flutter_test.dart';
import 'package:lemsa_core_kit/lemsa_core_kit.dart';

void main() {
  test('exhaustive switch covers every AppFailure subtype', () {
    const failures = <AppFailure>[
      NetworkFailure(),
      TimeoutFailure(),
      CancelledFailure(),
      NotFoundFailure('x'),
      AuthFailure(AuthReason.expired),
      PermissionFailure('row'),
      ValidationFailure({'email': 'invalid'}),
      ConflictFailure(code: 'dup'),
      ServerFailure(status: 500),
      StorageFailure(),
      UnknownFailure(),
    ];

    for (final f in failures) {
      final label = switch (f) {
        NetworkFailure() => 'network',
        TimeoutFailure() => 'timeout',
        CancelledFailure() => 'cancelled',
        NotFoundFailure(:final what) => 'notFound:$what',
        AuthFailure(:final reason) => 'auth:$reason',
        PermissionFailure(:final what) => 'permission:$what',
        ValidationFailure(:final fields) => 'validation:${fields.length}',
        ConflictFailure(:final code) => 'conflict:$code',
        ServerFailure(:final status) => 'server:$status',
        StorageFailure() => 'storage',
        UnknownFailure() => 'unknown',
      };
      expect(label, isNotEmpty);
    }
  });

  test('AppFailure has no message field', () {
    const f = NetworkFailure();
    expect(
      () => (f as dynamic).message,
      throwsA(isA<NoSuchMethodError>()),
    );
  });
}
