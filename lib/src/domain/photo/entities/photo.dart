import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    required UniqueId id,
    required Uri path,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<Filter> appliedFilters,
  }) = _Photo;
}
