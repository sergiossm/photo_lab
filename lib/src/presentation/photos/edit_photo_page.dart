import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_lab/src/application/photo/providers.dart';
import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/photo/entities/photo.dart';
import 'package:photo_lab/src/presentation/shared/extensions/l10n_extensions.dart';
import 'package:ui_kit/ui_kit.dart';

part 'widgets/filters.dart';

class EditPhotoPage extends HookWidget {
  const EditPhotoPage({
    required this.photo,
    required this.filePath,
    super.key,
  });

  final Photo? photo;
  final String? filePath;

  @override
  Widget build(BuildContext context) {
    final selectedFilter = useState<Filter?>(photo?.filter);

    return Scaffold(
      backgroundColor: context.color.onSecondary,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(IconAssets.back, size: AppSizes.s6),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(IconAssets.undo, size: AppSizes.s5),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(IconAssets.redo, size: AppSizes.s5),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: context.color.surface),
        backgroundColor: context.color.onSurface,
        actions: [
          Button(
            size: ButtonSize.small,
            borderRadius: AppRadius.circular.s3,
            text: context.loc.save,
            onPressed: () async {},
          ),
          AppSpacing.horizontal.s4,
        ],
      ),
      body: Center(
        child: () {
          final parameters = selectedFilter.value?.parameters.getOrElse([]) ?? [];
          final colorFilter = parameters.isEmpty ? null : ColorFilter.matrix(parameters);

          if (photo != null) {
            final url = photo!.url.toString();
            return ColorFilteredImage.network(url: url, colorFilter: colorFilter);
          } else if (filePath != null) {
            return ColorFilteredImage.file(filePath: filePath, colorFilter: colorFilter);
          } else {
            return const SizedBox.shrink();
          }
        }(),
      ),
      bottomNavigationBar: _Filters(
        filePath: filePath,
        photo: photo,
        selectedFilter: selectedFilter,
      ),
    );
  }
}
