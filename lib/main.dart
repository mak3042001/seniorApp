import 'package:flutter/material.dart';
import 'package:senior/app/app.dart';
import 'package:senior/app/di.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initAppModule();
  runApp(const MyApp());
}


