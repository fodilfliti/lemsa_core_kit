import 'package:flutter/material.dart';
import 'package:lemsa_core_kit/lemsa_core_kit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final result = await Result.guard(() async {
    if ('1,5'.toDoubleValue.isZero) {
      throw const ValidationFailure({'amount': 'zero'});
    }
    return 'ok';
  });

  final label = switch (result) {
    Ok(:final value) => value,
    Err(:final failure) => failure.runtimeType.toString(),
  };

  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(child: Text('lemsa_core_kit smoke: $label')),
      ),
    ),
  );
}
