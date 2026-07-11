import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';

/// Main call-to-action button with a built-in loading state.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.icon = Icons.save_outlined,
    this.isLoading = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? const SizedBox.square(
              dimension: AppDimensions.progressIndicatorSize,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(icon),
      label: Text(label),
    );
  }
}
