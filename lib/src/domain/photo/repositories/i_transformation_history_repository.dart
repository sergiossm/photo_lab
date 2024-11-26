import 'package:photo_lab/src/domain/photo/entities/transformation_history.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';

abstract class ITransformationHistoryRepository {
  Future<void> saveHistory(TransformationHistory history);
  Future<void> removeHistory(UniqueId historyId);
  Future<List<TransformationHistory>> getHistoryByPhotoId(UniqueId photoId);
  Future<void> clearHistoryForPhoto(UniqueId photoId);
}
