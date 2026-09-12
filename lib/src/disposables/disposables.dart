import 'package:flutter/foundation.dart';

/// Registry of owned resources disposed in reverse registration order.
///
/// Controllers create fields through [keep] / [keepDisposer]. Only the page
/// owner should call [dispose].
class Disposables {
  final List<void Function()> _disposers = [];

  /// Registers a [ChangeNotifier] for dispose. Returns [value] for fields.
  R keep<R extends ChangeNotifier>(R value) {
    _disposers.add(value.dispose);
    return value;
  }

  /// Registers an arbitrary disposer (e.g. `subscription.cancel`).
  void keepDisposer(void Function() dispose) {
    _disposers.add(dispose);
  }

  /// Disposes in reverse registration order. Safe to call twice.
  void dispose() {
    for (final disposer in _disposers.reversed) {
      disposer();
    }
    _disposers.clear();
  }

  /// Number of registered disposers (tests / debug).
  int get debugLength => _disposers.length;
}
