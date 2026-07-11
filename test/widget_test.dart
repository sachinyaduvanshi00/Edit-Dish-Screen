import 'package:edit_dish_screen/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows dish and initial ingredients', (tester) async {
    await tester.pumpWidget(const FitshieldApp());
    await tester.pumpAndSettle();

    expect(find.text('Paneer Tikka'), findsOneWidget);
    expect(find.text('Ingredients (4)'), findsOneWidget);
    expect(find.text('Save Changes'), findsOneWidget);
  });
}
