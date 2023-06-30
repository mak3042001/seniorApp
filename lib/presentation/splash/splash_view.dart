import 'dart:async';
import 'package:flutter/material.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/di.dart';
import 'package:senior/presentation/resources/assets_manager.dart';
import 'package:senior/presentation/resources/color_manager.dart';
import 'package:senior/presentation/resources/constants_manager.dart';
import 'package:senior/presentation/resources/routes_manager.dart';
import 'package:senior/presentation/resources/values_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreference _appPreference = instance<AppPreference>();


  _startDelay() {
    _timer = Timer(
      const Duration(seconds: AppConstant.splashTimer),
      _goNext,
    );
  }

  _goNext() async {
    _appPreference.isUserLoggedIn().then((isUserLoggedIn) => {
    if (isUserLoggedIn)
    {
    Navigator.pushReplacementNamed(context, Routes.home)
    }
    else
    {
        Navigator.pushReplacementNamed(context, Routes.loginRoute)
  }});
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Image(
                image: AssetImage(
                  ImageAssets.splashLogo,
                ),
                width: AppSize.s200,
                height: AppSize.s200,
              )),
          const SizedBox(
            height: AppSize.s20,
          ),
          Text(
            "Senior App",
            style: Theme
                .of(context)
                .textTheme
                .headlineLarge,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
