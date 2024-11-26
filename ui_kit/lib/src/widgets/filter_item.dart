import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    required this.imageUrl,
    required this.filterName,
    required this.isSelected,
    required this.onTap,
    this.colorFilter,
    this.showNoneIcon = false,
    super.key,
  });

  final String imageUrl;
  final String filterName;
  final ColorFilter? colorFilter;
  final bool isSelected;
  final bool showNoneIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                height: 100,
                width: 70,
                fit: BoxFit.fitHeight,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? context.color.secondary : Colors.transparent,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      opacity: isSelected ? 0.5 : 1,
                      fit: BoxFit.fitHeight,
                      colorFilter: colorFilter,
                    ),
                  ),
                ),
              ),
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
}
