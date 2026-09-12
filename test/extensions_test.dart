import 'package:flutter_test/flutter_test.dart';
import 'package:lemsa_core_kit/lemsa_core_kit.dart';

void main() {
  group('String?', () {
    test('isNullOrEmpty / isNotNullOrEmpty / text', () {
      String? s;
      expect(s.isNullOrEmpty, isTrue);
      expect(s.isNotNullOrEmpty, isFalse);
      expect(s.text, '');
      expect(''.isNullOrEmpty, isTrue);
      expect('a'.isNotNullOrEmpty, isTrue);
    });

    test('toDoubleValue handles comma decimals', () {
      expect('1,5'.toDoubleValue, 1.5);
      expect('2.5'.toDoubleValue, 2.5);
      expect(null.toDoubleValue, 0);
      expect(''.toDoubleValue, 0);
    });

    test('toIntValue', () {
      expect('3'.toIntValue, 3);
      expect(null.toIntValue, 0);
      // Comma→dot then int.tryParse; "1.0" is not a valid int literal.
      expect('1,0'.toIntValue, 0);
      expect('10'.toIntValue, 10);
    });
  });

  group('num?', () {
    test('isZero / isNotZero', () {
      num? n;
      expect(n.isZero, isTrue);
      expect(0.isZero, isTrue);
      expect(1.isNotZero, isTrue);
    });
  });

  group('bool?', () {
    test('isTrue / isFalse', () {
      bool? b;
      expect(b.isTrue, isFalse);
      expect(b.isFalse, isTrue);
      expect(true.isTrue, isTrue);
      expect(false.isFalse, isTrue);
    });
  });

  group('List', () {
    test('nonNullsList', () {
      expect([1, null, 2].nonNullsList, [1, 2]);
    });
  });

  group('DateTime', () {
    test('toDate', () {
      final dt = DateTime(2026, 9, 12, 14, 30);
      expect(dt.toDate, DateTime(2026, 9, 12));
    });
  });
}
