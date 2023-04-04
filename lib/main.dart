import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/app.dart';
import 'package:senior_project_group6/core/services/get_it_setup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const App());
}
