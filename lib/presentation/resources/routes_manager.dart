import 'package:flutter/material.dart';
import 'package:senior/app/di.dart';
import 'package:senior/presentation/booking/booking.dart';
import 'package:senior/presentation/contact/contactScreen.dart';
import 'package:senior/presentation/history/History.dart';
import 'package:senior/presentation/home/HomeApp.dart';
import 'package:senior/presentation/login/login_view/loginScreen.dart';
import 'package:senior/presentation/medications/medications.dart';
import 'package:senior/presentation/notification/notificationScreen.dart';
import 'package:senior/presentation/profile/profileScreen.dart';
import 'package:senior/presentation/resources/string_manager.dart';
import 'package:senior/presentation/schedules/Schedules.dart';
import 'package:senior/presentation/sign%20up/signup_view/signUpScreen.dart';
import 'package:senior/presentation/splash/splash_view.dart';


class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";
  static const String home = "/home";
  static const String booking = "/booking";
  static const String contact = "/contact";
  static const String history = "/history";
  static const String medication = "/medication";
  static const String notification = "/notification";
  static const String profile = "/profile";
  static const String schedules = "/schedules";
}

class RouteGenerator {
  static Route<dynamic> getRouteSetting(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeApp());
      case Routes.booking:
        return MaterialPageRoute(builder: (_) => const Booking());
      case Routes.contact:
        return MaterialPageRoute(builder: (_) => const ContactsScreen());
      case Routes.history:
        return MaterialPageRoute(builder: (_) => const History());
      case Routes.medication:
        return MaterialPageRoute(builder: (_) =>  Medications());
      case Routes.notification:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case Routes.schedules:
        return MaterialPageRoute(builder: (_) => const Schedules());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(StringManager.noRouteFound),
              ),
              body: const Center(child: Text(StringManager.noRouteFound)),
            ));
  }
}
