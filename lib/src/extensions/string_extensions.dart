/// Nullable string helpers.
extension NullableStringX on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Empty string when null.
  String get text => this ?? '';

  /// Parses as double; commas become dots (`"1,5"` → `1.5`). Null/empty → `0`.
  double get toDoubleValue {
    final raw = text.isEmpty ? '0' : text.replaceAll(',', '.');
    return double.tryParse(raw) ?? 0;
  }

  /// Parses as int after comma→dot. Null/empty → `0`.
  int get toIntValue {
    final raw = text.isEmpty ? '0' : text.replaceAll(',', '.');
    return int.tryParse(raw) ?? 0;
  }
}
