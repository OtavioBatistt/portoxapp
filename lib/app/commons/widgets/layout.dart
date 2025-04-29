// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/adapters/network/network_adapter.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/widgets/flushbar.dart';

class OxLayout extends StatefulWidget {
  const OxLayout({
    required this.child,
    this.disabledNetworkValidation = false,
    super.key,
  });
  final Widget child;
  final bool disabledNetworkValidation;

  @override
  State<OxLayout> createState() => _OxLayoutState();
}

class _OxLayoutState extends State<OxLayout> {
  late INetworkAdapter networkAdapter;
  late AppStore store;
  late StreamSubscription stream;

  void setupFlushbar() {
    if (store.signinErrorFlushbar == null) {
      store.setSigninErrorFlushbar(
        showErrorFlushbar(
          isFixed: true,
          title: intl(context, 'app.flushbar-network-title'),
          message: intl(context, 'app.flushbar-network-message'),
        ),
      );
    }
    if (store.errorFlushbar == null) {
      store.setErrorFlushbar(
        showErrorFlushbar(
          message: intl(context, 'app.flushbar-network-title'),
        ),
      );
    }
    if (store.successFlushbar == null) {
      store.setSuccessFlushbar(
        showSuccessFlushbar(
          message: intl(context, 'app.flushbar-network-connect-title'),
        ),
      );
    }
  }

  Future<void> handleShow(BuildContext context, Flushbar flushbar) async {
    await store.dismissAll();
    if (!flushbar.isAppearing()) {
      await flushbar.show(context);
    }
  }

  @override
  void initState() {
    super.initState();
    networkAdapter = Modular.get<INetworkAdapter>();
    store = Modular.get<AppStore>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setupFlushbar();
    });
    stream = networkAdapter.check((hasConnection) async {
      if (widget.disabledNetworkValidation) {
        return;
      }
      if (context.mounted) {
        if (!hasConnection) {
          final isSignInPage =
              ModalRoute.of(context)?.settings.name?.contains('/sign-in/') ??
                  false;
          if (isSignInPage) {
            await handleShow(context, store.signinErrorFlushbar!);
          } else {
            await handleShow(context, store.errorFlushbar!);
          }
        } else {
          await handleShow(context, store.successFlushbar!);
        }
      }
    });
  }

  @override
  void dispose() {
    stream.cancel();
    store.dismissAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(child: widget.child);
}
