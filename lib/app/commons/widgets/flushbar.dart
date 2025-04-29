import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

final messageDefaultStyle = TextStyle(
  fontSize: Ox.fontSizes.ref60,
  fontWeight: Ox.fontWeights.medium,
  height: Ox.lineHeights.medium,
  color: Ox.colors.white,
);

Flushbar showErrorFlushbar({
  required String message,
  String? title,
  bool isFixed = false,
  Duration? animationDuration,
  Function(FlushbarStatus?)? onStatusChanged,
}) =>
    Flushbar(
      title: title,
      message: title == null ? null : message,
      messageText: title == null
          ? Text(
              message,
              style: messageDefaultStyle,
            )
          : null,
      backgroundColor: Ox.colors.error,
      duration: isFixed ? null : Duration(milliseconds: Ox.duration.ref1000),
      icon: Icon(
        Icons.error_outline,
        color: Ox.colors.white,
      ),
      shouldIconPulse: false,
      flushbarStyle: FlushbarStyle.GROUNDED,
      animationDuration: animationDuration ?? const Duration(seconds: 1),
      onStatusChanged: onStatusChanged,
    );

Flushbar showSuccessFlushbar({
  required String message,
  Duration? animationDuration,
  Function(FlushbarStatus?)? onStatusChanged,
}) =>
    Flushbar(
      backgroundColor: Ox.colors.success,
      duration: Duration(milliseconds: Ox.duration.ref1000),
      icon: Icon(
        Icons.check_circle_outline,
        color: Ox.colors.white,
      ),
      shouldIconPulse: false,
      flushbarStyle: FlushbarStyle.GROUNDED,
      messageText: Text(
        message,
        style: messageDefaultStyle,
      ),
      animationDuration: animationDuration ?? const Duration(seconds: 1),
      onStatusChanged: onStatusChanged,
    );
