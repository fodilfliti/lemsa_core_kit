import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lemsa_core_kit/lemsa_core_kit.dart';

class _Probe extends ChangeNotifier {
  _Probe(this.name, this.order);

  final String name;
  final List<String> order;
  bool disposed = false;

  @override
  void dispose() {
    disposed = true;
    order.add(name);
    super.dispose();
  }
}

void main() {
  test('Disposables disposes in reverse registration order', () {
    final order = <String>[];
    final disposables = Disposables()
      ..keep(_Probe('A', order))
      ..keep(_Probe('B', order))
      ..keep(_Probe('C', order));

    expect(disposables.debugLength, 3);
    disposables.dispose();
    expect(order, ['C', 'B', 'A']);
    expect(disposables.debugLength, 0);

    // Idempotent.
    disposables.dispose();
    expect(order, ['C', 'B', 'A']);
  });

  test('keepDisposer runs in reverse with keep', () {
    final order = <String>[];
    Disposables()
      ..keep(_Probe('A', order))
      ..keepDisposer(() => order.add('D'))
      ..dispose();
    expect(order, ['D', 'A']);
  });
}
