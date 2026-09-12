/// Nullable bool helpers.
extension NullableBoolX on bool? {
  bool get isTrue => this ?? false;

  /// `null` is treated as false (not true).
  bool get isFalse => !(this ?? false);
}
