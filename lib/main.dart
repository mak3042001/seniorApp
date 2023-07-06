import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:senior/app/di.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initAppModule();
  runApp(MyApp());
}