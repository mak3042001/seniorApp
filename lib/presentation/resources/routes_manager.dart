import 'package:flutter/material.dart';
import 'package:senior/app/di.dart';
import 'package:senior/presentation/ai_screen/ai_screen.dart';
import 'package:senior/presentation/appointment/appointment_view/appointmentScreen.dart';
import 'package:senior/presentation/booking/booking_view/booking.dart';
import 'package:senior/presentation/contact/contactScreen.dart';
import 'package:senior/presentation/history/history_view/History.dart';
import 'package:senior/presentation/history_category/history_category_view/history_category_screen.dart';
import 'package:senior/presentation/home/HomeApp.dart';
import 'package:senior/presentation/login/login_view/loginScreen.dart';
import 'package:senior/presentation/medications/medications.dart';
import 'package:senior/presentation/medications_code/medication_code_view/medication_code_view.dart';
import 'package:senior/presentation/notification/notification_view/notificationScreen.dart';
import 'package:senior/presentation/profile/profile_view/profileScreen.dart';
import 'package:senior/presentation/resources/string_manager.dart';
import 'package:senior/presentation/schedules/schedules_view/Schedules.dart';
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
  static const String medicationCode = "/medicationCode";
  static const String notification = "/notification";
  static const String profile = "/profile";
  static const String schedules = "/schedules";
  static const String aiScreen = "/ai";
  static const String historyCategoriesScreen = "/historyCategories";
  static const String appointmentScreen = "/appointment";
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
        initBookingModule();
        return MaterialPageRoute(builder: (_) => const Booking());
      case Routes.contact:
        return MaterialPageRoute(builder: (_) => const ContactsScreen());
      case Routes.history:
        return MaterialPageRoute(builder: (_) => const History());
      case Routes.medication:
        return MaterialPageRoute(builder: (_) =>  Medications());
        case Routes.medicationCode:
        return MaterialPageRoute(builder: (_) =>  const MedicationCodeView());
      case Routes.notification:
        initNotificationModule();
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
        case Routes.historyCategoriesScreen:
          initHistoryCategoriesModule();
        return MaterialPageRoute(builder: (_) => const HistoryCategoriesScreen());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case Routes.schedules:
        initSchedulesIndexModule();
        return MaterialPageRoute(builder: (_) => const SchedulesScreen());
        case Routes.appointmentScreen:
          initAppointmentModule();
        return MaterialPageRoute(builder: (_) => const AppointmentScreen());
      case Routes.aiScreen:
        return MaterialPageRoute(builder: (_) => const AiScreen(title: 'AiScreen',));
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
