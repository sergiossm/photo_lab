import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/permission/entities/permission.dart';
import 'package:photo_lab/src/domain/permission/events/i_permission_event.dart';
import 'package:photo_lab/src/domain/permission/events/permission_requested.dart';
import 'package:photo_lab/src/domain/permission/events/permission_status_changed.dart';
import 'package:photo_lab/src/domain/permission/repositories/i_permission_repository.dart';
import 'package:photo_lab/src/domain/permission/value_objects/status.dart';
import 'package:photo_lab/src/domain/permission/value_objects/type.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:rxdart/rxdart.dart';

class PermissionService {
  PermissionService({
    required IPermissionRepository permissionRepository,
  }) : _repository = permissionRepository;

  final IPermissionRepository _repository;
  final _permissionEventSubject = PublishSubject<Either<Failure, IPermissionEvent>>();

  Stream<Either<Failure, IPermissionEvent>> get permissionEvents => _permissionEventSubject.stream;

  Future<Either<Failure, Permission>> checkAndRequestPermission(PermissionType type) async {
    _permissionEventSubject.add(right(PermissionRequested(type)));

    final permissionOrFailure = await _repository.checkPermission(type);
    if (permissionOrFailure.isLeft()) {
      final failureOption = permissionOrFailure.getLeft();
      final failure = failureOption.getOrElse(() => Failure('Error checking permission $type'));
      _permissionEventSubject.add(left(failure));
      return left(failure);
    }

    final permission = permissionOrFailure.getRight().fold(() => null, (t) => t)!;
    if (permission.status != PermissionStatus.granted) {
      final updatedPermissionOrFailure = await _repository.requestPermission(type);
      if (updatedPermissionOrFailure.isLeft()) {
        final failureOption = updatedPermissionOrFailure.getLeft();
        final failure = failureOption.getOrElse(() => Failure('Error requesting permission $type'));
        _permissionEventSubject.add(left(failure));
        return left(failure);
      }
      final updatedPermission = updatedPermissionOrFailure.getRight().fold(() => null, (t) => t)!;
      _permissionEventSubject.add(right(PermissionStatusChanged(updatedPermission)));
      return updatedPermissionOrFailure;
    }

    _permissionEventSubject.add(right(PermissionStatusChanged(permission)));
    return permissionOrFailure;
  }

  Future<Either<Failure, Permission>> requestPermission(PermissionType type) async {
    _permissionEventSubject.add(right(PermissionRequested(type)));

    final permissionOrFailure = await _repository.requestPermission(type);
    if (permissionOrFailure.isLeft()) {
      final failureOption = permissionOrFailure.getLeft();
      final failure = failureOption.getOrElse(() => Failure('Error requesting permission $type'));
      _permissionEventSubject.add(left(failure));
      return left(failure);
    }
    final updatedPermission = permissionOrFailure.getRight().fold(() => null, (t) => t)!;
    _permissionEventSubject.add(right(PermissionStatusChanged(updatedPermission)));
    return permissionOrFailure;
  }

  void dispose() {
    _permissionEventSubject.close();
  }
}
