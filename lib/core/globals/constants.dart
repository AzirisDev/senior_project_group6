import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

const String baseUrl = 'http://185.4.180.232:81/api/v1';
const String authenticationLogInEndpoint = '$baseUrl/auth/logIn';
const String authenticationSignUpEndpoint = '$baseUrl/auth/signUp';

const String userIdBox = "userIdBox";
const String userRoleBox = "userRoleBox";

// Requests
const String studentRequestsEndpoint = '$baseUrl/requests/student';
const String workerRequestsEndpoint = '$baseUrl/requests/service-worker';
const String requestsEndpoint = '$baseUrl/requests/student';
const String createRequestEndpoint = '$baseUrl/requests/create';
const String changeStatusEndpoint = '$baseUrl/requests/update-status';

// Users
const String usersEndpoint = '$baseUrl/user';

// Services
const String servicesEndpoint = '$baseUrl/department/departments';

enum Status {
  active,
  inProgress,
  pending,
  success,
  canceled,
  declined,
}
//

Map<Status, String> statusToNames = {
  Status.active: "Active",
  Status.inProgress: "In Progress",
  Status.pending: "Pending",
  Status.success: "Success",
  Status.canceled: "Canceled",
  Status.declined: "Declined",
};

Map<String, Status> namesToStatus = {
  "active": Status.active,
  "in_progress": Status.inProgress,
  "pending": Status.pending,
  "success": Status.success,
  "canceled": Status.canceled,
  "declined": Status.declined,
};

Map<Status, Color> statusColors = {
  Status.active: Colors.green,
  Status.inProgress: Colors.blue,
  Status.pending: Colors.orange,
  Status.success: Colors.indigo,
  Status.canceled: Colors.red,
  Status.declined: Colors.black,
};
