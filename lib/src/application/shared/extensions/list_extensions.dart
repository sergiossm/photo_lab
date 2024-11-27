extension ListX<T> on List<T> {
  /// Returns the single element that satisfies the given [test], or `null` if
  /// there is none or more than one element that satisfies the given [test].
  T? singleWhereOrNull(bool Function(T element) test) {
    T? result;
    var found = false;
    for (final element in this) {
      if (test(element)) {
        if (!found) {
          result = element;
          found = true;
        } else {
          return null;
        }
      }
    }
    return result;
  }
}
