import 'package:photo_lab/src/domain/shared/i_dto.dart';

abstract class ILocalDataSource<T extends IDto> {
  Future<T?> get(dynamic id);
  Future<void> put(T dto);
  Future<List<T>> getAll();
}
