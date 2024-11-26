import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/authentication/providers.dart';
import 'package:photo_lab/src/application/photo/controllers/photos_controller.dart';
import 'package:photo_lab/src/application/photo/states/photos_state.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_photo_repository.dart';
import 'package:photo_lab/src/infrastructure/photo/data_sources/firestore_photo_data_source.dart';
import 'package:photo_lab/src/infrastructure/photo/repositories/photo_repository.dart';

//
// Repositories
final photoRepositoryProvider = Provider<IPhotoRepository>((ref) {
  return PhotoRepository(remoteDataSource: FirestorePhotoDataSource());
});

//
// Controllers
final photosControllerProvider = StateNotifierProvider<PhotosController, PhotosState>((ref) {
  return PhotosController(
    authenticationFacade: ref.watch(authenticationFacadeProvider),
    photoRepository: ref.watch(photoRepositoryProvider),
  );
});
