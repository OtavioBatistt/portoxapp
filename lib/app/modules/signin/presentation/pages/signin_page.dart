import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:portox_app/app/commons/widgets/card.dart';
import 'package:portox_app/app/commons/widgets/flushbar.dart';
import 'package:portox_app/app/commons/widgets/layout.dart';
import 'package:portox_app/app/modules/signin/presentation/stores/signin_store.dart';
import 'package:portox_app/app/modules/signin/presentation/widgets/doubts_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    required this.store,
    this.hasTokenExpired,
    super.key,
  });
  final SignInStore store;
  final String? hasTokenExpired;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late SignInStore controller;
  bool obscureText = true;
  bool usernameNotEmpty = false;
  bool passwordNotEmpty = false;
  bool paramsAreInvalid = false;
  late ValueNotifier<SignInStatus?> statusListener;

  @override
  void initState() {
    super.initState();
    controller = widget.store;

    usernameController = TextEditingController(text: controller.username);
    passwordController = TextEditingController(text: controller.password);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.hasTokenExpired == 'true') {
        await showErrorFlushbar(
          title: intl(context, 'app.flushbar-expired-title'),
          message: intl(context, 'app.flushbar-expired-message'),
        ).show(context);
      }
    });
    usernameController.addListener(
      () =>
          setState(() => usernameNotEmpty = usernameController.text.isNotEmpty),
    );
    passwordController.addListener(
      () =>
          setState(() => passwordNotEmpty = passwordController.text.isNotEmpty),
    );

    controller.status.addListener(() {
      if (controller.status.value == SignInStatus.networkError) {
        showErrorFlushbar(
          title: intl(context, 'app.flushbar-network-title'),
          message: intl(context, 'app.flushbar-network-message'),
        ).show(context);
      } else if (controller.status.value == SignInStatus.error) {
        showErrorFlushbar(
          title: intl(context, 'app.flushbar-unknown-title'),
          message: intl(context, 'app.flushbar-unknown-message'),
        ).show(context);
      }
      if (controller.status.value == SignInStatus.invalidParams) {
        setState(() => paramsAreInvalid = true);
      } else {
        setState(() => paramsAreInvalid = false);
      }
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void handleSubmit() {
      if (formKey.currentState!.validate()) {
        controller.onSubmit(context);
      }
    }

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: Ox.colors.blue,
        body: OxLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Ox.space.ref40.w),
                child: OxCard(
                  child: ColoredBox(
                    color: Ox.colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Ox.space.ref100.w,
                        vertical: Ox.space.ref90.h,
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              intl(context, 'app.title'),
                              style: TextStyle(
                                fontWeight: Ox.fontWeights.thin,
                                fontSize: Ox.fontSizes.ref60,
                                height: Ox.lineHeights.medium,
                              ),
                            ),
                            SizedBox(height: Ox.space.ref10.h),
                            SizedBox(
                              height: Ox.size.ref150.h,
                              width: Ox.size.ref500.w,
                              child: OxAsset(Ox.assets.logo),
                            ),
                            SizedBox(height: Ox.space.ref30.h),
                            TextFormField(
                              controller: usernameController,
                              onChanged: controller.setUsername,
                              autocorrect: false,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(fontSize: Ox.fontSizes.ref40),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: intl(
                                  context,
                                  'sign-in-page.username-field',
                                ),
                                errorStyle: paramsAreInvalid
                                    ? TextStyle(height: Ox.lineHeights.negative)
                                    : null,
                                errorText: paramsAreInvalid ? ' ' : null,
                              ),
                              validator: (value) =>
                                  _fieldValidator(context, value),
                            ),
                            SizedBox(height: Ox.space.ref40.h),
                            TextFormField(
                              controller: passwordController,
                              onChanged: controller.setPassword,
                              obscureText: obscureText,
                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(fontSize: Ox.fontSizes.ref40),
                              decoration: InputDecoration(
                                labelText: intl(
                                  context,
                                  'sign-in-page.password-field',
                                ),
                                border: const OutlineInputBorder(),
                                suffixIcon: Visibility(
                                  visible: obscureText,
                                  replacement: IconButton(
                                    icon: const Icon(Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                    icon: const Icon(Icons.visibility_off),
                                  ),
                                ),
                                errorStyle: paramsAreInvalid
                                    ? TextStyle(height: Ox.lineHeights.negative)
                                    : null,
                                errorText: paramsAreInvalid ? ' ' : null,
                              ),
                              onEditingComplete:
                                  usernameNotEmpty && passwordNotEmpty
                                      ? handleSubmit
                                      : null,
                              validator: (value) =>
                                  _fieldValidator(context, value),
                            ),
                            if (paramsAreInvalid)
                              Padding(
                                padding: EdgeInsets.only(
                                  left: Ox.space.ref30.w,
                                  right: Ox.space.ref30.w,
                                  top: Ox.space.ref10.h,
                                ),
                                child: Text(
                                  intl(context, 'sign-in-page.invalid-params'),
                                  style: TextStyle(
                                    color: Ox.colors.error,
                                    fontSize: Ox.fontSizes.ref30,
                                    height: Ox.lineHeights.medium,
                                  ),
                                ),
                              ),
                            SizedBox(height: Ox.space.ref60.h),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                  fontWeight: Ox.fontWeights.medium,
                                  fontSize: Ox.fontSizes.ref35,
                                  height: Ox.lineHeights.medium,
                                  letterSpacing: Ox.letterSpace.medium,
                                ),
                                fixedSize:
                                    Size(double.maxFinite, Ox.size.ref110.h),
                              ),
                              onPressed: usernameNotEmpty &&
                                      passwordNotEmpty &&
                                      controller.status.value !=
                                          SignInStatus.loading
                                  ? handleSubmit
                                  : null,
                              child: () {
                                if (controller.status.value ==
                                    SignInStatus.loading) {
                                  return SizedBox(
                                    height: Ox.space.ref50.h,
                                    width: Ox.space.ref50.h,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  );
                                }
                                return Text(
                                  intl(context, 'sign-in-page.submit-button')
                                      .toUpperCase(),
                                );
                              }(),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: Ox.fontWeights.regular,
                                  fontSize: Ox.fontSizes.ref35,
                                  height: Ox.lineHeights.medium,
                                ),
                                backgroundColor: Ox.colors.white,
                                foregroundColor: Ox.colors.blueLight,
                                fixedSize:
                                    const Size.fromWidth(double.maxFinite),
                              ),
                              onPressed: () => showDoubtsPage(context),
                              child: Text(
                                intl(context, 'sign-in-page.doubts-button'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? _fieldValidator(BuildContext context, String? value) {
  if (value == null || value.isEmpty) {
    return intl(context, 'sign-in-page.required-field');
  }
  return null;
}
