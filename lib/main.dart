import 'package:flutter/material.dart';
import 'package:senior/app/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}