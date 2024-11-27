import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/photo/entities/photo.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

abstract class IPhotoRepository {
  Stream<Either<Failure, List<Photo>>> watchUserPhotos(UniqueId userId);
  Future<Either<Failure, Unit>> savePhoto(Photo photo);
}
