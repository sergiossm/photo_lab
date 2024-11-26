import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ColorFilteredCachedNetworkImage extends StatelessWidget {
  const ColorFilteredCachedNetworkImage({
    required this.url,
    this.fit,
    this.colorFilter,
    super.key,
  });

  final String url;
  final ColorFilter? colorFilter;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
            colorFilter: colorFilter,
          ),
        ),
      ),
    );
  }
}
