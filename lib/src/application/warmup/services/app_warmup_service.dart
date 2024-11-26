import 'package:photo_lab/src/application/photo/controllers/filters_controller.dart';
import 'package:photo_lab/src/application/photo/controllers/photos_controller.dart';
import 'package:photo_lab/src/application/user/contollers/user_controller.dart';

class AppWarmupService {
  AppWarmupService({
    required this.isAuthenticated,
    required UserController userController,
    required PhotosController photosController,
    required FiltersController filtersController,
  })  : _userController = userController,
        _photosController = photosController,
        _filtersController = filtersController;

  final bool isAuthenticated;
  final UserController _userController;
  final PhotosController _photosController;
  final FiltersController _filtersController;

  void warmUp() {
    // Assumming guest mode doesn't exist in this app, we don't need to warm up anything if the user is not authenticated
    if (!isAuthenticated) return;

    _userController.init();
    _photosController.init();
    _filtersController.init();
  }
}
