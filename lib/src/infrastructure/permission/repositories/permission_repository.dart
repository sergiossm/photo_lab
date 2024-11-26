import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/permission/entities/permission.dart';
import 'package:photo_lab/src/domain/permission/repositories/i_permission_repository.dart';
import 'package:photo_lab/src/domain/permission/value_objects/type.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/infrastructure/permission/data_sources/local/permission_handler_data_source.dart';

class PermissionRepository implements IPermissionRepository {
  PermissionRepository({
    required PermissionHandlerDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final PermissionHandlerDataSource _localDataSource;

  @override
  Future<Either<Failure, Permission>> checkPermission(PermissionType type) async {
    try {
      final status = await _localDataSource.checkPermission(type);
      final permission = Permission(
        type: type,
        status: status,
      );
      return right(permission);
    } catch (_) {
      return left(Failure('Error checking permission $type'));
    }
  }

  @override
  Future<Either<Failure, Permission>> requestPermission(PermissionType type) async {
    try {
      final status = await _localDataSource.requestPermission(type);
      final permission = Permission(
        type: type,
        status: status,
      );
      return right(permission);
    } catch (_) {
      return left(Failure('Error requesting permission $type'));
    }
  }
}
