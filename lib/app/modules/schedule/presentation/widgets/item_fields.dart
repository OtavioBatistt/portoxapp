import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/modules/schedule/domain/entities/line_entity.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/data_text_field.dart';

class OxItemFields extends StatelessWidget {
  const OxItemFields({
    super.key,
    this.line,
  });
  final LineEntity? line;
  @override
  Widget build(BuildContext context) {
    if (line == null) {
      return Container();
    }

    return Column(
      children: [
        OxDataTextField(
            title: intl(context, 'item-detail-page.document-type-field'),
            value: line!.docTypeDescription),
        SizedBox(height: Ox.space.ref40.h),
        OxDataTextField(
            title: intl(context, 'item-detail-page.document-number-field'),
            value: line!.orderNumber),
        SizedBox(height: Ox.space.ref40.h),
        OxDataTextField(
            title: intl(context, 'item-detail-page.client-field'),
            value: line!.entityName),
        SizedBox(height: Ox.space.ref40.h),
        OxDataTextField(
            title: intl(context, 'item-detail-page.line-field'),
            value: line!.lineNumber),
        SizedBox(height: Ox.space.ref40.h),
        OxDataTextField(
            title: intl(context, 'item-detail-page.code-field'),
            value: line!.itemCode),
        SizedBox(height: Ox.space.ref40.h),
        OxDataTextField(
            title: intl(context, 'item-detail-page.description-field'),
            value: line!.itemDescription),
        SizedBox(height: Ox.space.ref40.h),
        OxDataTextField(
            title: intl(context, 'item-detail-page.quantity-field'),
            value: '${line!.quantity.toString()}/${line!.uom}'),
        SizedBox(height: Ox.space.ref40.h),
        OxDataTextField(
            title: intl(context, 'item-detail-page.risc-type-field'),
            value:
                '${line!.hazardClassCode} - ${line!.hazardClassDescription}'),
        SizedBox(height: Ox.space.ref40.h),
        OxDataTextField(
            title: intl(context, 'item-detail-page.onu-field'),
            value: '${line!.unCode} - ${line!.unDescription}'),
      ],
    );
  }
}
