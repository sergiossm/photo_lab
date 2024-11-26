import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/application/photo/states/photos_state.dart';
import 'package:photo_lab/src/application/shared/extensions/riverpod_extensions.dart';
import 'package:photo_lab/src/application/shared/extensions/stream_extensions.dart';
import 'package:photo_lab/src/domain/authentication/entities/authentication_user.dart';
import 'package:photo_lab/src/domain/authentication/facades/i_authentication_facade.dart';
import 'package:photo_lab/src/domain/photo/entities/photo.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_photo_repository.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:rxdart/rxdart.dart';

class PhotosController extends StateNotifier<PhotosState> {
  PhotosController({
    required IAuthenticationFacade authenticationFacade,
    required IPhotoRepository photoRepository,
  })  : _photoRepository = photoRepository,
        _authenticationFacade = authenticationFacade,
        super(const PhotosState());

  final IAuthenticationFacade _authenticationFacade;
  final IPhotoRepository _photoRepository;
  final _compositeSubscription = CompositeSubscription();

  void init() {
    _watchSignedInUserPhotos();
  }

  void _watchSignedInUserPhotos() {
    _authenticationFacade
        .authStateChanges()
        .transform(
          SwitchMapStreamTransformer<Option<AuthenticationUser>, Either<Failure, List<Photo>>>(
            (userIdOption) => userIdOption.fold(
              () => Stream.value(left(const Failure('User is not authenticated'))),
              (authUser) {
                return _photoRepository.watchUserPhotos(authUser.id);
              },
            ),
          ),
        )
        .toAsyncValue()
        .asyncMap((result) {
      setStateSafe(
        () => state = state.copyWith(
          userPhotos: result.when(
            data: AsyncData.new,
            error: AsyncError.new,
            loading: AsyncLoading.new,
          ),
        ),
      );
    }).listenSafe(_compositeSubscription);
  }

  @override
  Future<void> dispose() async {
    await _compositeSubscription.cancel();
    super.dispose();
  }
}
