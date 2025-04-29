// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/autocomplete.dart';
import 'package:portox_app/app/commons/widgets/confirmation.dart';
import 'package:portox_app/app/commons/widgets/flushbar.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/checklist/presentation/stores/step_store.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/action_button.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_fields.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_header.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/line_entity.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/data_text_field.dart';
import 'package:portox_app/app/modules/signin/data/infra/entities/supervisor_entity.dart';

class StepWithWeighingPage extends StatefulWidget {
  const StepWithWeighingPage({
    required this.icon,
    required this.schedule,
    required this.flowStep,
    required this.confirmationLabel,
    required this.fields,
    required this.stepStore,
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
  final StepStore stepStore;

  @override
  State<StepWithWeighingPage> createState() => _StepWithWeighingPageState();
}

class _StepWithWeighingPageState extends State<StepWithWeighingPage>
    with SingleTickerProviderStateMixin {
  late StepStore controller;
  final int _tabsLength = 3;
  bool _isLastQuestion = false;
  bool _isSupervisorApproved = false;
  bool _isCompartmented = false;
  bool _isSkippable = false;
  LineEntity? selectedCompartment;
  SupervisorEntity? selectedSupervisor;
  String password = '';

  late TabController _tabController;
  late TextEditingController _weightController;
  late TextEditingController _supervisorTextController;
  late TextEditingController _supervisorPasswordController;

  final FocusNode _focusNode = FocusNode();
  final FocusNode _weightFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = widget.stepStore;
    controller
      ..setFields(widget.fields)
      ..loadSupervisors();
    _isCompartmented =
        widget.flowStep.compartmented && widget.schedule.lines.length > 1;
    _weightController = TextEditingController();
    _supervisorTextController = TextEditingController();
    _supervisorPasswordController = TextEditingController();
    _isSkippable = widget.flowStep.skippable;

    _weightController.addListener(
      () => controller.setWeight(double.tryParse(_weightController.text)),
    );
    _supervisorTextController.addListener(() {
      setState(() {
        _isSupervisorApproved = _supervisorTextController.text.isNotEmpty &&
            _supervisorPasswordController.text.isNotEmpty;
      });
    });
    _supervisorPasswordController.addListener(() {
      setState(() {
        _isSupervisorApproved = _supervisorTextController.text.isNotEmpty &&
            _supervisorPasswordController.text.isNotEmpty;
      });
    });

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
    _weightFocus.addListener(() {
      if (_weightFocus.hasFocus &&
          controller.enableWeightField &&
          _weightController.text == '0.0') {
        _weightController.clear();
      }
    });
  }

  @override
  void dispose() {
    controller
      ..setWeight(null)
      ..setStatus(StepStatus.initial)
      ..setEnableWeightField(value: false);

    _tabController.dispose();
    _supervisorTextController.dispose();
    _supervisorPasswordController.dispose();
    _focusNode.dispose();
    _weightFocus.dispose();
    super.dispose();
  }

  void handleChangeQuestion(int toIndexNumber) {
    if (!(toIndexNumber >= _tabsLength)) {
      _tabController.animateTo(toIndexNumber);
    }

    _focusNode.unfocus();
    _weightFocus.unfocus();
  }

  void handleSupervisorStepBack() {
    Modular.to.pop();
    handleChangeQuestion(_tabController.index - 1);
    _supervisorTextController.text = '';
    _supervisorPasswordController.clear();
    _isSupervisorApproved = false;
  }

  Future<void> handleSupervisorPassword(BuildContext context) async {
    if (selectedSupervisor == null) {
      return;
    }
    final validPassword = await controller.confirmSupervisorPassword(
      selectedSupervisor!,
      password,
    );
    if (validPassword) {
      handleChangeQuestion(_tabController.index + 1);
    } else {
      await showErrorFlushbar(
        message: intl(context, 'step-with-weighing-page.invalid-password'),
      ).show(context);
    }
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
          line.itemDescription.contains(itemDescription) &&
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
  Widget build(BuildContext context) {
    Widget getFirstStep({
      required Map<String, String> fields,
      required bool enableWeightField,
      required bool isPositiveWeight,
    }) =>
        Column(
          children: [
            OxChecklistFields(
              fields: fields,
              hasWeight: true,
              compartments: handleCompartmentOptions(),
              onTapCompartment: _isCompartmented
                  ? (value) {
                      setState(() {
                        if (value.isEmpty) {
                          selectedCompartment = null;
                        } else {
                          selectedCompartment = parseLineOption(value);
                        }
                      });
                    }
                  : null,
              child: Column(
                children: [
                  OxDataTextField(
                    title: intl(context, 'schedule.weight-field'),
                    value: controller.weight.toString(),
                    readOnly: !enableWeightField,
                    suffixText: 'Kg',
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: _weightController,
                    focusNode: _weightFocus,
                    onTap: () {
                      if (controller.enableWeightField &&
                          _weightController.text == '0.0') {
                        _weightController.clear();
                      }
                    },
                  ),
                  SizedBox(height: Ox.space.ref20),
                  OxActionButton(
                    text: intl(
                      context,
                      'step-with-weighing-page.update-weight-button',
                    ),
                    isLoading: controller.status == StepStatus.yesLoading,
                    color: Ox.colors.white,
                    backgroundColor: Ox.colors.blue,
                    suffixIcon: Icons.refresh,
                    onPressed: () async {
                      if (_isCompartmented && selectedCompartment == null) {
                        await showErrorFlushbar(
                          message: intl(
                            context,
                            'step-with-weighing-page.select-compartment',
                          ),
                        ).show(context);
                        return;
                      }

                      await controller.loadWeight(
                        compartment:
                            selectedCompartment?.compartment.toString() ?? '1',
                        flowCode: widget.flowStep.flowCode,
                        scheduleNumber: widget.schedule.scheduleNumber,
                      );
                      _weightController.text =
                          (controller.weight ?? 0).toString();
                    },
                  ),
                ],
              ),
            ),
            Divider(
              color: Ox.colors.grayLight,
              height: 1,
            ),
            SizedBox(height: Ox.space.ref40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OxActionButton(
                  text: intl(context, 'app.decline'),
                  backgroundColor: Ox.colors.error,
                  prefixIcon: Icons.thumb_down,
                  onPressed: () => Modular.to.popAndPushNamed(
                    '/checklist/?showNegativeMessage=true',
                    arguments: widget.schedule,
                  ),
                ),
                OxActionButton(
                  text: intl(context, 'app.confirm'),
                  color: Ox.colors.black,
                  backgroundColor: (_isCompartmented &&
                              (selectedCompartment != null) &&
                              (isPositiveWeight || _isSkippable)) ||
                          (!_isCompartmented &&
                              (isPositiveWeight || _isSkippable))
                      ? Ox.colors.green
                      : Ox.colors.grayLight,
                  suffixIcon: Icons.thumb_up,
                  onPressed: (_isCompartmented &&
                              (selectedCompartment != null) &&
                              (isPositiveWeight || _isSkippable)) ||
                          (!_isCompartmented &&
                              (isPositiveWeight || _isSkippable))
                      ? () {
                          if (controller.enableWeightField) {
                            handleChangeQuestion(_tabController.index + 1);
                          } else {
                            handleChangeQuestion(_tabController.index + 2);
                          }
                        }
                      : null,
                ),
              ],
            ),
          ],
        );

    final secondStep = Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      intl(
                        context,
                        'step-with-weighing-page.select-supervisor-label',
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      softWrap: false,
                      style: TextStyle(
                        color: Ox.colors.blue,
                        fontSize: Ox.fontSizes.ref60,
                        fontWeight: Ox.fontWeights.light,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Ox.space.ref40),
              OxAutocomplete(
                focusNode: _focusNode,
                controller: _supervisorTextController,
                onSelected: (value) {
                  if (value.isEmpty) {
                    selectedSupervisor = null;
                  } else {
                    selectedSupervisor = controller.supervisors.firstWhere(
                      (supervisor) => supervisor.description == value,
                    );
                  }
                },
                options: controller.supervisors
                    .map((user) => user.description)
                    .toList(),
                labelText: intl(
                  context,
                  'step-with-weighing-page.supervisor-autocomplete-field',
                ),
              ),
              SizedBox(height: Ox.space.ref40),
              TextField(
                controller: _supervisorPasswordController,
                onChanged: (value) => password = value,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(fontSize: Ox.fontSizes.ref40),
                decoration: InputDecoration(
                  labelText: intl(
                    context,
                    'step-with-weighing-page.supervisor-password-field',
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
              SizedBox(height: Ox.space.ref40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  OxActionButton(
                    text: intl(context, 'app.back'),
                    color: Ox.colors.blue,
                    backgroundColor: Ox.colors.white,
                    prefixIcon: Icons.arrow_back,
                    onPressed: _supervisorPasswordController.text.isEmpty
                        ? () => handleChangeQuestion(_tabController.index - 1)
                        : () => showDialog(
                              context: context,
                              builder: (context) => OxConfirmation(
                                onCancel: () => Modular.to.pop(),
                                onSubmit: handleSupervisorStepBack,
                                message: Text(
                                  intl(
                                    context,
                                    'step-with-weighing-page.back-to-first-step-confirmation-label',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Ox.colors.blue,
                                    fontSize: Ox.fontSizes.ref60,
                                  ),
                                ),
                              ),
                            ),
                  ),
                  const Spacer(),
                  OxActionButton(
                    text: intl(
                      context,
                      _isLastQuestion ? 'app.confirm' : 'app.next',
                    ),
                    color: Ox.colors.black,
                    backgroundColor: _isSupervisorApproved
                        ? Ox.colors.green
                        : Ox.colors.grayLight,
                    suffixIcon: Icons.arrow_forward,
                    onPressed: _isSupervisorApproved
                        ? () => handleSupervisorPassword(context)
                        : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

    final thirdStep = Column(
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
              text: intl(context, 'app.no'),
              color: Ox.colors.white,
              backgroundColor: Ox.colors.error,
              prefixIcon: Icons.thumb_down,
              isLoading: controller.status == StepStatus.noLoading,
              onPressed: () => controller.onSubmitWithWeight(
                accepted: false,
                weight: controller.weight,
                flowCode: widget.flowStep.flowCode,
                schedule: widget.schedule,
                compartment: selectedCompartment?.compartment ?? 1,
                supervisor: selectedSupervisor?.userId,
              ),
            ),
            OxActionButton(
              text: intl(context, 'app.yes'),
              color: Ox.colors.black,
              backgroundColor: Ox.colors.green,
              suffixIcon: Icons.thumb_up,
              isLoading: controller.status == StepStatus.yesLoading,
              onPressed: () => controller.onSubmitWithWeight(
                accepted: true,
                weight: controller.weight,
                flowCode: widget.flowStep.flowCode,
                schedule: widget.schedule,
                compartment: selectedCompartment?.compartment ?? 1,
                supervisor: selectedSupervisor?.userId,
              ),
            ),
          ],
        ),
      ],
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Observer(
        builder: (context) => Scaffold(
          backgroundColor: Ox.colors.blue,
          appBar: OxAppBar(appStore: Modular.get()),
          body: OxLayout(
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
                    OxChecklistHeader(
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
                          getFirstStep(
                            fields: controller.fields,
                            enableWeightField: controller.enableWeightField,
                            isPositiveWeight: (controller.weight ?? 0) > 0,
                          ),
                          secondStep,
                          thirdStep,
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
