const Map<String, dynamic> mockDishData = {
  '_id': 'dish-001',
  'dish_name': 'Paneer Tikka',
  'is_verified': true,
  'food_category': 'Vegetarian',
  'price': 250,
  'dish_variants': {
    'normal': {
      'full': {
        'price': 250,
        'ingredients': [
          {'id': 'ing-1', 'name': 'Paneer', 'quantity': 150, 'unit': 'g', 'brand': 'Amul'},
          {'id': 'ing-2', 'name': 'Capsicum', 'quantity': 50, 'unit': 'g', 'brand': ''},
          {'id': 'ing-3', 'name': 'Yogurt', 'quantity': 80, 'unit': 'ml', 'brand': 'Nestle'},
          {'id': 'ing-4', 'name': 'Tandoori Masala', 'quantity': 10, 'unit': 'g', 'brand': 'MDH'},
        ],
      },
    },
  },
};
