import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:senior_project_group6/core/globals/errors.dart';
import 'package:senior_project_group6/core/services/logger.dart';
import 'package:senior_project_group6/core/utils/fixture_readers.dart';

mixin ApiProviderMixin<T> {
  Future<T?> provideData({
    required String endPoint,
    String? token,
    Map<String, dynamic>? param,
    dynamic body,
    bool patch = false,
  }) async {
    final headers = {
      'Accept': 'application/json',
      if (body is String || body == null) 'Content-Type': 'application/json',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };

    final httpClient = http.Client();

    try {
      http.Response response;
      if (body == null) {
        if (param != null) {
          for (final e in param.entries) {
            endPoint += param.entries.first.key == e.key ? '?' : '&';
            if (e.value is List) {
              endPoint += e.value.map((x) => '${e.key}=$x').toList().join('&');
            } else {
              endPoint += '${e.key}=${e.value}';
            }
          }
        }
        response = await httpClient
            .get(Uri.parse(endPoint), headers: headers)
            .timeout(const Duration(seconds: 12));
      } else {
        if (patch) {
          response = await httpClient
              .patch(Uri.parse(endPoint), headers: headers, body: body)
              .timeout(const Duration(seconds: 30));
        } else if (body is File) {
          final request = http.MultipartRequest("POST", Uri.parse(endPoint))
            ..files.add(await http.MultipartFile.fromPath('file', body.path));
          if (token != null && token.isNotEmpty) {
            request.headers["Authorization"] = "Bearer $token";
          }
          response = await http.Response.fromStream(await request.send());
        } else {
          response = await httpClient
              .post(
                Uri.parse(endPoint),
                headers: headers,
                body: body,
              )
              .timeout(const Duration(seconds: 12));
        }
      }
      log.i('$endPoint\n${response.body}');
      final responseBody = json.decode(response.body);
      if (response.statusCode == 401) {
        if (responseBody['message'] == 'Invalid lazy user') {
          throw TokenExpired(msg: 'InvalidLazyUser');
        }
        throw TokenExpired(msg: 'Unauthorized');
      }
      if (response.statusCode == 404) {
        if (responseBody['message']
            .toString()
            .startsWith('No record found for id')) {
          throw TokenExpired(msg: 'InvalidLazyUser');
        }
      }
      if (response.statusCode == 409) throw TokenExpired();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return responseBody;
      }
      throw Exception(responseBody['message'] ?? 'Unknow Error');
    } on TimeoutException catch (_) {
      throw Exception('Connection timed out. Try again');
    } on SocketException catch (_) {
      throw Exception('Check network connection');
    } on Exception catch (e) {
      log.w(e.toString());
      rethrow;
    } finally {
      httpClient.close();
    }
  }
}

extension PrettyPrint on http.Response {
  String toPrettyString() {
    return '${request!.method} ${request!.url},\nCODE: $statusCode: $reasonPhrase,\nHEADERS:$headers,\nBODY:${const JsonEncoder.withIndent(' ').convert(json.decode(body))})';
  }

  /// Designated for creating mock responses
  /// 1. Run server.dart first
  /// 2. add serverPrinter function to row 87
  Future serverPrinter() async {
    if (request != null && body.isNotEmpty) {
      await http.post(
          Uri.parse('http://10.0.2.2:8080/${requestToFilename(request!)}'),
          headers: request!.headers,
          body: bodyBytes);
    }
  }
}
