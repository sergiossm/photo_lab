import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:photo_lab/src/domain/permission/value_objects/status.dart'
    as domain;
import 'package:photo_lab/src/domain/permission/value_objects/type.dart'
    as domain;

extension PermissionStatusMapper on permission_handler.PermissionStatus {
  domain.PermissionStatus toDomain() {
    switch (this) {
      case permission_handler.PermissionStatus.granted:
      case permission_handler.PermissionStatus.limited:
        return domain.PermissionStatus.granted;
      case permission_handler.PermissionStatus.permanentlyDenied:
        return domain.PermissionStatus.permanentlyDenied;
      case permission_handler.PermissionStatus.restricted:
      case permission_handler.PermissionStatus.provisional:
      case permission_handler.PermissionStatus.denied:
        return domain.PermissionStatus.denied;
    }
  }
}

extension PermissionTypeMapper on domain.PermissionType {
  permission_handler.Permission toPermissionHandler() {
    switch (this) {
      case domain.PermissionType.camera:
        return permission_handler.Permission.camera;
      case domain.PermissionType.photos:
        return permission_handler.Permission.photos;
    }
  }
}
