import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/globals/constants.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/features/requests/ui/widgets/request_tile.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  //mock up data
  List<Widget> requests = [
    const RequestTile(
      title: "Request for relocation",
      date: "4 Feb",
      location: "Room 914, block 27",
      type: "Student Housing",
      status: Status.active,
    ),
    const RequestTile(
      title: "Request for relocation",
      date: "4 Feb",
      location: "Room 914, block 27",
      type: "Student Housing",
      status: Status.pending,
    ),
    const RequestTile(
      title: "Request for relocation",
      date: "4 Feb",
      location: "Room 914, block 27",
      type: "Student Housing",
      status: Status.inProgress,
    ),
    const RequestTile(
      title: "Request for relocation",
      date: "4 Feb",
      location: "Room 914, block 27",
      type: "Student Housing",
      status: Status.success,
    ),
    const RequestTile(
      title: "Request for relocation",
      date: "4 Feb",
      location: "Room 914, block 27",
      type: "Student Housing",
      status: Status.canceled,
    ),
    const RequestTile(
      title: "Request for relocation",
      date: "4 Feb",
      location: "Room 914, block 27",
      type: "Student Housing",
      status: Status.declined,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBlue,
        title: const Text("Requests"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return requests[index];
          },
        ),
      ),
    );
  }
}
