import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/domain/occurrence_type_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/autocomplete.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/occurrence/presentation/stores/occurrence_store.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/line_entity.dart';

class NewOccurrencePage extends StatefulWidget {
  const NewOccurrencePage({
    required this.store,
    required this.schedule,
    super.key,
    this.selectedItem,
  });

  final ScheduleEntity schedule;
  final LineEntity? selectedItem;
  final OccurrenceStore store;

  @override
  State<NewOccurrencePage> createState() => _NewOccurrencePageState();
}

class _NewOccurrencePageState extends State<NewOccurrencePage> {
  late OccurrenceStore controller;
  String _occurrenceType = '';
  late TextEditingController _occurrenceRncController;
  String _occurrenceItem = '';
  late TextEditingController _occurrenceCommentaryController;

  bool _occurrenceTypeNotEmpty = false;
  bool _occurrenceRncNotEmpty = false;
  bool _occurrenceItemNotEmpty = false;
  bool _occurrenceCommentaryNotEmpty = false;

  @override
  void initState() {
    super.initState();
    controller = widget.store;
    controller.loadOccurrenceTypes(widget.schedule);
    _occurrenceRncController = TextEditingController();
    _occurrenceCommentaryController = TextEditingController();
    _occurrenceItemNotEmpty = widget.selectedItem != null;

    _occurrenceRncController.addListener(
      () => setState(
        () => _occurrenceRncNotEmpty = _occurrenceRncController.text.isNotEmpty,
      ),
    );
    _occurrenceCommentaryController.addListener(
      () => setState(
        () => _occurrenceCommentaryNotEmpty =
            _occurrenceCommentaryController.text.isNotEmpty,
      ),
    );
  }

  @override
  void dispose() {
    _occurrenceRncController.dispose();
    _occurrenceCommentaryController.dispose();
    super.dispose();
  }

  OccurrenceTypeEntity getTypeId() {
    final occurrence = controller.occurrenceTypes.firstWhere(
      (e) => controller.getOccurrenceDescription(e) == _occurrenceType,
    );
    return occurrence;
  }

  String getLineOption(LineEntity line) =>
      '${line.compartment} - ${line.orderNumber}/${line.lineNumber} ${line.itemDescription}';

  String parseLineOption(String description) {
    final split = description.split(' - ');
    if (split.length < 2) {
      return '';
    }
    final compartment = int.tryParse(split[0]);
    final orderNumber = split[1].split('/')[0];
    final lineNumber = split[1].split('/')[1].split(' ')[0];
    final itemDescription =
        split[1].split('/')[1].split(' ').sublist(1).join(' ');
    final line = widget.schedule.lines.firstWhere(
      (line) =>
          line.compartment == compartment &&
          line.itemDescription.contains(itemDescription) &&
          line.orderNumber == orderNumber &&
          line.lineNumber == lineNumber,
    );
    return line.id.toString();
  }

  List<String> handleItemOptions() {
    final sorted = widget.schedule.lines
      ..sort((a, b) => (a.compartment ?? 0).compareTo(b.compartment ?? 0));
    return [
      intl(context, 'occurrence-detail-page.all-items'),
      ...sorted.map(getLineOption).toList()
    ];
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
              child: ListView(
                children: [
                  Row(
                    children: [
                      OxAsset(Ox.assets.iconServer),
                      SizedBox(width: Ox.space.ref60.w),
                      Text(
                        intl(context, 'schedule-detail-page.title'),
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
                    widget.schedule.scheduleNumber.toUpperCase(),
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
                  SizedBox(height: Ox.space.ref80.h),
                  OxAutocomplete(
                    labelText: intl(
                      context,
                      'occurrence-detail-page.occurrence-type-label',
                    ),
                    options: controller.occurrenceTypes
                        .map((e) => controller.getOccurrenceDescription(e))
                        .toList(),
                    onSelected: (value) {
                      setState(() {
                        _occurrenceType = value;
                        _occurrenceTypeNotEmpty = value.isNotEmpty;
                      });
                    },
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  TextField(
                    controller: _occurrenceRncController,
                    style: TextStyle(fontSize: Ox.fontSizes.ref40),
                    decoration: InputDecoration(
                      labelText: intl(
                        context,
                        'occurrence-detail-page.occurrence-rnc-label',
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  OxAutocomplete(
                    labelText: intl(
                      context,
                      'occurrence-detail-page.occurrence-item-label',
                    ),
                    controller: widget.selectedItem != null
                        ? TextEditingController(
                            text: getLineOption(widget.selectedItem!),
                          )
                        : null,
                    options: handleItemOptions(),
                    onSelected: (value) {
                      setState(() {
                        _occurrenceItem = value;
                        _occurrenceItemNotEmpty = value.isNotEmpty;
                      });
                    },
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  TextField(
                    controller: _occurrenceCommentaryController,
                    minLines: 8,
                    maxLines: 8,
                    style: TextStyle(fontSize: Ox.fontSizes.ref40),
                    decoration: InputDecoration(
                      labelText: intl(
                        context,
                        'occurrence-detail-page.occurrence-commentary-label',
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => Modular.to.pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Ox.colors.white,
                          elevation: 0,
                        ),
                        child: Text(
                          intl(
                            context,
                            'app.cancel',
                          ).toUpperCase(),
                          style: TextStyle(
                            color: Ox.colors.blue,
                            fontWeight: Ox.fontWeights.medium,
                            fontSize: Ox.fontSizes.ref40,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _occurrenceTypeNotEmpty &&
                                (!getTypeId().required ||
                                    _occurrenceRncNotEmpty) &&
                                _occurrenceItemNotEmpty &&
                                _occurrenceCommentaryNotEmpty
                            ? () => controller.onSubmit(
                                  comments:
                                      _occurrenceCommentaryController.text,
                                  type: getTypeId().classificId.toString(),
                                  lineId: parseLineOption(_occurrenceItem),
                                  rncNumber: _occurrenceRncController.text,
                                  scheduleNumber:
                                      widget.schedule.scheduleNumber,
                                )
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _occurrenceTypeNotEmpty &&
                                  (!getTypeId().required ||
                                      _occurrenceRncNotEmpty) &&
                                  _occurrenceItemNotEmpty &&
                                  _occurrenceCommentaryNotEmpty
                              ? Ox.colors.green
                              : Ox.colors.grayLight,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              intl(
                                context,
                                'app.save',
                              ).toUpperCase(),
                              style: TextStyle(
                                color: Ox.colors.blue,
                                fontWeight: Ox.fontWeights.medium,
                                fontSize: Ox.fontSizes.ref40,
                              ),
                            ),
                            SizedBox(width: Ox.space.ref20),
                            OxAsset(
                              Ox.assets.iconSave,
                              color: Ox.colors.blue,
                              size: Ox.size.ref50,
                            ),
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
      );
}
