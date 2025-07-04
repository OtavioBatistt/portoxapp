import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/domain/answer_entity.dart';
import 'package:portox_app/app/commons/domain/checklist_answer_entity.dart';
import 'package:portox_app/app/commons/domain/checklist_signature_entity.dart';
import 'package:portox_app/app/commons/domain/flow_step_entity.dart';
import 'package:portox_app/app/commons/domain/question_entity.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/domain/signature_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/autocomplete.dart';
import 'package:portox_app/app/commons/widgets/confirmation.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/commons/widgets/radio_answer.dart';
import 'package:portox_app/app/commons/widgets/signature.dart';
import 'package:portox_app/app/modules/checklist/presentation/stores/step_store.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/action_button.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_header.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/line_entity.dart';
import 'package:signature/signature.dart';

class StepWithQuestionsPage extends StatefulWidget {
  const StepWithQuestionsPage({
    required this.icon,
    required this.schedule,
    required this.flowStep,
    required this.questions,
    required this.stepStore,
    required this.store,
    super.key,
    this.step,
    this.answers,
    this.signatures,
    this.executedCompartments = const [],
  });

  final String icon;
  final String? step;
  final ScheduleEntity schedule;
  final FlowStepEntity flowStep;
  final List<QuestionEntity> questions;
  final List<AnswerEntity>? answers;
  final List<SignatureEntity>? signatures;
  final StepStore stepStore;
  final List<int>? executedCompartments;
  final AppStore store;

  @override
  State<StepWithQuestionsPage> createState() => _StepWithQuestionsPageState();
}

class _StepWithQuestionsPageState extends State<StepWithQuestionsPage>
    with SingleTickerProviderStateMixin {
  int _currentQuestion = 1;
  bool _isFirstQuestion = true;
  bool _isLastQuestion = false;
  bool _isSignatureQuestion = false;
  bool _isQuestionRequired = true;
  int _tabsLength = 0;
  int _questionsLength = 0;
  bool _hasSignatureStep = false;
  bool _isCompartmented = false;

  LineEntity? selectedCompartment;

  List<String> _answersList = [];
  List<String> _updateTimeList = [];
  List<List<Point>> _signaturePointsList = [];

  late StepStore controller;
  int _currentIndex = 0;
  late TextEditingController _compartmentController;
  late TextEditingController _textEditingController;
  late SignatureController _signatureController;

  final FocusNode _focusNode = FocusNode();

  List<SignatureEntity>? _signaturesList;

  @override
  void initState() {
    super.initState();
    _isCompartmented =
        widget.flowStep.compartmented && widget.schedule.lines.length > 1;
    controller = widget.stepStore;
    _hasSignatureStep = widget.flowStep.signatures;
    _questionsLength = widget.questions.length;

    //Lista referencia assinaturas
    _signaturesList = widget.signatures;

    _tabsLength = _hasSignatureStep
        ? widget.questions.length + _signaturesList!.length
        : widget.questions.length;
    if (_isCompartmented) {
      _tabsLength = _tabsLength + 1;
    }

    _answersList = List.generate(_tabsLength, (index) => '');
    _updateTimeList = List.generate(_tabsLength, (index) => '');

    //Configuração das assinaturas
    if (_hasSignatureStep) {
      var signaturesList = _signaturesList!
          .where((element) =>
              widget.store.responsibles!.contains(element.responsiblePt))
          .toList();
      if (signaturesList.isEmpty) {
        _signaturePointsList =
            List.generate(_signaturesList!.length, (index) => []);
        _tabsLength = widget.questions.length + _signaturesList!.length;
      } else {
        _signaturesList = signaturesList;
        _signaturePointsList =
            List.generate(signaturesList.length, (index) => []);
        _tabsLength = widget.questions.length + signaturesList.length;
      }
    }

    if (!_hasSignatureStep) {
      _tabsLength = widget.questions.length;
    }
    _compartmentController = TextEditingController();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      setState(() {
        if (!_isSignatureQuestion) {
          _setTimeList(_currentIndex);
          _answersList[_currentIndex] = _textEditingController.text;
        }
      });
    });

    _signatureController = SignatureController(
      penColor: Ox.colors.black,
      penStrokeWidth: 4,
    );
    _signatureController.addListener(() {
      setState(() {
        _signatureController.toPngBytes().then((value) {
          if (value == null) {
            _answersList[_currentIndex] = '';
            _setTimeList(_currentIndex);
          } else {
            final imageEncoded = base64.encode(value);
            _answersList[_currentIndex] = imageEncoded;
            _setTimeList(_currentIndex);
          }
        });
        if (_isCompartmented) {
          _signaturePointsList[_currentIndex - widget.questions.length - 1] =
              _signatureController.points;
        } else {
          _signaturePointsList[_currentIndex - widget.questions.length] =
              _signatureController.points;
        }
      });
    });

    _isSignatureQuestion = _currentIndex >= widget.questions.length;
    _isQuestionRequired = _hasSignatureStep && _isSignatureQuestion
        ? _signaturesList![_currentIndex - widget.questions.length].required
        : widget.questions[_currentIndex].required;

    print(widget.store.name);
  }

  void handleChangeIndex(int index) {
    if (_isCompartmented) {
      setState(() {
        _currentIndex = index;
        _currentQuestion = _currentIndex;
        _isFirstQuestion = _currentIndex == 0;
        if (!_isFirstQuestion) {
          _isLastQuestion = _currentIndex == _tabsLength - 1;
          _isSignatureQuestion = _currentIndex >= (widget.questions.length + 1);
          _isQuestionRequired = _hasSignatureStep && _isSignatureQuestion
              ? _signaturesList![_currentIndex - widget.questions.length - 1]
                  .required
              : widget.questions[_currentIndex - 1].required;
        } else {
          _compartmentController =
              TextEditingController(text: getLineOption(selectedCompartment!));
        }

        if (_isSignatureQuestion) {
          _signatureController.points =
              _signaturePointsList[_currentIndex - widget.questions.length - 1];
        } else {
          _textEditingController.text = _answersList[_currentIndex];
        }
      });
    } else {
      setState(() {
        _currentIndex = index;
        _currentQuestion = _currentIndex + 1;
        _isFirstQuestion = _currentIndex == 0;
        _isLastQuestion = _currentIndex == _tabsLength - 1;
        _isSignatureQuestion = _currentIndex >= widget.questions.length;
        _isQuestionRequired = _hasSignatureStep && _isSignatureQuestion
            ? widget
                .signatures![_currentIndex - widget.questions.length].required
            : widget.questions[_currentIndex].required;

        if (_isSignatureQuestion) {
          _signatureController.points =
              _signaturePointsList[_currentIndex - widget.questions.length];
        } else {
          _textEditingController.text = _answersList[_currentIndex];
        }
      });
    }
    _setTimeList(_currentIndex);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _signatureController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _setTimeList(int index) {
    _updateTimeList[index] = DateTime.now().toString();
  }

  List<ChecklistAnswerEntity> getAnswers() {
    final list = <ChecklistAnswerEntity>[];
    var index = _isCompartmented ? 1 : 0;
    for (final question in widget.questions) {
      String? textValue;
      String? lovValue;
      String? radioValue;
      int? numberValue;

      if (question.validationType == 'RADIO') {
        radioValue = _answersList[index];
      } else if (question.validationType == 'VARCHAR') {
        textValue = _answersList[index];
      } else if (question.validationType == 'NUMBER') {
        numberValue = int.tryParse(_answersList[index]);
      } else if (question.validationType.startsWith('LOV')) {
        lovValue = widget.answers!
            .firstWhere(
              (answer) =>
                  controller.getAnswerDescription(answer) ==
                  _answersList[index],
            )
            .code;
      }
      list.add(
        ChecklistAnswerEntity(
          radioValue: radioValue,
          textValue: textValue,
          lovValue: lovValue,
          numberValue: numberValue,
          questionId: question.questionId,
          skipped: _answersList[index].isEmpty,
          createdAt: _updateTimeList[index],
        ),
      );
      index++;
    }
    return list;
  }

  List<ChecklistSignatureEntity> getSignatures() {
    final list = <ChecklistSignatureEntity>[];
    var index = _isCompartmented ? 1 : 0;
    for (final signature in _signaturesList ?? []) {
      list.add(
        ChecklistSignatureEntity(
          id: (signature as SignatureEntity).id,
          createdAt: _updateTimeList[widget.questions.length + index],
          mimeType: 'image/png',
          skipped: _answersList[widget.questions.length + index].isEmpty,
          image: _answersList[widget.questions.length + index],
        ),
      );
      index++;
    }
    return list;
  }

  void handleChangeQuestion(int toIndexNumber) {
    if (!(toIndexNumber >= _tabsLength)) {
      handleChangeIndex(toIndexNumber);
    } else {
      final answers = getAnswers();
      final signatures = getSignatures();

      controller.onSubmitWithQuestions(
        accepted: true,
        flowCode: widget.flowStep.flowCode,
        schedule: widget.schedule,
        answers: answers,
        signatures: signatures,
        compartment: selectedCompartment?.compartment,
      );
    }

    _focusNode.unfocus();
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
  Widget build(BuildContext context) {
    void handleGoBack(Function() callback) {
      showDialog(
        context: context,
        builder: (context) => OxConfirmation(
          message: Text(
            intl(context, 'checklist.back-confirmation'),
            style: TextStyle(
              color: Ox.colors.blue,
              fontSize: Ox.fontSizes.ref60,
              fontWeight: Ox.fontWeights.bold,
            ),
            textAlign: TextAlign.center,
          ),
          onCancel: () => Modular.to.pop(),
          onSubmit: () => callback(),
        ),
      );
    }

    Widget getQuestionWidget(String validationType) {
      if (validationType == 'RADIO') {
        return OxRadioAnswer(
          initialValue: _answersList[_currentIndex],
          orientation: OxRadioAnswerOrientationEnum.horizontal,
          onTap: (value) {
            setState(() {
              _setTimeList(_currentIndex);
              _answersList[_currentIndex] = value ?? '';
            });
          },
        );
      }

      if (validationType == 'VARCHAR') {
        return TextField(
          focusNode: _focusNode,
          controller: _textEditingController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText:
                intl(context, 'step-with-questions-page.text-field-label'),
          ),
        );
      }

      if (validationType == 'NUMBER') {
        return TextField(
          focusNode: _focusNode,
          controller: _textEditingController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText:
                intl(context, 'step-with-questions-page.text-field-label'),
          ),
        );
      }

      if (validationType.startsWith('LOV')) {
        return OxAutocomplete(
          readOnly: true,
          focusNode: _focusNode,
          controller: _textEditingController,
          onSelected: (value) {},
          options: widget.answers!
              .where((answer) => answer.validationType == validationType)
              .map((answer) => controller.getAnswerDescription(answer))
              .toList(),
        );
      }

      return Container();
    }

    List<Widget> getQuestionSteps() {
      final steps = <Widget>[];

      if (_isCompartmented) {
        steps.add(
          Column(
            children: [
              Row(
                children: [
                  Text(
                    intl(context, 'step-with-questions-page.compartment-label'),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      color: Ox.colors.blue,
                      fontSize: Ox.fontSizes.ref55,
                      fontWeight: Ox.fontWeights.medium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Ox.space.ref40),
              SizedBox(
                height: Ox.size.ref100,
                child: OxAutocomplete(
                  labelText: intl(
                    context,
                    'step-with-weighing-page.compartment-field',
                  ),
                  controller: _compartmentController,
                  onSelected: (value) {
                    setState(
                      () => selectedCompartment = parseLineOption(value),
                    );
                  },
                  options: handleCompartmentOptions(),
                ),
              ),
            ],
          ),
        );
      }

      final List<Widget> questionSteps = widget.questions
          .map(
            (question) => Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '$_currentQuestion/$_questionsLength) ${controller.getQuestionDescription(question)}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 100,
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
                SizedBox(height: Ox.space.ref80),
                getQuestionWidget(question.validationType),
              ],
            ),
          )
          .toList();
      steps.addAll(questionSteps);
      if (_hasSignatureStep) {
        steps.addAll(
          _signaturesList!
              .map(
                (signature) => Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            controller.getSignatureDescription(signature),
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
                    if (_isSignatureQuestion)
                      SizedBox(height: Ox.space.ref20)
                    else
                      SizedBox(height: Ox.space.ref80),
                    OxSignature(
                      height: Ox.size.ref400.w,
                      orientation: OxSignatureOrientationEnum.landscape,
                      controller: _signatureController,
                    ),
                  ],
                ),
              )
              .toList(),
        );
      }

      return steps;
    }

    Widget getActionButtons() => Row(
          children: [
            Visibility(
              visible: _isFirstQuestion,
              child: OxActionButton(
                color: Ox.colors.blue,
                backgroundColor: Ox.colors.white,
                onPressed: () => handleGoBack(
                  () => Modular.to
                    ..pop()
                    ..pop(),
                ),
                prefixIcon: Icons.arrow_back,
                text: intl(context, 'app.leave'),
              ),
            ),
            Visibility(
              visible: !_isFirstQuestion,
              child: OxActionButton(
                backgroundColor: Ox.colors.white,
                onPressed: () => handleChangeQuestion(_currentIndex - 1),
                prefixIcon: Icons.arrow_back,
                color: Ox.colors.blue,
                text: intl(context, 'app.back'),
              ),
            ),
            const Spacer(),
            OxActionButton(
              onPressed: (_isFirstQuestion &&
                          _isCompartmented &&
                          selectedCompartment != null) ||
                      (!_isQuestionRequired ||
                          (_isQuestionRequired ==
                              _answersList[_currentIndex].isNotEmpty))
                  ? () => handleChangeQuestion(_currentIndex + 1)
                  : null,
              color: Ox.colors.blue,
              backgroundColor: (_isFirstQuestion &&
                          _isCompartmented &&
                          selectedCompartment != null) ||
                      (!_isQuestionRequired ||
                          (_isQuestionRequired ==
                              _answersList[_currentIndex].isNotEmpty))
                  ? Ox.colors.green
                  : Ox.colors.grayLight,
              isLoading: controller.status == StepStatus.yesLoading,
              text: intl(
                context,
                _isLastQuestion ? 'app.confirm' : 'app.next',
              ),
              suffixIcon: Icons.arrow_forward,
            ),
          ],
        );

    return WillPopScope(
      onWillPop: () async => false,
      child: Observer(
        builder: (context) => Scaffold(
          backgroundColor: Ox.colors.blue,
          appBar: _isSignatureQuestion
              ? null
              : OxAppBar(
                  appStore: Modular.get(),
                  beforeRedirect: handleGoBack,
                ),
          body: OxLayout(
            child: ColoredBox(
              color: Ox.colors.white,
              child: RotatedBox(
                quarterTurns: _isSignatureQuestion ? 1 : 0,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: Ox.space.ref40.h,
                    right: Ox.space.ref60.w,
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
                      if (_isSignatureQuestion)
                        Container()
                      else
                        SizedBox(height: Ox.space.ref40),
                      Expanded(
                        child: ListView(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: getQuestionSteps()[_currentIndex],
                                ),
                              ],
                            ),
                            if (_isSignatureQuestion)
                              Container()
                            else
                              SizedBox(height: Ox.space.ref40),
                            getActionButtons(),
                            SizedBox(
                              height: _isSignatureQuestion
                                  ? Ox.space.ref40.h
                                  : Ox.space.ref100.h,
                            )
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
      ),
    );
  }
}
