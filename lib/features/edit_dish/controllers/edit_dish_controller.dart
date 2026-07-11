import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/helpers/dialog_helper.dart';
import '../../../core/helpers/snackbar_helper.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/mock_dish_data.dart';
import '../models/dish.dart';
import '../models/ingredient_form_item.dart';

/// Coordinates Edit Dish state and preserves the assessment business flow.
class EditDishController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ScrollController scrollController = ScrollController();
  final RxList<IngredientFormItem> ingredients = <IngredientFormItem>[].obs;
  final RxBool isSaving = false.obs;

  late final Dish dish;
  var _nextIngredientNumber = 1;

  @override
  void onInit() {
    super.onInit();
    dish = Dish.fromJson(mockDishData);
    _loadInitialIngredients();
  }

  void _loadInitialIngredients() {
    _disposeItems();
    ingredients.assignAll(
      dish.ingredients.map(IngredientFormItem.fromIngredient),
    );
    _nextIngredientNumber = IngredientIdGenerator.nextNumber(
      ingredients.map((item) => item.id),
    );
  }

  /// Adds an empty ingredient, then focuses and reveals it.
  void addIngredient() {
    final item = IngredientFormItem.empty(
      IngredientIdGenerator.create(_nextIngredientNumber++),
    );
    ingredients.add(item);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
      item.nameFocusNode.requestFocus();
    });
  }

  /// Removes the selected ingredient immediately.
  void removeIngredient(IngredientFormItem item) {
    if (ingredients.remove(item)) item.dispose();
  }

  /// Restores the original assessment mock ingredients.
  void resetChanges() => _loadInitialIngredients();

  /// Builds the exact update payload required by the assessment.
  Map<String, dynamic> buildUpdatePayload() => {
        'restro_id': 'mock-restro-001',
        'dish_id': dish.id,
        'updated_fields': {
          'full': {
            'ingredients': ingredients
                .map((item) => item.toIngredient().toJson())
                .toList(),
          },
        },
      };

  /// Validates, confirms and executes the existing simulated save flow.
  Future<void> save(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (isSaving.value || !(formKey.currentState?.validate() ?? false)) return;

    final confirmed = await DialogHelper.showConfirmation(
      title: AppStrings.confirmTitle,
      message: AppStrings.confirmMessage,
      confirmLabel: AppStrings.save,
      cancelLabel: AppStrings.cancel,
    );
    if (!confirmed) return;

    isSaving.value = true;
    try {
      final payload = buildUpdatePayload();
      debugPrint(const JsonEncoder.withIndent('  ').convert(payload));
      await Future<void>.delayed(const Duration(milliseconds: 450));
      SnackbarHelper.showSuccess(
        title: AppStrings.successTitle,
        message: AppStrings.successMessage,
      );
    } catch (error, stackTrace) {
      debugPrint('Save failed: $error\n$stackTrace');
      SnackbarHelper.showError(
        title: AppStrings.errorTitle,
        message: AppStrings.errorMessage,
      );
    } finally {
      isSaving.value = false;
    }
  }

  void _disposeItems() {
    for (final item in ingredients) {
      item.dispose();
    }
  }

  @override
  void onClose() {
    _disposeItems();
    scrollController.dispose();
    super.onClose();
  }
}
