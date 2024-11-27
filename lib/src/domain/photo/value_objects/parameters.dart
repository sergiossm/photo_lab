import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/photo/failures/parameters_failure.dart';
import 'package:photo_lab/src/domain/shared/failures/i_value_failure.dart';
import 'package:photo_lab/src/domain/shared/value_objects/i_value_object.dart';

class Parameters extends IValueObject<List<double>> {
  factory Parameters(List<double> input) {
    return Parameters._(
      _validateParameters(input),
    );
  }

  const Parameters._(this.value);

  @override
  final Either<IValueFailure<List<double>>, List<double>> value;
}

Either<IValueFailure<List<double>>, List<double>> _validateParameters(List<double> input) {
  /// Validates the input parameters for constructing a color filter matrix.
  ///
  /// The color filter matrix is expected to be a 4x5 matrix represented in row-major order,
  /// resulting in a list of 20 elements. This matrix is used to transform color values by
  /// matrix multiplication, where each pixel's color `[R, G, B, A]` is multiplied to create
  /// a new color. The additional 5th column allows for translation in the color space.
  ///
  /// This validation ensures that the input list has exactly 20 elements, corresponding to
  /// the 4 rows and 5 columns of the expected matrix format. If the input does not meet this
  /// requirement, it returns a [ValueFailure.invalidInput] with the failed value.
  ///
  /// Returns:
  /// - [Right] with the valid input if the length is 20.
  /// - [Left] with a [ParametersFailure] if the length is not 20.
  ///
  /// This check is crucial because an incorrect matrix size would result in improper color transformations,
  /// potentially leading to runtime errors or unintended visual effects.
  if (input.length != 20) {
    return Left(ParametersFailure(failedValue: input));
  }
  return Right(input);
}
