import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photo_lab/src/domain/shared/i_dto.dart';
import 'package:photo_lab/src/domain/shared/i_remote_data_source.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';
import 'package:photo_lab/src/infrastructure/photo/dtos/photo_dto.dart';
import 'package:photo_lab/src/infrastructure/shared/firestore_collections.dart';

class FirestorePhotoDataSource implements IRemoteDataSource {
  final _path = FirestoreCollections.photos;

  final _firestore = FirebaseFirestore.instance..settings = const Settings(persistenceEnabled: false);

  @override
  Future<void> upsert(IDto dto) {
    return _firestore.collection(_path).doc(dto.id).set(dto.toJson(), SetOptions(merge: true));
  }

  @override
  Stream<IDto> watch(UniqueId uid) => throw UnimplementedError();

  @override
  Stream<List<IDto>> watchAllForUser(UniqueId userId) async* {
    final snapshots = _firestore
        .collection(_path)
        .where('userId', isEqualTo: userId.getOrCrash())
        .orderBy('updatedAt', descending: true)
        .snapshots();
    await for (final snapshot in snapshots) {
      yield snapshot.docs.map((doc) => PhotoDto.fromJson(doc.data())).toList();
    }
  }
}
