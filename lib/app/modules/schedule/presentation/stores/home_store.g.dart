// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<List<ScheduleEntity>?>? _$scheduleListComputed;

  @override
  List<ScheduleEntity>? get scheduleList => (_$scheduleListComputed ??=
          Computed<List<ScheduleEntity>?>(() => super.scheduleList,
              name: 'HomeStoreBase.scheduleList'))
      .value;

  late final _$statusAtom =
      Atom(name: 'HomeStoreBase.status', context: context);

  @override
  HomeStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(HomeStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$onLoadAsyncAction =
      AsyncAction('HomeStoreBase.onLoad', context: context);

  @override
  Future<dynamic> onLoad() {
    return _$onLoadAsyncAction.run(() => super.onLoad());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setStatus(HomeStatus value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
scheduleList: ${scheduleList}
    ''';
  }
}
