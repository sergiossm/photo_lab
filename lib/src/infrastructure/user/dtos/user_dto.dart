import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/shared/i_dto.dart';
import 'package:photo_lab/src/domain/shared/value_objects/email_address.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';
import 'package:photo_lab/src/domain/user/entities/user.dart';
import 'package:photo_lab/src/infrastructure/shared/firestore_timestamp_converter.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto implements IDto {
  const factory UserDto({
    required String id,
    required String emailAddress,
    @FirestoreTimestampConverter() required DateTime createdAt,
    @FirestoreTimestampConverter() required DateTime updatedAt,
    @FirestoreTimestampConverter() DateTime? deletedAt,
    String? displayName,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  @override
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(id),
      emailAddress: EmailAddress(emailAddress),
      displayName: displayName ?? '',
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}

extension UserX on User {
  UserDto toDto() {
    return UserDto(
      id: id.getOrCrash(),
      displayName: displayName,
      emailAddress: emailAddress.getOrCrash(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }
}
