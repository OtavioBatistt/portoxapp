import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/autocomplete.dart';
import 'package:portox_app/app/commons/widgets/back_button.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/occurrence/domain/entities/new_occurrence_params_entity.dart';
import 'package:portox_app/app/modules/occurrence/domain/entities/occurrence_detail_params_entity.dart';
import 'package:portox_app/app/modules/occurrence/presentation/stores/occurrence_store.dart';
import 'package:portox_app/app/modules/occurrence/presentation/widgets/ocurrences_list.dart';

class OccurrencePage extends StatefulWidget {
  const OccurrencePage({
    required this.store,
    super.key,
  });

  final OccurrenceStore store;

  @override
  State<OccurrencePage> createState() => _OccurrencePageState();
}

class _OccurrencePageState extends State<OccurrencePage> {
  late OccurrenceStore controller;
  String _scheduleSelected = '';

  @override
  void initState() {
    super.initState();
    controller = widget.store;
    controller.onLoad();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                children: [
                  const OxBackButton(),
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
                  Divider(
                    color: Ox.colors.grayLight,
                    height: 1,
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          intl(context, 'occurrence-page.subtitle'),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: Ox.fontSizes.ref70,
                            fontWeight: Ox.fontWeights.light,
                            color: Ox.colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Ox.space.ref80.h),
                  OxAutocomplete(
                    options: (controller.scheduleList ?? [])
                        .map((schedule) => schedule.scheduleNumber)
                        .toList(),
                    onSelected: (value) =>
                        setState(() => _scheduleSelected = value),
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: _scheduleSelected.isNotEmpty
                            ? () => Modular.to.pushNamed(
                                  '/occurrence/new',
                                  arguments: NewOccurrenceParamsEntity(
                                    schedule: (controller.scheduleList ?? [])
                                        .firstWhere(
                                      (element) =>
                                          element.scheduleNumber ==
                                          _scheduleSelected,
                                    ),
                                  ),
                                )
                            : null,
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromHeight(Ox.size.ref110),
                          backgroundColor: _scheduleSelected.isNotEmpty
                              ? Ox.colors.green
                              : Ox.colors.grayLight,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              intl(
                                context,
                                'app.next',
                              ).toUpperCase(),
                              style: TextStyle(
                                color: Ox.colors.blue,
                                fontWeight: Ox.fontWeights.medium,
                                fontSize: Ox.fontSizes.ref40,
                              ),
                            ),
                            SizedBox(width: Ox.space.ref20),
                            Icon(
                              Icons.arrow_forward,
                              size: Ox.size.ref50,
                              color: Ox.colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Visibility(
                      visible: controller.occurrenceList
                          .where(
                            (occurrence) =>
                                occurrence.scheduleNumber == _scheduleSelected,
                          )
                          .isNotEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Ox.space.ref40.h),
                          Divider(
                            color: Ox.colors.grayLight,
                            height: 1,
                          ),
                          SizedBox(height: Ox.space.ref80.h),
                          Text(
                            intl(
                              context,
                              'occurrence-page.registered-occurrences-label',
                            ),
                            style: TextStyle(
                              fontSize: Ox.fontSizes.ref70,
                              fontWeight: Ox.fontWeights.light,
                              color: Ox.colors.blue,
                            ),
                          ),
                          SizedBox(height: Ox.space.ref40.h),
                          OxOccurrencesList(
                            occurrences: controller.occurrenceList
                                .where(
                                  (occurrence) =>
                                      occurrence.scheduleNumber ==
                                      _scheduleSelected,
                                )
                                .toList()
                              ..sort(
                                (a, b) => b.createdAt.compareTo(a.createdAt),
                              ),
                            onTapOccurrence: (occurrence) {
                              Modular.to.pushNamed(
                                '/occurrence/detail',
                                arguments: OccurrenceDetailParamsEntity(
                                  occurrence: occurrence,
                                  schedule: (controller.scheduleList ?? [])
                                      .firstWhere(
                                    (schedule) =>
                                        schedule.scheduleNumber ==
                                        _scheduleSelected,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
