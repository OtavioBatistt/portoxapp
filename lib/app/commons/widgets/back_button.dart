import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

class OxBackButton extends StatelessWidget {
  const OxBackButton({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Ox.colors.white,
        foregroundColor: Ox.colors.blueLight,
        fixedSize: const Size.fromWidth(double.maxFinite),
      ),
      onPressed: () {
        if (onTap != null) {
          onTap!();
        } else {
          Modular.to.maybePop();
        }
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: Ox.size.ref30.w,
            color: Ox.colors.blue,
          ),
          SizedBox(width: Ox.space.ref30.w),
          Text(
            intl(context, 'app.back').toUpperCase(),
            style: TextStyle(
              fontSize: Ox.fontSizes.ref35,
              fontWeight: FontWeight.w500,
              color: Ox.colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
