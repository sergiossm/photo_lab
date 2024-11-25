import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/warmup/providers.dart';
import 'package:ui_kit/ui_kit.dart';

part 'error.dart';
part 'loading.dart';

class AppWarmupWidget extends ConsumerWidget {
  const AppWarmupWidget({
    required this.onLoaded,
    super.key,
  });

  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appWarmupNotifierProvider);
    return state.when(
      loading: () => const _Loading(),
      error: (error, stackTrace) => _Error(
        message: error.toString(),
        onRetry: () async {
          await ref.read(appWarmupNotifierProvider.notifier).retry();
        },
      ),
      data: (_) => onLoaded(context),
    );
  }
}
