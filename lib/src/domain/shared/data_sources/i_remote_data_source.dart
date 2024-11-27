import 'package:photo_lab/src/domain/shared/i_dto.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

abstract class IRemoteDataSource<T extends IDto> {
  Future<void> upsert(IDto dto);
  Stream<T> watch(UniqueId id);
  Stream<List<T>> watchAllForUser(UniqueId userId);
}
