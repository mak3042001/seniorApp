import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/di.dart';
import 'package:senior/app/static.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import 'package:senior/presentation/login/login_view_model/login_viewModel.dart';
import 'package:senior/presentation/resources/assets_manager.dart';
import 'package:senior/presentation/resources/color_manager.dart';
import 'package:senior/presentation/resources/routes_manager.dart';
import 'package:senior/presentation/resources/string_manager.dart';
import 'package:senior/presentation/resources/values_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();

  final AppPreference _appPreference = instance<AppPreference>();

  bool isPassword = true;

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _blind() {
    _viewModel.start();
    userNameController
        .addListener(() => _viewModel.setUserName(userNameController.text));
    passwordController
        .addListener(() => _viewModel.setPassword(passwordController.text));

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          _appPreference.setUserLoggedIn();
          Navigator.of(context).pushReplacementNamed(Routes.home);
        });
      }
    });
  }

  @override
  void initState() {
    _blind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data
                  ?.getScreenWidget(context, _getContentWidget(), () {}) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
        padding: const EdgeInsets.only(top: AppPadding.p40),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150.0,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ))),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signUpRoute);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s60,
                ),
                const Center(
                    child: Image(
                  image: AssetImage(ImageAssets.splashLogo),
                  height: AppSize.s200,
                  width: AppSize.s200,
                )),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outIsUserNameValid,
                      builder: (context, snapshot) {
                        return defaultFormField(
                            controller: userNameController,
                            isPassword: false,
                            type: TextInputType.name,
                            text: StringManager.username,
                            prefix: IconBroken.User,
                            errorText: (snapshot.data ?? true)
                                ? null
                                : StringManager.usernameError);
                      }),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outIsPasswordValid,
                      builder: (context, snapshot) {
                        return defaultFormField(
                          errorText: (snapshot.data ?? true)
                              ? null
                              : StringManager.passwordError,
                          controller: passwordController,
                          isPassword: isPassword ? true : false,
                          type: TextInputType.name,
                          text: StringManager.password,
                          prefix: IconBroken.Lock,
                          suffix: isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                        );
                      }),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outAreAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height: AppSize.s40,
                          child: ElevatedButton(
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                      _viewModel.login();
                                    }
                                  : null,
                              child: const Text(StringManager.login)),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }
}
