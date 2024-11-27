import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';

abstract class IFileUploadRepository {
  Future<Either<Failure, Uri>> uploadFile({required String filePath, required String fileName});
}
