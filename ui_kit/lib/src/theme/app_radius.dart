import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppRadius {
  const AppRadius._();

  /// Provides radius as [BorderRadius.circular] widgets.
  static _BorderRadius get circular => const _BorderRadius();
}

class _BorderRadius {
  const _BorderRadius();

  /// 0px
  BorderRadius get none => BorderRadius.circular(AppSizes.none);

  /// 2px
  BorderRadius get s1 => BorderRadius.circular(AppSizes.s1);

  /// 4px
  BorderRadius get s2 => BorderRadius.circular(AppSizes.s2);

  /// 8px
  BorderRadius get s3 => BorderRadius.circular(AppSizes.s3);

  /// 12px
  BorderRadius get s4 => BorderRadius.circular(AppSizes.s4);

  /// 16px
  BorderRadius get s5 => BorderRadius.circular(AppSizes.s5);
}
