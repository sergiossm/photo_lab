part of '../photos_page.dart';

class _MyEdits extends HookConsumerWidget {
  const _MyEdits();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(photosControllerProvider).userPhotos;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.s5),
          child: Text(
            context.loc.myEdits,
            style: context.textStyle.titleMedium,
          ),
        ),
        AppSpacing.vertical.s3,
        photos.when(
          data: (photos) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.s3),
              child: Wrap(
                children: photos.map((photo) {
                  final url = photo.url.toString();
                  final parameters = photo.filter.parameters.getOrElse([]);

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.s2),
                    child: PhotoEditItem(
                      url: url,
                      colorFilter: parameters.isEmpty ? null : ColorFilter.matrix(parameters),
                      onTap: () {
                        context.pushNamed(
                          Routes.homePhotosEdit.name,
                          extra: EditPhotoParams(photo: photo),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            );
          },
          error: (_, __) => AppSpacing.vertical.none,
          loading: () => const LoadingIndicator(),
        ),
      ],
    );
  }
}
