import 'package:photo_lab/src/domain/photo/entities/filter.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

class TransformationHistory {
  TransformationHistory({
    required this.id,
    required this.photoId,
    required this.filtersApplied,
    required this.transformedAt,
  });

  final UniqueId id;
  final UniqueId photoId;
  final List<Filter> filtersApplied;
  final DateTime transformedAt;
}
