// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScheduleListStore on ScheduleListStoreBase, Store {
  Computed<List<ScheduleEntity>?>? _$scheduleListComputed;

  @override
  List<ScheduleEntity>? get scheduleList => (_$scheduleListComputed ??=
          Computed<List<ScheduleEntity>?>(() => super.scheduleList,
              name: 'ScheduleListStoreBase.scheduleList'))
      .value;

  late final _$statusAtom =
      Atom(name: 'ScheduleListStoreBase.status', context: context);

  @override
  ScheduleListStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ScheduleListStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$searchTextAtom =
      Atom(name: 'ScheduleListStoreBase.searchText', context: context);

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  late final _$ScheduleListStoreBaseActionController =
      ActionController(name: 'ScheduleListStoreBase', context: context);

  @override
  void setStatus(ScheduleListStatus value) {
    final _$actionInfo = _$ScheduleListStoreBaseActionController.startAction(
        name: 'ScheduleListStoreBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$ScheduleListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$ScheduleListStoreBaseActionController.startAction(
        name: 'ScheduleListStoreBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$ScheduleListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
searchText: ${searchText},
scheduleList: ${scheduleList}
    ''';
  }
}
