abstract final class IngredientIdGenerator {
  static int nextNumber(Iterable<String> ids) {
    var highest = 0;
    for (final id in ids) {
      final match = RegExp(r'^ing-(\d+)$').firstMatch(id);
      final number = int.tryParse(match?.group(1) ?? '') ?? 0;
      if (number > highest) highest = number;
    }
    return highest + 1;
  }

  static String create(int number) => 'ing-$number';
}
