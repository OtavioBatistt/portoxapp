import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portox_app/app/commons/widgets/autocomplete.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

void main() {
  var selectedValue = "";
  final formKey = GlobalKey<FormState>();

  Widget createOxAutocompleteWidget(
          {bool enabled = true, maxOptionsToShow = 4}) =>
      OxAutocomplete(
        options: const [
          "mockedValue1",
          "mockedValue2",
          "mockedValue3",
          "mockedValue4",
        ],
        enabled: enabled,
        maxOptionsToShow: maxOptionsToShow,
        onSelected: (value) {
          selectedValue = value ?? "error";
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

  group('Autocomplete tests:', () {
    testWidgets('Should be rendered with correct default values',
        (tester) async {
      await tester.pumpWidget(
        createWidget(
          (context, setState) => createOxAutocompleteWidget(),
        ),
      );

      final oxAutocomplete = find.byType(OxAutocomplete);

      expect(oxAutocomplete, findsOneWidget);
    });

    testWidgets('Should call the onSelected function and change the value',
        (tester) async {
      await tester.pumpWidget(
        createWidget(
          (context, setState) => createOxAutocompleteWidget(),
        ),
      );

      final oxAutocompleteInput = find.byType(OxAutocomplete);

      final oxAutocompleteItem =
          find.byKey(const Key('selectable-autocomplete-area')).first;

      await tester.tap(oxAutocompleteInput);
      await tester.pumpAndSettle();

      await tester.tap(oxAutocompleteItem);

      expect(selectedValue, "mockedValue1");
    });

    testWidgets('Should onSelected be null if enabled is false',
        (tester) async {
      await tester.pumpWidget(
        createWidget(
          (context, setState) => createOxAutocompleteWidget(enabled: false),
        ),
      );

      final oxAutocompleteWidget = tester.widget<Container>(
          find.byKey(const Key("clickable-autocomplete-area")));

      expect(
          (oxAutocompleteWidget.child as RawAutocomplete).onSelected, isNull);
    });

    testWidgets(
        'Should maxHeight change if options length is bigger than maxOptionsToShow',
        (tester) async {
      const maxOptionsToShow = 2;

      await tester.pumpWidget(
        createWidget(
          (context, setState) =>
              createOxAutocompleteWidget(maxOptionsToShow: maxOptionsToShow),
        ),
      );

      final oxAutocompleteInput = find.byType(OxAutocomplete);

      await tester.tap(oxAutocompleteInput);
      await tester.pumpAndSettle();

      final oxAutocompleteConstraintsListWidget = tester.widget<ConstrainedBox>(
          find.byKey(const Key("constraints-autocomplete-list-area")));

      expect(oxAutocompleteConstraintsListWidget.constraints.maxHeight,
          equals(Ox.size.ref140 * maxOptionsToShow));
    });
  });
}
