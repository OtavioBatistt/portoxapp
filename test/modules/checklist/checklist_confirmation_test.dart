import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_confirmation.dart';

void main() {
  var isCanceled = false;
  var isSubmited = false;

  Widget createChecklistConfirmationWidget() => OxChecklistConfirmation(
        flowDescription: "mockedDescription",
        scheduleNumber: "mockedScheduleNumber",
        scheduleData: "mockedScheduleData",
        userData: "mockedUserData",
        onCancel: () {
          isCanceled = true;
        },
        onSubmit: () {
          isSubmited = true;
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
                  child: StatefulBuilder(
                    builder: builder,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  group('Checklist module checklist header tests:', () {
    testWidgets('Should call the ChecklistConfirmation with default params',
        (tester) async {
      await tester.pumpWidget(createWidget(
          (context, setState) => createChecklistConfirmationWidget()));

      expect(find.byType(OxChecklistConfirmation), findsOneWidget);
    });

    testWidgets('Should call the onCancel function', (tester) async {
      await tester.pumpWidget(createWidget(
          (context, setState) => createChecklistConfirmationWidget()));

      await tester.tap(find
          .byKey(const Key('clickable-checklist-confirmation-cancel-area')));

      expect(isCanceled, isTrue);
    });

    testWidgets('Should call the onSubmit function', (tester) async {
      await tester.pumpWidget(createWidget(
          (context, setState) => createChecklistConfirmationWidget()));

      await tester.tap(find
          .byKey(const Key('clickable-checklist-confirmation-submit-area')));

      expect(isSubmited, isTrue);
    });
  });
}
