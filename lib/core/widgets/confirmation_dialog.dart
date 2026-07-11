import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Reusable confirmation dialog.
class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    required this.title,
    required this.message,
    required this.confirmLabel,
    required this.cancelLabel,
    super.key,
  });

  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: false),
          child: Text(cancelLabel),
        ),
        FilledButton(
          onPressed: () => Get.back(result: true),
          child: Text(confirmLabel),
        ),
      ],
    );
  }
}
