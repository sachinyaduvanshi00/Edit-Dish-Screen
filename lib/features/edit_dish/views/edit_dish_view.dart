import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/section_header.dart';
import '../controllers/edit_dish_controller.dart';
import '../widgets/dish_summary_card.dart';
import '../widgets/empty_ingredients_view.dart';
import '../widgets/ingredient_row.dart';

/// Main Edit Dish screen.
class EditDishView extends GetView<EditDishController> {
  const EditDishView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.editDish),
        actions: [
          TextButton.icon(
            onPressed: controller.resetChanges,
            icon: const Icon(Icons.refresh),
            label: const Text(AppStrings.reset),
          ),
          const SizedBox(width: AppDimensions.spacing8),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppDimensions.contentMaxWidth,
            ),
            child: Form(
              key: controller.formKey,
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(
                      AppDimensions.pagePadding,
                      AppDimensions.spacing12,
                      AppDimensions.pagePadding,
                      AppDimensions.bottomContentPadding,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate.fixed([
                        DishSummaryCard(dish: controller.dish),
                        const SizedBox(height: AppDimensions.spacing24),
                        Obx(
                          () => SectionHeader(
                            title:
                                '${AppStrings.ingredients} (${controller.ingredients.length})',
                            subtitle: AppStrings.ingredientHint,
                            trailing: OutlinedButton.icon(
                              onPressed: controller.addIngredient,
                              icon: const Icon(Icons.add),
                              label: const Text(AppStrings.addIngredient),
                            ),
                          ),
                        ),
                        const SizedBox(height: AppDimensions.spacing16),
                        Obx(() {
                          if (controller.ingredients.isEmpty) {
                            return EmptyIngredientsView(
                              onAdd: controller.addIngredient,
                            );
                          }

                          return Column(
                            children: List.generate(
                              controller.ingredients.length,
                              (index) {
                                final item = controller.ingredients[index];
                                return IngredientRow(
                                  key: ValueKey(item.id),
                                  item: item,
                                  index: index,
                                  onRemove: () =>
                                      controller.removeIngredient(item),
                                );
                              },
                            ),
                          );
                        }),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(AppDimensions.spacing16),
        child: Center(
          heightFactor: 1,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppDimensions.contentMaxWidth,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Obx(
                () => PrimaryButton(
                  label: controller.isSaving.value
                      ? AppStrings.saving
                      : AppStrings.saveChanges,
                  isLoading: controller.isSaving.value,
                  onPressed: () => controller.save(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
