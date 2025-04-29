// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewScheduleStore on NewScheduleStoreBase, Store {
  late final _$statusAtom =
      Atom(name: 'NewScheduleStoreBase.status', context: context);

  @override
  ValueNotifier<NewScheduleStatus> get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ValueNotifier<NewScheduleStatus> value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('NewScheduleStoreBase.onSubmit', context: context);

  @override
  Future<dynamic> onSubmit(List<String> codes, bool? fromScanner) {
    return _$onSubmitAsyncAction.run(() => super.onSubmit(codes, fromScanner));
  }

  late final _$NewScheduleStoreBaseActionController =
      ActionController(name: 'NewScheduleStoreBase', context: context);

  @override
  void setStatus(NewScheduleStatus value) {
    final _$actionInfo = _$NewScheduleStoreBaseActionController.startAction(
        name: 'NewScheduleStoreBase.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$NewScheduleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
