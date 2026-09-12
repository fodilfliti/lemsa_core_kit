/// Nullable list helpers.
extension NullableListX<T> on List<T?> {
  /// Non-null elements as a new list.
  List<T> get nonNullsList => whereType<T>().toList();
}
