import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/photo/value_objects/parameters.dart';
import 'package:photo_lab/src/domain/shared/i_dto.dart';
import 'package:photo_lab/src/infrastructure/photo/dtos/filter_type_dto.dart';

part 'filter_dto.freezed.dart';
part 'filter_dto.g.dart';

@freezed
class FilterDto with _$FilterDto implements IDto {
  const factory FilterDto({
    required FilterTypeDto type,
    required List<double> parameters,
  }) = _FilerDto;

  factory FilterDto.fromJson(Map<String, dynamic> json) => _$FilterDtoFromJson(json);

  const FilterDto._();

  @override
  String get id => throw UnimplementedError();

  @override
  Filter toDomain() {
    return Filter(
      type: type.toDomain(),
      parameters: Parameters(parameters),
    );
  }
}
