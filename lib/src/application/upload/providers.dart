import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/domain/upload/repositories/i_file_upload_repository.dart';
import 'package:photo_lab/src/infrastructure/upload/data_sources/firebase_storage_data_source.dart';
import 'package:photo_lab/src/infrastructure/upload/repositories/file_upload_repository.dart';

final fileUploadRepositoryProvider = Provider<IFileUploadRepository>(
  (ref) => FileUploadRepository(
    remoteDataSource: FirebaseStorageDataSource(),
  ),
);
