// ignore_for_file: use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/domain/checklist_seal_entity.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/camera.dart';
import 'package:portox_app/app/commons/widgets/flushbar.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/checklist/presentation/stores/step_store.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/action_button.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_fields.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_header.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_seals.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/line_entity.dart';

class StepWithSealsPage extends StatefulWidget {
  const StepWithSealsPage({
    required this.icon,
    required this.schedule,
    required this.flowStep,
    required this.confirmationLabel,
    required this.fields,
    required this.store,
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
  final List<int>? executedCompartments;
  final StepStore store;

  @override
  State<StepWithSealsPage> createState() => _StepWithSealsPageState();
}

class _StepWithSealsPageState extends State<StepWithSealsPage>
    with SingleTickerProviderStateMixin {
  late StepStore controller;
  final int _tabsLength = 4;
  bool _isLastQuestion = false;
  final List<ChecklistSealEntity> _seals = [];
  final List<ChecklistSealEntity> _manualSeals = [];
  bool showScanner = false;
  bool _isCompartmented = false;
  LineEntity? selectedCompartment;
  List<String> registeredSeals = [];

  late TextEditingController _manualSealController;
  late TabController _tabController;

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = widget.store;
    _isCompartmented =
        widget.flowStep.compartmented && widget.schedule.lines.length > 1;
    _manualSealController = TextEditingController();

    _tabController = TabController(
      length: _tabsLength,
      vsync: this,
      animationDuration: Duration(milliseconds: Ox.duration.ref0),
    );

    _tabController.addListener(() {
      setState(() {
        _isLastQuestion = _tabController.index == _tabsLength;
      });
    });

    checkRegisteredSeals();
  }

  @override
  void dispose() {
    _manualSealController.dispose();
    _tabController.dispose();
    _focusNode.dispose();
    registeredSeals.clear();
    super.dispose();
  }

  void handleChangeQuestion(int toIndexNumber) {
    if (!(toIndexNumber >= _tabsLength)) {
      _tabController.animateTo(toIndexNumber);
    } else {
      controller.onSubmitWithSeals(
        accepted: true,
        flowCode: widget.flowStep.flowCode,
        schedule: widget.schedule,
        seals: _seals,
        compartment: selectedCompartment?.compartment,
      );
    }

    _focusNode.unfocus();
  }

  void checkRegisteredSeals() async {
    var result =
        await widget.store.loadSeal.loadAll(widget.schedule.scheduleNumber);
    await result.fold((l) => null, (r) async {
      setState(() {
        registeredSeals = r ?? [];
      });
    });
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

  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final firstStep = Column(
      children: [
        OxChecklistFields(
          fields: widget.fields,
          compartments: handleCompartmentOptions(),
          onTapCompartment: _isCompartmented
              ? (value) {
                  setState(
                    () => selectedCompartment = parseLineOption(value),
                  );
                }
              : null,
        ),
        Divider(
          color: Ox.colors.grayLight,
          height: 1,
        ),
        SizedBox(height: Ox.space.ref40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OxActionButton(
              text: intl(context, 'app.cancel'),
              backgroundColor: Ox.colors.white,
              color: Ox.colors.blue,
              prefixIcon: Icons.arrow_back,
              isLoading: controller.status == StepStatus.noLoading,
              onPressed: () => Modular.to.popAndPushNamed(
                '/checklist/?showNegativeMessage=true',
                arguments: widget.schedule,
              ),
            ),
            OxActionButton(
              text: intl(
                context,
                _isLastQuestion ? 'app.confirm' : 'app.next',
              ),
              isLoading: controller.status == StepStatus.yesLoading,
              onPressed: (!_isCompartmented || selectedCompartment != null)
                  ? () => handleChangeQuestion(1)
                  : null,
              color: Ox.colors.blue,
              backgroundColor: Ox.colors.green,
              suffixIcon: Icons.arrow_forward,
            ),
          ],
        ),
      ],
    );

    final secondStep = Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 1,
                  backgroundColor: Ox.colors.green,
                  padding: EdgeInsets.all(Ox.size.ref20),
                ),
                onPressed: () {
                  setState(() {
                    showScanner = true;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OxAsset(Ox.assets.iconCamera),
                    SizedBox(width: Ox.space.ref20),
                    Text(
                      intl(context, 'step-with-seals-page.scan-seals-button')
                          .toUpperCase(),
                      style: TextStyle(
                        color: Ox.colors.blue,
                        fontWeight: Ox.fontWeights.medium,
                        fontSize: Ox.fontSizes.ref50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Ox.space.ref40),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichText(
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
                      'step-with-seals-page.total-seals-label',
                    ),
                    style: TextStyle(
                      fontSize: Ox.fontSizes.ref55,
                    ),
                  ),
                  TextSpan(
                    text: ' ${_seals.length}',
                    style: TextStyle(
                      fontSize: Ox.fontSizes.ref100,
                      fontWeight: Ox.fontWeights.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: Ox.space.ref40),
        OxChecklistSeals(
          seals: _seals,
          onRemoveSeal: (sealIndex) {
            setState(() {
              controller.removeSeal(sealIndex);
              _seals.removeAt(sealIndex);
            });
          },
        ),
        SizedBox(height: Ox.space.ref40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            OxActionButton(
              text: intl(context, 'app.back'),
              color: Ox.colors.blue,
              prefixIcon: Icons.arrow_back,
              backgroundColor: Ox.colors.white,
              onPressed: () => handleChangeQuestion(_tabController.index - 1),
            ),
            const Spacer(),
            OxActionButton(
              text: intl(context, 'app.finish'),
              suffixIcon: Icons.arrow_forward,
              backgroundColor:
                  _seals.isNotEmpty ? Ox.colors.green : Ox.colors.grayLight,
              color: _seals.isNotEmpty ? Ox.colors.blue : Ox.colors.gray,
              onPressed:
                  _seals.isNotEmpty ? () => handleChangeQuestion(3) : null,
            ),
          ],
        ),
      ],
    );

    Widget getThirdStep({required bool isValidating}) => Column(
          children: [
            SizedBox(
              height: Ox.size.ref200.h,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _manualSealController,
                      focusNode: _focusNode,
                      style: TextStyle(
                        fontSize: Ox.fontSizes.ref40,
                      ),
                      decoration: InputDecoration(
                        labelText: intl(
                          context,
                          'step-with-seals-page.type-seals-field',
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: Ox.space.ref20.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                      backgroundColor: Ox.colors.green,
                      fixedSize: Size.fromHeight(Ox.size.ref140),
                    ),
                    onPressed: () async {
                      final seal = ChecklistSealEntity(
                        code: _manualSealController.text,
                        createdAt: DateTime.now().toString(),
                      );

                      var hasConnection = await checkInternetConnectivity();

                      final errorMessage = await controller.checkSeal(
                        widget.schedule.scheduleNumber,
                        seal,
                        hasConnection,
                      );
                      if (errorMessage.isNotEmpty) {
                        await showErrorFlushbar(message: errorMessage)
                            .show(context);
                      } else if (_manualSeals.any((s) => s.code == seal.code) ||
                          _seals.any((s) => s.code == seal.code)) {
                        await showErrorFlushbar(
                          message: intl(
                            context,
                            'step-with-seals-page.already-added',
                          ),
                        ).show(context);
                      } else {
                        setState(() => _manualSeals.add(seal));
                        _manualSealController.clear();
                      }
                    },
                    child: Visibility(
                      visible: !isValidating,
                      replacement: SizedBox(
                        height: Ox.space.ref50.h,
                        width: Ox.space.ref50.h,
                        child: CircularProgressIndicator(
                          color: Ox.colors.blue,
                          strokeWidth: 2,
                        ),
                      ),
                      child: Text(
                        'Ok'.toUpperCase(),
                        style: TextStyle(
                          color: Ox.colors.blue,
                          fontWeight: Ox.fontWeights.medium,
                          fontSize: Ox.fontSizes.ref40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Ox.space.ref40),
            OxChecklistSeals(
              seals: _manualSeals,
              onRemoveSeal: (sealIndex) {
                setState(() {
                  controller.removeSeal(sealIndex);
                  _manualSeals.removeAt(sealIndex);
                });
              },
            ),
            SizedBox(height: Ox.space.ref40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OxActionButton(
                  backgroundColor: Ox.colors.white,
                  prefixIcon: Icons.arrow_back,
                  text: intl(context, 'app.back'),
                  color: Ox.colors.blue,
                  onPressed: () {
                    setState(() {
                      showScanner = true;
                    });
                    handleChangeQuestion(1);
                    _manualSealController.clear();
                  },
                ),
                OxActionButton(
                  onPressed: () {
                    _seals.addAll(_manualSeals);
                    _manualSeals.clear();
                    _manualSealController.clear();
                    handleChangeQuestion(1);
                  },
                  backgroundColor: Ox.colors.green,
                  text: intl(
                    context,
                    _isLastQuestion ? 'app.confirm' : 'app.next',
                  ),
                  color: Ox.colors.blue,
                  suffixIcon: Icons.arrow_forward,
                ),
              ],
            ),
          ],
        );

    final fourthStep = Column(
      children: [
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
              backgroundColor: Ox.colors.error,
              onPressed: () => controller.onSubmitWithSeals(
                accepted: false,
                flowCode: widget.flowStep.flowCode,
                schedule: widget.schedule,
                seals: _seals,
                compartment: selectedCompartment?.compartment,
              ),
              prefixIcon: Icons.thumb_down,
              text: intl(context, 'app.no'),
              isLoading: controller.status == StepStatus.noLoading,
            ),
            OxActionButton(
              text: intl(context, 'app.yes'),
              color: Ox.colors.black,
              suffixIcon: Icons.thumb_up,
              backgroundColor: Ox.colors.green,
              onPressed: () => handleChangeQuestion(_tabController.index + 1),
              isLoading: controller.status == StepStatus.yesLoading,
            ),
          ],
        ),
      ],
    );

    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: Ox.colors.blue,
        appBar: OxAppBar(appStore: Modular.get()),
        body: OxLayout(
          child: Visibility(
            visible: !showScanner,
            replacement: ColoredBox(
              color: Ox.colors.white,
              child: OxCamera(
                permissions: Modular.get(),
                recognizer: Modular.get(),
                onScan: (ocrText, codes) async {
                  final seal = ChecklistSealEntity(
                    code: codes.isNotEmpty ? codes[0] : ocrText,
                    createdAt: DateTime.now().toString(),
                  );

                  var hasConnection = await checkInternetConnectivity();

                  final errorMessage = await controller.checkSeal(
                    widget.schedule.scheduleNumber,
                    seal,
                    hasConnection,
                  );
                  if (errorMessage.isNotEmpty) {
                    await showErrorFlushbar(message: errorMessage)
                        .show(context);
                  } else if (_seals.any((s) => s.code == seal.code)) {
                    await showErrorFlushbar(
                      message: intl(
                        context,
                        'step-with-seals-page.already-added',
                      ),
                    ).show(context);
                  } else {
                    setState(() {
                      _seals.add(seal);
                      showScanner = false;
                    });
                  }
                },
                onBackPress: () => setState(() => showScanner = false),
                child: Padding(
                  padding: EdgeInsets.only(
                    right: Ox.space.ref60.w,
                    left: Ox.space.ref60.w,
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(Ox.size.ref30),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Ox.colors.green),
                      foregroundColor:
                          MaterialStateProperty.all(Ox.colors.blueLight),
                    ),
                    onPressed: () {
                      controller.setStatus(StepStatus.initial);
                      handleChangeQuestion(2);
                      setState(() {
                        showScanner = false;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.keyboard_alt_outlined,
                          size: Ox.size.ref60,
                          color: Ox.colors.black,
                        ),
                        SizedBox(width: Ox.space.ref20),
                        Text(
                          intl(
                            context,
                            'step-with-seals-page.type-seals-button',
                          ).toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: Ox.fontSizes.ref40,
                            fontWeight: Ox.fontWeights.medium,
                            color: Ox.colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            child: ColoredBox(
              color: Ox.colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  top: Ox.space.ref40.h,
                  right: Ox.space.ref60.w,
                  bottom: Ox.space.ref100.h,
                  left: Ox.space.ref60.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    registeredSeals.isNotEmpty
                        ? OxChecklistHeader(
                            icon: widget.icon,
                            flowDescription: widget.flowStep.flowDescription,
                            step: widget.step,
                            scheduleNumber: widget.schedule.scheduleNumber,
                            hasFunction: true,
                            functionIcon: GestureDetector(
                              onTap: () async {
                                if (registeredSeals.isNotEmpty) {
                                  Modular.to.pushNamed(
                                    '/checklist/step-with-seals-history',
                                    arguments: {
                                      'seals': registeredSeals,
                                      'scheduleNumber':
                                          widget.schedule.scheduleNumber,
                                      'icon': widget.icon,
                                    },
                                  );
                                }
                              },
                              child: Icon(
                                Icons.timer_outlined,
                                color: Ox.colors.blue,
                                size: 28,
                              ),
                            ),
                          )
                        : OxChecklistHeader(
                            icon: widget.icon,
                            flowDescription: widget.flowStep.flowDescription,
                            step: widget.step,
                            scheduleNumber: widget.schedule.scheduleNumber,
                          ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          firstStep,
                          secondStep,
                          getThirdStep(
                            isValidating:
                                controller.status == StepStatus.yesLoading,
                          ),
                          fourthStep
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
