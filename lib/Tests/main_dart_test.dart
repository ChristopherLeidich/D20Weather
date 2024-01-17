import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fantasy_weather_app/main.dart';

import '../Widgets/expandables/dice_roller_dialog.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('App should start and display WeatherD20', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that WeatherD20 is displayed.
    expect(find.byType(WeatherD20), findsOneWidget);
  });

  testWidgets('App should open drawer on menu button press', (WidgetTester tester) async {
    final MockNavigatorObserver navigatorObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: MyApp(),
        navigatorObservers: [navigatorObserver],
      ),
    );

    // Tap the menu button.
    await tester.tap(find.byIcon(Icons.list_outlined));
    await tester.pumpAndSettle();

    // Verify that the drawer is opened.
    verify(navigatorObserver.didPush(any, any));

    // You can add more assertions based on your specific requirements.
  });

  // Add more tests as needed for different functionalities.

  // Example: Test the behavior of diceRollScreen function
  testWidgets('Dice roll screen should be displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Trigger the diceRollScreen function.
    diceRollScreen(tester.binding.buildContext);

    // Verify that the DiceRollDialog is displayed.
    expect(find.byType(DiceRollDialog), findsOneWidget);
  });
}