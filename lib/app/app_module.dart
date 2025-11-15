import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' hide Key;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portox_app/app/commons/adapters/cryptography/cryptography.dart';
import 'package:portox_app/app/commons/adapters/device/device.dart';
import 'package:portox_app/app/commons/adapters/http_client/dio/dio_adapter.dart';
import 'package:portox_app/app/commons/adapters/http_client/dio/interceptors/dio_interceptor.dart';
import 'package:portox_app/app/commons/adapters/network/connectivity_plus/connectivity_plus_adapter.dart';
import 'package:portox_app/app/commons/adapters/permissions/permissions.dart';
import 'package:portox_app/app/commons/adapters/recognizer/mlkit/mlkit_recognizer.dart';
import 'package:portox_app/app/commons/adapters/services/formatters/date_formatter_service.dart';
import 'package:portox_app/app/commons/adapters/services/token_service.dart';
import 'package:portox_app/app/commons/adapters/storage/firebase/firebase_adapter.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_answer_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_checklist_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_checklist_seal_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_credentials_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_flow_steps_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_occurrence_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_occurrence_type_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_question_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_schedule_driver_phone_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/entities/isar_signature_entity.dart';
import 'package:portox_app/app/commons/adapters/storage/isar/isar_user_adapter.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/config/environment.dart';
import 'package:portox_app/app/commons/master_store.dart';
import 'package:portox_app/app/modules/checklist/checklist_module.dart';
import 'package:portox_app/app/modules/communication/data/services/service_firebase_source.dart';
import 'package:portox_app/app/modules/occurrence/occurrence_module.dart';
import 'package:portox_app/app/modules/schedule/data/external/api/api_master_datasource.dart';
import 'package:portox_app/app/modules/schedule/data/external/firebase/firebase_datasource.dart';
import 'package:portox_app/app/modules/schedule/data/external/storage/local_storage_master_datasource.dart';
import 'package:portox_app/app/modules/schedule/data/infra/repositories/external_master_repository_impl.dart';
import 'package:portox_app/app/modules/schedule/data/infra/repositories/firebase_repository_impl.dart';
import 'package:portox_app/app/modules/schedule/data/infra/repositories/local_answers_repository_impl.dart';
import 'package:portox_app/app/modules/schedule/data/infra/repositories/local_flow_steps_repository_impl.dart';
import 'package:portox_app/app/modules/schedule/data/infra/repositories/local_occurrence_types_repository_impl.dart';
import 'package:portox_app/app/modules/schedule/data/infra/repositories/local_questions_repository_impl.dart';
import 'package:portox_app/app/modules/schedule/data/infra/repositories/local_signatures_repository_impl.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_answers.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_flow_steps.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_occurrence_types.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_questions.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_schedules.dart';
import 'package:portox_app/app/modules/schedule/domain/usecases/load_signatures.dart';
import 'package:portox_app/app/modules/schedule/schedule_module.dart';
import 'package:portox_app/app/modules/signin/data/external/firebase/firebase_auth_datasource.dart';
import 'package:portox_app/app/modules/signin/data/infra/repositories/firebase_auth_repository_impl.dart';
import 'package:portox_app/app/modules/signin/domain/usecases/signout_external.dart';
import 'package:portox_app/app/modules/signin/signin_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AppStore(i())),
    Bind.lazySingleton((i) => MasterStore(i(), i(), i(), i(), i(), i(), i())),
    Bind.factory((i) => Dio(BaseOptions(baseUrl: Environment.apiUrl))),
    Bind.factory(
      (i) => DioAdapter(
        dio: i(),
        interceptors: [i()],
      ),
    ),
    Bind.factory(
      (i) => CustomInterceptors(
        userKey: Environment.apiUserKey,
        appStore: i(),
      ),
    ),
    Bind.factory((i) => FirebaseAuth.instance),
    Bind.factory(
      (i) => FirebaseFirestore.instance
        ..settings =
            const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED),
    ),
    AsyncBind((i) async {
      Directory? dir;
      if (!kIsWeb) {
        dir = await getApplicationSupportDirectory();
      }
      return Isar.open(
        schemas: [
          IsarCredentialsEntitySchema,
          IsarFlowStepsEntitySchema,
          IsarAnswerEntitySchema,
          IsarQuestionEntitySchema,
          IsarOccurrenceTypeEntitySchema,
          IsarOccurrenceEntitySchema,
          IsarSignatureEntitySchema,
          IsarChecklistEntitySchema,
          IsarChecklistSealEntitySchema,
          IsarScheduleDriverPhoneEntitySchema,
        ],
        directory: dir?.path ?? ' ',
      );
    }),
    Bind.factory((i) => IsarCredentialsAdapter(i())),
    Bind.factory((i) => TokenService(i())),
    Bind.factory((i) => DateService()),
    Bind.factory((i) => Connectivity()),
    Bind.factory(
      (i) => NetworkConnectivityAdapter(
        baseURL: Environment.apiUrl,
        connectivity: i(),
      ),
    ),
    Bind.factory((i) => FirebaseAdapter(dateFormatter: i(), firestore: i())),
    Bind.factory((i) => Permissions()),
    Bind.factory((i) => Recognizer(TextRecognizer(), BarcodeScanner())),
    Bind.factory((i) => SignOutExternal(signOutRepository: i())),
    Bind.factory(
      (i) => FirebaseAuthRepository(
        createDataSource: i(),
        signInDataSource: i(),
        signOutDataSource: i(),
      ),
    ),
    Bind.factory((i) => FirebaseAuthDataSource(firebaseAuth: i())),
    Bind.factory((i) => Device()),
    Bind.factory((i) => Cryptography()),
    Bind.factory(
      (i) => LoadAndSaveQuestionsUseCase(
        loadExternalQuestions: i(),
        loadLocalQuestions: i(),
        updateLocalQuestions: i(),
      ),
    ),
    Bind.factory(
      (i) => LoadAndSaveAnswersUseCase(
        loadExternalAnswers: i(),
        loadLocalAnswers: i(),
        updateLocalAnswers: i(),
      ),
    ),
    Bind.factory(
      (i) => LoadAndSaveFlowStepsUseCase(
        loadExternalFlowSteps: i(),
        loadLocalFlowSteps: i(),
        updateLocalFlowSteps: i(),
      ),
    ),
    Bind.factory(
      (i) => LoadAndSaveOccurrenceTypesUseCase(
        loadExternalOccurrenceTypes: i(),
        loadLocalOccurrenceTypes: i(),
        updateLocalOccurrenceTypes: i(),
      ),
    ),
    Bind.factory(
      (i) => LoadAndSaveSignaturesUseCase(
        loadExternalSignatures: i(),
        loadLocalSignatures: i(),
        updateLocalSignatures: i(),
      ),
    ),
    Bind.factory(
      (i) => ExternalMasterRepository(
        answersDataSource: i(),
        flowStepsDataSource: i(),
        questionsDataSource: i(),
        occurrenceTypesDataSource: i(),
        signaturesDataSource: i(),
      ),
    ),
    Bind.factory(
      (i) => LocalFlowStepsRepository(loadFlowSteps: i(), saveFlowSteps: i()),
    ),
    Bind.factory(
      (i) => LocalAnswersRepository(loadAnswers: i(), saveAnswers: i()),
    ),
    Bind.factory(
      (i) => LocalQuestionsRepository(loadQuestions: i(), saveQuestions: i()),
    ),
    Bind.factory(
      (i) => LocalSignaturesRepository(
        loadSignatures: i(),
        saveSignatures: i(),
      ),
    ),
    Bind.factory(
      (i) => LocalOccurrenceTypesRepository(
        loadOccurrenceTypes: i(),
        saveOccurrenceTypes: i(),
      ),
    ),
    Bind.factory((i) => LocalStorageMasterDataSource(storage: i())),
    Bind.factory((i) => ApiMasterDataSource(client: i())),
    Bind.factory((i) => LoadSchedulesUseCase(schedulesRepository: i())),
    Bind.factory((i) => FirebaseRepository(schedulesDataSource: i())),
    Bind.factory((i) => FirebaseDataSource(externalStorage: i())),
    Bind.factory((i) => ServiceFirebaseSource()),
  ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/sign-in', module: SignInModule(), guards: [AppGuard()]),
        ModuleRoute('/schedule', module: ScheduleModule()),
        ModuleRoute('/occurrence', module: OccurrenceModule()),
        ModuleRoute('/checklist', module: ChecklistModule()),
      ];
}

class AppGuard extends RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    await Modular.isModuleReady<AppModule>();
    await Modular.isModuleReady<SignInModule>();
    return true;
  }
}

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/sign-in/');

  @override
  bool canActivate(String path, ParallelRoute route) =>
      Modular.get<AppStore>().isLogged;
}
