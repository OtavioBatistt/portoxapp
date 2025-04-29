import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/card.dart';

class OxChecklistConfirmation extends StatelessWidget {
  const OxChecklistConfirmation({
    super.key,
    required this.flowDescription,
    required this.scheduleNumber,
    required this.scheduleData,
    required this.userData,
    required this.onSubmit,
    required this.onCancel,
  });

  final String flowDescription;
  final String scheduleNumber;
  final String scheduleData;
  final String userData;
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
                    horizontal: Ox.size.ref90,
                    vertical: Ox.size.ref120,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              softWrap: false,
                              text: TextSpan(
                                text:
                                    intl(context, 'confirmation-step.execute'),
                                style: TextStyle(
                                  color: Ox.colors.blue,
                                  fontSize: Ox.fontSizes.ref60,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: flowDescription,
                                    style: TextStyle(
                                      color: Ox.colors.blue,
                                      fontSize: Ox.fontSizes.ref60,
                                      fontWeight: Ox.fontWeights.medium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Ox.space.ref20),
                      RichText(
                        text: TextSpan(
                          text: scheduleNumber,
                          style: TextStyle(
                            color: Ox.colors.blue,
                            fontSize: Ox.fontSizes.ref60,
                            fontWeight: Ox.fontWeights.medium,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' ?',
                              style: TextStyle(
                                  color: Ox.colors.blue,
                                  fontSize: Ox.fontSizes.ref60,
                                  fontWeight: Ox.fontWeights.regular),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Ox.space.ref40),
                      Text(
                        intl(context, 'confirmation-step.schedule-data'),
                        style: TextStyle(
                          color: Ox.colors.blue,
                          fontSize: Ox.fontSizes.ref40,
                          fontWeight: Ox.fontWeights.bold,
                        ),
                      ),
                      Text(
                        scheduleData,
                        style: TextStyle(
                          color: Ox.colors.blue,
                          fontSize: Ox.fontSizes.ref40,
                        ),
                      ),
                      SizedBox(height: Ox.space.ref40),
                      Text(
                        intl(context, 'confirmation-step.user-data'),
                        style: TextStyle(
                          color: Ox.colors.blue,
                          fontSize: Ox.fontSizes.ref40,
                          fontWeight: Ox.fontWeights.bold,
                        ),
                      ),
                      Text(
                        userData,
                        style: TextStyle(
                          color: Ox.colors.blue,
                          fontSize: Ox.fontSizes.ref40,
                        ),
                      ),
                      SizedBox(height: Ox.space.ref40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            key: const Key(
                                "clickable-checklist-confirmation-cancel-area"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Ox.colors.grayLight,
                            ),
                            onPressed: onCancel,
                            child: Text(
                              intl(context, 'app.cancel').toUpperCase(),
                              style: TextStyle(
                                color: Ox.colors.gray,
                                fontWeight: Ox.fontWeights.medium,
                                fontSize: Ox.fontSizes.ref40,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            key: const Key(
                                "clickable-checklist-confirmation-submit-area"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Ox.colors.blueLight,
                            ),
                            onPressed: onSubmit,
                            child: Text(
                              intl(context, 'app.execute').toUpperCase(),
                              style: TextStyle(
                                color: Ox.colors.white,
                                fontWeight: Ox.fontWeights.medium,
                                fontSize: Ox.fontSizes.ref40,
                              ),
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
