import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/shared/extensions/riverpod_extensions.dart';
import 'package:photo_lab/src/application/shared/extensions/stream_extensions.dart';
import 'package:photo_lab/src/application/user/services/user_service.dart';
import 'package:photo_lab/src/application/user/states/user_state.dart';
import 'package:rxdart/rxdart.dart';

class UserController extends StateNotifier<UserState> {
  UserController({
    required UserService userService,
  })  : _userService = userService,
        super(const UserState());

  final UserService _userService;
  final _compositeSubscription = CompositeSubscription();

  void init() {
    _watchSignedInUser();
  }

  Future<void> _watchSignedInUser() async {
    try {
      _userService.watchSignedInUser().toAsyncValue().asyncMap(
        (result) {
          setStateSafe(
            () => state.copyWith(
              user: result,
            ),
          );
        },
      ).listenSafe(_compositeSubscription);
    } catch (e) {
      state = state.copyWith(user: AsyncError(e, StackTrace.current));
    }
  }

  @override
  Future<void> dispose() async {
    await _compositeSubscription.cancel();
    super.dispose();
  }
}
