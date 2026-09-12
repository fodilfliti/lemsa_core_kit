import 'package:flutter_test/flutter_test.dart';
import 'package:lemsa_core_kit/lemsa_core_kit.dart';

void main() {
  test('Result.guard maps success to Ok', () async {
    final result = await Result.guard(() async => 42);
    expect(result, isA<Ok<int>>());
    expect(result.valueOrNull, 42);
    expect(result.isOk, isTrue);
    expect(result.failureOrNull, isNull);
  });

  test('Result.guard maps thrown AppFailure to Err', () async {
    final result = await Result.guard<int>(() async {
      throw const NetworkFailure();
    });
    expect(result, isA<Err<int>>());
    expect(result.isOk, isFalse);
    expect(result.failureOrNull, isA<NetworkFailure>());
  });

  test('Result.guard propagates non-AppFailure', () async {
    await expectLater(
      Result.guard<int>(() async {
        throw StateError('boom');
      }),
      throwsA(isA<StateError>()),
    );
  });

  test('orElse recovers from Err', () {
    const Result<int> result = Err(NetworkFailure());
    expect(result.orElse((_) => 7), 7);
  });
}
