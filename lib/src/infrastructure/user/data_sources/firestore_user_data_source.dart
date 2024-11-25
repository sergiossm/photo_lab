import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:photo_lab/src/domain/shared/i_dto.dart';
import 'package:photo_lab/src/domain/shared/i_remote_data_source.dart';
import 'package:photo_lab/src/domain/shared/value_objects/unique_id.dart';
import 'package:photo_lab/src/infrastructure/shared/firestore_collections.dart';
import 'package:photo_lab/src/infrastructure/user/dtos/user_dto.dart';

class FirestoreUserDataSource implements IRemoteDataSource {
  final _path = FirestoreCollections.users;

  final _firestore = FirebaseFirestore.instance
    ..settings = const Settings(persistenceEnabled: false);

  @override
  Future<void> upsert(IDto userDto) {
    return _firestore
        .collection(_path)
        .doc(userDto.id)
        .set(userDto.toJson(), SetOptions(merge: true));
  }

  @override
  Stream<IDto> watch(UniqueId uid) async* {
    final id = uid.getOrCrash();
    final snapshots = _firestore.collection(_path).doc(id).snapshots();
    await for (final snapshot in snapshots) {
      yield UserDto.fromJson(snapshot.data()!);
    }
  }
}
