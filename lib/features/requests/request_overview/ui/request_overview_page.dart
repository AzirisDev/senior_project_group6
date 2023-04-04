import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/globals/constants.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_text_button.dart';
import 'package:senior_project_group6/features/profile/ui/widgets/profile_info_tile.dart';

class RequestOverviewPage extends StatefulWidget {
  final String title;
  final String date;
  final String location;
  final String type;
  final Status status;
  const RequestOverviewPage({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.type,
    required this.status,
  });

  @override
  State<RequestOverviewPage> createState() => _RequestOverviewPageState();
}

class _RequestOverviewPageState extends State<RequestOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBlue,
        title: const Text(""),
        automaticallyImplyLeading: false,
        leadingWidth: 200,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: const [
              SizedBox(
                width: 20,
              ),
              Icon(Icons.arrow_back_rounded),
              SizedBox(
                width: 10,
              ),
              Text(
                "Back",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileInfoTile(
                      title: "Status",
                      info: statusToNames[widget.status] ?? ""),
                  const SizedBox(
                    height: 12,
                  ),
                  ProfileInfoTile(title: "Date", info: widget.date),
                  const SizedBox(
                    height: 12,
                  ),
                  const ProfileInfoTile(
                      title: "Description",
                      info:
                          "Description text. We may add a button to open a separate page with full description."),
                  const SizedBox(
                    height: 12,
                  ),
                  ProfileInfoTile(
                    title: "Location",
                    info: widget.location,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ProfileInfoTile(
                    title: "Request Type",
                    info: widget.type,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: AppColor.cloudGrey,
                              borderRadius: BorderRadius.circular(10)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomTextButton(
                  onPressed: () {}, buttonText: "Update status"),
            )
          ],
        ),
      ),
    );
  }
}
