import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/checklist_item.dart';

import '../../helpers/ignore_overflow_errors.dart';

void main() {
  var isChecklistItemTapped = false;

  Widget createChecklistItemWidget({bool wasExecuted = false, String? step}) =>
      OxChecklistItem(
        icon: Ox.assets.iconScanner,
        label: "Label test",
        step: step,
        wasExecuted: wasExecuted,
        onTap: () {
          isChecklistItemTapped = true;
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

  group('Schedule module checklist item tests:', () {
    testWidgets('Should call the ChecklistItem with default params',
        (tester) async {
      await tester.pumpWidget(
          createWidget((context, setState) => createChecklistItemWidget()));

      expect(find.byType(OxChecklistItem), findsOneWidget);
    });

    testWidgets('Should call the ChecklistItem with step param',
        (tester) async {
      FlutterError.onError = ignoreOverflowErrors;

      await tester.pumpWidget(createWidget(
          (context, setState) => createChecklistItemWidget(step: "Fase 1")));

      expect(find.text("Fase 1".toUpperCase()), findsOneWidget);
    });

    testWidgets('Should call the onTap function and change the boolean',
        (tester) async {
      await tester.pumpWidget(
          createWidget((context, setState) => createChecklistItemWidget()));

      expect(isChecklistItemTapped, isFalse);

      await tester.tap(find.byKey(const Key('clickable-checklist-item-area')));

      expect(isChecklistItemTapped, isTrue);
    });

    testWidgets('Should onChanged be null if isDisabled is true',
        (tester) async {
      await tester.pumpWidget(createWidget(
          (context, setState) => createChecklistItemWidget(wasExecuted: true)));

      final checklistItemButton = tester.widget<ElevatedButton>(
          find.byKey(const Key('clickable-checklist-item-area')));

      expect(checklistItemButton.onPressed, isNull);
    });
  });
}
