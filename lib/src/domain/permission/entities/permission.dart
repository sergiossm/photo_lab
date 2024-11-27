import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/permission/value_objects/status.dart';
import 'package:photo_lab/src/domain/permission/value_objects/type.dart';

part 'permission.freezed.dart';

@freezed
class Permission with _$Permission {
  const factory Permission({
    required PermissionType type,
    required PermissionStatus status,
  }) = _Permission;
}
