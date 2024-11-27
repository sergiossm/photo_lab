import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/shared/i_entity.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo implements IEntity {
  const factory Photo({
    required UniqueId id,
    required UniqueId userId,
    required Uri url,
    required DateTime createdAt,
    required DateTime updatedAt,
    required Filter filter,
    DateTime? deletedAt,
  }) = _Photo;
}
