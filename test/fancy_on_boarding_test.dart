import 'package:flutter_test/flutter_test.dart';
import '../example/lib/main.dart';

void main() {
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
