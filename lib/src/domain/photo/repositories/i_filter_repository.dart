import 'package:fpdart/fpdart.dart';
import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/photo/value_objects/filter_type.dart';
import 'package:photo_lab/src/domain/shared/failures/failure.dart';

abstract class IFilterRepository {
  Future<Either<Failure, List<Filter>>> getFilters();
  Future<Option<Filter>> getFilterByType(FilterType type);
}
