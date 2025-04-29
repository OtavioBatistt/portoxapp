import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';

class _RouteItem {
  _RouteItem(this.path, this.label, this.icon);
  final String path;
  final String label;
  final IconData icon;
}

class OxBottomNavigation extends StatefulWidget {
  const OxBottomNavigation({super.key});

  @override
  State<OxBottomNavigation> createState() => _OxBottomNavigationState();
}

class _OxBottomNavigationState extends State<OxBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final routes = [
      _RouteItem(
        '/tasks/',
        intl(context, 'tasks-page.title'),
        Icons.person,
      ),
      _RouteItem(
        '/checklist/',
        intl(context, 'checklist-page.title'),
        Icons.person,
      ),
    ];

    final index = routes.indexWhere(
      (route) =>
          ModalRoute.of(context)?.settings.name?.contains(route.path) ?? false,
    );

    return BottomNavigationBar(
      currentIndex: index,
      onTap: (value) => Modular.to.navigate(routes[value].path),
      items: routes
          .map(
            (route) => BottomNavigationBarItem(
              icon: Icon(route.icon),
              label: route.label,
            ),
          )
          .toList(),
    );
  }
}
