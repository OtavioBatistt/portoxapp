import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/radio.dart';

enum OxRadioAnswerOrientationEnum { vertical, horizontal }

// ignore: constant_identifier_names
enum OxRadioAnswerValueEnum { Y, N, NONE }

class OxRadioAnswer extends StatefulWidget {
  const OxRadioAnswer({
    super.key,
    this.isDisabled = false,
    this.initialValue,
    required this.onTap,
    this.orientation = OxRadioAnswerOrientationEnum.vertical,
  });
  final bool isDisabled;
  final String? initialValue;
  final OxRadioAnswerOrientationEnum? orientation;
  final void Function(String? value) onTap;
  @override
  State<OxRadioAnswer> createState() => _OxRadioAnswerState();
}

class _OxRadioAnswerState extends State<OxRadioAnswer> {
  String? _selectedAnswer;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _selectedAnswer = widget.initialValue ?? '';
    });

    void handleTap(value) {
      setState(() {
        _selectedAnswer = value;
      });
      widget.onTap(value);
    }

    List<Widget> getRadioList(OxRadioAnswerOrientationEnum orientation) => [
          OxRadio(
            key: const Key('clickable-radio-answer-yes-area'),
            value: OxRadioAnswerValueEnum.Y.name,
            groupValue: _selectedAnswer,
            isDisabled: widget.isDisabled,
            onTap: handleTap,
            child: OxAsset(
              Ox.assets.iconAnswerYes,
              alignment: Alignment.centerLeft,
              size: orientation == OxRadioAnswerOrientationEnum.horizontal
                  ? Ox.size.ref80
                  : Ox.size.ref115,
            ),
          ),
          OxRadio(
            key: const Key('clickable-radio-answer-no-area'),
            value: OxRadioAnswerValueEnum.N.name,
            groupValue: _selectedAnswer,
            isDisabled: widget.isDisabled,
            onTap: handleTap,
            child: OxAsset(
              Ox.assets.iconAnswerNo,
              alignment: Alignment.centerLeft,
              size: orientation == OxRadioAnswerOrientationEnum.horizontal
                  ? Ox.size.ref80
                  : Ox.size.ref115,
            ),
          ),
          OxRadio(
            key: const Key('clickable-radio-answer-none-area'),
            value: OxRadioAnswerValueEnum.NONE.name,
            groupValue: _selectedAnswer,
            isDisabled: widget.isDisabled,
            onTap: handleTap,
            child: Text(
              "N/A",
              style: TextStyle(
                fontSize: orientation == OxRadioAnswerOrientationEnum.horizontal
                    ? Ox.fontSizes.ref70
                    : Ox.fontSizes.ref80,
                fontWeight: Ox.fontWeights.bold,
              ),
            ),
          ),
        ];

    if (widget.orientation == OxRadioAnswerOrientationEnum.horizontal) {
      return Row(
          mainAxisSize: MainAxisSize.min,
          children: getRadioList(OxRadioAnswerOrientationEnum.horizontal)
              .map((e) => Expanded(child: e))
              .toList());
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getRadioList(OxRadioAnswerOrientationEnum.vertical));
  }
}
