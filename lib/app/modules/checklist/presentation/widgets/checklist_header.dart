import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';

class OxChecklistHeader extends StatelessWidget {
  const OxChecklistHeader({
    super.key,
    required this.icon,
    this.step,
    required this.flowDescription,
    required this.scheduleNumber,
  });

  final String icon;
  final String? step;
  final String flowDescription;
  final String scheduleNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OxAsset(
              icon,
              color: Ox.colors.blue,
              size: Ox.size.ref100,
            ),
            SizedBox(width: Ox.space.ref40),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      flowDescription,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                          color: Ox.colors.blue,
                          fontSize: Ox.fontSizes.ref55,
                          fontWeight: Ox.fontWeights.medium),
                    ),
                  ),
                  SizedBox(width: Ox.space.ref20),
                  step != null
                      ? Text(
                          '($step)',
                          style: TextStyle(
                              color: Ox.colors.blue,
                              fontSize: Ox.fontSizes.ref50,
                              fontWeight: Ox.fontWeights.regular),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: Ox.space.ref40),
        Text(
          scheduleNumber.toUpperCase(),
          style: TextStyle(
            color: Ox.colors.blue,
            fontSize: Ox.fontSizes.ref60,
            fontWeight: Ox.fontWeights.regular,
          ),
        ),
        SizedBox(height: Ox.space.ref20),
        Divider(
          color: Ox.colors.grayLight,
          height: 1,
        ),
        SizedBox(height: Ox.space.ref40),
      ],
    );
  }
}
