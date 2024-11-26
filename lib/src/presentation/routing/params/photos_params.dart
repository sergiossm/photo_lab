import 'package:photo_lab/src/domain/photo/entities/photo.dart';

class EditPhotoParams {
  EditPhotoParams({this.photo, this.filePath});

  final Photo? photo;
  final String? filePath;
}
