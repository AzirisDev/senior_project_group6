import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/core/utils/date_time_formatter.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_text_button.dart';
import 'package:senior_project_group6/features/profile/ui/widgets/profile_info_tile.dart';
import 'package:senior_project_group6/features/requests/common/model/service_request.dart';
import 'package:senior_project_group6/features/requests/request_overview/ui/status_modal_bottom_sheet.dart';
import 'package:senior_project_group6/features/requests/requests_list/cubit/requests_list_cubit.dart';

class RequestOverviewPage extends StatefulWidget {
  final ServiceRequest serviceRequest;
  const RequestOverviewPage({
    super.key,
    required this.serviceRequest,
  });

  @override
  State<RequestOverviewPage> createState() => _RequestOverviewPageState();
}

class _RequestOverviewPageState extends State<RequestOverviewPage> {
  bool isWorker = false;
  List<File> images = [];

  @override
  void initState() {
    super.initState();
    getWorker();
  }

  void getWorker() async {
    var role = await CacheStorage().getUserRole();
    if (role.toString().toLowerCase() == "service_worker") {
      isWorker = true;
      setState(() {});
    }
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.serviceRequest.title ?? 'Unknown',
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
                      info: widget.serviceRequest.status ?? 'Unknown',
                      sufficIcon: Icons.check_box_rounded,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ProfileInfoTile(
                      title: "Date",
                      info: DateTimeFormatter().convertDateFormat(
                        widget.serviceRequest.timeCreated ?? DateTime.now().toString(),
                      ),
                      sufficIcon: Icons.date_range_rounded,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ProfileInfoTile(
                      title: "Description",
                      info: widget.serviceRequest.description ?? 'No description',
                      sufficIcon: Icons.description_rounded,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ProfileInfoTile(
                      title: "Location",
                      info: widget.serviceRequest.location ?? 'Unknown',
                      sufficIcon: Icons.location_on_rounded,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ProfileInfoTile(
                      title: "Request Type",
                      info: widget.serviceRequest.requestType ?? 'Unknown',
                      sufficIcon: Icons.category_rounded,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      widget.serviceRequest.media != null && widget.serviceRequest.media!.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.serviceRequest.media!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: FittedBox(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          widget.serviceRequest.media![index],
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: AppColor.grey,
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              if (isWorker)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomTextButton(
                      onPressed: () async {
                        final result = await showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return StatusModalBottomSheet(
                              status: widget.serviceRequest.status ?? "",
                              requestId: widget.serviceRequest.id.toString(),
                            );
                          },
                        );
                        if (result && context.mounted) {
                          BlocProvider.of<RequestsListCubit>(context).getRequests();
                          Navigator.pop(context);
                        }
                      },
                      buttonText: "Update status"),
                )
            ],
          ),
        ),
      ),
    );
  }
}
