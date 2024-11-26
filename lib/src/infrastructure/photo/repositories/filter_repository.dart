import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_filter_repository.dart';
import 'package:photo_lab/src/domain/photo/value_objects/filter_type.dart';
import 'package:photo_lab/src/domain/shared/data_sources/i_local_data_source.dart';
import 'package:photo_lab/src/infrastructure/photo/dtos/filter_dto.dart';
import 'package:photo_lab/src/infrastructure/photo/dtos/filter_type_dto.dart';

class FilterRepository implements IFilterRepository {
  FilterRepository({
    required ILocalDataSource<FilterDto> localDataSource,
  }) : _localDataSource = localDataSource;

  final ILocalDataSource<FilterDto> _localDataSource;

  @override
  Future<Filter?> getFilterByType(FilterType type) async {
    try {
      final typeDto = type.toDto();
      final dto = await _localDataSource.get(typeDto);
      return dto?.toDomain();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Filter>> getFilters() async {
    try {
      final filters = await _localDataSource.getAll();
      return filters.map((dto) => dto.toDomain()).toList();
    } catch (_) {
      return [];
    }
  }
}
