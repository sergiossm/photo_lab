import 'package:photo_lab/src/application/photo/controllers/filters_controller.dart';
import 'package:photo_lab/src/application/photo/controllers/photos_controller.dart';
import 'package:photo_lab/src/application/user/contollers/user_controller.dart';

class AppWarmupService {
  AppWarmupService({
    required UserController userController,
    required PhotosController photosController,
    required FiltersController filtersController,
  })  : _userController = userController,
        _photosController = photosController,
        _filtersController = filtersController;

  final UserController _userController;
  final PhotosController _photosController;
  final FiltersController _filtersController;

  void warmUp() {
    _userController.init();
    _photosController.init();
    _filtersController.init();
  }
}
