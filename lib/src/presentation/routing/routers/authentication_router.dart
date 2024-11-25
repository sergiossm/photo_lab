import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_lab/src/presentation/authentication/authentication_page.dart';
import 'package:photo_lab/src/presentation/authentication/landing_page.dart';
import 'package:photo_lab/src/presentation/routing/params/authentication_params.dart';
import 'package:photo_lab/src/presentation/routing/routes/routes.dart';

abstract class AuthenticationRouter {
  static GoRoute get route => GoRoute(
        path: Routes.authenticationLanding.path,
        name: Routes.authenticationLanding.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const LandingPage(),
        ),
        routes: [
          GoRoute(
            path: Routes.authSignInSignUp.path,
            name: Routes.authSignInSignUp.name,
            pageBuilder: (context, state) {
              final params = state.extra! as AuthenticationParams;

              return MaterialPage<void>(
                key: state.pageKey,
                child: AuthenticationPage(
                  formType: params.formType,
                ),
              );
            },
          ),
        ],
      );
}
