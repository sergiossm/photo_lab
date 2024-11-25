import 'package:flutter/material.dart';
import 'package:photo_lab/src/presentation/shared/extensions/l10n_extensions.dart';
import 'package:ui_kit/ui_kit.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.loc.appTitle,
              style: context.textStyle.displayLarge
                  .copyWith(color: context.color.primary),
            ),
          ],
        ),
      ),
    );
  }
}
