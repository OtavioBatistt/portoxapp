import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/app_store.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/app_bar.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/schedule/presentation/widgets/data_text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    required this.store,
    super.key,
  });

  final AppStore store;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _loadPackageInfo();
  }

  Future<void> _loadPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Scaffold(
          backgroundColor: Ox.colors.white,
          appBar: OxAppBar(appStore: Modular.get()),
          body: OxLayout(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Ox.space.ref40.w,
                vertical: Ox.space.ref50.h,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        intl(context, 'schedule.profile-title'),
                        style: TextStyle(
                          fontSize: Ox.fontSizes.ref50,
                          fontWeight: Ox.fontWeights.medium,
                          color: Ox.colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Ox.space.ref20.h),
                  Divider(
                    color: Ox.colors.grayLight,
                    height: 1,
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  OxDataTextField(
                    title: intl(
                      context,
                      'schedule.profile-name-label',
                    ),
                    value: widget.store.name,
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  OxDataTextField(
                    title: intl(
                      context,
                      'schedule.profile-email-label',
                    ),
                    value: widget.store.email,
                  ),
                  SizedBox(height: Ox.space.ref40.h),
                  OxDataTextField(
                    title: intl(
                      context,
                      'schedule.profile-type-label',
                    ),
                    value: widget.store.profileName,
                  ),
                  SizedBox(height: Ox.space.ref200.h),
                  Text(
                    '${intl(context, 'schedule.profile-version-label')}: ${_packageInfo.version}',
                    style: TextStyle(
                      color: Ox.colors.blue,
                      fontSize: Ox.fontSizes.ref50,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () => Modular.to.pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Ox.colors.blue,
                        ),
                        child: Text(
                          intl(
                            context,
                            'app.close',
                          ).toUpperCase(),
                          style: TextStyle(
                            color: Ox.colors.white,
                            fontWeight: Ox.fontWeights.medium,
                            fontSize: Ox.fontSizes.ref40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
