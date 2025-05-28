import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_schedule_driver_phone_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/back_button.dart';
import 'package:portox_app/app/commons/widgets/flushbar.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/action_button.dart';
import 'package:portox_app/app/modules/communication/data/services/service_communication_source.dart';
import 'package:portox_app/app/modules/communication/data/services/service_firebase_source.dart';
import 'package:portox_app/app/modules/schedule/data/external/storage/local_storage_master_datasource.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/data_text_field.dart';

class SmsPage extends StatefulWidget {
  final String phone;
  final String plates;
  final String schedule;
  final LocalStorageMasterDataSource storage;

  const SmsPage({
    super.key,
    required this.phone,
    required this.plates,
    required this.schedule,
    required this.storage,
  });

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  late TextEditingController _phoneController;
  late TextEditingController _scheduleController;
  late TextEditingController _baseMessageController;
  late TextEditingController _customMessageController;
  final ServiceCommunicationSource _sender = ServiceCommunicationSource();
  final ServiceFirebaseSource _firebaseService = ServiceFirebaseSource();

  Locale deviceLocale = WidgetsBinding.instance.window.locale;

  bool _isEngLan = false;
  bool _isLoading = false;

  String _selectedOption = '';
  String _baseMessage = '';

  int _messageCount = 0;

  void _loadMessageCount() async {
    var phoneNumberInstance =
        await widget.storage.loadDriverPhone(widget.schedule);
    if (phoneNumberInstance != null &&
        phoneNumberInstance.messageCount != null) {
      _messageCount = phoneNumberInstance.messageCount!;
    }
  }

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: widget.phone);
    _scheduleController = TextEditingController(text: widget.schedule);
    _baseMessageController = TextEditingController();
    _customMessageController = TextEditingController();
    _initializeFirebase();

    _isEngLan = deviceLocale.languageCode == 'en';
    _selectedOption = '1';
    _baseMessage = _isEngLan
        ? 'Driver Call: Schedule Update  ${widget.schedule} Vehicle ${widget.plates}.'
        : 'Chamada de Motorista: Atualização Agendamento ${widget.schedule} Veículo ${widget.plates}.';
    _updateMessage();
    _loadMessageCount();
  }

  Future<void> _initializeFirebase() async {
    await _firebaseService.initializeFirebase();
  }

  void _updateMessage() {
    switch (_selectedOption) {
      case '1':
        _baseMessageController.text = _isEngLan
            ? '$_baseMessage Go to Billing to collect documents.'
            : '$_baseMessage Compareça ao Faturamento para retirar documentos.';
        break;
      case '2':
        _baseMessageController.text = _isEngLan
            ? '$_baseMessage Go to the Concierge.'
            : '$_baseMessage Compareça a Portaria.';
        break;
      case '3':
        _baseMessageController.text = _isEngLan
            ? '$_baseMessage Please remove vehicle, current process complete.'
            : '$_baseMessage Por favor retirar veículo, processo atual finalizado.';
        break;
      case '4':
        _baseMessageController.text = _baseMessage;
        break;
      default:
        _baseMessageController.text = _baseMessage;
    }
  }

  void _setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  void _sendSMS() async {
    if (!_validateFields()) {
      return;
    }

    String phone = _phoneController.text;
    String schedule = _scheduleController.text;
    String message = _baseMessageController.text;

    try {
      _setLoading(true);
      if (_messageCount == 3) {
        _setLoading(false);
        await showErrorFlushbar(message: intl(context, 'sms-page.send-limit'))
            .show(context);
        return;
      }
      if (_selectedOption == '4') {
        message =
            _baseMessageController.text + ' ' + _customMessageController.text;
      }
      var phoneNumber = phone
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll(' ', '')
          .replaceAll('-', '');

      var result = await _sender.sendSMS('55$phoneNumber', message);

      if (result) {
        await _firebaseService.persisteDataMessage(
          phone: phone,
          schedule: schedule,
          message: message,
          date: DateTime.now(),
        );

        await widget.storage.saveDriverPhone(
          IsarScheduleDriverPhoneEntity()
            ..driverPhone = _phoneController.text
            ..scheduleNumber = widget.schedule
            ..messageCount = ++_messageCount,
        );

        _setLoading(false);
        // ignore: use_build_context_synchronously
        await showSuccessFlushbar(
                message: intl(context, 'sms-page.send-success'))
            .show(context);
      } else {
        _setLoading(false);
        // ignore: use_build_context_synchronously
        await showErrorFlushbar(message: intl(context, 'sms-page.send-failure'))
            .show(context);
      }

      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      _setLoading(false);
      await showErrorFlushbar(message: intl(context, 'sms-page.send-failure'))
          .show(context);
    }
  }

  bool _validateFields() {
    if (_phoneController.text.isEmpty ||
        _scheduleController.text.isEmpty ||
        _baseMessageController.text.isEmpty) {
      showErrorFlushbar(message: intl(context, 'sms-page.send-complete-fields'))
          .show(context);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) {
          try {
            return Scaffold(
              backgroundColor: Ox.colors.white,
              appBar: OxAppBar(appStore: Modular.get()),
              body: SingleChildScrollView(
                child: OxLayout(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Ox.space.ref40.w,
                      vertical: Ox.space.ref50.h,
                    ),
                    child: Column(
                      children: [
                        const OxBackButton(),
                        SizedBox(height: Ox.space.ref50.h),
                        OxDataTextField(
                          title: intl(context, 'sms-page.phone'),
                          value: _phoneController.text,
                          controller: _phoneController,
                        ),
                        SizedBox(height: Ox.space.ref50.h),
                        OxDataTextField(
                          title: intl(context, 'sms-page.schedule'),
                          value: widget.schedule,
                          controller: _scheduleController,
                        ),
                        SizedBox(height: Ox.space.ref50.h),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                intl(context, 'sms-page.select-message'),
                                style: TextStyle(
                                  fontWeight: Ox.fontWeights.semibold,
                                  fontSize: Ox.fontSizes.ref40,
                                  color: Ox.colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Ox.space.ref50.h),
                        DropdownButton<String>(
                          value:
                              _selectedOption.isEmpty ? null : _selectedOption,
                          items: [
                            DropdownMenuItem(
                              value: '1',
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  _isEngLan
                                      ? 'Go to Billing to collect documents.'
                                      : 'Compareça ao Faturamento para retirar documentos.',
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '2',
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(_isEngLan
                                    ? 'Go to the Concierge.'
                                    : 'Compareça a Portaria.'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '3',
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(_isEngLan
                                    ? 'Please remove vehicle, current process complete.'
                                    : 'Por favor retirar veículo, processo atual finalizado.'),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '4',
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(_isEngLan ? 'Edit' : 'Editar'),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value!;
                              _updateMessage();
                            });
                          },
                        ),
                        SizedBox(height: Ox.space.ref50.h),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                intl(context, 'sms-page.message'),
                                style: TextStyle(
                                  fontWeight: Ox.fontWeights.semibold,
                                  fontSize: Ox.fontSizes.ref40,
                                  color: Ox.colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Ox.space.ref50.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(_baseMessageController.text),
                        ),
                        SizedBox(height: Ox.space.ref50.h),
                        if (_selectedOption == '4')
                          OxDataTextField(
                            title: '',
                            value: '',
                            minLines: 10,
                            controller: _customMessageController,
                            readOnly: _selectedOption != '4',
                          ),
                        SizedBox(height: Ox.space.ref50.h),
                        OxActionButton(
                          text: intl(context, 'sms-page.send-message'),
                          color: Ox.colors.blue,
                          backgroundColor: Ox.colors.green,
                          onPressed: _sendSMS,
                          isLoading: _isLoading,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            // ignore: avoid_catches_without_on_clauses
          } catch (e) {
            print('Exception in Observer: $e');
            return Container();
          }
        },
      );
}
