import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/domain/shared/i_dto.dart';
import 'package:photo_lab/src/domain/shared/i_remote_data_source.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';
import 'package:photo_lab/src/domain/user/entities/user.dart';
import 'package:photo_lab/src/domain/user/repositories/i_user_repository.dart';
import 'package:photo_lab/src/infrastructure/user/dtos/user_dto.dart';

class UserRepository implements IUserRepository {
  UserRepository({
    required IRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final IRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Unit>> upsertUser(User user) async {
    try {
      final dto = user.toDto();
      await _remoteDataSource.upsert(dto);
      return right(unit);
    } catch (_) {
      return left(const Failure('Error upserting user'));
    }
  }

  @override
  Stream<Option<User>> watchUser(UniqueId userId) => _remoteDataSource.watch(userId).transform(
        StreamTransformer<IDto, Option<User>>.fromHandlers(
          handleData: (userDto, sink) {
            final user = userDto.toDomain() as User;
            sink.add(some(user));
          },
          handleError: (error, stackTrace, sink) {
            sink.add(none());
          },
        ),
      );
}
