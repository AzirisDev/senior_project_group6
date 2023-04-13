import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/globals/constants.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/core/utils/date_time_formatter.dart';
import 'package:senior_project_group6/features/requests/request_overview/ui/request_overview_page.dart';
import 'package:senior_project_group6/features/requests/requests_list/cubit/requests_list_cubit.dart';
import 'package:senior_project_group6/features/requests/requests_list/cubit/requests_list_state.dart';
import 'package:senior_project_group6/features/requests/requests_list/ui/widgets/request_tile.dart';

class RequestsListPage extends StatefulWidget {
  const RequestsListPage({super.key});

  @override
  State<RequestsListPage> createState() => _RequestsListPageState();
}

class _RequestsListPageState extends State<RequestsListPage> {
  @override
  void initState() {
    context.read<RequestsListCubit>().getRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBlue,
        title: const Text("Requests"),
        automaticallyImplyLeading: false,
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
              return ListView.builder(
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
                        imageUrl: state.requests[index].media != null && state.requests[index].media!.isNotEmpty ? state.requests[index].media!.first : null,
                      ),
                    ),
                  );
                },
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
