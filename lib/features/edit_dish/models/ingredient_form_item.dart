import 'package:flutter/material.dart';

import 'ingredient.dart';

/// Owns the editable field state for one ingredient row.
class IngredientFormItem {
  IngredientFormItem({
    required this.id,
    required this.nameController,
    required this.quantityController,
    required this.unitController,
    required this.brandController,
    FocusNode? nameFocusNode,
    FocusNode? quantityFocusNode,
    FocusNode? unitFocusNode,
    FocusNode? brandFocusNode,
  })  : nameFocusNode = nameFocusNode ?? FocusNode(),
        quantityFocusNode = quantityFocusNode ?? FocusNode(),
        unitFocusNode = unitFocusNode ?? FocusNode(),
        brandFocusNode = brandFocusNode ?? FocusNode();

  /// Creates editable state from an existing ingredient.
  factory IngredientFormItem.fromIngredient(Ingredient ingredient) =>
      IngredientFormItem(
        id: ingredient.id,
        nameController: TextEditingController(text: ingredient.name),
        quantityController:
            TextEditingController(text: _formatNumber(ingredient.quantity)),
        unitController: TextEditingController(text: ingredient.unit),
        brandController: TextEditingController(text: ingredient.brand),
      );

  /// Creates a blank editable ingredient with the provided generated ID.
  factory IngredientFormItem.empty(String id) => IngredientFormItem(
        id: id,
        nameController: TextEditingController(),
        quantityController: TextEditingController(),
        unitController: TextEditingController(),
        brandController: TextEditingController(),
      );

  final String id;
  final TextEditingController nameController;
  final TextEditingController quantityController;
  final TextEditingController unitController;
  final TextEditingController brandController;
  final FocusNode nameFocusNode;
  final FocusNode quantityFocusNode;
  final FocusNode unitFocusNode;
  final FocusNode brandFocusNode;

  /// Converts the current trimmed field values into the domain model.
  Ingredient toIngredient() => Ingredient(
        id: id,
        name: nameController.text.trim(),
        quantity: _parseNumber(quantityController.text),
        unit: unitController.text.trim(),
        brand: brandController.text.trim(),
      );

  static String _formatNumber(num value) =>
      value.toDouble() == value.toDouble().truncateToDouble()
          ? value.toInt().toString()
          : value.toString();

  static num _parseNumber(String value) {
    final parsed = double.parse(value.trim());
    return parsed == parsed.truncateToDouble() ? parsed.toInt() : parsed;
  }

  /// Releases all text and focus controllers owned by this item.
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    unitController.dispose();
    brandController.dispose();
    nameFocusNode.dispose();
    quantityFocusNode.dispose();
    unitFocusNode.dispose();
    brandFocusNode.dispose();
  }
}
