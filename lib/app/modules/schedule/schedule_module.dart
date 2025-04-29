import 'package:flutter_modular/flutter_modular.dart';
import 'package:portox_app/app/modules/checklist/data/external/storage/storage_checklist_datasource.dart';
import 'package:portox_app/app/modules/communication/presentation/pages/sms_page.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/parse_code_schedule.dart';
import 'package:portox_app/app/modules/schedule/presentation/pages/home.dart';
import 'package:portox_app/app/modules/schedule/presentation/pages/item_detail.dart';
import 'package:portox_app/app/modules/schedule/presentation/pages/new_schedule.dart';
import 'package:portox_app/app/modules/schedule/presentation/pages/profile.dart';
import 'package:portox_app/app/modules/schedule/presentation/pages/schedule_detail.dart';
import 'package:portox_app/app/modules/schedule/presentation/pages/schedule_list_page.dart';
import 'package:portox_app/app/modules/schedule/presentation/stores/home_store.dart';
import 'package:portox_app/app/modules/schedule/presentation/stores/new_schedule_store.dart';
import 'package:portox_app/app/modules/schedule/presentation/stores/schedule_list_store.dart';

class ScheduleModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeStore(i(), i(), i())),
        Bind.lazySingleton((i) => ScheduleListStore(i())),
        Bind.lazySingleton((i) => NewScheduleStore(i())),
        Bind.factory((i) => StorageChecklistDataSource(storage: i())),
        Bind.factory((i) => ParseCodeScheduleUseCase()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => HomePage(
            store: Modular.get(),
            tokenService: Modular.get(),
          ),
        ),
        ChildRoute(
          '/profile',
          child: (_, args) => ProfilePage(
            store: Modular.get(),
          ),
        ),
        ChildRoute(
          '/list',
          child: (_, args) => ScheduleListPage(
            store: Modular.get(),
            dateFormatter: Modular.get(),
          ),
        ),
        ChildRoute(
          '/detail',
          child: (_, args) => ScheduleDetailPage(
            schedule: args.data,
            storage: Modular.get(),
          ),
        ),
        ChildRoute(
          '/item-detail',
          child: (_, args) => ItemDetailPage(
            schedule: args.data,
          ),
        ),
        ChildRoute(
          '/new-schedule',
          child: (_, args) => NewSchedulePage(
            store: Modular.get(),
            permissions: Modular.get(),
            recognizer: Modular.get(),
          ),
        ),
        ChildRoute(
          '/communication',
          child: (_, args) => SmsPage(
            phone: args.data['phone'],
            plates: args.data['plates'],
            schedule: args.data['schedule'],
            storage: Modular.get(),
          ),
        ),
      ];
}
