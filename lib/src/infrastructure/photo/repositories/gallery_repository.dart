import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_gallery_repository.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/infrastructure/photo/data_sources/gallery_data_source.dart';

class GalleryRepository implements IGalleryRepository {
  GalleryRepository({
    required GalleryDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final GalleryDataSource _localDataSource;

  @override
  Future<Either<Failure, Unit>> saveImage(Uint8List imageBytes) async {
    try {
      await _localDataSource.put(imageBytes);
      return right(unit);
    } catch (e) {
      return left(const Failure('Error saving image'));
    }
  }
}
