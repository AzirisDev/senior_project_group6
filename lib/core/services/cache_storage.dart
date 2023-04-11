import 'package:hive/hive.dart';
import 'package:senior_project_group6/core/globals/constants.dart';

class CacheStorage {
  static final CacheStorage _instance = CacheStorage._internal();
  factory CacheStorage() {
    return _instance;
  }
  CacheStorage._internal();

  final String userIdKey = "UserIdKey";
  final String userRoleKey = "UserRoleKey";

  Future<int?> getUserId() async {
    var box = await Hive.openBox(userIdBox);

    return box.get(userIdKey);
  }

  void setUserId(int id) async {
    var box = await Hive.openBox(userIdBox);
    box.put(userIdKey, id);
  }

  Future<String?> getUserRole() async {
    var box = await Hive.openBox(userRoleBox);

    return box.get(userRoleKey);
  }

  void setUserRole(String role) async {
    var box = await Hive.openBox(userRoleBox);
    box.put(userRoleKey, role);
  }
}
