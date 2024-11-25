import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/warmup/services/app_warmup_service.dart';

class AppWarmupController extends StateNotifier<AsyncValue<void>> {
  AppWarmupController({
    required AppWarmupService appWarmupService,
  })  : _appWarmupService = appWarmupService,
        super(const AsyncValue<void>.loading());

  final AppWarmupService _appWarmupService;

  void warmUp() {
    _appWarmupService.warmUp();
    state = const AsyncValue.data(null);
  }

  Future<void> retry() async {
    state = const AsyncValue.loading();
    warmUp();
  }
}
