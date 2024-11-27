import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_lab/src/application/authentication/providers.dart';
import 'package:photo_lab/src/application/warmup/providers.dart';
import 'package:photo_lab/src/presentation/routing/routes/routes.dart';
import 'package:photo_lab/src/presentation/shared/extensions/build_context_extensions.dart';
import 'package:photo_lab/src/presentation/shared/extensions/l10n_extensions.dart';
import 'package:ui_kit/ui_kit.dart';

class LandingPage extends HookConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 4,
              child: AutoScrollImageCarousel(
                images: [
                  ImageAssets.landingCarousel1,
                  ImageAssets.landingCarousel2,
                  ImageAssets.landingCarousel3,
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.s8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.loc.appTitle,
                      style: context.textStyle.displayLarge.copyWith(
                        color: context.color.primary,
                        height: 1,
                      ),
                    ),
                    Text(
                      context.loc.appDescription,
                      style: context.textStyle.titleLarge.copyWith(color: context.color.onSurface),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.s8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      text: context.loc.signUp,
                      expand: true,
                      onPressed: () async {
                        context.showSnackBar(context.loc.comingSoon);
                        // unawaited(
                        //   context.pushNamed(
                        //     Routes.authSignInSignUp.name,
                        //     extra: AuthenticationParams(
                        //       formType: AuthenticationFormType.signUp,
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                    AppSpacing.vertical.s5,
                    Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        return Button(
                          text: context.loc.continueWithGoogle,
                          type: ButtonType.tonal,
                          icon: Icon(
                            IconAssets.google,
                            size: AppSizes.s4,
                            color: context.color.onSecondary,
                          ),
                          expand: true,
                          onPressed: () async {
                            (await ref.read(authenticationServiceProvider).signInWithGoogle()).fold(
                              (failure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  AppSnackBar.error(text: failure).build(context),
                                );
                              },
                              (_) {
                                // Warm up the app before navigating to the home page
                                ref.read(appWarmupServiceProvider).warmUp();

                                // Navigate to the home page
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  context.goNamed(Routes.homePhotos.name);
                                });
                              },
                            );
                          },
                        );
                      },
                    ),
                    AppSpacing.vertical.s5,
                    Button(
                      text: context.loc.logIn,
                      type: ButtonType.text,
                      expand: true,
                      onPressed: () async {
                        context.showSnackBar(context.loc.comingSoon);

                        // unawaited(
                        //   context.pushNamed(
                        //     Routes.authSignInSignUp.name,
                        //     extra: AuthenticationParams(
                        //       formType: AuthenticationFormType.signIn,
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
