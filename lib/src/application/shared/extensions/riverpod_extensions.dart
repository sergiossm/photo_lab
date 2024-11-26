import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension StateNotifierX<T> on StateNotifier<T> {
  void setStateSafe(T Function() action, {VoidCallback? onFail}) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      state = action();
    } else if (onFail != null) {
      onFail();
    } else {
      debugPrint(
        'Could not update state because context of $runtimeType is not mounted',
      );
    }
  }
}
