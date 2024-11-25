import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/shared/failures/email_value_failures.dart';
import 'package:photo_lab/src/domain/shared/failures/i_value_failure.dart';
import 'package:photo_lab/src/domain/shared/value_objects/i_value_object.dart';

class EmailAddress extends IValueObject<String> {
  factory EmailAddress(String input) {
    return EmailAddress._(
      _validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);

  @override
  final Either<IValueFailure<String>, String> value;
}

Either<IValueFailure<String>, String> _validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(InvalidEmail(failedValue: input));
  }
}
