import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/occurrence/presentation/stores/occurrence_store.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/data_text_field.dart';

class OccurrenceDetailPage extends StatelessWidget {
  const OccurrenceDetailPage({
    required this.occurrence,
    required this.schedule,
    required this.store,
    super.key,
  });

  final OccurrenceEntity occurrence;
  final ScheduleEntity schedule;
  final OccurrenceStore store;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Scaffold(
          backgroundColor: Ox.colors.white,
          appBar: OxAppBar(appStore: Modular.get()),
          body: OxLayout(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Ox.space.ref40.w,
                vertical: Ox.space.ref50.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      OxAsset(Ox.assets.iconServer),
                      SizedBox(width: Ox.space.ref60.w),
                      Text(
                        intl(context, 'occurrence-page.title'),
                        style: TextStyle(
                          fontSize: Ox.fontSizes.ref50,
                          fontWeight: Ox.fontWeights.medium,
                          color: Ox.colors.blue,
                        ),
                      ),
                      SizedBox(width: Ox.space.ref20.w),
                    ],
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  Text(
                    schedule.scheduleNumber.toUpperCase(),
                    style: TextStyle(
                      color: Ox.colors.blue,
                      fontSize: Ox.fontSizes.ref60,
                      fontWeight: Ox.fontWeights.regular,
                    ),
                  ),
                  SizedBox(height: Ox.space.ref20.h),
                  Divider(
                    color: Ox.colors.grayLight,
                    height: 1,
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  OxDataTextField(
                    title: intl(
                      context,
                      'occurrence-detail-page.occurrence-type-label',
                    ),
                    value: store.getOccurrenceDescriptionById(occurrence.type),
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  OxDataTextField(
                    title: intl(
                      context,
                      'occurrence-detail-page.occurrence-rnc-label',
                    ),
                    value: occurrence.rncNumber,
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  OxDataTextField(
                    title: intl(
                      context,
                      'occurrence-detail-page.occurrence-item-label',
                    ),
                    value:
                        store.getLineDescription(schedule, occurrence.lineId) ??
                            intl(context, 'occurrence-detail-page.all-items'),
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  OxDataTextField(
                    title: intl(
                      context,
                      'occurrence-detail-page.occurrence-commentary-label',
                    ),
                    value: occurrence.comments,
                    minLines: 8,
                  ),
                  Expanded(
                    child: Align(
                      child: ElevatedButton(
                        onPressed: () => Modular.to.pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Ox.colors.blue,
                        ),
                        child: Text(
                          intl(
                            context,
                            'app.close',
                          ).toUpperCase(),
                          style: TextStyle(
                            color: Ox.colors.white,
                            fontWeight: Ox.fontWeights.medium,
                            fontSize: Ox.fontSizes.ref40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
