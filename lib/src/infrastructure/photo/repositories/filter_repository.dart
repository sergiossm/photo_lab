import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/photo/repositories/i_filter_repository.dart';
import 'package:photo_lab/src/domain/photo/value_objects/filter_type.dart';
import 'package:photo_lab/src/domain/shared/data_sources/i_local_data_source.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';
import 'package:photo_lab/src/infrastructure/photo/dtos/filter_dto.dart';
import 'package:photo_lab/src/infrastructure/photo/dtos/filter_type_dto.dart';

class FilterRepository implements IFilterRepository {
  FilterRepository({
    required ILocalDataSource<FilterDto> localDataSource,
  }) : _localDataSource = localDataSource;

  final ILocalDataSource<FilterDto> _localDataSource;

  @override
  Future<Option<Filter>> getFilterByType(FilterType type) async {
    try {
      final typeDto = type.toDto();
      final dto = await _localDataSource.get(typeDto);
      return optionOf(dto?.toDomain());
    } catch (_) {
      return none();
    }
  }

  @override
  Future<Either<Failure, List<Filter>>> getFilters() async {
    try {
      final filters = await _localDataSource.getAll();
      return right(filters.map((dto) => dto.toDomain()).toList());
    } catch (_) {
      return left(const Failure('Error getting filters'));
    }
  }
}
