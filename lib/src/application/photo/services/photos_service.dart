import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/application/authentication/authentication_service.dart';
import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/photo/entities/photo.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_gallery_repository.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_photo_repository.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';
import 'package:photo_lab/src/domain/upload/repositories/i_file_upload_repository.dart';

class PhotosService {
  PhotosService({
    required IPhotoRepository photoRepository,
    required IFileUploadRepository fileUploadRepository,
    required IGalleryRepository galleryRepository,
    required AuthenticationService authenticationService,
  })  : _photoRepository = photoRepository,
        _fileUploadRepository = fileUploadRepository,
        _authenticationService = authenticationService,
        _galleryRepository = galleryRepository;

  final IPhotoRepository _photoRepository;
  final IFileUploadRepository _fileUploadRepository;
  final IGalleryRepository _galleryRepository;
  final AuthenticationService _authenticationService;

  Future<Either<String, Unit>> saveImageFromBytes({
    required Uint8List editedImageBytes,
    required Filter filter,
    required Photo? photo,
    required String? filePath,
  }) async {
    final photoId = UniqueId();
    return photoId.value.fold(
      (_) => left('Error saving image'),
      (photoIdString) async {
        return _authenticationService.userId.fold(
          () => left('Error saving image'),
          (userId) => userId.value.fold(
            (_) => left('Error saving image'),
            (userIdString) async {
              final fileName = '${photoIdString}_$userIdString.png';
              return (await _galleryRepository.saveImage(editedImageBytes)).fold(
                (_) => left('Error saving image'),
                (r) async {
                  Uri? url;
                  if (filePath != null) {
                    url = (await _fileUploadRepository.uploadFile(filePath: filePath, fileName: fileName)).fold(
                      (_) => null,
                      (uri) => uri,
                    );
                  } else {
                    url = Uri.parse(filePath!);
                  }
                  final now = DateTime.now();
                  final updatedPhoto = photo?.copyWith(
                        filter: filter,
                        url: url!,
                        updatedAt: now,
                      ) ??
                      Photo(
                        id: photoId,
                        userId: userId,
                        filter: filter,
                        url: url!,
                        createdAt: now,
                        updatedAt: now,
                      );

                  return (await _photoRepository.savePhoto(updatedPhoto)).fold(
                    (_) => left('Error saving image'),
                    (_) => right(unit),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
