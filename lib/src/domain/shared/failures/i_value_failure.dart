abstract class IValueFailure<T> {
  IValueFailure({required this.failedValue});

  final T failedValue;
}
