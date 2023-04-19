import 'package:flutter/material.dart';
import 'package:flutter_guidelines/main.dart';
import 'package:flutter_guidelines/widgets/facts-page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../facts_test.mocks.dart';

void main() {
  testWidgets('Test api widget', (WidgetTester tester) async {
// https://docs.flutter.io/flutter/widgets/MediaQuery-class.html
    // return new MediaQuery(
    //     data: new MediaQueryData(), child: new MaterialApp(home: widget));

    //  var client = MockClient();

    var app = new MediaQuery(
        data: new MediaQueryData(), child: new MaterialApp(home: MyApp()));
    await tester.pumpWidget(MyApp());
    var button = find.widgetWithText(ElevatedButton, 'Click');
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pump();
    expect(find.widgetWithText(ElevatedButton, 'fetching'), findsOneWidget);
    //await tester.pumpAndSettle(Duration(seconds: 5));
    //expect(find.text("Done"), findsOneWidget);
  }, skip: true);
}
