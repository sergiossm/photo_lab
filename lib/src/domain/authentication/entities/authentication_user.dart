import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/shared/value_objects/email_address.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

part 'authentication_user.freezed.dart';

@freezed
class AuthenticationUser with _$AuthenticationUser {
  const factory AuthenticationUser({
    required UniqueId id,
    required EmailAddress emailAddress,
    Uri? photoUrl,
    String? displayName,
  }) = _AuthenticationUser;
}
