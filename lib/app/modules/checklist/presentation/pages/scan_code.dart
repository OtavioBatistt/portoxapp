import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portox_app/app/commons/adapters/permissions/permissions_adapter.dart';
import 'package:portox_app/app/commons/adapters/recognizer/recognizer_adapter.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/camera.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';

class ScanCode extends StatefulWidget {
  ScanCode({
    required this.recognizer,
    required this.permissions,
    this.callback,
    super.key,
  });
  final PermissionsAdapter permissions;
  final RecognizerAdapter recognizer;
  final Function(String code)? callback;

  @override
  State<ScanCode> createState() => _ScanCodeState();
}

class _ScanCodeState extends State<ScanCode> {
  Flushbar? flushbar;
  Function(String code)? callback;

  @override
  void initState() {
    super.initState();
    final args = Modular.args.data;
    if (args is Map && args['callback'] is Function(String)) {
      callback = args['callback'] as Function(String);
    }
  }

  @override
  void dispose() {
    flushbar?.dismiss();
    super.dispose();
  }

  void onScanCode(String code) {
    if (callback != null) {
      callback!(code);
    }
    Modular.to.pop();
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
              onScan: (_, codes) => {
                if (callback != null) {onScanCode(codes.first)}
              },
              showQRCodeOverlay: true,
              disableOCRRecognizer: true,
            ),
          ),
        ),
      );
}
