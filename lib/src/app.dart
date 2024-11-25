import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/presentation/routing/routers/router.dart';
import 'package:ui_kit/ui_kit.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class PhotoLabApp extends ConsumerWidget {
  const PhotoLabApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    final router = ref.watch(goRouterProvider);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: appTheme.theme,
      builder: (context, child) => Builder(
        builder: (context) => ThemeProvider(
          appTheme: appTheme,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            body: child,
          ),
        ),
      ),
    );
  }
}
