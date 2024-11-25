import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/shared/failures/i_value_failure.dart';
import 'package:photo_lab/src/domain/shared/value_objects/i_value_object.dart';
import 'package:uuid/uuid.dart';

const _base62Chars =
    '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

// Unique ID that matches the format of Firebase's IDs
class UniqueId extends IValueObject<String> {
  // We cannot let a simple String be passed in.
  // This would allow for possible non-unique IDs.
  factory UniqueId() {
    const uuid = Uuid();

    // Generate a random UUID (UUID v4)
    final uuidV4 = uuid.v4();

    // Convert the UUID string to a BigInt
    final uuidBigInt = BigInt.parse(uuidV4.replaceAll('-', ''), radix: 16);

    // Convert the BigInt to a base62 string
    var base62Str = _toBase62(uuidBigInt);

    // Ensure the string is 20 characters long by padding or truncating if necessary
    if (base62Str.length > 20) {
      base62Str = base62Str.substring(0, 20);
    } else {
      base62Str =
          base62Str.padLeft(20, '0'); // Pad with leading zeros if necessary
    }

    return UniqueId._(right(base62Str));
  }

  /// Used with strings we trust are unique, such as database IDs.
  factory UniqueId.fromUniqueString(String uniqueIdStr) {
    return UniqueId._(
      right(uniqueIdStr),
    );
  }

  const UniqueId._(this.value);

  static String _toBase62(BigInt number) {
    var base62Str = '';
    var num = number;
    while (num > BigInt.zero) {
      final remainder = num % BigInt.from(62);
      base62Str = _base62Chars[remainder.toInt()] + base62Str;
      num = num ~/ BigInt.from(62);
    }
    return base62Str;
  }

  @override
  final Either<IValueFailure<String>, String> value;
}
