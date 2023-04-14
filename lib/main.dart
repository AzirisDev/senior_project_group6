import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/app.dart';
import 'package:senior_project_group6/core/services/get_it_setup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}
