import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/card.dart';

final titleStyle = TextStyle(
  fontSize: Ox.fontSizes.ref70,
  color: Ox.colors.blue,
  fontWeight: Ox.fontWeights.bold,
);

final textStyle = TextStyle(
  fontSize: Ox.fontSizes.ref45,
  color: Ox.colors.blue,
);

showDoubtsPage(BuildContext context) {
  final alert = DefaultTextStyle(
    style: const TextStyle(),
    child: Wrap(
      runAlignment: WrapAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Ox.space.ref70.w),
          child: OxCard(
            child: Container(
              color: Ox.colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: Ox.space.ref130.h,
                      bottom: Ox.space.ref70.h,
                    ),
                    child: Text(
                      intl(context, 'doubts-page.title'),
                      style: titleStyle,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Ox.space.ref90.w,
                        vertical: Ox.space.ref20.h,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "1. ",
                            style: textStyle,
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: intl(context,
                                    'doubts-page.first-access-doubt-paragraph-one-part-one'),
                                style: textStyle,
                                children: <TextSpan>[
                                  const TextSpan(text: '"'),
                                  TextSpan(
                                      text: intl(context,
                                          'doubts-page.first-access-doubt-paragraph-one-part-second'),
                                      style: TextStyle(
                                          fontWeight: Ox.fontWeights.bold)),
                                  const TextSpan(text: '" '),
                                  TextSpan(
                                    text: intl(context,
                                        'doubts-page.first-access-doubt-paragraph-one-part-third'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Ox.space.ref100.w,
                        vertical: Ox.space.ref20.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2. ",
                          style: textStyle,
                        ),
                        Flexible(
                          child: Text(
                            intl(context,
                                'doubts-page.first-access-doubt-paragraph-two'),
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Ox.space.ref100.w,
                        vertical: Ox.space.ref20.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3. ",
                          style: textStyle,
                        ),
                        Flexible(
                          child: Text(
                            intl(context,
                                'doubts-page.first-access-doubt-paragraph-three'),
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(Ox.space.ref100.w,
                        Ox.space.ref20.h, Ox.space.ref90.w, Ox.space.ref0.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "4. ",
                          style: textStyle,
                        ),
                        Flexible(
                          child: Text(
                            intl(context,
                                'doubts-page.first-access-doubt-paragraph-four'),
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Ox.space.ref90.h),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Ox.colors.blue,
                            padding: EdgeInsets.symmetric(
                                vertical: Ox.space.ref20.h,
                                horizontal: Ox.space.ref50.w)),
                        onPressed: () => Modular.to.pop(),
                        child: Text(intl(context, 'doubts-page.button'))),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
