import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Reusable typography styles for the application.
abstract final class AppTextStyles {
  static const TextStyle pageTitle = TextStyle(
    fontSize: 24,
    height: 1.25,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    height: 1.35,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    height: 1.5,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMuted = TextStyle(
    fontSize: 14,
    height: 1.5,
    color: AppColors.mutedText,
  );

  static const TextStyle label = TextStyle(
    fontSize: 13,
    height: 1.35,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    height: 1.35,
    color: AppColors.mutedText,
  );
}
