import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_lab/src/domain/photo/entities/photo.dart';

part 'photos_state.freezed.dart';

@freezed
class PhotosState with _$PhotosState {
  const factory PhotosState({
    @Default(AsyncLoading<List<Photo>>()) AsyncValue<List<Photo>> userPhotos,
  }) = _PhotosState;
}
