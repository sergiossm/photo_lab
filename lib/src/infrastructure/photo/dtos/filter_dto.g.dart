// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilerDtoImpl _$$FilerDtoImplFromJson(Map<String, dynamic> json) =>
    _$FilerDtoImpl(
      type: $enumDecode(_$FilterTypeDtoEnumMap, json['type']),
      parameters: (json['parameters'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$FilerDtoImplToJson(_$FilerDtoImpl instance) =>
    <String, dynamic>{
      'type': _$FilterTypeDtoEnumMap[instance.type]!,
      'parameters': instance.parameters,
    };

const _$FilterTypeDtoEnumMap = {
  FilterTypeDto.grayscale: 'grayscale',
  FilterTypeDto.sepia: 'sepia',
  FilterTypeDto.invert: 'invert',
};
