import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/autocomplete.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/data_text_field.dart';

class OxChecklistFields extends StatelessWidget {
  const OxChecklistFields({
    required this.fields,
    super.key,
    this.hasWeight = false,
    this.hasTag = false,
    this.compartments = const [],
    this.onTapTag,
    this.onTapCompartment,
    this.child,
  });

  final Map<String, String> fields;
  final bool hasWeight;
  final bool hasTag;
  final Widget? child;
  final List<String> compartments;
  final void Function()? onTapTag;
  final void Function(String value)? onTapCompartment;

  @override
  Widget build(BuildContext context) {
    Widget getTagField(String value) => Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: OxDataTextField(
                title: intl(context, 'schedule.tag-field'),
                value: value,
              ),
            ),
            SizedBox(width: Ox.space.ref20.w),
            FilledButton(
              onPressed: onTapTag,
              style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: Ox.colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Ox.radii.ref10),
                  side: BorderSide(color: Ox.colors.black),
                ),
              ),
              child: OxAsset(Ox.assets.iconCamera),
            ),
          ],
        );
    return Expanded(
      child: ListView.separated(
        itemCount: child == null ? fields.length : fields.length + 1,
        padding: EdgeInsets.only(top: Ox.space.ref10),
        separatorBuilder: (context, index) => SizedBox(height: Ox.space.ref20),
        itemBuilder: (context, index) {
          if (index == fields.length && child != null) {
            return child;
          }
          final item = fields.entries.elementAt(index);
          final isFirstItem = index == 0;
          final isLastItem = fields.length - 1 == index;

          return Column(
            children: [
              if (isFirstItem && compartments.isNotEmpty)
                Column(
                  children: [
                    SizedBox(
                      height: Ox.size.ref100,
                      child: OxAutocomplete(
                        labelText: intl(
                          context,
                          'step-with-weighing-page.compartment-field',
                        ),
                        onSelected: onTapCompartment ?? (value) {},
                        options: compartments,
                      ),
                    ),
                    SizedBox(height: Ox.space.ref20)
                  ],
                )
              else
                Container(),
              Visibility(
                visible: item.value.isNotEmpty &&
                    !(isLastItem && hasWeight) &&
                    !(isLastItem && hasTag),
                child: OxDataTextField(title: item.key, value: item.value),
              ),
              if (isLastItem && hasTag) getTagField(item.value),
            ],
          );
        },
      ),
    );
  }
}
