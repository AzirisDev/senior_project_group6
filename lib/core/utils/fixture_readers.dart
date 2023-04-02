import 'dart:io';
import 'package:http/http.dart';
import 'package:senior_project_group6/core/globals/constants.dart';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

String requestToFilename(BaseRequest request) =>
    "${"${request.method}_"}${request.url.toString().splitMapJoin(RegExp(baseUrl), onMatch: (m) => "").splitMapJoin("/api/v1/", onMatch: (m) => "").replaceAll(RegExp(r'[?=\/\.\-$&:]|(\%5[B|D])'), "_").replaceAll(RegExp(r'_+'), "_")}.json";
