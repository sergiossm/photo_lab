import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    required this.imageUrl,
    this.size = AppSizes.s9,
    this.radius,
    super.key,
  });

  final String? imageUrl;
  final double size;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final borderRadius = radius == null ? AppRadius.circular.s4 : BorderRadius.circular(radius!);
    if (imageUrl == null) {
      return Icon(
        IconAssets.user,
        size: AppSizes.s8,
        color: context.color.secondary,
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      height: size,
      width: size,
      imageBuilder: (context, imageProvider) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
