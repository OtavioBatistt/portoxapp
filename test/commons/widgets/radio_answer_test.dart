import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portox_app/app/commons/widgets/radio_answer.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  var selectedAnswer = "";
  final formKey = GlobalKey<FormState>();

  Widget createOxRadioAnswerWidget(
          {bool? isDisabled, OxRadioAnswerOrientationEnum? orientation}) =>
      OxRadioAnswer(
        orientation: orientation ?? OxRadioAnswerOrientationEnum.vertical,
        isDisabled: isDisabled ?? false,
        onTap: (value) {
          selectedAnswer = value ?? "error";
        },
      );

  Widget createWidget(
    Widget Function(BuildContext, void Function(void Function())) builder,
  ) =>
      ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Directionality(
              textDirection: TextDirection.ltr,
              child: MediaQuery(
                data: const MediaQueryData(size: Size(800, 600)),
                child: Material(
                  child: Form(
                    key: formKey,
                    child: StatefulBuilder(
                      builder: builder,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  group('Radio answer tests:', () {
    testWidgets('Should be rendered with correct default values',
        (tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(
            createWidget(
              (context, setState) => createOxRadioAnswerWidget(),
            ),
          ));

      await tester.pumpAndSettle();

      final oxRadioAnswer = find.byType(OxRadioAnswer);

      expect(oxRadioAnswer, findsOneWidget);
    });

    testWidgets(
        'Should call the onChanged function and change the value to YES',
        (tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(
            createWidget(
              (context, setState) => createOxRadioAnswerWidget(),
            ),
          ));

      final oxRadioAnswerYes =
          find.byKey(const Key('clickable-radio-answer-yes-area'));

      await tester.tap(oxRadioAnswerYes);

      expect(selectedAnswer, "Y");
    });

    testWidgets('Should onChanged be null if isDisabled is true',
        (tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(
            createWidget(
              (context, setState) =>
                  createOxRadioAnswerWidget(isDisabled: true),
            ),
          ));

      final yesRadioWidget = tester.widget<RadioListTile>(
          find.byKey(const Key('clickable-radio-area-Y')));

      expect(yesRadioWidget.onChanged, isNull);
    });

    testWidgets('Should orientation change to horizontal', (tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(
            createWidget(
              (context, setState) => createOxRadioAnswerWidget(
                  orientation: OxRadioAnswerOrientationEnum.horizontal),
            ),
          ));

      final oxRadioAnswerWidget =
          tester.widget<OxRadioAnswer>(find.byType(OxRadioAnswer));

      expect(oxRadioAnswerWidget.orientation,
          OxRadioAnswerOrientationEnum.horizontal);
    });
  });
}
