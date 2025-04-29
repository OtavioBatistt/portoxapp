import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/back_button.dart';
import 'package:portox_app/app/commons/widgets/confirmation.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/commons/widgets/pagination.dart';
import 'package:portox_app/app/modules/occurrence/domain/entities/new_occurrence_params_entity.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/item_fields.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({
    required this.schedule,
    super.key,
  });

  final ScheduleEntity schedule;

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int itemIndex = 0;
  String locationFieldLabel = '';

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Scaffold(
          backgroundColor: Ox.colors.white,
          bottomNavigationBar: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Ox.colors.green,
              fixedSize: Size(double.maxFinite, Ox.size.ref220.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Ox.radii.ref0),
              ),
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => OxConfirmation(
                onCancel: () => Modular.to.pop(),
                onSubmit: () {
                  Modular.to.pop();
                  Modular.to.pushNamed(
                    '/checklist/',
                    arguments: widget.schedule,
                  );
                },
                message: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Ox.colors.blue,
                      fontSize: Ox.fontSizes.ref60,
                    ),
                    children: [
                      TextSpan(
                        text: intl(
                          context,
                          'schedule-detail-page.confirmation',
                        ),
                      ),
                      TextSpan(
                        text: ' ${widget.schedule.scheduleNumber}',
                        style: TextStyle(
                          fontWeight: Ox.fontWeights.bold,
                        ),
                      ),
                      const TextSpan(
                        text: ' ?',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Ox.size.ref80.h,
                  width: Ox.size.ref80.h,
                  child: OxAsset(Ox.assets.iconCameraThicker),
                ),
                Text(
                  intl(context, 'detail-pages.submit').toUpperCase(),
                  style: TextStyle(
                    fontWeight: Ox.fontWeights.medium,
                    fontSize: Ox.fontSizes.ref40,
                    color: Ox.colors.black,
                  ),
                ),
              ],
            ),
          ),
          appBar: OxAppBar(appStore: Modular.get()),
          body: OxLayout(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Ox.space.ref40.w,
                vertical: Ox.space.ref50.h,
              ),
              child: Column(
                children: [
                  const OxBackButton(),
                  Row(
                    children: [
                      OxAsset(Ox.assets.iconServer),
                      SizedBox(width: Ox.space.ref60.w),
                      Text(
                        intl(context, 'item-detail-page.title'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.schedule.scheduleNumber,
                        style: TextStyle(
                          fontSize: Ox.fontSizes.ref60,
                          color: Ox.colors.blue,
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: Ox.colors.blue,
                            fontSize: Ox.fontSizes.ref40,
                          ),
                          children: [
                            TextSpan(
                              text: intl(
                                context,
                                'item-detail-page.item-indicator',
                              ),
                            ),
                            TextSpan(
                              text: ' ${itemIndex + 1} ',
                              style: TextStyle(
                                fontWeight: Ox.fontWeights.bold,
                                fontSize: Ox.fontSizes.ref60,
                              ),
                            ),
                            TextSpan(
                              text: intl(
                                context,
                                'item-detail-page.of-indicator',
                              ),
                            ),
                            TextSpan(
                              text: ' ${widget.schedule.lines.length}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Ox.space.ref10.h),
                  Divider(
                    color: Ox.colors.grayLight,
                    height: 1,
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(1),
                      children: [
                        SizedBox(height: Ox.space.ref50.h),
                        Visibility(
                          visible: widget.schedule.lines.isNotEmpty,
                          replacement: Center(
                            child: Column(
                              children: [
                                OxAsset(
                                  Ox.assets.iconError,
                                  size: Ox.size.ref80,
                                  color: Ox.colors.blue,
                                ),
                                SizedBox(height: Ox.space.ref30),
                                Text(
                                  intl(
                                    context,
                                    'item-detail-page.not-found-error',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: OxItemFields(
                            line: widget.schedule.lines.isNotEmpty
                                ? widget.schedule.lines[itemIndex]
                                : null,
                          ),
                        ),
                        SizedBox(height: Ox.space.ref50.h),
                        Visibility(
                          visible: widget.schedule.lines.length > 1,
                          child: OxPagination(
                            selectedIndex: itemIndex,
                            itemAmount: widget.schedule.lines.length,
                            onItemPress: (index) {
                              setState(() => itemIndex = index);
                            },
                            onBackPress: () {
                              if (itemIndex > 0) {
                                setState(() => itemIndex = itemIndex - 1);
                              }
                            },
                            onNextPress: () {
                              if (itemIndex <
                                  (widget.schedule.lines.length - 1)) {
                                setState(() => itemIndex = itemIndex + 1);
                              }
                            },
                          ),
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        SizedBox(height: Ox.space.ref40.h),
                        ElevatedButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => OxConfirmation(
                              onCancel: () => Modular.to.pop(),
                              onSubmit: () {
                                Modular.to.popAndPushNamed(
                                  '/occurrence/new',
                                  arguments: NewOccurrenceParamsEntity(
                                    schedule: widget.schedule,
                                    selectedItem:
                                        widget.schedule.lines[itemIndex],
                                  ),
                                );
                              },
                              message: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Ox.colors.blue,
                                    fontSize: Ox.fontSizes.ref60,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: intl(
                                        context,
                                        'detail-pages.occurrence-confirmation',
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' ${widget.schedule.scheduleNumber}',
                                      style: TextStyle(
                                        fontWeight: Ox.fontWeights.bold,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: ' ?',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Ox.colors.errorLight,
                            fixedSize: Size.fromHeight(Ox.size.ref140.h),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: Ox.size.ref50.h,
                                width: Ox.size.ref50.h,
                                child: OxAsset(
                                  Ox.assets.iconWarning,
                                  color: Ox.colors.white,
                                ),
                              ),
                              SizedBox(width: Ox.size.ref10.w),
                              Text(
                                intl(context, 'detail-pages.occurrence-button')
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontWeight: Ox.fontWeights.medium,
                                  fontSize: Ox.fontSizes.ref40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
