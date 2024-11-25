import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppWarmupNotifier extends StateNotifier<AsyncValue<void>> {
  AppWarmupNotifier() : super(const AsyncValue<void>.loading());

  Future<void> warmUp() async {}

  Future<void> retry() async {
    state = const AsyncValue.loading();
    await warmUp();
  }
}
