import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/parse_code_schedule.dart';

part 'new_schedule_store.g.dart';

class NewScheduleStore = NewScheduleStoreBase with _$NewScheduleStore;

enum NewScheduleStatus { initial, loading, success, error }

abstract class NewScheduleStoreBase with Store {
  NewScheduleStoreBase(this.parseCodeScheduleUseCase);
  final ParseCodeScheduleUseCase parseCodeScheduleUseCase;

  @observable
  ValueNotifier<NewScheduleStatus> status =
      ValueNotifier(NewScheduleStatus.initial);

  @action
  void setStatus(NewScheduleStatus value) => status.value = value;

  @action
  Future onSubmit(List<String> codes, bool? fromScanner) async {
    setStatus(NewScheduleStatus.loading);

    if (codes.isEmpty || codes.first.isEmpty) {
      setStatus(NewScheduleStatus.initial);
      return;
    }
    final response = await parseCodeSchedule(codes.first, fromScanner ?? false);
    setStatus(response);
  }

  Future<NewScheduleStatus> parseCodeSchedule(
      String code, bool fromScanner) async {
    final result = await parseCodeScheduleUseCase.call(code);
    return result.fold(
      (e) => NewScheduleStatus.error,
      (schedule) {
        Modular.to.popAndPushNamed(
          '/checklist/?fromScanner=$fromScanner',
          arguments: schedule,
        );
        return NewScheduleStatus.success;
      },
    );
  }
}
