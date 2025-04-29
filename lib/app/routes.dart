class Routes {
  static const root = '/';
  static const onboarding = _OnboardingRoutes._();
  static const schedule = _ScheduleRoutes._();
  static const checklist = _ChecklistRoutes._();
}

class _OnboardingRoutes {
  const _OnboardingRoutes._();
  static const module = '/onboarding';
  final root = module;
  final signIn = '$module/';
}

class _ScheduleRoutes {
  const _ScheduleRoutes._();
  static const module = '/schedules';
  final root = module;
  final scheduleList = '$module/';
  final scheduleDetail = '$module/details';
}

class _ChecklistRoutes {
  const _ChecklistRoutes._();
  static const module = '/checklists';
  final root = module;
  final checklistVehiclePresentationStep = '$module/vehicle-presentation-step';
}
