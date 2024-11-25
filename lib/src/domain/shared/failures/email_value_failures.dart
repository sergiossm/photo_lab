import 'package:photo_lab/src/domain/shared/failures/i_value_failure.dart';

class InvalidEmail<T> extends IValueFailure<T> {
  InvalidEmail({required super.failedValue});
}
