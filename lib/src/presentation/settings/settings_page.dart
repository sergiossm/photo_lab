import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_lab/src/application/authentication/providers.dart';
import 'package:photo_lab/src/application/user/providers.dart';
import 'package:photo_lab/src/presentation/routing/routes/routes.dart';
import 'package:photo_lab/src/presentation/shared/extensions/l10n_extensions.dart';
import 'package:ui_kit/ui_kit.dart';

part 'widgets/profile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(context.loc.settings),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                AppSpacing.vertical.s5,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.s5),
                  child: _Profile(),
                ),
                AppSpacing.vertical.s8,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
