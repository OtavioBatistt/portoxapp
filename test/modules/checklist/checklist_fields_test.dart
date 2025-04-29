import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_fields.dart';

import '../../helpers/ignore_overflow_errors.dart';

void main() {
  Widget createChecklistFieldsWidget() => const OxChecklistFields(
        fields: {
          'Janelas': 'mockedJanelas',
          'Janela': 'mockedJanela',
          'CNH': 'mockedCNH',
          'mockedKeyWithoutValue': '',
        },
        compartments: [],
        // isWeightReadOnly: true,
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

  group('Checklist module checklist fields tests:', () {
    testWidgets('Should call the ChecklistFields with default params',
        (tester) async {
      FlutterError.onError = ignoreOverflowErrors;

      await tester.pumpWidget(
          createWidget((context, setState) => createChecklistFieldsWidget()));

      expect(find.byType(OxChecklistFields), findsOneWidget);
    });
  });
}
