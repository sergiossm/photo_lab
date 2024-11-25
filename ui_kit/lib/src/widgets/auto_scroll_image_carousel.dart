import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AutoScrollImageCarousel extends StatelessWidget {
  const AutoScrollImageCarousel({
    required this.images,
    super.key,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2,
          viewportFraction: .55,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.easeInOutCubicEmphasized,
          autoPlayAnimationDuration: const Duration(milliseconds: 950),
        ),
        items: images
            .map(
              (image) => ClipRRect(
                borderRadius: AppRadius.circular.s5,
                child: Image.asset(
                  image,
                  width: 200,
                  fit: BoxFit.fitHeight,
                  package: 'ui_kit',
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
