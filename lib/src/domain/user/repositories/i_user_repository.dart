import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';
import 'package:photo_lab/src/domain/user/entities/user.dart';

abstract class IUserRepository {
  Future<Either<Failure, Unit>> upsertUser(User user);
  Stream<Option<User>> watchUser(UniqueId id);
}
