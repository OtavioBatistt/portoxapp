import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/back_button.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/checklist/presentation/widgets/checklist_header.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';

class StepWithSealsHistoryPage extends StatefulWidget {
  final List<String> seals;
  final String scheduleNumber;
  final String icon;

  const StepWithSealsHistoryPage({
    super.key,
    required this.seals,
    required this.scheduleNumber,
    required this.icon,
  });

  @override
  State<StepWithSealsHistoryPage> createState() =>
      _StepWithSealsHistoryPageState();
}

class _StepWithSealsHistoryPageState extends State<StepWithSealsHistoryPage> {
  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) {
          try {
            return Scaffold(
              backgroundColor: Ox.colors.white,
              appBar: OxAppBar(appStore: Modular.get()),
              body: SingleChildScrollView(
                child: OxLayout(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Ox.space.ref40.w,
                      vertical: Ox.space.ref50.h,
                    ),
                    child: Column(
                      children: [
                        const OxBackButton(),
                        SizedBox(height: Ox.space.ref50.h),
                        OxChecklistHeader(
                          icon: widget.icon,
                          flowDescription:
                              intl(context, 'step-with-seals-page.registered'),
                          scheduleNumber: widget.scheduleNumber,
                          hasFunction: false,
                        ),
                        Divider(
                          color: Ox.colors.grayLight,
                          height: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: widget.seals.map((lacre) {
                              return Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.84,
                                    height: Ox.space.ref110.h,
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    padding: EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      color: Ox.colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Ox.colors.gray),
                                    ),
                                    child: Text(
                                      lacre,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            // ignore: avoid_catches_without_on_clauses
          } catch (e) {
            print('Exception in Observer: $e');
            return Container();
          }
        },
      );
}
