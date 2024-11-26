// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoDtoImpl _$$PhotoDtoImplFromJson(Map<String, dynamic> json) =>
    _$PhotoDtoImpl(
      id: json['id'] as String,
      url: json['url'] as String,
      createdAt: const FirestoreTimestampConverter()
          .fromJson(json['createdAt'] as Timestamp),
      updatedAt: const FirestoreTimestampConverter()
          .fromJson(json['updatedAt'] as Timestamp),
      filter: FilterDto.fromJson(json['filter'] as Map<String, dynamic>),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$PhotoDtoImplToJson(_$PhotoDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'createdAt':
          const FirestoreTimestampConverter().toJson(instance.createdAt),
      'updatedAt':
          const FirestoreTimestampConverter().toJson(instance.updatedAt),
      'filter': instance.filter,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
