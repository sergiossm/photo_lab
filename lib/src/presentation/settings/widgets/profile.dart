part of '../settings_page.dart';

class _Profile extends ConsumerWidget {
  const _Profile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userControllerProvider).user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.profile,
          style: context.textStyle.titleMedium,
        ),
        AppSpacing.vertical.s3,
        user.when(
          data: (userOption) {
            return userOption.fold(() => const SizedBox(), (user) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: AppRadius.circular.s3,
                  color: context.color.onSurface.withOpacity(.05),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.vertical.s5,
                    Row(
                      children: [
                        AppSpacing.horizontal.s6,
                        UserAvatar(imageUrl: user.photoUrl?.toString()),
                        AppSpacing.horizontal.s5,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.displayName,
                              style: context.textStyle.titleLarge,
                            ),
                            Text(
                              user.emailAddress.value.getOrElse((_) => ''),
                              style:
                                  context.textStyle.bodySmall.copyWith(color: context.color.onSurface.withOpacity(.87)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppSpacing.vertical.s3,
                    const Divider(),
                    AppSpacing.vertical.s3,
                    Padding(
                      padding: const EdgeInsets.only(left: AppSizes.s4),
                      child: Button(
                        size: ButtonSize.small,
                        type: ButtonType.textDestructive,
                        text: context.loc.signOut,
                        onPressed: () async {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            context.goNamed(Routes.authenticationLanding.name);
                          });

                          unawaited(ref.read(authenticationFacadeProvider).signOut());
                        },
                      ),
                    ),
                    AppSpacing.vertical.s4,
                  ],
                ),
              );
            });
          },
          error: (_, __) => const SizedBox(),
          loading: () => const LoadingIndicator(),
        ),
      ],
    );
  }
}
