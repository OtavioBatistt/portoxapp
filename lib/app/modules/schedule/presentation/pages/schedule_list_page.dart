import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/adapters/services/formatters/date_formatter_service_adapter.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/back_button.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/commons/widgets/tab.dart';
import 'package:portox_app/app/modules/schedule/presentation/stores/schedule_list_store.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/schedule_list.dart';

class ScheduleListPage extends StatefulWidget {
  const ScheduleListPage({
    required this.store,
    required this.dateFormatter,
    super.key,
  });
  final ScheduleListStore store;
  final IDateServiceAdapter dateFormatter;

  @override
  State<ScheduleListPage> createState() => _ScheduleListPageState();
}

class _ScheduleListPageState extends State<ScheduleListPage>
    with SingleTickerProviderStateMixin {
  final tooltipKey = GlobalKey<TooltipState>();
  final searchController = TextEditingController();
  late ScheduleListStore controller;
  late TabController _tabController;
  String searchText = '';

  DateTime? today;
  DateTime? tomorrow;
  DateTime? afterTomorrow;
  DateTime? fouthTabDate;
  DateTime? fifthTabDate;

  bool isFirstTab = true;
  String firstTab = '';
  List<ScheduleEntity> get firstTabList => (controller.scheduleList ?? [])
      .where((element) =>
          element.window.day == today?.day &&
          element.queryString.toUpperCase().contains(searchText))
      .toList();

  bool isSecondTab = false;
  String secondTab = '';
  List<ScheduleEntity> get secondTabList => (controller.scheduleList ?? [])
      .where((element) =>
          element.window.day == tomorrow?.day &&
          element.queryString.toUpperCase().contains(searchText))
      .toList();

  bool isThirdTab = false;
  String thirdTab = '';
  List<ScheduleEntity> get thirdTabList => (controller.scheduleList ?? [])
      .where((element) =>
          element.window.day == afterTomorrow?.day &&
          element.queryString.toUpperCase().contains(searchText))
      .toList();

  bool isFourthTab = false;
  String fourthTab = '';
  List<ScheduleEntity> get fourthTabList => (controller.scheduleList ?? [])
      .where((element) =>
          element.window.day == fouthTabDate?.day &&
          element.queryString.toUpperCase().contains(searchText))
      .toList();

  bool isFifthTab = false;
  String fifthTab = '';
  List<ScheduleEntity> get fifthTabList => (controller.scheduleList ?? [])
      .where((element) =>
          element.window.day == fifthTabDate?.day &&
          element.queryString.toUpperCase().contains(searchText))
      .toList();

  @override
  void initState() {
    super.initState();
    controller = widget.store;
    setupTabs();
    _tabController = TabController(
        length: 5,
        vsync: this,
        animationDuration: Duration(milliseconds: Ox.duration.ref0));
    _tabController.addListener(() {
      setState(() {
        isFirstTab = _tabController.index == 0;
        isSecondTab = _tabController.index == 1;
        isThirdTab = _tabController.index == 2;
        isFourthTab = _tabController.index == 3;
        isFifthTab = _tabController.index == 4;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void setupTabs() {
    final now = DateTime.now();
    final setToday = DateTime(now.year, now.month, now.day);
    final setTomorrow = DateTime(now.year, now.month, now.day + 1);
    final setAfterTomorrow = DateTime(now.year, now.month, now.day + 2);
    final setFourthTabDate = DateTime(now.year, now.month, now.day + 3);
    final setFifthTabDate = DateTime(now.year, now.month, now.day + 4);

    setState(() {
      today = setToday;
      tomorrow = setTomorrow;
      afterTomorrow = setAfterTomorrow;
      fouthTabDate = setFourthTabDate;
      fifthTabDate = setFifthTabDate;
      firstTab = widget.dateFormatter.formatDayMonth(setToday);
      secondTab = widget.dateFormatter.formatDayMonth(setTomorrow);
      thirdTab = widget.dateFormatter.formatDayMonth(setAfterTomorrow);
      fourthTab = widget.dateFormatter.formatDayMonth(setFourthTabDate);
      fifthTab = widget.dateFormatter.formatDayMonth(setFifthTabDate);
    });
  }

  void handleSearch() {
    setState(() {
      searchText = searchController.text.toUpperCase();
    });
  }

  void handleClear() {
    searchController.clear();
    setState(() {
      searchText = '';
    });
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => Scaffold(
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
                  const OxBackButton(),
                  Row(
                    children: [
                      OxAsset(Ox.assets.iconClipboard),
                      SizedBox(width: Ox.space.ref60.w),
                      Text(
                        intl(context, 'schedule-list-page.title'),
                        style: TextStyle(
                          fontSize: Ox.fontSizes.ref50,
                          fontWeight: Ox.fontWeights.medium,
                          color: Ox.colors.blue,
                        ),
                      ),
                      SizedBox(width: Ox.space.ref20.w),
                      SizedBox(
                        height: Ox.size.ref100.h,
                        width: Ox.size.ref100.h,
                        child: Tooltip(
                          key: tooltipKey,
                          triggerMode: TooltipTriggerMode.tap,
                          decoration: BoxDecoration(
                            color: Ox.colors.gray,
                            borderRadius: BorderRadius.circular(Ox.radii.ref10),
                          ),
                          textStyle: TextStyle(
                            fontSize: Ox.fontSizes.ref40,
                            color: Ox.colors.white,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: Ox.space.ref50.w,
                            vertical: Ox.space.ref40.h,
                          ),
                          message: intl(
                              context, 'schedule-list-page.search-tooltip'),
                          showDuration:
                              Duration(milliseconds: Ox.duration.ref500),
                          waitDuration:
                              Duration(milliseconds: Ox.duration.ref1),
                          margin: EdgeInsets.only(right: Ox.space.ref10.w),
                          child: Padding(
                            padding: EdgeInsets.all(Ox.size.ref20),
                            child: OxAsset(
                              Ox.assets.iconInfo,
                              color: Ox.colors.blue,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: Ox.space.ref50.h),
                  SizedBox(
                    height: Ox.size.ref120.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: Material(
                            elevation: Ox.elevation.medium,
                            child: TextField(
                              controller: searchController,
                              onSubmitted: (_) => handleSearch(),
                              decoration: InputDecoration(
                                prefixIcon: IconButton(
                                  icon: const Icon(Icons.search),
                                  onPressed: handleSearch,
                                ),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: handleClear,
                                ),
                                border: const OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(
                                  left: Ox.space.ref30.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Ox.space.ref20.w),
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
                          child: OxAsset(Ox.assets.iconCamera),
                          onPressed: () =>
                              Modular.to.pushNamed('/schedule/new-schedule'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Ox.space.ref50.h),
                  SizedBox(
                    height: Ox.size.ref120.h,
                    child: Row(
                      children: [
                        SizedBox(
                          width: Ox.space.ref200.w,
                          child: OxTab(
                            firstTab,
                            isActive: isFirstTab,
                            onTap: () => _tabController.animateTo(0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          child: SizedBox(
                            width: Ox.space.ref200.w,
                            child: OxTab(
                              secondTab,
                              isActive: isSecondTab,
                              onTap: () => _tabController.animateTo(1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Ox.space.ref200.w,
                          child: OxTab(
                            thirdTab,
                            isActive: isThirdTab,
                            onTap: () => _tabController.animateTo(2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          child: SizedBox(
                            width: Ox.space.ref200.w,
                            child: OxTab(
                              fourthTab,
                              isActive: isFourthTab,
                              onTap: () => _tabController.animateTo(3),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Ox.space.ref200.w,
                          child: OxTab(
                            fifthTab,
                            isActive: isFifthTab,
                            onTap: () => _tabController.animateTo(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: Ox.size.ref40.h,
                        left: Ox.size.ref40.h,
                        right: Ox.size.ref40.h,
                      ),
                      decoration: BoxDecoration(
                        color: Ox.colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Ox.radii.ref10),
                            bottomRight: Radius.circular(Ox.radii.ref10)),
                      ),
                      child: TabBarView(controller: _tabController, children: [
                        OxScheduleList(
                          isLoading: controller.scheduleList == null,
                          contentColor: Ox.colors.white,
                          scheduleList: firstTabList,
                          onItemTap: (schedule) => Modular.to.pushNamed(
                              '/schedule/detail',
                              arguments: schedule),
                        ),
                        OxScheduleList(
                          isLoading: controller.scheduleList == null,
                          contentColor: Ox.colors.white,
                          scheduleList: secondTabList,
                          onItemTap: (schedule) => Modular.to.pushNamed(
                              '/schedule/detail',
                              arguments: schedule),
                        ),
                        OxScheduleList(
                          isLoading: controller.scheduleList == null,
                          contentColor: Ox.colors.white,
                          scheduleList: thirdTabList,
                          onItemTap: (schedule) => Modular.to.pushNamed(
                              '/schedule/detail',
                              arguments: schedule),
                        ),
                        OxScheduleList(
                          isLoading: controller.scheduleList == null,
                          contentColor: Ox.colors.white,
                          scheduleList: fourthTabList,
                          onItemTap: (schedule) => Modular.to.pushNamed(
                              '/schedule/detail',
                              arguments: schedule),
                        ),
                        OxScheduleList(
                          isLoading: controller.scheduleList == null,
                          contentColor: Ox.colors.white,
                          scheduleList: fifthTabList,
                          onItemTap: (schedule) => Modular.to.pushNamed(
                              '/schedule/detail',
                              arguments: schedule),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
