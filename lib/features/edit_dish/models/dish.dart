import 'ingredient.dart';

/// Dish model parsed from the supplied assessment mock data.
class Dish {
  const Dish({
    required this.id,
    required this.name,
    required this.isVerified,
    required this.category,
    required this.price,
    required this.ingredients,
  });

  /// Creates a dish while preserving the assessment response structure.
  factory Dish.fromJson(Map<String, dynamic> json) {
    final variants = json['dish_variants'] as Map<String, dynamic>;
    final normal = variants['normal'] as Map<String, dynamic>;
    final full = normal['full'] as Map<String, dynamic>;
    final rawIngredients = full['ingredients'] as List<dynamic>;

    return Dish(
      id: json['_id'] as String,
      name: json['dish_name'] as String,
      isVerified: json['is_verified'] as bool,
      category: json['food_category'] as String,
      price: json['price'] as num,
      ingredients: rawIngredients
          .map((item) => Ingredient.fromJson(item as Map<String, dynamic>))
          .toList(growable: false),
    );
  }

  final String id;
  final String name;
  final bool isVerified;
  final String category;
  final num price;
  final List<Ingredient> ingredients;
}
