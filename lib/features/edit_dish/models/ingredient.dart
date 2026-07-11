/// Ingredient domain model used by the assessment payload.
class Ingredient {
  const Ingredient({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unit,
    required this.brand,
  });

  /// Creates an ingredient from the mock response structure.
  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json['id'] as String,
        name: json['name'] as String? ?? '',
        quantity: json['quantity'] as num? ?? 0,
        unit: json['unit'] as String? ?? '',
        brand: json['brand'] as String? ?? '',
      );

  final String id;
  final String name;
  final num quantity;
  final String unit;
  final String brand;

  /// Converts the ingredient to the required payload shape.
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
        'unit': unit,
        'brand': brand,
      };
}
