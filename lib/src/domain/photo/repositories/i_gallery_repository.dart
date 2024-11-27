import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';

abstract class IGalleryRepository {
  Future<Either<Failure, Unit>> saveImage(Uint8List imageBytes);
}
