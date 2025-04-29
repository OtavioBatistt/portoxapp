import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';

class OxChecklistItem extends StatelessWidget {
  const OxChecklistItem({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
    this.step,
    this.buttonActiveColor,
    this.buttonInactiveColor,
    this.buttonLabelActiveColor,
    this.buttonLabelInactiveColor,
    this.wasExecuted = false,
    this.isScanSeal = false,
  });

  final String icon;
  final String label;
  final String? step;
  final Color? buttonActiveColor;
  final Color? buttonInactiveColor;
  final Color? buttonLabelActiveColor;
  final Color? buttonLabelInactiveColor;
  final bool wasExecuted;
  final void Function() onTap;
  final bool isScanSeal;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: Ox.space.ref185,
        child: Row(
          children: [
            SizedBox(
              width: Ox.size.ref80,
              child: OxAsset(
                icon,
                color: Ox.colors.blue,
              ),
            ),
            SizedBox(width: Ox.space.ref40),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style: TextStyle(
                      color: Ox.colors.blue,
                      fontSize: Ox.fontSizes.ref50,
                      fontWeight: Ox.fontWeights.medium,
                    ),
                  ),
                  if (step == null)
                    Container()
                  else
                    Text(
                      step!.toUpperCase(),
                      style: TextStyle(
                        color: Ox.colors.blue,
                        fontSize: Ox.fontSizes.ref45,
                        fontWeight: Ox.fontWeights.regular,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: Ox.space.ref40),
            if (isScanSeal)
              ElevatedButton(
                key: const Key('clickable-checklist-item-area'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: wasExecuted
                      ? buttonInactiveColor ?? Ox.colors.grayLight
                      : buttonActiveColor ?? Ox.colors.blueLight,
                  fixedSize: Size.fromWidth(Ox.size.ref340.w),
                ),
                onPressed: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      wasExecuted
                          ? intl(context, 'checklist-item.add-button')
                              .toUpperCase()
                          : intl(context, 'checklist-item.active-button')
                              .toUpperCase(),
                      style: TextStyle(
                        color: wasExecuted
                            ? buttonInactiveColor ?? Ox.colors.gray
                            : buttonActiveColor ?? Ox.colors.white,
                        fontSize: Ox.fontSizes.ref40,
                      ),
                    ),
                    if (wasExecuted)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          '+',
                          style: TextStyle(
                            color: Ox.colors.blueLight,
                            fontSize: Ox.fontSizes.ref50,
                          ),
                        ),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
              )
            else
              ElevatedButton(
                key: const Key('clickable-checklist-item-area'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: wasExecuted
                      ? buttonInactiveColor ?? Ox.colors.grayLight
                      : buttonActiveColor ?? Ox.colors.blueLight,
                  fixedSize: Size.fromWidth(Ox.size.ref340.w),
                ),
                onPressed: wasExecuted ? null : onTap,
                child: Text(
                  wasExecuted
                      ? intl(context, 'checklist-item.inactive-button')
                          .toUpperCase()
                      : intl(context, 'checklist-item.active-button')
                          .toUpperCase(),
                  style: TextStyle(
                    color: wasExecuted
                        ? buttonInactiveColor ?? Ox.colors.gray
                        : buttonActiveColor ?? Ox.colors.white,
                    fontSize: Ox.fontSizes.ref40,
                  ),
                ),
              )
          ],
        ),
      );
}
