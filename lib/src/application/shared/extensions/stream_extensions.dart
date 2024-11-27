import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:rxdart/rxdart.dart';

extension StreamX<T> on Stream<T> {
  /// Convert value [Future<T>] into Either
  ///```dart
  /// Either<AppError, T> result = await repository.getFirstResult().toAsyncValue();
  /// ```
  Stream<AsyncValue<T>> toAsyncValue() {
    return map<AsyncValue<T>>(AsyncData<T>.new)
        .onErrorReturnWith((error, stackTrace) {
      // return AsyncError<T>(const AppError(), stackTrace);
      return AsyncError<T>('ERROR', stackTrace);
    });
  }

  /// Subscibe to the [CompositeSubscription] safely
  ///```dart
  /// repository.listenSafe(compositeSubscription);
  /// ```
  void listenSafe(
    CompositeSubscription compositeSubscription, {
    dynamic Function(T event)? onData,
  }) {
    compositeSubscription.add(listen(onData));
  }
}

extension StreamEitherX<T> on Stream<Either<Failure, T>> {
  Stream<AsyncValue<T>> toAsyncValue() {
    return map<AsyncValue<T>>(
      (value) => value.fold(
        (left) => AsyncError<T>(left, StackTrace.current),
        AsyncData.new,
      ),
    ).onErrorReturnWith((error, stackTrace) {
      return AsyncError<T>(left, stackTrace);
    });
  }
}
