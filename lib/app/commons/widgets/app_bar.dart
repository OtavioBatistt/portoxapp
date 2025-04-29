import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/confirmation.dart';

class OxAppBar extends StatelessWidget implements PreferredSize {
  const OxAppBar({
    required this.appStore,
    super.key,
    this.beforeRedirect,
  });
  final AppStore appStore;
  final Function(Function())? beforeRedirect;

  void handleRedirect(Function() callback) {
    if (beforeRedirect != null) {
      beforeRedirect!(callback);
    } else {
      callback();
    }
  }

  bool shouldRedirect(BuildContext context, String nextRoute) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute == nextRoute) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) => AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: Ox.size.ref200.h,
        title: GestureDetector(
          onTap: () => handleRedirect(() async {
            if (shouldRedirect(context, '/schedule/')) {
              await Modular.to.pushNamed('/schedule/');
            }
          }),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                intl(context, 'app.title'),
                style: TextStyle(
                  fontSize: Ox.fontSizes.ref35,
                  fontWeight: Ox.fontWeights.light,
                ),
              ),
              SizedBox(
                height: Ox.space.ref10.h,
              ),
              OxAsset(
                Ox.assets.logo,
                color: Ox.colors.white,
                size: Ox.size.ref60.h,
              ),
            ],
          ),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) => handleRedirect(() async {
              if (value == '/sign-in/') {
                showDialog(
                  context: context,
                  builder: (context) => OxConfirmation(
                    onCancel: () => Modular.to.pop(),
                    onSubmit: () async => await appStore.signOut(),
                    message: Text(
                      intl(
                        context,
                        'menu.logout-confirmation',
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Ox.colors.blue,
                        fontSize: Ox.fontSizes.ref60,
                      ),
                    ),
                  ),
                );
              } else if (value.isNotEmpty) {
                if (shouldRedirect(context, value)) {
                  await Modular.to.pushNamed(value);
                }
              }
            }),
            icon: Icon(
              Icons.menu,
              size: Ox.size.ref80.w,
            ),
            position: PopupMenuPosition.under,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: '/schedule/profile',
                child: ListTile(
                  trailing: Text(
                    intl(context, 'menu.profile'),
                    style: TextStyle(fontSize: Ox.fontSizes.ref50),
                  ),
                ),
              ),
              PopupMenuItem(
                value: '/schedule/',
                child: ListTile(
                  trailing: Text(
                    intl(context, 'menu.home'),
                    style: TextStyle(fontSize: Ox.fontSizes.ref50),
                  ),
                ),
              ),
              PopupMenuItem(
                value: '/schedule/list',
                child: ListTile(
                  trailing: Text(
                    intl(context, 'menu.schedule-list'),
                    style: TextStyle(fontSize: Ox.fontSizes.ref50),
                  ),
                ),
              ),
              PopupMenuItem(
                value: '/schedule/new-schedule',
                child: ListTile(
                  trailing: Text(
                    intl(context, 'menu.start-flow'),
                    style: TextStyle(fontSize: Ox.fontSizes.ref50),
                  ),
                ),
              ),
              PopupMenuItem(
                value: '/occurrence/',
                child: ListTile(
                  trailing: Text(
                    intl(context, 'menu.occurrence'),
                    style: TextStyle(fontSize: Ox.fontSizes.ref50),
                  ),
                ),
              ),
              const PopupMenuItem(
                value: '',
                enabled: false,
                child: Text(''),
              ),
              const PopupMenuItem(
                value: '',
                enabled: false,
                child: Text(''),
              ),
              PopupMenuItem(
                value: '/sign-in/',
                child: ListTile(
                  trailing: Text(
                    intl(context, 'menu.logout'),
                    style: TextStyle(fontSize: Ox.fontSizes.ref50),
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
