import 'package:photo_lab/src/domain/permission/events/i_permission_event.dart';
import 'package:photo_lab/src/domain/permission/value_objects/type.dart';

class PermissionRequested extends IPermissionEvent {
  PermissionRequested(this.type);

  final PermissionType type;
}
