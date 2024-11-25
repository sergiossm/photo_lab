import 'package:flutter/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

class AppSpacing {
  const AppSpacing._();

  /// Provides vertical spacing as [SizedBox] widgets.
  static _VerticalSpacing get vertical => const _VerticalSpacing();

  /// Provides horizontal spacing as [SizedBox] widgets.
  static _HorizontalSpacing get horizontal => const _HorizontalSpacing();
}

/// Internal class for creating vertical spacing.
class _VerticalSpacing {
  const _VerticalSpacing();

  /// Vertical spacing of 0 pixels.
  SizedBox get none => const SizedBox.shrink();

  /// Expand in the vertical axis
  SizedBox get expand => const SizedBox(height: double.infinity);

  /// Vertical spacing of 2 pixels.
  SizedBox get s1 => const SizedBox(height: AppSizes.s1);

  /// Vertical spacing of 4 pixels.
  SizedBox get s2 => const SizedBox(height: AppSizes.s2);

  /// Vertical spacing of 8 pixels.
  SizedBox get s3 => const SizedBox(height: AppSizes.s3);

  /// Vertical spacing of 12 pixels.
  SizedBox get s4 => const SizedBox(height: AppSizes.s4);

  /// Vertical spacing of 16 pixels.
  SizedBox get s5 => const SizedBox(height: AppSizes.s5);

  /// Vertical spacing of 20 pixels.
  SizedBox get s6 => const SizedBox(height: AppSizes.s6);

  /// Vertical spacing of 24 pixels.
  SizedBox get s7 => const SizedBox(height: AppSizes.s7);

  /// Vertical spacing of 32 pixels.
  SizedBox get s8 => const SizedBox(height: AppSizes.s8);

  /// Vertical spacing of 40 pixels.
  SizedBox get s9 => const SizedBox(height: AppSizes.s9);

  /// Vertical spacing of 48 pixels.
  SizedBox get s10 => const SizedBox(height: AppSizes.s10);

  /// Vertical spacing of 56 pixels.
  SizedBox get s11 => const SizedBox(height: AppSizes.s11);

  /// Vertical spacing of 64 pixels.
  SizedBox get s12 => const SizedBox(height: AppSizes.s12);

  /// Vertical spacing of 72 pixels.
  SizedBox get s13 => const SizedBox(height: AppSizes.s13);
}

/// Internal class for creating horizontal spacing.
class _HorizontalSpacing {
  const _HorizontalSpacing();

  /// Horizontal spacing of 0 pixels.
  SizedBox get none => const SizedBox.shrink();

  /// Expand in the vertical axis
  SizedBox get expand => const SizedBox(width: double.infinity);

  /// Horizontal spacing of 2 pixels.
  SizedBox get s1 => const SizedBox(width: AppSizes.s1);

  /// Horizontal spacing of 4 pixels.
  SizedBox get s2 => const SizedBox(width: AppSizes.s2);

  /// Horizontal spacing of 8 pixels.
  SizedBox get s3 => const SizedBox(width: AppSizes.s3);

  /// Horizontal spacing of 12 pixels.
  SizedBox get s4 => const SizedBox(width: AppSizes.s4);

  /// Horizontal spacing of 16 pixels.
  SizedBox get s5 => const SizedBox(width: AppSizes.s5);

  /// Horizontal spacing of 20 pixels.
  SizedBox get s6 => const SizedBox(width: AppSizes.s6);

  /// Horizontal spacing of 24 pixels.
  SizedBox get s7 => const SizedBox(width: AppSizes.s7);

  /// Horizontal spacing of 32 pixels.
  SizedBox get s8 => const SizedBox(width: AppSizes.s8);

  /// Horizontal spacing of 40 pixels.
  SizedBox get s9 => const SizedBox(width: AppSizes.s9);

  /// Horizontal spacing of 48 pixels.
  SizedBox get s10 => const SizedBox(width: AppSizes.s10);

  /// Horizontal spacing of 56 pixels.
  SizedBox get s11 => const SizedBox(width: AppSizes.s11);

  /// Horizontal spacing of 64 pixels.
  SizedBox get s12 => const SizedBox(width: AppSizes.s12);

  /// Horizontal spacing of 72 pixels.
  SizedBox get s13 => const SizedBox(width: AppSizes.s13);
}
