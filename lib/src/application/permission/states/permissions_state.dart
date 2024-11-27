import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/permission/value_objects/status.dart';

part 'permissions_state.freezed.dart';

@freezed
class PermissionsState with _$PermissionsState {
  const factory PermissionsState({
    @Default((PermissionStatus.denied, false)) (PermissionStatus, bool) cameraStatus,
    @Default((PermissionStatus.denied, false)) (PermissionStatus, bool) photosStatus,
  }) = _PermissionsState;
}
