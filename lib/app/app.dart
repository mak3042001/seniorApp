import 'package:flutter/material.dart';
import 'package:senior/presentation/resources/routes_manager.dart';
import 'package:senior/presentation/resources/theme_manager.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRouteSetting,
      initialRoute: Routes.splashRoute,
    );
  }
}