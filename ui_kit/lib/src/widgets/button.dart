import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

enum ButtonType {
  filled,
  tonal,
  text,
  iconFilled,
  iconTonal,
}

enum ButtonSize {
  large(48),
  medium(40),
  small(32);

  const ButtonSize(this.height);

  final double height;
}

class Button extends StatefulWidget {
  const Button({
    this.text,
    this.onPressed,
    this.type = ButtonType.filled,
    this.size = ButtonSize.large,
    this.isLoading = false,
    this.expand = false,
    super.key,
    this.leading,
    this.trailing,
  });

  final String? text;
  final Future<void> Function()? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final bool isLoading;
  final bool expand;
  final Widget? leading;
  final Widget? trailing;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    /// Show loader when dev pass isLoading to true OR there is operation processing on button tap.
    final showLoader = widget.isLoading || _isLoading;

    final isDisabled = widget.onPressed == null;
    final onPressedFunc = isDisabled
        ? null
        : () async {
            if (!_isLoading) {
              try {
                setState(() => _isLoading = true);
                await widget.onPressed?.call();
              } finally {
                if (mounted) {
                  setState(() => _isLoading = false);
                }
              }
            }
          };

    final text = Text(
      widget.text ?? '',
      textAlign: TextAlign.center,
      maxLines: 1,
    );
    Widget child = text;

    if (showLoader) {
      child = ColorFiltered(
        colorFilter: ColorFilter.mode(
          (widget.type == ButtonType.filled)
              ? context.color.onPrimary
              : context.color.primary,
          BlendMode.srcIn,
        ),
        child: const LoadingIndicator(
          size: AppSizes.s5,
          strokeWidth: 1.5,
        ),
      );
    } else if (widget.trailing != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppSpacing.horizontal.s3,
          text,
          AppSpacing.horizontal.s2,
          widget.trailing!,
          AppSpacing.horizontal.s3,
        ],
      );
    } else if (widget.leading != null) {
      if (widget.type == ButtonType.iconFilled ||
          widget.type == ButtonType.iconTonal) {
        child = widget.leading!;
      } else {
        child = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppSpacing.horizontal.s3,
            widget.leading!,
            AppSpacing.horizontal.s3,
            text,
            AppSpacing.horizontal.s3,
          ],
        );
      }
    }

    return SizedBox(
      height: widget.size.height,
      width: widget.expand ? double.infinity : null,
      child: _CustomFilledButton(
        type: widget.type,
        onPressed: onPressedFunc,
        removePadding: widget.size == ButtonSize.small,
        child: child,
      ),
    );
  }
}

class _CustomFilledButton extends StatelessWidget {
  const _CustomFilledButton({
    required this.type,
    required this.child,
    this.onPressed,
    this.removePadding = false,
  });

  final ButtonType type;
  final Future<void> Function()? onPressed;
  final Widget child;
  final bool removePadding;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle.titleSmall;
    const horizontalPadding = EdgeInsets.symmetric(horizontal: AppSizes.s3);

    return switch (type) {
      ButtonType.filled => FilledButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
                return context.color.primary.withOpacity(.05);
              },
            ),
            padding: removePadding
                ? const WidgetStatePropertyAll(horizontalPadding)
                : null,
            textStyle: WidgetStatePropertyAll(textStyle),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return context.color.secondary.withOpacity(.5);
                }
                return context.color.secondary;
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return context.color.primary.withOpacity(.5);
                }
                return context.color.primary;
              },
            ),
          ),
          child: child,
        ),
      ButtonType.tonal => FilledButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
                return context.color.onSecondary.withOpacity(.05);
              },
            ),
            padding: removePadding
                ? const WidgetStatePropertyAll(horizontalPadding)
                : null,
            textStyle: WidgetStatePropertyAll(textStyle),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return context.color.onSecondary.withOpacity(.1);
                }
                return context.color.onSecondary.withOpacity(.05);
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return context.color.onSecondary.withOpacity(.2);
                }
                return context.color.onSecondary.withOpacity(.87);
              },
            ),
          ),
          child: child,
        ),
      ButtonType.text => TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
                return context.color.onSecondary.withOpacity(.05);
              },
            ),
            padding: removePadding
                ? const WidgetStatePropertyAll(horizontalPadding)
                : null,
            textStyle: WidgetStatePropertyAll(textStyle),
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return context.color.onSecondary.withOpacity(.1);
                }
                return null;
              },
            ),
            foregroundColor: WidgetStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(WidgetState.disabled)) {
                  return context.color.onSecondary.withOpacity(.2);
                }
                return context.color.onSecondary.withOpacity(.87);
              },
            ),
          ),
          child: child,
        ),
      // TODO: Handle this case.
      ButtonType.iconFilled => throw UnimplementedError(),
      // TODO: Handle this case.
      ButtonType.iconTonal => throw UnimplementedError(),
    };
  }
}
