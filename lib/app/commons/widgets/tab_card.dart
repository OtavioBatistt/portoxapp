import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';

class OxTabCard extends StatelessWidget {
  const OxTabCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isOutlined = false,
  });
  final String title;
  final String subtitle;
  final bool isOutlined;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Ox.radii.ref20),
          color: Ox.colors.white,
          border:
              isOutlined ? Border.all(color: Ox.colors.blue, width: 1) : null,
        ),
        child: ListTile(
          onTap: onTap,
          title: Text(
            title.replaceAll(' ', '\u{00A0}').replaceAll('-', '\u{2011}'),
            style: TextStyle(
              fontSize: Ox.fontSizes.ref45,
              color: Ox.colors.blue,
              fontWeight: Ox.fontWeights.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontSize: Ox.fontSizes.ref55,
              color: Ox.colors.blue,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: SizedBox(
            width: Ox.size.ref90.w,
            height: Ox.size.ref90.w,
            child: OxAsset(Ox.assets.iconEyeOpen, color: Ox.colors.blue),
          ),
        ),
      ),
    );
  }
}
