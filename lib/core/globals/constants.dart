import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

enum Status {
  active,
  inProgress,
  pending,
  success,
  canceled,
  declined,
}

Map<Status, String> statusNames = {
  Status.active: "Active",
  Status.inProgress: "In Progress",
  Status.pending: "Pending",
  Status.success: "Success",
  Status.canceled: "Canceled",
  Status.declined: "Declined",
};

Map<Status, Color> statusColors = {
  Status.active: Colors.green,
  Status.inProgress: Colors.blue,
  Status.pending: Colors.orange,
  Status.success: Colors.indigo,
  Status.canceled: Colors.red,
  Status.declined: Colors.black,
};
