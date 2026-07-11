import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

/// Centralized snackbar presentation methods.
abstract final class SnackbarHelper {
  /// Shows a success snackbar.
  static void showSuccess({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(AppDimensions.spacing16),
      icon: const Icon(Icons.check_circle_outline, color: AppColors.primary),
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.primaryContainer,
      colorText: AppColors.onPrimaryContainer,
    );
  }

  /// Shows an error snackbar.
  static void showError({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(AppDimensions.spacing16),
      icon: const Icon(Icons.error_outline, color: AppColors.danger),
      duration: const Duration(seconds: 3),
      backgroundColor: AppColors.dangerContainer,
      colorText: AppColors.textPrimary,
    );
  }
}
