import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import '../example/lib/main.dart';

void main() {
  testWidgets('Skip Pressed smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    // Verify that Skip button is visible.
    expect(find.text('Skip'), findsOneWidget);
    expect(find.text('Fancy OnBoarding'), findsNothing);

    // Tap the 'Skip' button and navigate to next screen.
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    // Verify that the home page opens.
    expect(find.text('Fancy OnBoarding'), findsOneWidget);
    expect(find.text('Skip'), findsNothing);
  });

  testWidgets('Done Pressed smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    // Drag Screen 5 times To Reveal Done button
    for (int i = 1; i < 6; i++) {
      await tester.drag(find.byType(MyHomePage), Offset(-400.0, 0.0));
      await tester.pumpAndSettle();
    }

    // Verify that done button is now visible.
    expect(find.text('Skip'), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);

    // Tap the 'Done' button and trigger a frame
    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();

    // Verify that the home page opens.
    expect(find.text('Done'), findsNothing);
    expect(find.text('Fancy OnBoarding'), findsOneWidget);
  });

  testWidgets('Drag Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    // Drag from first page to second and back to first

    // should find First page by its title Text
    expect(find.text('Hotels'), findsWidgets);
    // second page title Text should not be found
    expect(find.text('Banks'), findsNothing);

    // Drag Screen To Reveal next Page
    await tester.drag(find.byType(MyHomePage), Offset(-400.0, 0.0));

    await tester.pumpAndSettle();

    // first page should have been removed by second page
    expect(find.text('Hotels'), findsNothing);
    expect(find.text('Banks'), findsWidgets);

    // Drag Screen To Reveal next Prev page
    await tester.drag(find.byType(MyHomePage), Offset(400.0, 0.0));

    await tester.pumpAndSettle();
    // first page should have been removed by second page
    expect(find.text('Hotels'), findsWidgets);
    // second page title Text should not be found
    expect(find.text('Banks'), findsNothing);
  });
}

class _IsVisible extends CustomMatcher {
  _IsVisible(dynamic matcher)
      : super('Check if a widget is visible or not', 'isVisible', matcher);

  @override
  Object featureValueOf(dynamic actual) {
    final finder = actual as Finder;
    final result = finder.evaluate().single as Opacity;

    return result.opacity;
  }
}

Matcher isVisible(bool value) => _IsVisible(value);
