import 'package:flutter/material.dart';

class OxRadio extends StatelessWidget {
  const OxRadio({
    super.key,
    this.child,
    this.isDisabled = false,
    this.value = "radio",
    this.groupValue,
    required this.onTap,
  });

  final Widget? child;
  final bool isDisabled;
  final String value;
  final String? groupValue;
  final void Function(String? value) onTap;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      key: Key('clickable-radio-area-$value'),
      title: child,
      value: value,
      groupValue: groupValue,
      contentPadding: EdgeInsets.zero,
      visualDensity:
          const VisualDensity(horizontal: VisualDensity.minimumDensity),
      onChanged: isDisabled
          ? null
          : (String? value) {
              onTap(value);
            },
    );
  }
}
