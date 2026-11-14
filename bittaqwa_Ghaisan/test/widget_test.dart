import 'package:flutter_test/flutter_test.dart';
import 'package:bittaqwa_ghaisan/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MyApp), findsOneWidget);
  });
}
