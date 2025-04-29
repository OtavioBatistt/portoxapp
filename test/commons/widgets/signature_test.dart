import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portox_app/app/commons/widgets/signature.dart';
import 'package:signature/signature.dart';

void main() {
  var signatureController = SignatureController(
    penStrokeWidth: 4,
  );

  Widget createSignatureWidget({required SignatureController controller}) =>
      MaterialApp(
        home: Scaffold(
          body: OxSignature(
            controller: controller,
          ),
        ),
      );

  Widget createWidget(
    Widget Function(BuildContext, void Function(void Function())) builder,
  ) =>
      ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Directionality(
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
      );

  group('Signature tests:', () {
    testWidgets('Should call the Signature with default params',
        (tester) async {
      await tester.pumpWidget(createWidget((context, setState) =>
          createSignatureWidget(controller: signatureController)));

      expect(find.byType(OxSignature), findsOneWidget);
    });

    testWidgets('Should be possible to write a signature', (tester) async {
      await tester.pumpWidget(createWidget((context, setState) =>
          createSignatureWidget(controller: signatureController)));

      final signatureWidget =
          tester.widget<Signature>(find.byKey(const Key('signature-drawer')));

      signatureWidget.controller
          .addPoint(Point(Offset.infinite, PointType.move, 1));

      expect(signatureWidget.controller.isNotEmpty, true);
    });

    testWidgets('Should call the clear function and reset the signature',
        (tester) async {
      await tester.pumpWidget(createWidget((context, setState) =>
          createSignatureWidget(controller: signatureController)));

      final signatureWidget =
          tester.widget<Signature>(find.byKey(const Key('signature-drawer')));

      signatureWidget.controller
          .addPoint(Point(Offset.infinite, PointType.move, 1));

      final clearButton = find.byKey(const Key('clear-button'));

      await tester.tap(clearButton);

      expect(signatureWidget.controller.isNotEmpty, false);
    });
  });
}
