import 'package:photo_lab/src/domain/permission/entities/permission.dart';
import 'package:photo_lab/src/domain/permission/events/i_permission_event.dart';

class PermissionStatusChanged extends IPermissionEvent {
  PermissionStatusChanged(this.permission);

  final Permission permission;
}
