/// Mutation event for list / cache sync.
sealed class Change<T> {
  const Change();
}

/// Entity was created.
final class Created<T> extends Change<T> {
  const Created(this.item);

  final T item;
}

/// Entity was updated.
final class Updated<T> extends Change<T> {
  const Updated(this.item);

  final T item;
}

/// Entity was deleted.
final class Deleted<T> extends Change<T> {
  const Deleted(this.id);

  final String id;
}
