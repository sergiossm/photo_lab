import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/permission/services/permission_service.dart';
import 'package:photo_lab/src/application/permission/states/permissions_state.dart';
import 'package:photo_lab/src/application/shared/extensions/riverpod_extensions.dart';
import 'package:photo_lab/src/domain/permission/events/permission_requested.dart';
import 'package:photo_lab/src/domain/permission/events/permission_status_changed.dart';
import 'package:photo_lab/src/domain/permission/value_objects/type.dart';
import 'package:rxdart/rxdart.dart';

class PermissionController extends StateNotifier<PermissionsState> {
  PermissionController({
    required PermissionService permissionService,
  })  : _permissionService = permissionService,
        super(const PermissionsState()) {
    _subscribeToEvents();
  }

  final PermissionService _permissionService;
  final _compositeSubscription = CompositeSubscription();

  void _subscribeToEvents() {
    _compositeSubscription.add(
      _permissionService.permissionEvents.listen((event) {
        event.fold(
          (_) {},
          _handlePermissionEvent,
        );
      }),
    );
  }

  void _handlePermissionEvent(dynamic r) {
    switch (r.runtimeType) {
      case PermissionRequested:
        _handlePermissionRequested(r as PermissionRequested);
        return;
      case PermissionStatusChanged:
        _handlePermissionStatusChanged(r as PermissionStatusChanged);
        return;
    }
  }

  void _handlePermissionRequested(PermissionRequested r) {
    final permissionType = r.type;
    switch (permissionType) {
      case PermissionType.camera:
        setStateSafe(() => state = state.copyWith(cameraStatus: (state.cameraStatus.$1, true)));
        return;
      case PermissionType.photos:
        setStateSafe(() => state = state.copyWith(photosStatus: (state.photosStatus.$1, true)));
        return;
    }
  }

  void _handlePermissionStatusChanged(PermissionStatusChanged r) {
    final permission = r.permission;
    switch (permission.type) {
      case PermissionType.camera:
        setStateSafe(() => state = state.copyWith(cameraStatus: (permission.status, false)));
        return;
      case PermissionType.photos:
        setStateSafe(() => state = state.copyWith(photosStatus: (permission.status, false)));
        return;
    }
  }

  @override
  void dispose() {
    _compositeSubscription.dispose();
    super.dispose();
  }
}
