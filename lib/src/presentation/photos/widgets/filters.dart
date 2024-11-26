part of '../edit_photo_page.dart';

class _Filters extends HookConsumerWidget {
  const _Filters({
    required this.photo,
    required this.selectedFilter,
  });

  final Photo? photo;
  final ValueNotifier<Filter?> selectedFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersControllerProvider).filters;

    return SafeArea(
      child: Container(
        color: context.color.onSurface,
        height: 176,
        child: filters.when(
          data: (filters) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.s5, vertical: AppSizes.s3),
                  child: Row(
                    children: [
                      Text(
                        context.loc.presets,
                        style: context.textStyle.displaySmall.copyWith(color: context.color.onPrimary, fontSize: 20),
                      ),
                      AppSpacing.horizontal.s5,
                      Text(
                        context.loc.aiFilters,
                        style: context.textStyle.displaySmall
                            .copyWith(color: context.color.onPrimary.withOpacity(.5), fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.s4),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length + 1,
                    itemBuilder: (context, index) {
                      final isNoneFilter = index == 0;
                      final filter = isNoneFilter ? null : filters[index - 1];
                      final filterType = filter?.type;
                      final isSelected = selectedFilter.value?.type == filterType;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSizes.s2),
                        child: FilterItem(
                          imageUrl: photo!.url.toString(),
                          filterName: isNoneFilter ? context.loc.none : filterType!.localizedName(context),
                          isSelected: isSelected,
                          colorFilter: isNoneFilter ? null : ColorFilter.matrix(filter!.parameters.getOrElse([])),
                          showNoneIcon: isNoneFilter,
                          onTap: () => selectedFilter.value = isNoneFilter ? null : filter,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
