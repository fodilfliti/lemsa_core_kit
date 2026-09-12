import 'package:flutter_test/flutter_test.dart';
import 'package:lemsa_core_kit/lemsa_core_kit.dart';

void main() {
  test('Change subtypes carry payload', () {
    const Change<int> created = Created(1);
    const updated = Updated<int>(2);
    const deleted = Deleted<int>('id-3');

    final label = switch (created) {
      Created(:final item) => 'c$item',
      Updated(:final item) => 'u$item',
      Deleted(:final id) => 'd$id',
    };
    expect(label, 'c1');
    expect(updated.item, 2);
    expect(deleted.id, 'id-3');
  });

  test('NoOpReporter is callable', () {
    const reporter = NoOpReporter();
    reporter.failure(const NetworkFailure(), null);
    reporter.crash(Exception('x'), StackTrace.empty);
    reporter.breadcrumb('hi', data: {'a': 1});
    expect(reporter, isA<AppReporter>());
  });

  test('AppLogger does not throw', () {
    final log = AppLogger(name: 'test');
    log
      ..info('hello', data: {'k': 'v'})
      ..warning('warn', error: 'e')
      ..failure(const TimeoutFailure());
    expect(log.name, 'test');
  });
}
