import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/globals/constants.dart';
import 'package:senior_project_group6/core/services/cache_storage.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/core/utils/date_time_formatter.dart';
import 'package:senior_project_group6/features/requests/request_overview/ui/request_overview_page.dart';
import 'package:senior_project_group6/features/requests/requests_list/cubit/requests_list_cubit.dart';
import 'package:senior_project_group6/features/requests/requests_list/cubit/requests_list_state.dart';
import 'package:senior_project_group6/features/requests/requests_list/ui/widgets/request_tile.dart';
import 'package:senior_project_group6/features/requests/requests_list/ui/widgets/worker_filter_bottom_sheet.dart';

class RequestsListPage extends StatefulWidget {
  const RequestsListPage({super.key});

  @override
  State<RequestsListPage> createState() => _RequestsListPageState();
}

class _RequestsListPageState extends State<RequestsListPage> {
  bool isWorker = false;
  @override
  void initState() {
    context.read<RequestsListCubit>().getRequestsByUserId();
    super.initState();
    getWorker();
  }

  void getWorker() async {
    final role = await CacheStorage().getUserRole();
    if (role?.toLowerCase() == 'service_worker') {
      isWorker = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBlue,
        title: const Text("Requests"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              if (isWorker) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return const StatusRequestModalBottomSheet();
                  },
                );
              }
            },
            icon: const Icon(Icons.filter),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocConsumer<RequestsListCubit, RequestsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is RequestsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is RequestsSuccessState) {
              return state.requests.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.requests.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RequestOverviewPage(
                                  serviceRequest: state.requests[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: RequestTile(
                              title: state.requests[index].title ?? '',
                              date: DateTimeFormatter().convertDateFormat(state.requests[index].timeCreated ?? DateTime.now().toString()),
                              location: state.requests[index].location ?? '',
                              type: state.requests[index].requestType ?? '',
                              status: namesToStatus[state.requests[index].status?.toLowerCase()] ?? Status.active,
                              imageUrl:
                                  state.requests[index].media != null && state.requests[index].media!.isNotEmpty ? state.requests[index].media!.first : null,
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text("No requests"),
                    );
            }

            return const Center(
              child: Text("Something went wrong"),
            );
          },
        ),
      ),
    );
  }
}
