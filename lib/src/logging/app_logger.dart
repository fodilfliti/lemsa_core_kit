import 'dart:developer' as developer;

import 'package:lemsa_core_kit/src/failure/app_failure.dart';

/// Thin wrapper over [developer.log].
///
/// Optional redact hooks can be added later without changing call sites much.
class AppLogger {
  AppLogger({this.name = 'lemsa'});

  /// Logger name passed to [developer.log].
  final String name;

  void info(String message, {Map<String, Object?>? data}) {
    _log('INFO', message, data);
  }

  void warning(String message, {Object? error}) {
    _log('WARN', message, error == null ? null : {'error': error});
  }

  void failure(AppFailure failure, {String? context}) {
    _log(
      'FAIL',
      context ?? 'failure',
      {'type': failure.runtimeType.toString()},
    );
  }

  void _log(String level, String message, Map<String, Object?>? data) {
    final buffer = StringBuffer('$level: ')..write(message);
    if (data != null && data.isNotEmpty) {
      buffer.write(' $data');
    }
    developer.log(buffer.toString(), name: name);
  }
}
