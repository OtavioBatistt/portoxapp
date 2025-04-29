import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

class OxDataTextField extends StatelessWidget {
  const OxDataTextField({
    required this.title,
    required this.value,
    super.key,
    this.suffixText,
    this.readOnly = true,
    this.minLines = 1,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.focusNode,
    this.onTap,
  });

  final String title;
  final String value;
  final String? suffixText;
  final bool readOnly;
  final int minLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController(text: value);

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:
                EdgeInsets.only(left: Ox.space.ref30, bottom: Ox.space.ref20),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: Ox.fontWeights.semibold,
                fontSize: Ox.fontSizes.ref40,
                color: Ox.colors.blue,
              ),
            ),
          ),
        ),
        TextField(
          controller: controller ?? textEditingController,
          style: TextStyle(
            fontSize: Ox.fontSizes.ref40,
          ),
          onTap: onTap,
          focusNode: focusNode,
          readOnly: readOnly,
          minLines: minLines,
          maxLines: null,
          keyboardType: keyboardType ?? TextInputType.text,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            isDense: true,
            border: const OutlineInputBorder(),
            contentPadding: EdgeInsets.all(Ox.space.ref30.w),
            suffixText: suffixText,
            suffixStyle: TextStyle(
              color: Ox.colors.black,
            ),
          ),
        )
      ],
    );
  }
}
