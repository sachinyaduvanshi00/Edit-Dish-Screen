abstract final class AppValidators {
  static String? ingredientName(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Ingredient name is required';
    if (!RegExp(r'^[A-Za-z0-9]').hasMatch(text)) {
      return 'Name must start with a letter or digit';
    }
    return null;
  }

  static String? quantity(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Quantity is required';
    final number = double.tryParse(text);
    if (number == null) return 'Enter a valid number';
    if (number <= 0) return 'Quantity must be greater than 0';
    return null;
  }
}
