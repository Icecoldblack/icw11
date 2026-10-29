import 'package:flutter_test/flutter_test.dart';
import 'package:signup_app/main.dart';

void main() {
  testWidgets('Welcome screen shows the enter button', (tester) async {
    await tester.pumpWidget(const HauntedMansionApp());
    // Let the typewriter title finish
    await tester.pump(const Duration(seconds: 5));
    expect(find.text('Enter If You Dare'), findsOneWidget);
  });
}
