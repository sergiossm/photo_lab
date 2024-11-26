import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/photo/entities/photo.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

abstract class IPhotoRepository {
  Future<void> savePhoto(Photo photo);
  Future<Option<Photo>> getPhotoById(UniqueId id);
  Future<List<Photo>> getAllPhotos();
  Future<void> deletePhoto(UniqueId id);
}
