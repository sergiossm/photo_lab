import 'package:flutter/material.dart';

class AppRadius {
  const AppRadius._();

  /// 0px
  static const double none = 0;

  /// 2px
  static const double s1 = 2;

  /// 4px
  static const double s2 = 4;

  /// 8px
  static const double s3 = 8;

  /// 12px
  static const double s4 = 12;

  /// 16px
  static const double s5 = 16;

  /// 24px
  static const double s6 = 24;

  /// 32px
  static const double s7 = 32;

  /// 40px
  static const double s8 = 40;

  /// 48px
  static const double s9 = 48;

  /// 56px
  static const double s10 = 56;

  /// 64px
  static const double s11 = 64;

  /// 72px
  static const double s12 = 72;

  /// 80px
  static const double s13 = 80;

  /// 88px
  static const double s14 = 88;

  /// Provides radius as [BorderRadius.circular] widgets.
  static _BorderRadius get circular => const _BorderRadius();
}

class _BorderRadius {
  const _BorderRadius();

  /// 0px
  BorderRadius get none => BorderRadius.circular(AppRadius.none);

  /// 2px
  BorderRadius get s1 => BorderRadius.circular(AppRadius.s1);

  /// 4px
  BorderRadius get s2 => BorderRadius.circular(AppRadius.s2);

  /// 8px
  BorderRadius get s3 => BorderRadius.circular(AppRadius.s3);

  /// 12px
  BorderRadius get s4 => BorderRadius.circular(AppRadius.s4);

  /// 16px
  BorderRadius get s5 => BorderRadius.circular(AppRadius.s5);
}
