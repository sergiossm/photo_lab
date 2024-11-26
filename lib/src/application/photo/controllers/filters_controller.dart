import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_lab/src/application/photo/states/filters_state.dart';
import 'package:photo_lab/src/application/shared/extensions/riverpod_extensions.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_filter_repository.dart';

class FiltersController extends StateNotifier<FiltersState> {
  FiltersController({
    required IFilterRepository filterRepository,
  })  : _filterRepository = filterRepository,
        super(const FiltersState());

  final IFilterRepository _filterRepository;

  void init() {
    _getFilters();
  }

  Future<void> _getFilters() async {
    final filters = await _filterRepository.getFilters();
    setStateSafe(
      () => state = state.copyWith(
        filters: filters.fold(
          (l) => AsyncError(l, StackTrace.current),
          AsyncData.new,
        ),
      ),
    );
  }
}
