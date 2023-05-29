import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/colors.dart';
import 'package:senior/app/di.dart';
import 'package:senior/app/static.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import 'package:senior/presentation/home/HomeApp.dart';
import 'package:senior/presentation/login/login_view/loginScreen.dart';
import 'package:senior/presentation/resources/assets_manager.dart';
import 'package:senior/presentation/resources/color_manager.dart';
import 'package:senior/presentation/resources/routes_manager.dart';
import 'package:senior/presentation/resources/string_manager.dart';
import 'package:senior/presentation/resources/values_manager.dart';
import 'package:senior/presentation/sign%20up/signup_view_model/signup_view_model.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();

  final AppPreference _appPreferences = instance<AppPreference>();

  DateTime selectedDate = DateTime.now();

  final TextEditingController _userNameEditingController =
  TextEditingController();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _birthdateEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
  TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
  TextEditingController();
  final TextEditingController _phoneEditingController =
  TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isPassword = true;

  _bind() {
    _viewModel.start();
    _userNameEditingController.addListener(() {
      _viewModel.setUserName(_userNameEditingController.text);
    });
    _nameEditingController.addListener(() {
      _viewModel.setName(_nameEditingController.text);
    });

    _birthdateEditingController.addListener(() {
      _viewModel.setBirthdate(_birthdateEditingController.text);
    });

    _confirmPasswordEditingController.addListener(() {
      _viewModel.setConfirmPassword(_confirmPasswordEditingController.text);
    });

    _passwordEditingController.addListener(() {
      _viewModel.setPassword(_passwordEditingController.text);
    });

    _phoneEditingController.addListener(() {
      _viewModel.setPhone(_phoneEditingController.text);
    });

    _viewModel.isUserRegisteredInSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        // navigate to main screen
        SchedulerBinding.instance?.addPostFrameCallback((_) {
          _appPreferences.setUserLoggedIn();
          Navigator.of(context).pushReplacementNamed(Routes.home);
        });
      }
    });
  }

  @override
  void initState() {
    _bind();
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
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s14,
              ),
              const Center(
                  child: Image(
                    image: AssetImage(ImageAssets.splashLogo),
                    height: AppSize.s200,
                    width: AppSize.s200,
                  )),
              const SizedBox(
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                    stream: _viewModel.outputErrorUserName,
                    builder: (context, snapshot) {
                      return defaultFormField(
                        errorText:snapshot.data,
                        controller: _userNameEditingController,
                        type: TextInputType.name,
                        text: StringManager.username,
                        prefix: IconBroken.User,
                        isPassword: false,
                      );
                    }),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                    stream: _viewModel.outputErrorName,
                    builder: (context, snapshot) {
                      return defaultFormField(
                        errorText: snapshot.data,
                        controller: _nameEditingController,
                        type: TextInputType.name,
                        text: StringManager.nameHint,
                        prefix: IconBroken.User,
                        isPassword: false,
                      );
                    }),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                    stream: _viewModel.outputErrorPassword,
                    builder: (context, snapshot) {
                      return defaultFormField(
                        errorText: snapshot.data,
                        controller: _passwordEditingController,
                        type: TextInputType.name,
                        prefix: IconBroken.Lock,
                        text: StringManager.password,
                        isPassword: isPassword,
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
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                    stream: _viewModel.outputErrorConfirmPassword,
                    builder: (context, snapshot) {
                      return defaultFormField(
                        errorText: snapshot.data,
                        controller: _confirmPasswordEditingController,
                        type: TextInputType.name,
                        prefix: IconBroken.Lock,
                        text: StringManager.confirmPasswordHint,
                        isPassword: isPassword,
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
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                    stream: _viewModel.outputErrorPhone,
                    builder: (context, snapshot) {
                      return defaultFormField(
                        errorText: snapshot.data,
                        controller: _phoneEditingController,
                        type: TextInputType.phone,
                        text: StringManager.phoneHint,
                        prefix: IconBroken.Call,
                        isPassword: false,
                      );
                    }),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<String?>(
                    stream: _viewModel.outputErrorBirthdate,
                    builder: (context, snapshot) {
                      return defaultDisableFormField(
                        enableInteractiveSelection: false,
                        hasFocusBool: false,
                        errorText: snapshot.data,
                        controller: _birthdateEditingController,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(1900),
                            lastDate: selectedDate,
                          ).then((value) {
                            _birthdateEditingController.text =
                                DateFormat('yyyy-MM-dd').format(value!);
                          });
                        },
                        type: TextInputType.none,
                        text: _birthdateEditingController.text != null
                            ? 'Birthdate'
                            : _birthdateEditingController.text,
                        prefix: IconBroken.Calendar,
                      );
                    }),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                    stream: _viewModel.outputAreAllInputsValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                            onPressed: (snapshot.data ?? false)
                                ? () {
                              _viewModel.register();
                            }
                                : null,
                            child: const Text(StringManager.signUp)),
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
