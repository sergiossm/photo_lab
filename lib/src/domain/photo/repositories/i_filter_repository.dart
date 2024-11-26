import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/photo/value_objects/filter_type.dart';

abstract class IFilterRepository {
  Future<List<Filter>> getFilters();
  Future<Filter?> getFilterByType(FilterType type);
}
