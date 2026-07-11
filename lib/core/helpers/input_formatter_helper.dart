import 'package:flutter/services.dart';

/// Provides reusable input formatters.
abstract final class InputFormatterHelper {
  /// Allows positive decimal numbers with one decimal separator.
  static final TextInputFormatter quantity = TextInputFormatter.withFunction(
    (oldValue, newValue) {
      if (newValue.text.isEmpty ||
          RegExp(r'^\d*\.?\d*$').hasMatch(newValue.text)) {
        return newValue;
      }
      return oldValue;
    },
  );
}
