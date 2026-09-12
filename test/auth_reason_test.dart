import 'package:flutter_test/flutter_test.dart';
import 'package:lemsa_core_kit/lemsa_core_kit.dart';

void main() {
  test('AuthReason switch is exhaustive', () {
    for (final reason in AuthReason.values) {
      final label = switch (reason) {
        AuthReason.invalidCredentials => 'invalidCredentials',
        AuthReason.emailNotConfirmed => 'emailNotConfirmed',
        AuthReason.expired => 'expired',
        AuthReason.signedOut => 'signedOut',
        AuthReason.disabled => 'disabled',
        AuthReason.rateLimited => 'rateLimited',
      };
      expect(label, reason.name);
    }
  });
}
