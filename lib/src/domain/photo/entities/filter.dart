import 'package:photo_lab/src/domain/photo/value_objects/filter_type.dart';
import 'package:photo_lab/src/domain/photo/value_objects/parameters.dart';

class Filter {
  Filter({
    required this.type,
    required this.parameters,
  });

  final FilterType type;
  final Parameters parameters;
}
