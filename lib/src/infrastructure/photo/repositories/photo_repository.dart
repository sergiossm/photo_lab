import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/photo/entities/photo.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_photo_repository.dart';
import 'package:photo_lab/src/domain/shared/data_sources/i_remote_data_source.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';
import 'package:photo_lab/src/infrastructure/photo/dtos/photo_dto.dart';

class PhotoRepository implements IPhotoRepository {
  PhotoRepository({
    required IRemoteDataSource<PhotoDto> remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final IRemoteDataSource<PhotoDto> _remoteDataSource;

  @override
  Stream<Either<Failure, List<Photo>>> watchUserPhotos(UniqueId userId) =>
      _remoteDataSource.watchAllForUser(userId).transform(
            StreamTransformer.fromHandlers(
              handleData: (data, sink) {
                sink.add(right(data.map((photo) => photo.toDomain()).toList()));
              },
              handleError: (error, stackTrace, sink) {
                sink.add(left(Failure('Error watching photos for user $userId')));
              },
            ),
          );

  @override
  Future<Either<Failure, Unit>> savePhoto(Photo photo) async {
    try {
      await _remoteDataSource.upsert(photo.toDto());
      return right(unit);
    } catch (_) {
      return left(const Failure('Error saving photo'));
    }
  }
}
