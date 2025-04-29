import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portox_app/app/commons/widgets/radio.dart';

void main() {
  var selectedAnswer = "";

  Widget createWidget({bool? isDisabled}) => MaterialApp(
        home: Scaffold(
          body: OxRadio(
            value: "mockedValue",
            groupValue: "mockedGroup",
            isDisabled: isDisabled ?? false,
            onTap: (value) {
              selectedAnswer = value ?? "error";
            },
            child: const Text(
              "Radio label test",
            ),
          ),
        ),
      );

  group('Radio tests:', () {
    testWidgets('Should call the Radio with default params', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byType(OxRadio), findsOneWidget);
    });

    testWidgets('Should call the onChanged function and change the value',
        (tester) async {
      await tester.pumpWidget(createWidget());

      expect(selectedAnswer, isEmpty);

      await tester
          .tap(find.byKey(const Key('clickable-radio-area-mockedValue')));

      expect(selectedAnswer, "mockedValue");
    });

    testWidgets('Should onChanged be null if isDisabled is true',
        (tester) async {
      await tester.pumpWidget(createWidget(isDisabled: true));

      final currentRadio = tester.widget<RadioListTile>(
          find.byKey(const Key('clickable-radio-area-mockedValue')));

      expect(currentRadio.onChanged, isNull);
    });
  });
}
