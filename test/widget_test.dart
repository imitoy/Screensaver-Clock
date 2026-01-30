import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('Clock screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the clock screen is displayed.
    expect(find.byType(ClockScreen), findsOneWidget);

    // Verify that the app bar is displayed.
    expect(find.byType(AppBar), findsOneWidget);

    // Verify that the clock text is displayed.
    expect(find.byType(Text), findsWidgets);
  });
}
