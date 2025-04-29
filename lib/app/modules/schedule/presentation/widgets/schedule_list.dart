import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/tab_card.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';

class OxScheduleList extends StatefulWidget {
  const OxScheduleList({
    super.key,
    required this.scheduleList,
    required this.onItemTap,
    this.isLoading = false,
    this.isOutlined = false,
    this.onRefresh,
    this.contentColor,
  });
  final List<ScheduleEntity> scheduleList;
  final Future Function()? onRefresh;
  final Function(ScheduleEntity) onItemTap;
  final bool isLoading;
  final bool isOutlined;
  final Color? contentColor;

  @override
  State<OxScheduleList> createState() => _OxScheduleListState();
}

class _OxScheduleListState extends State<OxScheduleList> {
  @override
  Widget build(BuildContext context) {
    Widget renderList() {
      if (widget.isLoading) {
        return Center(
          child: CircularProgressIndicator(color: widget.contentColor),
        );
      }

      if (widget.scheduleList.isEmpty) {
        return Center(
          child: Text(
            intl(context, 'schedule-list-page.not-found'),
            style: TextStyle(
              fontSize: Ox.fontSizes.ref55,
              fontWeight: Ox.fontWeights.bold,
              color: widget.contentColor ?? Ox.colors.white,
            ),
          ),
        );
      }

      return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: Ox.space.ref20),
          itemCount: widget.scheduleList.length,
          itemBuilder: (context, index) {
            final item = widget.scheduleList[index];
            return OxTabCard(
                title: '${item.windowHourAndMinute} - ${item.location}',
                subtitle: item.scheduleNumber,
                onTap: () => widget.onItemTap(item),
                isOutlined: widget.isOutlined);
          });
    }

    if (widget.onRefresh == null) {
      return renderList();
    }

    return RefreshIndicator(
        onRefresh: widget.onRefresh!,
        child: () {
          return renderList();
        }());
  }
}
