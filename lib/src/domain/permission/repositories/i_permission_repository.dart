import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/permission/entities/permission.dart';
import 'package:photo_lab/src/domain/permission/value_objects/type.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';

abstract class IPermissionRepository {
  Future<Either<Failure, Permission>> checkPermission(PermissionType type);
  Future<Either<Failure, Permission>> requestPermission(PermissionType type);
}
