import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/adapters/permissions/permissions_adapter.dart';
import 'package:portox_app/app/commons/adapters/recognizer/recognizer_adapter.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/camera.dart';
import 'package:portox_app/app/commons/widgets/flushbar.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/schedule/presentation/stores/new_schedule_store.dart';

class NewSchedulePage extends StatefulWidget {
  const NewSchedulePage({
    required this.store,
    required this.recognizer,
    required this.permissions,
    super.key,
  });
  final NewScheduleStore store;
  final PermissionsAdapter permissions;
  final RecognizerAdapter recognizer;

  @override
  State<NewSchedulePage> createState() => _NewSchedulePageState();
}

class _NewSchedulePageState extends State<NewSchedulePage> {
  late NewScheduleStore controller;
  Flushbar? flushbar;

  @override
  void initState() {
    super.initState();
    controller = widget.store;
    controller.status.addListener(() {
      flushbar ??= showErrorFlushbar(
        message: intl(context, 'code-scanner.error'),
      );
      if (controller.status.value == NewScheduleStatus.error) {
        flushbar?.show(context);
        controller.setStatus(NewScheduleStatus.initial);
      }
    });
  }

  @override
  void dispose() {
    flushbar?.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Scaffold(
          backgroundColor: Colors.transparent,
          appBar: OxAppBar(appStore: Modular.get()),
          body: OxLayout(
            child: OxCamera(
              permissions: widget.permissions,
              recognizer: widget.recognizer,
              onScan: (_, codes) => controller.onSubmit(codes, true),
              showQRCodeOverlay: true,
              disableOCRRecognizer: true,
            ),
          ),
        ),
      );
}
