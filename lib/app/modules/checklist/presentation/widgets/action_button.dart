import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

class OxActionButton extends StatelessWidget {
  const OxActionButton({
    required this.text,
    super.key,
    this.color,
    this.backgroundColor,
    this.prefixIcon,
    this.suffixIcon,
    this.isLoading,
    this.onPressed,
  });

  final String text;
  final Color? color;
  final Color? backgroundColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? isLoading;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: !(isLoading ?? false) ? onPressed : null,
        child: Visibility(
          visible: !(isLoading ?? false),
          replacement: SizedBox(
            height: Ox.space.ref50.h,
            width: Ox.space.ref50.h,
            child: CircularProgressIndicator(
              color: color,
              strokeWidth: 2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null)
                Row(
                  children: [
                    Icon(prefixIcon, size: Ox.size.ref50, color: color),
                    SizedBox(width: Ox.space.ref20),
                  ],
                ),
              Text(
                text.toUpperCase(),
                style: TextStyle(
                  color: color,
                  fontWeight: Ox.fontWeights.medium,
                  fontSize: Ox.fontSizes.ref40,
                ),
              ),
              if (suffixIcon != null)
                Row(
                  children: [
                    SizedBox(width: Ox.space.ref20),
                    Icon(suffixIcon, size: Ox.size.ref50, color: color),
                  ],
                ),
            ],
          ),
        ),
      );
}
