// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/domain/checklist_signature_entity.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/domain/signature_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/camera.dart';
import 'package:portox_app/app/commons/widgets/flushbar.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/commons/widgets/signature.dart';
import 'package:portox_app/app/modules/checklist/data/external/api/api_driver_checkout_datasource.dart';
import 'package:portox_app/app/modules/checklist/presentation/stores/checklist_store.dart';
import 'package:portox_app/app/modules/checklist/presentation/stores/step_store.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/action_button.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_fields.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_header.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/line_entity.dart';
import 'package:signature/signature.dart';

class StepWithoutQuestionsPage extends StatefulWidget {
  const StepWithoutQuestionsPage({
    required this.icon,
    required this.schedule,
    required this.flowStep,
    required this.confirmationLabel,
    required this.fields,
    required this.store,
    required this.hasTag,
    required this.hasDriverCheckout,
    super.key,
    this.step,
    this.executedCompartments = const [],
  });

  final String icon;
  final String? step;
  final ScheduleEntity schedule;
  final FlowStepEntity flowStep;
  final String confirmationLabel;
  final Map<String, String> fields;
  final bool hasTag;
  final StepStore store;
  final List<int>? executedCompartments;
  final bool hasDriverCheckout;

  @override
  State<StepWithoutQuestionsPage> createState() =>
      _StepWithoutQuestionsPageState();
}

class _StepWithoutQuestionsPageState extends State<StepWithoutQuestionsPage> {
  late StepStore controller;
  bool showScanner = false;
  bool _isCompartmented = false;
  bool _isDriverCheckoutLoading = false;
  bool _driverCheckoutUnavailable = false;
  bool _driverCheckoutIncomplete = false;
  bool _showSignatureStep = false;
  int _currentSignatureIndex = 0;
  LineEntity? selectedCompartment;
  late ApiDriverCheckoutDataSource _driverCheckoutDataSource;
  String? checkinDate = '-';
  String? checkoutDate = '-';
  String? totalDate = '-';
  String? driverQuestion = '';
  late SignatureController _signatureController;
  List<String> _signatureImages = [];
  List<SignatureEntity>? _signatures;

  @override
  void initState() {
    super.initState();
    controller = widget.store;
    controller.setFields(widget.fields);
    _isCompartmented =
        widget.flowStep.compartmented && widget.schedule.lines.length > 1;

    _driverCheckoutDataSource = Modular.get<ApiDriverCheckoutDataSource>();

    // Inicializar SignatureController
    _signatureController = SignatureController(
      penColor: Ox.colors.black,
      penStrokeWidth: 4,
    );

    // Listener para salvar assinatura quando o usuário desenhar
    _signatureController.addListener(() {
      if (_showSignatureStep && _signatures != null && _signatures!.isNotEmpty) {
        _signatureController.toPngBytes().then((value) {
          if (value != null) {
            final imageEncoded = base64.encode(value);
            setState(() {
              _signatureImages[_currentSignatureIndex] = imageEncoded;
            });
          } else {
            setState(() {
              _signatureImages[_currentSignatureIndex] = '';
            });
          }
        });
      }
    });

    if (widget.hasDriverCheckout) {
      _isDriverCheckoutLoading = true;
      _loadDriverCheckoutData();
      _loadSignatureConfig();
    }
  }

  Future<void> _loadDriverCheckoutData() async {
    try {
      final result = await _driverCheckoutDataSource.getDriverCheckout(
        scheduleNumber: widget.schedule.scheduleNumber,
      );

      final arrivalDate = result['arrivalDate'];
      final checkoutDateApi = result['checkoutDate'];
      final apiTime = result['time'];
      final apiQuestion = result['question'];

      final hasArrival = arrivalDate?.isNotEmpty ?? false;
      final hasCheckout = checkoutDateApi?.isNotEmpty ?? false;
      final hasTime = apiTime?.isNotEmpty ?? false;
      final computedTotal = hasTime
          ? apiTime!
          : (hasArrival && hasCheckout
              ? calculateTotalTime(arrivalDate, checkoutDateApi)
              : '-');
      final hasRequiredFields = hasArrival &&
          hasCheckout &&
          computedTotal.isNotEmpty &&
          computedTotal != '-';

      setState(() {
        _isDriverCheckoutLoading = false;
        _driverCheckoutUnavailable = false;
        _driverCheckoutIncomplete = !hasRequiredFields;
        checkinDate = formatIsoDateToBrazilian(arrivalDate);
        checkoutDate = formatIsoDateToBrazilian(checkoutDateApi);
        totalDate = computedTotal;
        driverQuestion = apiQuestion ?? '';
      });
    } catch (e) {
      debugPrint('Erro ao obter dados do checkout do motorista: $e');
      setState(() {
        _isDriverCheckoutLoading = false;
        _driverCheckoutUnavailable = true;
        _driverCheckoutIncomplete = true;
        checkinDate = '-';
        checkoutDate = '-';
        totalDate = '-';
      });
    }
  }

  String formatIsoDateToBrazilian(String? isoDate) {
    try {
      if (isoDate == null) {
        return '-';
      }
      final dateTime = DateTime.parse(isoDate).toLocal();
      final formatted = DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
      return formatted;
    } catch (_) {
      return '-';
    }
  }

  String calculateTotalTime(String? entryIso, String? exitIso) {
    try {
      if (entryIso == null || exitIso == null) {
        return '-';
      }

      final entry = DateTime.parse(entryIso).toLocal();
      final exit = DateTime.parse(exitIso).toLocal();

      final duration = exit.difference(entry);

      if (duration.isNegative) return '-';

      final totalMinutes = duration.inMinutes;
      final days = totalMinutes ~/ (24 * 60);
      final hours = (totalMinutes % (24 * 60)) ~/ 60;
      final minutes = totalMinutes % 60;

      final hoursStr = hours.toString().padLeft(2, '0');
      final minutesStr = minutes.toString().padLeft(2, '0');

      if (days > 0) {
        return '${days}D $hoursStr:$minutesStr';
      } else {
        return '$hoursStr:$minutesStr';
      }
    } catch (_) {
      return '-';
    }
  }

  void _loadSignatureConfig() {
    try {
      // Buscar as assinaturas configuradas para este flow usando o ChecklistStore
      final checklistStore = Modular.get<ChecklistStore>();
      final signatures = checklistStore.getSignatures(
        widget.flowStep,
        widget.schedule,
      );
      
      setState(() {
        _signatures = signatures;
        // Inicializar lista de imagens vazias (uma para cada assinatura)
        _signatureImages = List.generate(signatures.length, (index) => '');
      });
    } catch (e) {
      debugPrint('Erro ao carregar configurações de assinatura: $e');
      setState(() {
        _signatures = [];
        _signatureImages = [];
      });
    }
  }

  void _goToNextSignature() {
    if (_currentSignatureIndex < _signatures!.length - 1) {
      setState(() {
        _currentSignatureIndex++;
        // Restaurar assinatura anterior se existir
        _signatureController.clear();
        // Não podemos restaurar pontos de uma imagem base64, então começa limpo
      });
    }
  }

  void _goToPreviousSignature() {
    if (_currentSignatureIndex > 0) {
      setState(() {
        _currentSignatureIndex--;
        // Restaurar assinatura anterior se existir
        _signatureController.clear();
      });
    }
  }

  bool _isFirstSignature() => _currentSignatureIndex == 0;
  bool _isLastSignature() => _currentSignatureIndex == _signatures!.length - 1;

  @override
  void dispose() {
    controller.setTag('');
    _signatureController.dispose();
    super.dispose();
  }

  bool checkIfWasExecuted(LineEntity line) =>
      !(widget.executedCompartments?.contains(line.compartment) ?? false);

  String getLineOption(LineEntity line) =>
      '${line.compartment} - ${line.orderNumber}/${line.lineNumber} ${line.itemDescription}';

  LineEntity parseLineOption(String description) {
    final split = description.split(' - ');
    final compartment = int.tryParse(split[0]);
    final orderNumber = split[1].split('/')[0];
    final lineNumber = split[1].split('/')[1].split(' ')[0];
    final itemDescription =
        split[1].split('/')[1].split(' ').sublist(1).join(' ');
    return widget.schedule.lines.firstWhere(
      (line) =>
          line.compartment == compartment &&
          line.itemDescription == itemDescription &&
          line.orderNumber == orderNumber &&
          line.lineNumber == lineNumber,
    );
  }

  List<String> handleCompartmentOptions() {
    if (!_isCompartmented) {
      return [];
    }
    final sorted = widget.schedule.lines
      ..sort((a, b) => (a.compartment ?? 0).compareTo(b.compartment ?? 0));
    return sorted.where(checkIfWasExecuted).map(getLineOption).toList();
  }

  @override
  Widget build(BuildContext _) => WillPopScope(
        onWillPop: () async => false,
        child: Observer(
          builder: (context) => Scaffold(
            backgroundColor: Ox.colors.white,
            appBar: _showSignatureStep 
                ? null 
                : OxAppBar(appStore: Modular.get()),
            body: OxLayout(
              child: RotatedBox(
                quarterTurns: _showSignatureStep ? 1 : 0,
                child: Visibility(
                  visible: !showScanner,
                  replacement: OxCamera(
                  permissions: Modular.get(),
                  recognizer: Modular.get(),
                  onScan: (_, codes) async {
                    if (controller.status == StepStatus.yesLoading) {
                      return;
                    }
                    final result = await controller.checkTag(
                      widget.schedule.scheduleNumber,
                      codes,
                    );
                    if (result.isNotEmpty) {
                      await showErrorFlushbar(message: result).show(context);
                    } else {
                      setState(() => showScanner = false);
                    }
                  },
                  onBackPress: () {
                    controller.setStatus(StepStatus.initial);
                    setState(() => showScanner = false);
                  },
                  showQRCodeOverlay: true,
                  disableOCRRecognizer: true,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Ox.space.ref40.w,
                    vertical: Ox.space.ref50.h,
                  ),
                  child: !widget.hasDriverCheckout
                      ? Column(
                          children: [
                            OxChecklistHeader(
                              icon: widget.icon,
                              flowDescription: widget.flowStep.getLabel(),
                              step: widget.step,
                              scheduleNumber: widget.schedule.scheduleNumber,
                            ),
                            OxChecklistFields(
                              fields: controller.fields,
                              hasTag: widget.hasTag,
                              onTapTag: () {
                                setState(() {
                                  showScanner = true;
                                });
                              },
                              compartments: handleCompartmentOptions(),
                              onTapCompartment: _isCompartmented
                                  ? (value) {
                                      setState(
                                        () => selectedCompartment =
                                            parseLineOption(value),
                                      );
                                    }
                                  : null,
                            ),
                            if (widget.schedule.balanceTag) Container(),
                            SizedBox(height: Ox.space.ref40),
                            Divider(
                              color: Ox.colors.grayLight,
                              height: 1,
                            ),
                            SizedBox(height: Ox.space.ref40),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                widget.confirmationLabel,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Ox.colors.blue,
                                  fontSize: Ox.fontSizes.ref40,
                                  fontWeight: Ox.fontWeights.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: Ox.space.ref40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OxActionButton(
                                  color: Ox.colors.white,
                                  backgroundColor: Ox.colors.error,
                                  isLoading:
                                      controller.status == StepStatus.noLoading,
                                  onPressed: !_isCompartmented ||
                                          selectedCompartment != null
                                      ? () => controller.onSubmitConfirmation(
                                            accepted: false,
                                            flowCode: widget.flowStep.flowCode,
                                            schedule: widget.schedule,
                                            hasTag: false,
                                            compartment: selectedCompartment
                                                ?.compartment,
                                          )
                                      : null,
                                  prefixIcon: Icons.thumb_down,
                                  text: intl(context, 'app.no'),
                                ),
                                OxActionButton(
                                  color: Ox.colors.black,
                                  backgroundColor: Ox.colors.green,
                                  isLoading: controller.status ==
                                      StepStatus.yesLoading,
                                  onPressed: (!widget.hasTag ||
                                              controller.tag.isNotEmpty) &&
                                          (!_isCompartmented ||
                                              selectedCompartment != null)
                                      ? () => controller.onSubmitConfirmation(
                                            accepted: true,
                                            flowCode: widget.flowStep.flowCode,
                                            schedule: widget.schedule,
                                            hasTag: widget.hasTag,
                                            compartment: selectedCompartment
                                                ?.compartment,
                                          )
                                      : null,
                                  suffixIcon: Icons.thumb_up,
                                  text: intl(context, 'app.yes'),
                                ),
                              ],
                            ),
                          ],
                        )
                      : !_showSignatureStep
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OxChecklistHeader(
                                  icon: widget.icon,
                                  flowDescription: widget.flowStep.getLabel(),
                                  step: widget.step,
                                  scheduleNumber: widget.schedule.scheduleNumber,
                                ),
                                SizedBox(height: Ox.space.ref40),
                                Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    (driverQuestion?.isNotEmpty == true)
                                        ? driverQuestion!
                                        : intl(
                                            context,
                                            'checklist.driver-checkout-title',
                                          ),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Ox.colors.blue,
                                      fontSize: Ox.fontSizes.ref50,
                                      fontWeight: Ox.fontWeights.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: Ox.space.ref40),
                                SizedBox(height: Ox.space.ref40),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    intl(context,
                                            'checklist.driver-checkout-check-in-label') +
                                        ': $checkinDate',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Ox.colors.blue,
                                      fontSize: Ox.fontSizes.ref50,
                                      fontWeight: Ox.fontWeights.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: Ox.space.ref40),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    intl(context,
                                            'checklist.driver-checkout-check-out-label') +
                                        ': $checkoutDate',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Ox.colors.blue,
                                      fontSize: Ox.fontSizes.ref50,
                                      fontWeight: Ox.fontWeights.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: Ox.space.ref40),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    intl(context,
                                            'checklist.driver-checkout-total-label') +
                                        ': $totalDate',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Ox.colors.blue,
                                      fontSize: Ox.fontSizes.ref50,
                                      fontWeight: Ox.fontWeights.bold,
                                    ),
                                  ),
                                ),
                                if (_driverCheckoutUnavailable ||
                                    _driverCheckoutIncomplete)
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: Ox.space.ref260.h),
                                    child: Text(
                                      _driverCheckoutUnavailable
                                          ? intl(
                                              context,
                                              'checklist.driver-checkout-error',
                                            )
                                          : intl(
                                              context,
                                              'checklist.driver-checkout-missing-data',
                                            ),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Ox.colors.error,
                                        fontSize: Ox.fontSizes.ref40,
                                        fontWeight: Ox.fontWeights.medium,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: Ox.space.ref100),
                            Divider(
                              color: Ox.colors.grayLight,
                              height: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                OxActionButton(
                                  color: Ox.colors.white,
                                  backgroundColor: Ox.colors.error,
                                  isLoading:
                                      controller.status == StepStatus.noLoading,
                                  onPressed: !_isCompartmented ||
                                          selectedCompartment != null
                                      ? () => controller.onSubmitConfirmation(
                                            accepted: false,
                                            flowCode: widget.flowStep.flowCode,
                                            schedule: widget.schedule,
                                            hasTag: false,
                                            compartment: selectedCompartment
                                                ?.compartment,
                                          )
                                      : null,
                                  prefixIcon: Icons.thumb_down,
                                  text: intl(context, 'app.no'),
                                ),
                                OxActionButton(
                                  color: Ox.colors.black,
                                  backgroundColor: Ox.colors.green,
                                  isLoading: controller.status ==
                                      StepStatus.yesLoading,
                                  onPressed: (!widget.hasTag ||
                                              controller.tag.isNotEmpty) &&
                                          (!_isCompartmented ||
                                              selectedCompartment != null) &&
                                          !_driverCheckoutUnavailable &&
                                          !_driverCheckoutIncomplete &&
                                          !_isDriverCheckoutLoading
                                      ? () async {
                                          // Se tem assinaturas configuradas, mostra tela de assinatura
                                          if (_signatures != null && _signatures!.isNotEmpty) {
                                            setState(() {
                                              _showSignatureStep = true;
                                            });
                                          } else {
                                            // Senão, submete diretamente sem assinatura
                                            await controller.onSubmitConfirmation(
                                              accepted: true,
                                              flowCode: widget.flowStep.flowCode,
                                              schedule: widget.schedule,
                                              hasTag: widget.hasTag,
                                              compartment: selectedCompartment
                                                  ?.compartment,
                                            );
                                          }
                                        }
                                      : null,
                                  suffixIcon: Icons.thumb_up,
                                  text: intl(context, 'app.yes'),
                                ),
                              ],
                            ),
                          ],
                        )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OxChecklistHeader(
                                  icon: widget.icon,
                                  flowDescription: widget.flowStep.getLabel(),
                                  step: widget.step,
                                  scheduleNumber: widget.schedule.scheduleNumber,
                                ),
                                SizedBox(height: Ox.space.ref40),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Indicador de progresso (ex: "1/2")
                                      Text(
                                        '${_currentSignatureIndex + 1}/${_signatures?.length ?? 0}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Ox.colors.blue,
                                          fontSize: Ox.fontSizes.ref40,
                                          fontWeight: Ox.fontWeights.medium,
                                        ),
                                      ),
                                      SizedBox(height: Ox.space.ref20),
                                      // Descrição da assinatura atual
                                      Text(
                                        _signatures != null && _signatures!.isNotEmpty
                                            ? controller.getSignatureDescription(_signatures![_currentSignatureIndex])
                                            : 'Assinatura do Motorista',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Ox.colors.blue,
                                          fontSize: Ox.fontSizes.ref60,
                                          fontWeight: Ox.fontWeights.bold,
                                        ),
                                      ),
                                      SizedBox(height: Ox.space.ref60),
                                      OxSignature(
                                        height: Ox.size.ref400.w,
                                        orientation: OxSignatureOrientationEnum.landscape,
                                        controller: _signatureController,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: Ox.space.ref40),
                                Divider(
                                  color: Ox.colors.grayLight,
                                  height: 1,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Botão Voltar (sempre visível, cancela tudo)
                                    if (_isFirstSignature())
                                      OxActionButton(
                                        color: Ox.colors.blue,
                                        backgroundColor: Ox.colors.white,
                                        onPressed: () {
                                          setState(() {
                                            _showSignatureStep = false;
                                            _currentSignatureIndex = 0;
                                            _signatureController.clear();
                                            _signatureImages = List.generate(_signatures!.length, (index) => '');
                                          });
                                        },
                                        prefixIcon: Icons.arrow_back,
                                        text: intl(context, 'app.leave'),
                                      ),
                                    // Botão Anterior (só aparece se não for a primeira)
                                    if (!_isFirstSignature())
                                      OxActionButton(
                                        color: Ox.colors.blue,
                                        backgroundColor: Ox.colors.white,
                                        onPressed: () {
                                          _goToPreviousSignature();
                                        },
                                        prefixIcon: Icons.arrow_back,
                                        text: intl(context, 'app.back'),
                                      ),
                                    const Spacer(),
                                    // Botão Próxima (aparece se não for a última)
                                    if (!_isLastSignature())
                                      OxActionButton(
                                        color: Ox.colors.black,
                                        backgroundColor: Ox.colors.green,
                                        onPressed: () {
                                          _goToNextSignature();
                                        },
                                        suffixIcon: Icons.arrow_forward,
                                        text: intl(context, 'app.next'),
                                      ),
                                    // Botão Confirmar (só na última assinatura)
                                    if (_isLastSignature())
                                      OxActionButton(
                                        color: Ox.colors.black,
                                        backgroundColor: Ox.colors.green,
                                        isLoading: controller.status == StepStatus.yesLoading,
                                        onPressed: () async {
                                          // Validar se todas as assinaturas foram preenchidas
                                          bool allSigned = true;
                                          for (int i = 0; i < _signatureImages.length; i++) {
                                            if (_signatureImages[i].isEmpty) {
                                              allSigned = false;
                                              break;
                                            }
                                          }
                                          
                                          if (!allSigned) {
                                            await showErrorFlushbar(
                                              message: 'Por favor, complete todas as assinaturas antes de confirmar',
                                            ).show(context);
                                            return;
                                          }
                                          
                                          // Cria a lista com TODAS as assinaturas
                                          final signatures = _signatures!.asMap().entries.map((entry) {
                                            return ChecklistSignatureEntity(
                                              id: entry.value.id,
                                              image: _signatureImages[entry.key],
                                              createdAt: DateTime.now().toString(),
                                              mimeType: 'image/png',
                                              skipped: _signatureImages[entry.key].isEmpty,
                                            );
                                          }).toList();
                                          
                                          // Envia com TODAS as assinaturas
                                          await controller.onSubmitWithQuestions(
                                            accepted: true,
                                            flowCode: widget.flowStep.flowCode,
                                            schedule: widget.schedule,
                                            answers: [],
                                            signatures: signatures,
                                            compartment: selectedCompartment?.compartment,
                                          );
                                        },
                                        suffixIcon: Icons.check,
                                        text: intl(context, 'app.confirm'),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                ),
              ),
              ),
            ),
          ),
        ),
      );
}
