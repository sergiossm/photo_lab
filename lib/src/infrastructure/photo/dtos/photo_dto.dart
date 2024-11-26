import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/photo/entities/photo.dart';
import 'package:photo_lab/src/domain/shared/i_dto.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';
import 'package:photo_lab/src/infrastructure/photo/dtos/filter_dto.dart';
import 'package:photo_lab/src/infrastructure/shared/firestore_timestamp_converter.dart';

part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';

@freezed
class PhotoDto with _$PhotoDto implements IDto {
  const factory PhotoDto({
    required String id,
    required String url,
    @FirestoreTimestampConverter() required DateTime createdAt,
    @FirestoreTimestampConverter() required DateTime updatedAt,
    required FilterDto filter,
    DateTime? deletedAt,
  }) = _PhotoDto;

  const PhotoDto._();

  factory PhotoDto.fromJson(Map<String, dynamic> json) => _$PhotoDtoFromJson(json);

  @override
  Photo toDomain() {
    return Photo(
      id: UniqueId.fromUniqueString(id),
      url: Uri.parse(url),
      createdAt: createdAt,
      updatedAt: updatedAt,
      filter: filter.toDomain(),
      deletedAt: deletedAt,
    );
  }
}
