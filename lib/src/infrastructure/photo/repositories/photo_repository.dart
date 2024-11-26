import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/photo/entities/photo.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_photo_repository.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/domain/shared/i_dto.dart';
import 'package:photo_lab/src/domain/shared/i_remote_data_source.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';
import 'package:photo_lab/src/infrastructure/photo/dtos/photo_dto.dart';

class PhotoRepository implements IPhotoRepository {
  PhotoRepository({
    required IRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final IRemoteDataSource _remoteDataSource;

  @override
  Stream<Either<Failure, List<Photo>>> watchUserPhotos(UniqueId userId) =>
      _remoteDataSource.watchAllForUser(userId).transform(
            StreamTransformer<List<IDto>, Either<Failure, List<Photo>>>.fromHandlers(
              handleData: (data, sink) {
                final photos = data as List<PhotoDto>;
                sink.add(right(photos.map((photo) => photo.toDomain()).toList()));
              },
              handleError: (error, stackTrace, sink) {
                sink.add(left(Failure('Error watching photos for user $userId')));
              },
            ),
          );
}
