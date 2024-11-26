import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/permission/controllers/permission_controller.dart';
import 'package:photo_lab/src/application/permission/services/permission_service.dart';
import 'package:photo_lab/src/application/permission/states/permissions_state.dart';
import 'package:photo_lab/src/domain/permission/repositories/i_permission_repository.dart';
import 'package:photo_lab/src/infrastructure/permission/data_sources/local/permission_handler_data_source.dart';
import 'package:photo_lab/src/infrastructure/permission/repositories/permission_repository.dart';

//
// Repositories
final permissionRepositoryProvider = Provider<IPermissionRepository>((ref) {
  return PermissionRepository(
    localDataSource: PermissionHandlerDataSource(),
  );
});

//
// Services
final permissionServiceProvider = Provider<PermissionService>((ref) {
  return PermissionService(
    permissionRepository: ref.read(permissionRepositoryProvider),
  );
});

//
// Controllers
final permissionControllerProvider = StateNotifierProvider<PermissionController, PermissionsState>(
  (ref) => PermissionController(
    permissionService: ref.watch(permissionServiceProvider),
  ),
);
