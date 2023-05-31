import 'package:flutter/material.dart';
import 'package:senior/presentation/resources/theme_manager.dart';

import '../presentation/resources/routes_manager.dart';

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal();

  final int appState = 0;

  static const MyApp _instance =
  MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRouteSetting,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}