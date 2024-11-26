import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_lab/src/application/photo/providers.dart';
import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/photo/entities/photo.dart';
import 'package:photo_lab/src/domain/photo/events/edit_events.dart';
import 'package:photo_lab/src/presentation/shared/extensions/l10n_extensions.dart';
import 'package:ui_kit/ui_kit.dart';

part 'widgets/filters.dart';

class EditPhotoPage extends HookConsumerWidget {
  const EditPhotoPage({
    required this.photo,
    required this.filePath,
    super.key,
  });

  final Photo? photo;
  final String? filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = useState<Filter?>(photo?.filter);

    // Apply the selected filter to the photo
    useEffect(
      () {
        // If the photo already has a filter applied, don't include it in the undo stack
        // if (photo?.filter != null) {
        // } else {
        ref.read(editHistoryServiceProvider).applyFilter(selectedFilter.value);
        // }
        return null;
      },
      [selectedFilter.value],
    );

    // Dispose the edit history service when the page is disposed
    useEffect(
      () {
        return ref.read(editHistoryServiceProvider).clearHistory;
      },
      [],
    );

    final canUndo = useState(photo?.filter != null); // If the photo already has a filter applied, it can be undone
    final canRedo = useState(false);
    final subscription = useOnStreamChange(
      ref.watch(editHistoryServiceProvider).editHistoryStream,
      onData: (event) {
        event.fold(
          (_) {},
          (editEvent) {
            if (editEvent is UndoStackNotEmpty) {
              canUndo.value = true;
            } else if (editEvent is UndoStackEmpty) {
              canUndo.value = false;
            } else if (editEvent is RedoStackNotEmpty) {
              canRedo.value = true;
            } else if (editEvent is RedoStackEmpty) {
              canRedo.value = false;
            }
          },
        );
      },
    );
    useEffect(
      () {
        return () {
          subscription?.cancel();
        };
      },
      [subscription],
    );

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
              disabledColor: context.color.surface.withOpacity(.5),
              onPressed: !canUndo.value
                  ? null
                  : () {
                      ref.read(editHistoryServiceProvider).undo();
                      ref.read(editHistoryServiceProvider).currentFilter.fold(
                            () => selectedFilter.value = null,
                            (filter) => selectedFilter.value = filter,
                          );
                    },
              icon: const Icon(IconAssets.undo, size: AppSizes.s5),
            ),
            IconButton(
              disabledColor: context.color.surface.withOpacity(.5),
              onPressed: !canRedo.value
                  ? null
                  : () {
                      // Redo
                      ref.read(editHistoryServiceProvider).redo();
                      ref.read(editHistoryServiceProvider).currentFilter.fold(
                            () => selectedFilter.value = null,
                            (filter) => selectedFilter.value = filter,
                          );
                    },
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
