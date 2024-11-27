import 'package:photo_lab/src/domain/shared/data_sources/i_local_data_source.dart';
import 'package:photo_lab/src/infrastructure/photo/dtos/filter_dto.dart';
import 'package:photo_lab/src/infrastructure/photo/dtos/filter_type_dto.dart';

class InMemoryFilterDataSource implements ILocalDataSource<FilterDto> {
  final List<FilterDto> _filters = [
    const FilterDto(
      type: FilterTypeDto.sepia,
      parameters: <double>[
        0.393,
        0.769,
        0.189,
        0,
        0,
        0.349,
        0.686,
        0.168,
        0,
        0,
        0.272,
        0.534,
        0.131,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
      ],
    ),
    const FilterDto(
      type: FilterTypeDto.grayscale,
      parameters: <double>[
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0.2126,
        0.7152,
        0.0722,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
      ],
    ),
    const FilterDto(
      type: FilterTypeDto.invert,
      parameters: <double>[
        -1,
        0,
        0,
        0,
        255,
        0,
        -1,
        0,
        0,
        255,
        0,
        0,
        -1,
        0,
        255,
        0,
        0,
        0,
        1,
        0,
      ],
    ),
  ];

  @override
  Future<List<FilterDto>> getAll() async {
    return _filters;
  }

  @override
  Future<FilterDto?> get(dynamic id) async {
    return _filters.firstWhere((filter) => filter.type == id);
  }

  @override
  Future<void> put(FilterDto dto) {
    throw UnimplementedError();
  }
}
