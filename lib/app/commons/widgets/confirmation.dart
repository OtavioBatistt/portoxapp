import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/card.dart';

class OxConfirmation extends StatelessWidget {
  const OxConfirmation({
    super.key,
    required this.message,
    required this.onSubmit,
    required this.onCancel,
  });

  final Widget message;
  final Function() onSubmit;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Ox.space.ref70.w),
            child: OxCard(
              child: Container(
                color: Ox.colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Ox.size.ref50,
                    vertical: Ox.size.ref200,
                  ),
                  child: Column(
                    children: [
                      message,
                      SizedBox(height: Ox.space.ref100.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Ox.colors.error,
                            ),
                            onPressed: onCancel,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.thumb_down, size: Ox.size.ref50),
                                SizedBox(width: Ox.space.ref20),
                                Text(
                                  intl(context, 'app.no').toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: Ox.fontWeights.medium,
                                    fontSize: Ox.fontSizes.ref40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Ox.colors.green,
                            ),
                            onPressed: onSubmit,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  intl(context, 'app.yes').toUpperCase(),
                                  style: TextStyle(
                                    color: Ox.colors.black,
                                    fontWeight: Ox.fontWeights.medium,
                                    fontSize: Ox.fontSizes.ref40,
                                  ),
                                ),
                                SizedBox(width: Ox.space.ref20),
                                Icon(Icons.thumb_up,
                                    size: Ox.size.ref50,
                                    color: Ox.colors.black),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
