import 'package:finance_firebase/firebase_options.dart';
import 'package:finance_firebase/src/app_material.dart';
import 'package:finance_firebase/src/dependences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  registerDependencies();
  runApp(const AppMaterial());
}
