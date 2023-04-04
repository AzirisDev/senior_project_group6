import 'package:hive/hive.dart';
import 'package:senior_project_group6/core/globals/constants.dart';

class CacheStorage {
  CacheStorage();

  final String userIdKey = "UserIdKey";

  Future<int?> getUserId() async {
    var box = await Hive.openBox(userIdBox);

    return box.get(userIdKey);
  }

  void setUserId(int id) async {
    var box = await Hive.openBox(userIdBox);
    box.put(userIdKey, id);
  }
}
