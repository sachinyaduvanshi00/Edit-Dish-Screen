import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/helpers/input_formatter_helper.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/validators.dart';
import '../../../core/widgets/app_text_field.dart';
import '../models/ingredient_form_item.dart';

/// Editable ingredient card used by the Edit Dish form.
class IngredientRow extends StatelessWidget {
  const IngredientRow({
    required this.item,
    required this.index,
    required this.onRemove,
    super.key,
  });

  final IngredientFormItem item;
  final int index;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacing12),
      padding: const EdgeInsets.all(AppDimensions.spacing16),
      decoration: BoxDecoration(
        color: index.isOdd ? AppColors.alternateRow : AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Ingredient ${index + 1}',
                  style: AppTextStyles.cardTitle,
                ),
              ),
              Text(item.id, style: AppTextStyles.caption),
              const SizedBox(width: AppDimensions.spacing8),
              Tooltip(
                message: AppStrings.removeIngredient,
                child: IconButton.filledTonal(
                  onPressed: onRemove,
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.dangerContainer,
                    foregroundColor: AppColors.danger,
                    minimumSize: const Size.square(AppDimensions.iconButtonSize),
                  ),
                  icon: const Icon(Icons.delete_outline),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacing12),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide =
                  constraints.maxWidth >= AppDimensions.mobileBreakpoint;
              final fields = _buildFields(context);

              if (!isWide) {
                return Column(
                  children: [
                    for (var i = 0; i < fields.length; i++) ...[
                      fields[i],
                      if (i != fields.length - 1)
                        const SizedBox(height: AppDimensions.fieldGap),
                    ],
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: fields[0]),
                  const SizedBox(width: AppDimensions.fieldGap),
                  Expanded(flex: 2, child: fields[1]),
                  const SizedBox(width: AppDimensions.fieldGap),
                  Expanded(flex: 2, child: fields[2]),
                  const SizedBox(width: AppDimensions.fieldGap),
                  Expanded(flex: 3, child: fields[3]),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFields(BuildContext context) {
    return [
      AppTextField(
        controller: item.nameController,
        focusNode: item.nameFocusNode,
        label: AppStrings.ingredientName,
        hint: AppStrings.ingredientNameHint,
        validator: AppValidators.ingredientName,
        onFieldSubmitted: (_) => item.quantityFocusNode.requestFocus(),
      ),
      AppTextField(
        controller: item.quantityController,
        focusNode: item.quantityFocusNode,
        label: AppStrings.quantity,
        hint: AppStrings.quantityHint,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [InputFormatterHelper.quantity],
        validator: AppValidators.quantity,
        onFieldSubmitted: (_) => item.unitFocusNode.requestFocus(),
      ),
      AppTextField(
        controller: item.unitController,
        focusNode: item.unitFocusNode,
        label: AppStrings.unit,
        hint: AppStrings.unitHint,
        onFieldSubmitted: (_) => item.brandFocusNode.requestFocus(),
      ),
      AppTextField(
        controller: item.brandController,
        focusNode: item.brandFocusNode,
        label: AppStrings.brand,
        hint: AppStrings.brandHint,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
      ),
    ];
  }
}
