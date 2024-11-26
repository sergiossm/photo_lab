import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/shared/data_sources/i_remote_data_source.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';
import 'package:photo_lab/src/domain/user/entities/user.dart';
import 'package:photo_lab/src/domain/user/repositories/i_user_repository.dart';
import 'package:photo_lab/src/infrastructure/user/dtos/user_dto.dart';

class UserRepository implements IUserRepository {
  UserRepository({
    required IRemoteDataSource<UserDto> remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final IRemoteDataSource<UserDto> _remoteDataSource;

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
        StreamTransformer.fromHandlers(
          handleData: (userDto, sink) {
            sink.add(some(userDto.toDomain()));
          },
          handleError: (error, stackTrace, sink) {
            sink.add(none());
          },
        ),
      );
}
