import 'dart:typed_data';

import 'package:gal/gal.dart';

class GalleryDataSource {
  Future<void> put(Uint8List imageBytes) {
    return Gal.putImageBytes(imageBytes);
  }
}
