import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/domain/upload/repositories/i_file_upload_repository.dart';
import 'package:photo_lab/src/infrastructure/upload/data_sources/firebase_storage_data_source.dart';

class FileUploadRepository implements IFileUploadRepository {
  FileUploadRepository({
    required FirebaseStorageDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final FirebaseStorageDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Uri>> uploadFile({required String filePath, required String fileName}) async {
    try {
      final url = await _remoteDataSource.uploadFile(filePath: filePath, fileName: fileName);
      return right(Uri.parse(url));
    } catch (_) {
      return left(const Failure('Error uploading files'));
    }
  }
}
