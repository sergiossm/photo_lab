import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/photo/value_objects/filter_type.dart';

@JsonEnum(alwaysCreate: true)
enum FilterTypeDto {
  grayscale,
  sepia,
  invert,
}

extension FilterTypeDtoX on FilterTypeDto {
  FilterType toDomain() {
    switch (this) {
      case FilterTypeDto.grayscale:
        return FilterType.grayscale;
      case FilterTypeDto.sepia:
        return FilterType.sepia;
      case FilterTypeDto.invert:
        return FilterType.invert;
    }
  }
}

extension FilterTypeX on FilterType {
  FilterTypeDto toDto() {
    switch (this) {
      case FilterType.grayscale:
        return FilterTypeDto.grayscale;
      case FilterType.sepia:
        return FilterTypeDto.sepia;
      case FilterType.invert:
        return FilterTypeDto.invert;
    }
  }
}
