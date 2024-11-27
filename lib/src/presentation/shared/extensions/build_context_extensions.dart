import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

extension BuildContextX on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      isError ? AppSnackBar.error(text: message).build(this) : AppSnackBar.informative(text: message).build(this),
    );
  }
}
