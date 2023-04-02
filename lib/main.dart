import 'dart:io';
import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/app.dart';
import 'package:senior_project_group6/core/services/get_it_setup.dart';
import 'package:hive/hive.dart';

void main() {
  setup();
  Hive.init(Directory.current.path);
  runApp(const App());
}
