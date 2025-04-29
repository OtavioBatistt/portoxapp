import 'package:flutter_modular/flutter_modular.dart';

import 'package:portox_app/app/modules/communication/presentation/pages/sms_page.dart';

class CommunicationModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => SmsPage(
            phone: args.data['phone'],
            plates: args.data['plates'],
            schedule: args.data['schedule'],
            storage: Modular.get(),
          ),
        ),
      ];
}
