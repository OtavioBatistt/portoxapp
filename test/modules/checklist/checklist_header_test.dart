import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_header.dart';

void main() {
  Widget createChecklistHeaderWidget({String? step}) => OxChecklistHeader(
        icon: Ox.assets.iconCamera,
        flowDescription: "mockedDescription",
        scheduleNumber: "mockedScheduleNumber",
        step: step,
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
    testWidgets('Should call the ChecklistHeader with default params',
        (tester) async {
      await tester.pumpWidget(
          createWidget((context, setState) => createChecklistHeaderWidget()));

      expect(find.byType(OxChecklistHeader), findsOneWidget);
    });

    testWidgets('Should call the onCancel function', (tester) async {
      await tester.pumpWidget(createWidget(
          (context, setState) => createChecklistHeaderWidget(step: 'Fase 1')));

      expect(find.text("(Fase 1)"), findsOneWidget);
    });
  });
}
