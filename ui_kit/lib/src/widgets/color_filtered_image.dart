import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ColorFilteredImage extends StatelessWidget {
  const ColorFilteredImage.network({
    required this.url,
    this.fit,
    this.colorFilter,
    super.key,
  })  : _isNetworkImage = true,
        filePath = null;

  const ColorFilteredImage.file({
    required this.filePath,
    this.fit,
    this.colorFilter,
    super.key,
  })  : _isNetworkImage = false,
        url = null;

  final String? url;
  final String? filePath;
  final ColorFilter? colorFilter;
  final BoxFit? fit;
  final bool _isNetworkImage;

  @override
  Widget build(BuildContext context) {
    assert(
      _isNetworkImage && url != null || !_isNetworkImage && filePath != null,
      'Either url or filePath must be provided',
    );

    return _isNetworkImage
        ? _CachedNetworkImage(
            url: url!,
            fit: fit,
            colorFilter: colorFilter,
          )
        : _FileImage(
            filePath: filePath!,
            fit: fit,
            colorFilter: colorFilter,
          );
  }
}

class _FileImage extends StatelessWidget {
  const _FileImage({
    required this.filePath,
    required this.fit,
    required this.colorFilter,
  });

  final String filePath;
  final BoxFit? fit;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    final child = Image.file(
      File(filePath),
      fit: fit,
    );
    return colorFilter == null ? child : ColorFiltered(colorFilter: colorFilter!, child: child);
  }
}

class _CachedNetworkImage extends StatelessWidget {
  const _CachedNetworkImage({
    required this.url,
    required this.fit,
    required this.colorFilter,
  });

  final String url;
  final BoxFit? fit;
  final ColorFilter? colorFilter;

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
