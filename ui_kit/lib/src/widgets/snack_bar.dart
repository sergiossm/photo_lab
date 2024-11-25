import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppSnackBar {
  const AppSnackBar.informative({
    required this.text,
    this.margin,
    this.leading,
  }) : _error = false;

  const AppSnackBar.error({
    required this.text,
    this.margin,
  })  : _error = true,
        leading = null;

  final bool _error;
  final String text;
  final Widget? leading;
  final EdgeInsetsGeometry? margin;

  SnackBar build(BuildContext context) {
    final backgroundColor =
        _error ? context.color.error : context.color.onSurface;

    return SnackBar(
      backgroundColor: backgroundColor,
      margin: margin,
      content: Row(
        children: [
          if (leading != null) leading!,
          Expanded(
            child: Text(
              text,
              style: context.textStyle.titleSmall
                  .copyWith(color: context.color.surface),
            ),
          ),
        ],
      ),
    );
  }
}
