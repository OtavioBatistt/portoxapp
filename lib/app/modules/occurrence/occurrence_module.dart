import 'package:flutter_modular/flutter_modular.dart';
import 'package:portox_app/app/modules/occurrence/data/external/firebase/firebase_datasource.dart';
import 'package:portox_app/app/modules/occurrence/data/external/storage/local_storage_master_datasource.dart';
import 'package:portox_app/app/modules/occurrence/data/infra/repositories/extenal_occurrence_repository_impl.dart';
import 'package:portox_app/app/modules/occurrence/data/infra/repositories/local_occurrences_repository_impl.dart';

import 'package:portox_app/app/modules/occurrence/domain/entities/new_occurrence_params_entity.dart';
import 'package:portox_app/app/modules/occurrence/domain/entities/occurrence_detail_params_entity.dart';
import 'package:portox_app/app/modules/occurrence/domain/usecases/create_occurrence.dart';
import 'package:portox_app/app/modules/occurrence/domain/usecases/filter_current_steps.dart';
import 'package:portox_app/app/modules/occurrence/domain/usecases/load_occurrence.dart';
import 'package:portox_app/app/modules/occurrence/domain/usecases/save_occurrence.dart';
import 'package:portox_app/app/modules/occurrence/presentation/pages/new_occurrence.dart';
import 'package:portox_app/app/modules/occurrence/presentation/pages/occurrence.dart';
import 'package:portox_app/app/modules/occurrence/presentation/pages/occurrence_detail.dart';
import 'package:portox_app/app/modules/occurrence/presentation/stores/occurrence_store.dart';

class OccurrenceModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => OccurrenceStore(i(), i(), i(), i(), i(), i()),
        ),
        Bind.factory((i) => CreateOccurrenceUseCase(occurrenceRepository: i())),
        Bind.factory((i) => SaveOccurrenceUseCase(occurrenceRepository: i())),
        Bind.factory((i) => LoadOccurrencesUseCase(loadLocalOccurrences: i())),
        Bind.factory((i) => FilterCurrentOccurrenceTypesUseCase()),
        Bind.factory(
          (i) => ExternalOccurrenceRepository(occurrenceDataSource: i()),
        ),
        Bind.factory(
          (i) => LocalOccurrencesRepository(
            loadOccurrences: i(),
            saveOccurrences: i(),
          ),
        ),
        Bind.factory((i) => LocalStorageOccurrenceDataSource(storage: i())),
        Bind.factory((i) => FirebaseOccurrenceDataSource(externalStorage: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => OccurrencePage(store: Modular.get()),
        ),
        ChildRoute(
          '/new',
          child: (_, args) {
            final params = args.data as NewOccurrenceParamsEntity;
            return NewOccurrencePage(
              store: Modular.get(),
              schedule: params.schedule,
              selectedItem: params.selectedItem,
            );
          },
        ),
        ChildRoute(
          '/detail',
          child: (_, args) {
            final params = args.data as OccurrenceDetailParamsEntity;
            return OccurrenceDetailPage(
              store: Modular.get(),
              occurrence: params.occurrence,
              schedule: params.schedule,
            );
          },
        ),
      ];
}
