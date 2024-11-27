import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageDataSource {
  final _storage = FirebaseStorage.instance;

  Future<String> uploadFile({
    required String filePath,
    required String fileName,
  }) async {
    try {
      final url =
          await _storage.ref().child(fileName).putFile(File(filePath)).then((value) => value.ref.getDownloadURL());
      return url;
    } catch (_) {
      rethrow;
    }
  }
}
