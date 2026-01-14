import 'package:flumo_flutter_example/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home grid shows example items', (tester) async {
    await tester.pumpWidget(const FlumoApp());
    expect(find.text('Splash'), findsOneWidget);
    expect(find.text('Map'), findsOneWidget);
    expect(find.text('Map Cluster'), findsOneWidget);
  });
}
