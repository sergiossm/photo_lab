import 'package:photo_lab/src/domain/shared/i_dto.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

abstract class IRemoteDataSource {
  Future<void> upsert(IDto dto);
  Stream<IDto> watch(UniqueId uid);
}
