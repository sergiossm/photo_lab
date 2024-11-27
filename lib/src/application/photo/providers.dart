import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/authentication/providers.dart';
import 'package:photo_lab/src/application/photo/controllers/filters_controller.dart';
import 'package:photo_lab/src/application/photo/controllers/photos_controller.dart';
import 'package:photo_lab/src/application/photo/services/edit_history_service.dart';
import 'package:photo_lab/src/application/photo/services/photos_service.dart';
import 'package:photo_lab/src/application/photo/states/filters_state.dart';
import 'package:photo_lab/src/application/photo/states/photos_state.dart';
import 'package:photo_lab/src/application/upload/providers.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_filter_repository.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_gallery_repository.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_photo_repository.dart';
import 'package:photo_lab/src/infrastructure/photo/data_sources/firestore_photo_data_source.dart';
import 'package:photo_lab/src/infrastructure/photo/data_sources/gallery_data_source.dart';
import 'package:photo_lab/src/infrastructure/photo/data_sources/in_memory_filter_data_source.dart';
import 'package:photo_lab/src/infrastructure/photo/repositories/filter_repository.dart';
import 'package:photo_lab/src/infrastructure/photo/repositories/gallery_repository.dart';
import 'package:photo_lab/src/infrastructure/photo/repositories/photo_repository.dart';

//
// Repositories
final photoRepositoryProvider = Provider<IPhotoRepository>((ref) {
  return PhotoRepository(remoteDataSource: FirestorePhotoDataSource());
});

final filterRepositoryProvider = Provider<IFilterRepository>((ref) {
  return FilterRepository(localDataSource: InMemoryFilterDataSource());
});

final galleryRepositoryProvider = Provider<IGalleryRepository>((ref) {
  return GalleryRepository(localDataSource: GalleryDataSource());
});

//
// Services
final editHistoryServiceProvider = Provider<EditHistoryService>((ref) {
  return EditHistoryService();
});

final photosServiceProvider = Provider<PhotosService>((ref) {
  return PhotosService(
    photoRepository: ref.watch(photoRepositoryProvider),
    fileUploadRepository: ref.watch(fileUploadRepositoryProvider),
    galleryRepository: ref.watch(galleryRepositoryProvider),
    authenticationService: ref.watch(authenticationServiceProvider),
  );
});

//
// Controllers
final photosControllerProvider = StateNotifierProvider<PhotosController, PhotosState>((ref) {
  return PhotosController(
    authenticationFacade: ref.watch(authenticationFacadeProvider),
    photoRepository: ref.watch(photoRepositoryProvider),
  );
});

final filtersControllerProvider = StateNotifierProvider<FiltersController, FiltersState>((ref) {
  return FiltersController(filterRepository: ref.watch(filterRepositoryProvider));
});
