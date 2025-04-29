import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

class OxAsset extends StatelessWidget {
  const OxAsset(this.asset, {super.key, this.color, this.size, this.alignment});

  final String asset;
  final Color? color;
  final double? size;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/$asset',
      width: size ?? Ox.size.ref80,
      height: size ?? Ox.size.ref80,
      alignment: alignment ?? Alignment.center,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
