part of '../photos_page.dart';

class _ImportFrom extends HookConsumerWidget {
  const _ImportFrom();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void listenToPermissionEvents() {
      ref
        ..listenManual(permissionControllerProvider.select((value) => value.cameraStatus), (previous, next) async {
          final wasLoading = previous?.$2 ?? false;
          final isLoading = next.$2;
          if (wasLoading && !isLoading && next.$1 == PermissionStatus.granted) {
            final path = await _pickImage(ImageSource.camera);
            // if (path != null) onImagePicked(path);
          }
        })
        ..listenManual(
          permissionControllerProvider.select((value) => value.photosStatus),
          (previous, next) async {
            final wasLoading = previous?.$2 ?? false;
            final isLoading = next.$2;
            if (wasLoading && !isLoading && next.$1 == PermissionStatus.granted) {
              final path = await _pickImage(ImageSource.gallery);
              // if (path != null) onImagePicked(path);
            }
          },
        );
    }

    useEffect(
      () {
        listenToPermissionEvents();
        return null;
      },
      [],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.importFrom,
          style: context.textStyle.titleMedium,
        ),
        AppSpacing.vertical.s3,
        Row(
          children: [
            Expanded(
              child: Button(
                expand: true,
                type: ButtonType.iconTonal,
                iconPosition: IconPosition.top,
                borderRadius: AppRadius.circular.s5,
                icon: const Icon(
                  IconAssets.photos,
                  size: AppSizes.s6,
                ),
                text: context.loc.photos,
                onPressed: () async {
                  await ref.read(permissionServiceProvider).checkAndRequestPermission(PermissionType.photos);
                },
              ),
            ),
            AppSpacing.horizontal.s3,
            Expanded(
              child: Button(
                expand: true,
                type: ButtonType.iconTonal,
                borderRadius: AppRadius.circular.s5,
                iconPosition: IconPosition.top,
                icon: const Icon(
                  IconAssets.files,
                  size: AppSizes.s6,
                ),
                text: context.loc.files,
                onPressed: () async {},
              ),
            ),
            AppSpacing.horizontal.s3,
            Expanded(
              child: Button(
                expand: true,
                borderRadius: AppRadius.circular.s5,
                type: ButtonType.iconTonal,
                iconPosition: IconPosition.top,
                icon: const Icon(
                  IconAssets.camera,
                  size: AppSizes.s6,
                ),
                text: context.loc.camera,
                onPressed: () async {
                  await ref.read(permissionServiceProvider).checkAndRequestPermission(PermissionType.camera);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<String?> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    return pickedFile?.path;
  }
}
