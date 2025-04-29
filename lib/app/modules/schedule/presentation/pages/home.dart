import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/adapters/services/token_service_adapter.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/schedule/presentation/stores/home_store.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/schedule_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.store,
    required this.tokenService,
    super.key,
  });
  final HomeStore store;
  final ITokenServiceAdapter tokenService;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore controller;

  @override
  void initState() {
    super.initState();
    controller = widget.store;
    controller.onLoad();
    widget.tokenService.startNewTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _formatDate() {
    final date = DateTime.now();
    final day = date.day;
    final month = intl(context, 'app.month-name-${date.month}');
    return '$day de $month';
  }

  @override
  Widget build(BuildContext context) {
    final menuStyle = ElevatedButton.styleFrom(
      elevation: 0,
      fixedSize: Size(MediaQuery.of(context).size.width / 3, double.maxFinite),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Ox.radii.ref0),
      ),
    );
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: Ox.colors.white,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Ox.colors.green,
                fixedSize: Size(double.maxFinite, Ox.size.ref220.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Ox.radii.ref0),
                ),
              ),
              onPressed: () => Modular.to.pushNamed('/schedule/new-schedule'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Ox.size.ref80.h,
                    width: Ox.size.ref80.h,
                    child: OxAsset(Ox.assets.iconCameraThicker),
                  ),
                  Text(
                    intl(context, 'home-page.submit').toUpperCase(),
                    style: TextStyle(
                      fontWeight: Ox.fontWeights.medium,
                      fontSize: Ox.fontSizes.ref40,
                      color: Ox.colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Ox.colors.blue,
              height: Ox.size.ref180.h,
              child: Row(
                children: [
                  ElevatedButton(
                    style: menuStyle,
                    onPressed: () => Modular.to.pushNamed('/schedule/list'),
                    child: Text(
                      intl(context, 'menu.schedule-list'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Ox.fontSizes.ref40,
                        fontWeight: Ox.fontWeights.medium,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: Ox.size.ref025,
                    color: Ox.colors.white,
                    indent: Ox.space.ref40,
                    endIndent: Ox.space.ref40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width / 3 - 2,
                        double.maxFinite,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Ox.radii.ref0),
                      ),
                    ),
                    onPressed: () =>
                        Modular.to.pushNamed('/schedule/new-schedule'),
                    child: Text(
                      intl(context, 'menu.start-flow'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Ox.fontSizes.ref40,
                        fontWeight: Ox.fontWeights.medium,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: Ox.size.ref025,
                    color: Ox.colors.white,
                    indent: Ox.space.ref40,
                    endIndent: Ox.space.ref40,
                  ),
                  ElevatedButton(
                    style: menuStyle,
                    onPressed: () => Modular.to.pushNamed('/occurrence/'),
                    child: Text(
                      intl(context, 'menu.occurrence'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Ox.fontSizes.ref40,
                        fontWeight: Ox.fontWeights.medium,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        appBar: OxAppBar(appStore: Modular.get()),
        body: OxLayout(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Ox.space.ref40.w,
              vertical: Ox.space.ref50.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    OxAsset(Ox.assets.iconCalendar, color: Ox.colors.blue),
                    SizedBox(width: Ox.space.ref60.w),
                    Text(
                      _formatDate(),
                      style: TextStyle(
                        fontSize: Ox.fontSizes.ref60,
                        fontWeight: Ox.fontWeights.medium,
                        color: Ox.colors.blue,
                      ),
                    ),
                    SizedBox(width: Ox.space.ref20.w),
                  ],
                ),
                SizedBox(height: Ox.space.ref20.h),
                Divider(
                  color: Ox.colors.grayLight,
                  height: 1,
                ),
                SizedBox(height: Ox.space.ref20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      intl(context, 'home-page.next-schedules'),
                      style: TextStyle(
                        fontSize: Ox.fontSizes.ref40,
                        fontWeight: Ox.fontWeights.bold,
                        color: Ox.colors.blue,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Modular.to.pushNamed('/schedule/list'),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.square(Ox.size.ref60.h),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OxAsset(
                            Ox.assets.iconPlus,
                            size: Ox.size.ref30.h,
                          ),
                          SizedBox(width: Ox.space.ref10.w),
                          Text(
                            intl(context, 'home-page.show-more'),
                            style: TextStyle(
                              fontSize: Ox.fontSizes.ref40,
                              color: Ox.colors.blue,
                              fontWeight: Ox.fontWeights.regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: OxScheduleList(
                    isLoading: controller.scheduleList == null,
                    scheduleList: controller.scheduleList ?? [],
                    contentColor: Ox.colors.blue,
                    onItemTap: (schedule) => Modular.to
                        .pushNamed('/schedule/detail', arguments: schedule),
                    isOutlined: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
