import 'package:permission_handler/permission_handler.dart'
    as permission_handler;
import 'package:photo_lab/src/domain/permission/value_objects/status.dart';
import 'package:photo_lab/src/domain/permission/value_objects/type.dart';
import 'package:photo_lab/src/infrastructure/permission/data_sources/permission_mapper.dart';

class PermissionHandlerDataSource {
  Future<PermissionStatus> checkPermission(PermissionType type) async {
    final permission = type.toPermissionHandler();
    final status = await permission.status;
    return status.toDomain();
  }

  Future<PermissionStatus> requestPermission(PermissionType type) async {
    final permission = type.toPermissionHandler();
    final status = await permission.request();
    return status.toDomain();
  }
}
