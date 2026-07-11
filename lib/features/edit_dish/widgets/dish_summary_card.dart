import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_card.dart';
import '../models/dish.dart';

/// Displays the fixed dish metadata above the editable ingredients.
class DishSummaryCard extends StatelessWidget {
  const DishSummaryCard({required this.dish, super.key});

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Wrap(
        spacing: AppDimensions.spacing24,
        runSpacing: AppDimensions.spacing16,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const CircleAvatar(
            radius: AppDimensions.avatarRadius,
            backgroundColor: AppColors.primaryContainer,
            child: Icon(Icons.restaurant_menu, color: AppColors.primary),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 220),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child: Text(dish.name, style: AppTextStyles.pageTitle)),
                    if (dish.isVerified) ...[
                      const SizedBox(width: AppDimensions.spacing8),
                      const Tooltip(
                        message: AppStrings.verifiedDish,
                        child: Icon(
                          Icons.verified,
                          size: 21,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: AppDimensions.spacing12),
                Wrap(
                  spacing: AppDimensions.spacing8,
                  runSpacing: AppDimensions.spacing8,
                  children: [
                    Chip(
                      avatar: const Icon(Icons.eco_outlined, size: 17),
                      label: Text(dish.category),
                      visualDensity: VisualDensity.compact,
                    ),
                    Chip(
                      avatar: const Icon(Icons.currency_rupee, size: 17),
                      label: Text('${dish.price}'),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
