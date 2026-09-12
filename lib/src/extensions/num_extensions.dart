/// Nullable num helpers.
extension NullableNumX on num? {
  bool get isZero => (this ?? 0) == 0;

  bool get isNotZero => !isZero;
}
