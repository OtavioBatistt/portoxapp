import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:portox_app/app/commons/adapters/device/device_adapter.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/master_store.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

enum HomeStatus { initial, loading, success, error }

abstract class HomeStoreBase with Store {
  HomeStoreBase(
    this.appStore,
    this.masterStore,
    this.deviceAdapter,
  );

  final AppStore appStore;
  final MasterStore masterStore;
  final IDeviceAdapter deviceAdapter;

  @observable
  HomeStatus status = HomeStatus.loading;
  @computed
  List<ScheduleEntity>? get scheduleList => masterStore.todayScheduleList;

  @action
  void setStatus(HomeStatus value) => status = value;

  @action
  Future onLoad() async {
    setStatus(HomeStatus.loading);
    unawaited(masterStore.loadMasterData());
    await masterStore
        .loadSchedules(appStore.plants.map((plant) => plant.code).toList());
    setStatus(HomeStatus.initial);
  }
}
