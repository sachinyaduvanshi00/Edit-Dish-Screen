import 'package:get/get.dart';

import '../widgets/confirmation_dialog.dart';

/// Centralized dialog presentation methods.
abstract final class DialogHelper {
  /// Shows a non-dismissible confirmation dialog.
  static Future<bool> showConfirmation({
    required String title,
    required String message,
    required String confirmLabel,
    required String cancelLabel,
  }) async {
    final result = await Get.dialog<bool>(
      ConfirmationDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
      ),
      barrierDismissible: false,
    );
    return result ?? false;
  }
}
