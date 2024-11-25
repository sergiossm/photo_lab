import 'package:photo_lab/src/application/user/contollers/user_controller.dart';

class AppWarmupService {
  AppWarmupService({
    required this.isAuthenticated,
    required UserController userController,
  }) : _userController = userController;

  final bool isAuthenticated;
  final UserController _userController;

  void warmUp() {
    // Assumming guest mode doesn't exist in this app, we don't need to warm up anything if the user is not authenticated
    if (!isAuthenticated) return;

    _userController.init();
  }
}
