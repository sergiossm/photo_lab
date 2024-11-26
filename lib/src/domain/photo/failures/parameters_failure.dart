import 'package:photo_lab/src/domain/shared/failures/i_value_failure.dart';

class ParametersFailure extends IValueFailure<List<double>> {
  ParametersFailure({required super.failedValue});
}
