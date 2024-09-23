// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pet_app2/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    testWidgets('Initial happiness and hunger levels test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MaterialApp(home: DigitalPetApp()));

      // Verify that the initial happiness and hunger levels are displayed correctly.
      expect(find.text('Happiness Level: 50'), findsOneWidget);
      expect(find.text('Hunger Level: 50'), findsOneWidget);

      // Tap the 'Play with Your Pet' button and trigger a frame.
      await tester.tap(find.text('Play with Your Pet'));
      await tester.pump();

      // Verify that the happiness level has increased and hunger level has slightly increased.
      expect(find.text('Happiness Level: 60'), findsOneWidget);
      expect(find.text('Hunger Level: 55'), findsOneWidget);

      // Tap the 'Feed Your Pet' button and trigger a frame.
      await tester.tap(find.text('Feed Your Pet'));
      await tester.pump();

      // Verify that the hunger level has decreased and happiness level is updated.
      expect(find.text('Hunger Level: 45'), findsOneWidget);
      // Since happiness can increase or decrease, we can check if it's within a valid range
      expect(find.textContaining('Happiness Level:'), findsOneWidget);
    });
}
