import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class FilterItem extends StatelessWidget {
  const FilterItem.network({
    required this.imageUrl,
    required this.filterName,
    required this.isSelected,
    required this.onTap,
    this.colorFilter,
    this.showNoneIcon = false,
    super.key,
  })  : _isNetworkImage = true,
        filePath = null;

  const FilterItem.file({
    required this.filePath,
    required this.filterName,
    required this.isSelected,
    required this.onTap,
    this.colorFilter,
    this.showNoneIcon = false,
    super.key,
  })  : _isNetworkImage = false,
        imageUrl = null;

  final String? imageUrl;
  final String? filePath;
  final String filterName;
  final ColorFilter? colorFilter;
  final bool isSelected;
  final bool showNoneIcon;
  final VoidCallback onTap;
  final bool _isNetworkImage;

  @override
  Widget build(BuildContext context) {
    assert(
      _isNetworkImage && imageUrl != null || !_isNetworkImage && filePath != null,
      'Either imageUrl or filePath must be provided',
    );

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            children: [
              _buildImage(context),
              AppSpacing.vertical.s3,
              Text(
                filterName,
                style: context.textStyle.labelMedium.copyWith(
                  color: isSelected ? context.color.secondary : context.color.surface,
                ),
              ),
            ],
          ),
          if (showNoneIcon && isSelected)
            SizedBox(
              width: 70,
              height: 100,
              child: Center(
                child: Icon(
                  IconAssets.empty,
                  color: context.color.secondary,
                  size: AppSizes.s5,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (_isNetworkImage) {
      return _buildNetworkImage(context);
    }
    return _buildFileImage(context);
  }

  Widget _buildNetworkImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      height: 100,
      width: 70,
      fit: BoxFit.fitHeight,
      imageBuilder: (context, imageProvider) => _buildDecoratedContainer(
        context,
        DecorationImage(
          image: imageProvider,
          opacity: isSelected ? 0.5 : 1,
          fit: BoxFit.fitHeight,
          colorFilter: colorFilter,
        ),
      ),
    );
  }

  Widget _buildFileImage(BuildContext context) {
    Widget image = Image.file(
      File(filePath!),
      height: 100,
      width: 70,
      fit: BoxFit.fitHeight,
    );

    if (colorFilter != null) {
      image = ColorFiltered(colorFilter: colorFilter!, child: image);
    }

    return _buildDecoratedContainer(
      context,
      null,
      child: ClipRRect(
        borderRadius: AppRadius.circular.s3,
        child: Opacity(opacity: isSelected ? 0.5 : 1, child: image),
      ),
    );
  }

  Container _buildDecoratedContainer(
    BuildContext context,
    DecorationImage? decorationImage, {
    Widget? child,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppRadius.circular.s3,
        border: Border.all(
          color: isSelected ? context.color.secondary : Colors.transparent,
          width: 2,
        ),
        image: decorationImage,
      ),
      child: child,
    );
  }
}
