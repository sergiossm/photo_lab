import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_lab/src/application/user/providers.dart';
import 'package:photo_lab/src/presentation/routing/routes/routes.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        // Listen to user changes
        ref.listenManual(
          userControllerProvider.select((value) => value.user),
          (previous, next) {
            next.whenData(
              (userOption) {
                userOption.fold(
                  () {},
                  (user) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.goNamed(Routes.homePhotos.name);
                    });
                  },
                );
              },
            );
          },
        );

        return null;
      },
      [],
    );

    return Container();
  }
}
