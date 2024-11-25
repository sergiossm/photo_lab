import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/authentication/entities/authentication_user.dart';
import 'package:photo_lab/src/domain/shared/i_entity.dart';
import 'package:photo_lab/src/domain/shared/value_objects/email_address.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

part 'user.freezed.dart';

@freezed
class User with _$User implements IEntity {
  const factory User({
    required UniqueId id,
    required EmailAddress emailAddress,
    required String displayName,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    Uri? photoUrl,
  }) = _User;

  factory User.fromAuthenticationUser(AuthenticationUser authUser) {
    return User(
      id: authUser.id,
      emailAddress: authUser.emailAddress,
      displayName: authUser.displayName ?? 'N/A',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      photoUrl: authUser.photoUrl,
    );
  }
}
