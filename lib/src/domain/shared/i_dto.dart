import 'package:photo_lab/src/domain/shared/i_entity.dart';

abstract class IDto {
  String get id;
  Map<String, dynamic> toJson();
  IEntity toDomain();
}
