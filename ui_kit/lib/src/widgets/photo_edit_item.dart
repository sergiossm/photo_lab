import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class PhotoEditItem extends StatelessWidget {
  const PhotoEditItem({
    required this.url,
    required this.colorFilter,
    this.onTap,
    super.key,
  });

  final String url;
  final ColorFilter? colorFilter;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.circular.s2,
      child: Material(
        child: Ink.image(
          image: CachedNetworkImageProvider(url),
          colorFilter: colorFilter,
          height: AppSizes.s15,
          width: AppSizes.s15,
          fit: BoxFit.cover,
          child: InkWell(
            overlayColor: WidgetStateProperty.all(context.color.onSecondary.withOpacity(.05)),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
