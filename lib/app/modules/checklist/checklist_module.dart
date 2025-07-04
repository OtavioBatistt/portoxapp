import 'package:flutter_modular/flutter_modular.dart';
import 'package:portox_app/app/modules/checklist/data/external/api/api_seals_datasource.dart';
import 'package:portox_app/app/modules/checklist/data/external/api/api_weighing_datasource.dart';
import 'package:portox_app/app/modules/checklist/data/external/firebase/checklist_firebase_datasource.dart';
import 'package:portox_app/app/modules/checklist/data/external/storage/storage_checklist_datasource.dart';
import 'package:portox_app/app/modules/checklist/data/infra/repositories/api_seals_repository_impl.dart';
import 'package:portox_app/app/modules/checklist/data/infra/repositories/api_weighing_repository_impl.dart';
import 'package:portox_app/app/modules/checklist/data/infra/repositories/checklist_firebase_repository_impl.dart';
import 'package:portox_app/app/modules/checklist/data/infra/repositories/load_checklist_repository_impl.dart';
import 'package:portox_app/app/modules/checklist/data/infra/repositories/load_seal_repository_impl.dart';
import 'package:portox_app/app/modules/checklist/data/infra/repositories/remove_checklist_repository_impl.dart';
import 'package:portox_app/app/modules/checklist/data/infra/repositories/save_checklist_repository_impl.dart';
import 'package:portox_app/app/modules/checklist/data/infra/repositories/save_seal_repository_impl.dart';
import 'package:portox_app/app/modules/checklist/data/infra/repositories/save_ticket_repository_impl.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/step_with_question_params_entity.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/step_with_seals_params_entity.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/step_with_weighing_params_entity.dart';
import 'package:portox_app/app/modules/checklist/domain/entities/step_without_question_params_entity.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/create_checklist.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/filter_current_answers.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/filter_current_questions.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/filter_current_signatures.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/filter_current_steps.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/load_checklist_by_schedule_number.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/load_seal.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/load_weighing.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/remove_checklist.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/save_checklist.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/save_seal.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/save_ticket.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/validate_seal.dart';
import 'package:portox_app/app/modules/checklist/domain/usecases/validate_supervisor_password.dart';
import 'package:portox_app/app/modules/checklist/presentation/pages/checklist.dart';
import 'package:portox_app/app/modules/checklist/presentation/pages/step_with_questions.dart';
import 'package:portox_app/app/modules/checklist/presentation/pages/step_with_seal_letter.dart';
import 'package:portox_app/app/modules/checklist/presentation/pages/step_with_seals.dart';
import 'package:portox_app/app/modules/checklist/presentation/pages/step_with_seals_history.dart';
import 'package:portox_app/app/modules/checklist/presentation/pages/step_with_weighing.dart';
import 'package:portox_app/app/modules/checklist/presentation/pages/step_without_questions.dart';
import 'package:portox_app/app/modules/checklist/presentation/stores/checklist_store.dart';
import 'package:portox_app/app/modules/checklist/presentation/stores/step_store.dart';

class ChecklistModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => ChecklistStore(i(), i(), i(), i(), i(), i(), i()),
        ),
        Bind.lazySingleton(
          (i) => StepStore(i(), i(), i(), i(), i(), i(), i(), i(), i(), i()),
        ),
        Bind.factory((i) => FilterCurrentStepsUseCase()),
        Bind.factory((i) => FilterCurrentQuestionsUseCase()),
        Bind.factory((i) => FilterCurrentSignaturesUseCase()),
        Bind.factory((i) => FilterCurrentAnswersUseCase()),
        Bind.factory(
          (i) => LoadChecklistByScheduleNumberUseCase(checklistRepository: i()),
        ),
        Bind.factory((i) => SaveChecklistUseCase(checklistRepository: i())),
        Bind.factory((i) => RemoveChecklistUseCase(checklistRepository: i())),
        Bind.factory((i) => CreateChecklistUseCase(checklistRepository: i())),
        Bind.factory((i) => SaveTicketUseCase(ticketRepository: i())),
        Bind.factory((i) => LoadWeighingUseCase(weighingRepository: i())),
        Bind.factory(
          (i) => ValidateSupervisorPasswordUseCase(cryptoRepository: i()),
        ),
        Bind.factory((i) => ValidateSealUseCase(sealRepository: i())),
        Bind.factory(
          (i) => ChecklistFirebaseRepository(checklistDataSource: i()),
        ),
        Bind.factory(
          (i) => LoadChecklistByScheduleNumberRepository(loadChecklist: i()),
        ),
        Bind.factory((i) => SaveChecklistRepository(saveChecklist: i())),
        Bind.factory((i) => SaveTicketRepository(dataSource: i())),
        Bind.factory((i) => RemoveChecklistRepository(removeChecklist: i())),
        Bind.factory((i) => ApiWeighingRepository(weighingDataSource: i())),
        Bind.factory((i) => ApiSealsRepository(sealsDataSource: i())),
        Bind.factory((i) => ChecklistFirebaseDataSource(externalStorage: i())),
        Bind.factory((i) => StorageChecklistDataSource(storage: i())),
        Bind.factory((i) => ApiWeighingDataSource(client: i())),
        Bind.factory((i) => ApiSealsDataSource(client: i())),
        Bind.factory((i) => SaveSealUseCase(sealRepository: i())),
        Bind.factory((i) => SaveSealRepository(saveChecklistSeal: i())),
        Bind.factory((i) => LoadSealUseCase(loadSealRepository: i())),
        Bind.factory((i) => LoadSealRepository(loadChecklistSeal: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => ChecklistPage(
            fromScanner: args.queryParams['fromScanner'] == 'true',
            showNegativeMessage:
                args.queryParams['showNegativeMessage'] == 'true',
            showPositiveMessage:
                args.queryParams['showPositiveMessage'] == 'true',
            schedule: args.data,
            appStore: Modular.get(),
            store: Modular.get(),
            storage: Modular.get(),
          ),
        ),
        ChildRoute(
          '/step-with-questions',
          child: (_, args) {
            final params = args.data as StepWithQuestionParamsEntity;
            return StepWithQuestionsPage(
              icon: params.icon,
              schedule: params.schedule,
              flowStep: params.flowStep,
              questions: params.questions,
              answers: params.answers,
              signatures: params.signatures,
              step: params.step,
              executedCompartments: params.executedCompartments,
              stepStore: Modular.get(),
              store: Modular.get(),
            );
          },
        ),
        ChildRoute(
          '/step-with-weighing',
          child: (_, args) {
            final params = args.data as StepWithWeighingParamsEntity;
            return StepWithWeighingPage(
              icon: params.icon,
              schedule: params.schedule,
              flowStep: params.flowStep,
              step: params.step,
              confirmationLabel: params.confirmationLabel,
              fields: params.fields,
              executedCompartments: params.executedCompartments,
              stepStore: Modular.get(),
            );
          },
        ),
        ChildRoute(
          '/step-without-questions',
          child: (_, args) {
            final params = args.data as StepWithoutQuestionParamsEntity;
            return StepWithoutQuestionsPage(
              icon: params.icon,
              schedule: params.schedule,
              flowStep: params.flowStep,
              step: params.step,
              fields: params.fields,
              confirmationLabel: params.confirmationLabel,
              hasTag: params.hasTag,
              executedCompartments: params.executedCompartments,
              store: Modular.get(),
            );
          },
          maintainState: false,
        ),
        ChildRoute(
          '/step-with-seals',
          child: (_, args) {
            final params = args.data as StepWithSealsParamsEntity;
            return StepWithSealsPage(
              icon: params.icon,
              schedule: params.schedule,
              flowStep: params.flowStep,
              step: params.step,
              confirmationLabel: params.confirmationLabel,
              fields: params.fields,
              executedCompartments: params.executedCompartments,
              store: Modular.get(),
            );
          },
        ),
        ChildRoute(
          '/step-with-seal-letter',
          child: (_, args) {
            final params = args.data as StepWithSealsParamsEntity;
            return StepWithSealLetterPage(
              icon: params.icon,
              schedule: params.schedule,
              flowStep: params.flowStep,
              step: params.step,
              confirmationLabel: params.confirmationLabel,
              fields: params.fields,
              executedCompartments: params.executedCompartments,
              store: Modular.get(),
              );
          },
        ),
        ChildRoute(
          '/step-with-seals-history',
          child: (_, args) {
            return StepWithSealsHistoryPage(
              seals: args.data['seals'],
              scheduleNumber: args.data['scheduleNumber'],
              icon: args.data['icon'],
            );
          },
        ),
      ];
}
