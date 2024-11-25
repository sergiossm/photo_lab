import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/warmup/app_warmup_notifier.dart';

final appWarmupNotifierProvider =
    StateNotifierProvider<AppWarmupNotifier, AsyncValue<void>>(
  (ref) => AppWarmupNotifier(),
);
