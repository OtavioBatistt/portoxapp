import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/master_store.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    required this.masterStore,
    super.key,
  });

  final MasterStore masterStore;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _fadeController;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    handleLoad();
    final controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: Ox.duration.ref150),
    );
    _slideController = controller;
    _fadeController = controller;

    _fadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: const Interval(0.8, 1, curve: Curves.fastOutSlowIn),
      ),
    );

    _slide = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _slideController
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _fadeController.forward();
        }
      })
      ..forward();
  }

  void handleLoad() {
    Future.wait([
      widget.masterStore.loadMasterData(),
      Future.delayed(Duration(milliseconds: Ox.duration.ref500)),
    ]).then((value) {
      Modular.to.navigate('/sign-in/');
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(446, 792));

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: Ox.colors.blue,
        body: OxLayout(
          disabledNetworkValidation: true,
          child: Center(
            child: SizedBox(
              height: Ox.space.ref500,
              width: Ox.space.ref500,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  FadeTransition(
                    opacity: _fadeIn,
                    child: OxAsset(
                      Ox.assets.splashRect,
                      color: Ox.colors.white,
                      size: Ox.size.ref800,
                    ),
                  ),
                  SlideTransition(
                    position: _slide,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Ox.space.ref70.w),
                      child: OxAsset(
                        Ox.assets.splashLogo,
                        color: Ox.colors.white,
                        size: Ox.size.ref150,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.masterStore.progress != 100,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: Ox.space.ref500.h),
                          CircularProgressIndicator(
                            color: Ox.colors.white,
                            strokeWidth: 2,
                          ),
                          SizedBox(height: Ox.space.ref60.h),
                          Text(
                            intl(context, 'splash.loading-resources'),
                            style: TextStyle(
                              color: Ox.colors.white,
                              fontSize: Ox.fontSizes.ref50,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
