import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:utkal_statistics_alumni_app/main.dart';

void main() {
  testWidgets('shows splash screen on launch', (WidgetTester tester) async {
    await tester.pumpWidget(const AlumniApp());

    expect(find.text('Utkal Statistics Alumni Association'), findsOneWidget);
  });

  testWidgets('navigates from splash to login', (WidgetTester tester) async {
    await tester.pumpWidget(const AlumniApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.text('Mobile Number'), findsOneWidget);
    expect(find.text('Login'), findsWidgets);
  });

  testWidgets('shows validation errors for empty login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AlumniApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    expect(find.text('Enter your mobile number'), findsOneWidget);
    expect(find.text('Enter your password'), findsOneWidget);
  });

  testWidgets('opens admin dashboard from demo button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AlumniApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Open Admin Demo'));
    await tester.pumpAndSettle();

    expect(find.text('Admin Dashboard'), findsOneWidget);
    expect(find.text('Sample Pending Alumni'), findsOneWidget);
  });
}
