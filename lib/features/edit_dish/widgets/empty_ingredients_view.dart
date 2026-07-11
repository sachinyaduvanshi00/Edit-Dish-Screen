import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_card.dart';

/// Empty state shown when all ingredient rows are removed.
class EmptyIngredientsView extends StatelessWidget {
  const EmptyIngredientsView({required this.onAdd, super.key});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacing24,
        vertical: AppDimensions.spacing48,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: const BoxDecoration(
                color: AppColors.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.inventory_2_outlined,
                size: 38,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacing16),
            const Text(AppStrings.noIngredients, style: AppTextStyles.cardTitle),
            const SizedBox(height: AppDimensions.spacing6),
            const Text(
              AppStrings.noIngredientsDescription,
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMuted,
            ),
            const SizedBox(height: AppDimensions.spacing20),
            OutlinedButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              label: const Text(AppStrings.addIngredient),
            ),
          ],
        ),
      ),
    );
  }
}
