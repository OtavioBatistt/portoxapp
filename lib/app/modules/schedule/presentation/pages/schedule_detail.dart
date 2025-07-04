import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_schedule_driver_phone_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/back_button.dart';
import 'package:portox_app/app/commons/widgets/confirmation.dart';
import 'package:portox_app/app/commons/widgets/flushbar.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/action_button.dart';
import 'package:portox_app/app/modules/occurrence/domain/entities/new_occurrence_params_entity.dart';
import 'package:portox_app/app/modules/schedule/data/external/storage/local_storage_master_datasource.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/data_text_field.dart';

class ScheduleDetailPage extends StatefulWidget {
  const ScheduleDetailPage({
    required this.schedule,
    required this.storage,
    super.key,
  });

  final ScheduleEntity schedule;
  final LocalStorageMasterDataSource storage;

  @override
  State<ScheduleDetailPage> createState() => _ScheduleDetailPageState();
}

class _ScheduleDetailPageState extends State<ScheduleDetailPage> {
  TextEditingController _phoneController = TextEditingController();
  FocusNode _phoneFocusNode = FocusNode();
  String locationFieldLabel = '';
  bool _hasDriverPhone = false;
  bool _driverPhoneSaved = false;
  bool _showSaveButton = false;

  IsarScheduleDriverPhoneEntity? _scheduleDriverPhone = null;

  final _maskFormatterPhone = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  Future<void> loadDriverPhoneNumber() async {
    var phoneNumber =
        await widget.storage.loadDriverPhone(widget.schedule.scheduleNumber);
    if (phoneNumber != null) {
      setState(() {
        _hasDriverPhone = true;
        _scheduleDriverPhone = phoneNumber;
        _phoneController.text = _scheduleDriverPhone!.driverPhone!;
      });
    } else {
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.schedule.operationType.startsWith('D')) {
        setState(() {
          locationFieldLabel = intl(context, 'schedule.discharge-field');
        });
      } else {
        setState(() {
          locationFieldLabel = intl(context, 'schedule.charge-field');
        });
      }
    });
    loadDriverPhoneNumber();
  }

  String _formatDate(DateTime date) {
    final day = date.day;
    final month = intl(context, 'app.month-${date.month}');
    final year = date.year;
    final hour = '${date.hour}'.padLeft(2, '0');
    final minute = '${date.minute}'.padLeft(2, '0');
    final weekday = intl(context, 'app.weekday-${date.weekday}');
    return '$day-$month-$year $hour:$minute ($weekday)';
  }

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
            onPressed: () async => {
              showDialog(
                context: context,
                builder: (context) => OxConfirmation(
                  onCancel: () => Modular.to.pop(),
                  onSubmit: () => Modular.to.popAndPushNamed(
                    '/checklist/',
                    arguments: widget.schedule,
                  ),
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
              )
            },
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.schedule.scheduleNumber,
                      style: TextStyle(
                        fontSize: Ox.fontSizes.ref60,
                        color: Ox.colors.blue,
                      ),
                    ),
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
                        OxDataTextField(
                          title: intl(context, 'schedule.plant-field'),
                          value: widget.schedule.plantDescription.isEmpty
                              ? widget.schedule.plantCode
                              : '${widget.schedule.plantCode} - ${widget.schedule.plantDescription}',
                        ),
                        SizedBox(height: Ox.space.ref50.h),
                        OxDataTextField(
                          title: intl(context, 'schedule.operation-field'),
                          value: widget.schedule.operationDescription,
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title: intl(context, 'schedule.seal-letter-text'),
                          value: widget.schedule.sealLetter
                              ? intl(context, 'schedule.seal-letter-field-true')
                              : intl(
                                  context, 'schedule.seal-letter-field-false'),
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title: intl(context, 'schedule.window-field'),
                          value:
                              '${_formatDate(widget.schedule.window)} - ${widget.schedule.location}',
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title: intl(context, 'schedule.carrier-field'),
                          value: widget.schedule.carrierName,
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title: intl(context, 'schedule.truck-plate-field'),
                          value: widget.schedule.truckPlate,
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title: intl(context, 'schedule.status-field'),
                          value:
                              intl(context, 'schedule.status-confirmed-field')
                                  .toUpperCase(),
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title: intl(context, 'schedule.trailer-plate-field'),
                          value: widget.schedule.trailerPlate,
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title: intl(context, 'schedule.axes-field'),
                          value: (widget.schedule.totalAxes ?? '').toString(),
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title:
                              intl(context, 'schedule.capacity-weight-field'),
                          value:
                              (widget.schedule.capacityWeight ?? '').toString(),
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title:
                              intl(context, 'schedule.capacity-volume-field'),
                          value:
                              (widget.schedule.capacityVolume ?? '').toString(),
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title: intl(context, 'schedule.driver-field'),
                          value: widget.schedule.driverName,
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title:
                              intl(context, 'schedule.driver-document-field'),
                          value: widget.schedule.driverDoc,
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: OxDataTextField(
                                title: intl(context, 'sms-page.phone'),
                                value: _phoneController.text,
                                controller: _phoneController,
                                readOnly: false,
                                inputFormatters: [_maskFormatterPhone],
                                keyboardType: TextInputType.number,
                                focusNode: _phoneFocusNode,
                                onTap: () {
                                  setState(() {
                                    _showSaveButton = true;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        Row(
                          children: [
                            if (_showSaveButton)
                              Row(
                                children: [
                                  OxActionButton(
                                    text:
                                        '      ${intl(context, 'sms-page.save-phone')}      ',
                                    color: Ox.colors.white,
                                    backgroundColor: Ox.colors.blueLight,
                                    onPressed: () async {
                                      if (_phoneController.text.length == 15) {
                                        await widget.storage.saveDriverPhone(
                                          IsarScheduleDriverPhoneEntity()
                                            ..driverPhone =
                                                _phoneController.text
                                            ..scheduleNumber =
                                                widget.schedule.scheduleNumber
                                            ..messageCount = 0,
                                        );
                                        setState(() {
                                          _driverPhoneSaved = true;
                                        });
                                        await showSuccessFlushbar(
                                                message: intl(context,
                                                    'sms-page.valid-phone'))
                                            .show(context);
                                      } else {
                                        await showErrorFlushbar(
                                                message: intl(context,
                                                    'sms-page.invalid-phone'))
                                            .show(context);
                                        return;
                                      }
                                    },
                                  ),
                                  SizedBox(width: Ox.space.ref40.h),
                                ],
                              ),
                            if ((_hasDriverPhone &&
                                    _phoneController.text.isNotEmpty) ||
                                _driverPhoneSaved)
                              OxActionButton(
                                text: intl(context, 'sms-page.send-message'),
                                color: Ox.colors.blue,
                                backgroundColor: Ox.colors.green,
                                onPressed: () async {
                                  _phoneFocusNode.unfocus();
                                  await loadDriverPhoneNumber();
                                  if (_phoneController.text.length == 15) {
                                    Modular.to.pushNamed(
                                      '/schedule/communication',
                                      arguments: {
                                        'phone': _phoneController.text,
                                        'plates': widget.schedule.truckPlate,
                                        'schedule':
                                            widget.schedule.scheduleNumber,
                                      },
                                    );
                                  }
                                },
                              ),
                          ],
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        OxDataTextField(
                          title: locationFieldLabel,
                          value: widget.schedule.plantAddress,
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        ElevatedButton(
                          onPressed: () => Modular.to.pushNamed(
                            '/schedule/item-detail',
                            arguments: widget.schedule,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Ox.colors.blueLight,
                            fixedSize: Size.fromHeight(Ox.size.ref140.h),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: Ox.size.ref50.h,
                                width: Ox.size.ref50.h,
                                child: OxAsset(
                                  Ox.assets.iconPlus,
                                  color: Ox.colors.white,
                                ),
                              ),
                              SizedBox(width: Ox.size.ref10.w),
                              Text(
                                intl(
                                  context,
                                  'schedule-detail-page.item-button',
                                ).toUpperCase(),
                                style: TextStyle(
                                  fontWeight: Ox.fontWeights.medium,
                                  fontSize: Ox.fontSizes.ref40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Ox.space.ref40.h),
                        ElevatedButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) => OxConfirmation(
                              onCancel: () => Modular.to.pop(),
                              onSubmit: () => Modular.to.popAndPushNamed(
                                '/occurrence/new',
                                arguments: NewOccurrenceParamsEntity(
                                  schedule: widget.schedule,
                                ),
                              ),
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
