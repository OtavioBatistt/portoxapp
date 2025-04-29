import 'package:mobx/mobx.dart';
import 'package:portox_app/app/commons/domain/schedule_entity.dart';
import 'package:portox_app/app/commons/master_store.dart';

part 'schedule_list_store.g.dart';

class ScheduleListStore = ScheduleListStoreBase with _$ScheduleListStore;

enum ScheduleListStatus { initial, loading, success, error }

abstract class ScheduleListStoreBase with Store {
  ScheduleListStoreBase(
    this.masterStore,
  );
  final MasterStore masterStore;

  final now = DateTime.now();

  @observable
  ScheduleListStatus status = ScheduleListStatus.initial;
  @observable
  String searchText = '';
  @computed
  List<ScheduleEntity>? get scheduleList => masterStore.scheduleList;

  @action
  void setStatus(ScheduleListStatus value) => status = value;
  @action
  void setSearchText(String value) => searchText = value;
}
