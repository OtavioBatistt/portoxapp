import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_schedule_driver_phone_entity.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/utils/utils.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/back_button.dart';
import 'package:portox_app/app/commons/widgets/confirmation.dart';
import 'package:portox_app/app/commons/widgets/flushbar.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/step_with_question_params_entity.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/step_with_seals_params_entity.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/step_with_weighing_params_entity.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/step_without_question_params_entity.dart';
import 'package:portox_app/app/modules/checklist/presentation/stores/checklist_store.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_confirmation.dart';
import 'package:portox_app/app/modules/communication/data/services/service_firebase_source.dart';
import 'package:portox_app/app/modules/occurrence/domain/entities/new_occurrence_params_entity.dart';
import 'package:portox_app/app/modules/schedule/data/external/storage/local_storage_master_datasource.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/checklist_item.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({
    required this.fromScanner,
    required this.showNegativeMessage,
    required this.showPositiveMessage,
    required this.schedule,
    required this.appStore,
    required this.store,
    required this.storage,
    super.key,
  });

  final bool fromScanner;
  final bool showNegativeMessage;
  final bool showPositiveMessage;
  final ScheduleEntity schedule;
  final AppStore appStore;
  final ChecklistStore store;
  final LocalStorageMasterDataSource storage;

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  late ChecklistStore controller;
  Flushbar? errorFlushbar;
  Flushbar? successFlushbar;
  IsarScheduleDriverPhoneEntity? _scheduleDriverPhone = null;
  TextEditingController _phoneController = TextEditingController();
  bool _hasDriverPhone = false;
  final ServiceFirebaseSource _firebaseService = ServiceFirebaseSource();
  List<bool> wasExecutedList = [];

  @override
  void initState() {
    super.initState();
    controller = widget.store;
    controller
      ..onLoad(widget.schedule)
      ..setupReactions();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.showNegativeMessage) {
        errorFlushbar ??= showErrorFlushbar(
          message: intl(context, 'checklist-step-confirmation.cancel-label'),
        );
        await errorFlushbar?.show(context);
      } else if (widget.showPositiveMessage) {
        successFlushbar ??= showSuccessFlushbar(
          message: intl(context, 'checklist-step-confirmation.done-label'),
        );
        await successFlushbar?.show(context);
      }
    });
  }

  @override
  void dispose() {
    if (errorFlushbar?.isDismissible ?? false) {
      errorFlushbar?.dismiss();
    }
    if (successFlushbar?.isDismissible ?? false) {
      successFlushbar?.dismiss();
    }
    controller.dispose?.reaction.dispose();
    super.dispose();
  }

  Future<void> loadWasExecutedList() async {
    wasExecutedList = await Future.wait(
      controller.steps.map((item) => checkWasExecuted(item)),
    );
  }

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

  Future<bool> checkWasExecuted(FlowStepEntity flowStep) async {
    var wasExecuted = await _firebaseService.existsFlowStepStatus(
        flowCode: flowStep.flowCode,
        scheduleNumber: widget.schedule.scheduleNumber);

    if (wasExecuted) {
      return wasExecuted;
    }

    if (flowStep.flowCode == 'AWAITTING_SCAN_SEAL') {
      return controller.executedSteps
          .any((executed) => executed.flowCode == flowStep.flowCode);
    }

    if (flowStep.compartmented) {
      final compartments =
          widget.schedule.lines.map((line) => line.compartment).toList();
      final executedSteps = controller.executedSteps
          .where((executed) => executed.flowCode == flowStep.flowCode)
          .toList();
      return executedSteps.length == compartments.length;
    }

    return controller.executedSteps
        .any((executed) => executed.flowCode == flowStep.flowCode);
  }

  @override
  Widget build(BuildContext context) {
    void handleRedirect(FlowStepEntity flowStep) {
      const confirmationSteps = [
        'AWAITTING_SHOW',
        'CHECKIN',
        'RELEASE',
        'DRIVER_CTE',
        'AWAITTING_CHECKOUT',
        'INIT_LOAD',
        'FINAL_LOAD',
        'INIT_UNLOAD',
        'FINAL_UNLOAD',
        'CONFIRM_GRADE'
      ];

      final confirmationLabel =
          intl(context, 'checklist-step.confirmation-label').split('{value}');

      if (confirmationSteps.any(flowStep.flowCode.contains)) {
        Modular.to.popAndPushNamed(
          '/checklist/step-without-questions',
          arguments: StepWithoutQuestionParamsEntity(
            step: flowStep.getStep(),
            confirmationLabel:
                '${confirmationLabel.first}${flowStep.getLabel().toUpperCase()}${confirmationLabel.last}',
            fields: controller.getFieldsMap(
              context,
              widget.schedule,
              flowStep.flowCode,
              widget.schedule.balanceTag,
            ),
            flowStep: flowStep,
            icon: flowStep.getIcon(),
            schedule: widget.schedule,
            hasTag: widget.schedule.balanceTag &&
                flowStep.flowCode.contains('AWAITTING_SHOW'),
            executedCompartments: controller.executedSteps
                .where((executed) => executed.flowCode == flowStep.flowCode)
                .map((e) => e.compartment ?? 0)
                .toList(),
          ),
        );
      }
      if (['WEIGHTING'].any(flowStep.flowCode.contains)) {
        Modular.to.popAndPushNamed(
          '/checklist/step-with-weighing',
          arguments: StepWithWeighingParamsEntity(
            step: flowStep.getStep(),
            confirmationLabel:
                '${confirmationLabel.first}${flowStep.getLabel().toUpperCase()}${confirmationLabel.last}',
            fields: controller.getFieldsMap(
              context,
              widget.schedule,
              flowStep.flowCode,
              false,
            ),
            executedCompartments: controller.executedSteps
                .where((executed) => executed.flowCode == flowStep.flowCode)
                .map((e) => e.compartment ?? 0)
                .toList(),
            flowStep: flowStep,
            icon: flowStep.getIcon(),
            schedule: widget.schedule,
          ),
        );
      }
      if (['CHECKLIST'].any(flowStep.flowCode.contains)) {
        final questions = controller.getQuestions(flowStep, widget.schedule);
        final signatures = controller.getSignatures(flowStep, widget.schedule);
        final answers = controller.getAnswers(
          questions,
          widget.schedule,
        );
        Modular.to.popAndPushNamed(
          '/checklist/step-with-questions',
          arguments: StepWithQuestionParamsEntity(
            step: flowStep.getStep(),
            flowStep: flowStep,
            icon: flowStep.getIcon(),
            schedule: widget.schedule,
            questions: questions,
            signatures: signatures,
            answers: answers,
            executedCompartments: controller.executedSteps
                .where((executed) => executed.flowCode == flowStep.flowCode)
                .map((e) => e.compartment ?? 0)
                .toList(),
          ),
        );
      }

      if (['SCAN_SEAL'].any(flowStep.flowCode.contains)) {
        Modular.to.popAndPushNamed(
          '/checklist/step-with-seals',
          arguments: StepWithSealsParamsEntity(
            step: flowStep.getStep(),
            confirmationLabel:
                '${confirmationLabel.first}${flowStep.getLabel().toUpperCase()}${confirmationLabel.last}',
            fields: controller.getFieldsMap(
              context,
              widget.schedule,
              flowStep.flowCode,
              false,
            ),
            flowStep: flowStep,
            icon: flowStep.getIcon(),
            schedule: widget.schedule,
            executedCompartments: controller.executedSteps
                .where((executed) => executed.flowCode == flowStep.flowCode)
                .map((e) => e.compartment ?? 0)
                .toList(),
          ),
        );
      }
    }

    void handleConfirmation(FlowStepEntity flowStep) {
      showDialog(
        context: context,
        builder: (context) => OxChecklistConfirmation(
          flowDescription: flowStep.flowDescription.toUpperCase(),
          scheduleData: formatWindowAndLocation(
            context,
            widget.schedule.window,
            widget.schedule.location,
          ),
          scheduleNumber: widget.schedule.scheduleNumber,
          userData: widget.appStore.name.toUpperCase(),
          onCancel: () => Modular.to.pop(),
          onSubmit: () => handleRedirect(flowStep),
        ),
      );
    }

    Widget renderList() {
      if (controller.status == ChecklistStatus.loading ||
          controller.isLoadingFlowSteps) {
        return Center(child: CircularProgressIndicator(color: Ox.colors.blue));
      }

      return FutureBuilder(
        future: loadWasExecutedList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
                child: CircularProgressIndicator(color: Ox.colors.blue));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(1),
            itemCount: controller.steps.length,
            itemBuilder: (context, index) {
              final item = controller.steps[index];
              return OxChecklistItem(
                icon: item.getIcon(),
                label: item.getLabel(),
                step: item.getStep(),
                onTap: () => handleConfirmation(item),
                wasExecuted: wasExecutedList[index],
                isScanSeal: item.flowCode == 'AWAITTING_SCAN_SEAL',
              );
            },
          );
        },
      );
    }

    return Observer(
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
                OxBackButton(
                  onTap: () {
                    Modular.to.popUntil(
                      (route) =>
                          !['/checklist/', '/flushbar', '/new-schedule'].any(
                        (path) => route.settings.name?.contains(path) ?? false,
                      ),
                    );

                    if (widget.fromScanner) {
                      Modular.to.maybePop();
                    }
                  },
                ),
                Row(
                  children: [
                    OxAsset(Ox.assets.iconTruck, color: Ox.colors.blue),
                    SizedBox(width: Ox.space.ref40.w),
                    Text(
                      intl(context, 'checklist-page.title'),
                      style: TextStyle(
                        fontSize: Ox.fontSizes.ref60,
                        fontWeight: Ox.fontWeights.medium,
                        color: Ox.colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Ox.space.ref40.h),
                if (widget.fromScanner)
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: Ox.elevation.medium,
                          fixedSize: Size(Ox.size.ref160.w, Ox.size.ref120.h),
                          backgroundColor: Ox.colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Ox.radii.ref10),
                              side: BorderSide(color: Ox.colors.black)),
                        ),
                        child: Icon(
                          Icons.sms_outlined,
                          color: Ox.colors.black,
                          size: 28,
                        ),
                        onPressed: () async {
                          await loadDriverPhoneNumber();
                          Modular.to.pushNamed(
                            '/schedule/communication',
                            arguments: {
                              'phone': _phoneController.text,
                              'plates': widget.schedule.truckPlate,
                              'schedule': widget.schedule.scheduleNumber,
                            },
                          );
                        },
                      ),
                    ],
                  )
                else
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
                  child: renderList(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          onPressed: () async {
            if (widget.fromScanner) {
              await showErrorFlushbar(
                message: intl(
                    context, 'detail-pages.occurrence-button-scam-message'),
              ).show(context);
              return;
            } else {
              await showDialog(
                context: context,
                builder: (context) => OxConfirmation(
                  onCancel: () => Modular.to.pop(),
                  onSubmit: () {
                    Modular.to.popAndPushNamed(
                      '/occurrence/new',
                      arguments:
                          NewOccurrenceParamsEntity(schedule: widget.schedule),
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
                          text: ' ${widget.schedule.scheduleNumber}',
                          style: TextStyle(fontWeight: Ox.fontWeights.bold),
                        ),
                        const TextSpan(
                          text: ' ?',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Ox.colors.errorLight,
            fixedSize: Size.fromHeight(Ox.size.ref140.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Ox.radii.ref0),
            ),
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
                intl(context, 'detail-pages.occurrence-button').toUpperCase(),
                style: TextStyle(
                  fontWeight: Ox.fontWeights.medium,
                  fontSize: Ox.fontSizes.ref40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
