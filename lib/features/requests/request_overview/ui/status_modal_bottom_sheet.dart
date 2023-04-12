import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_text_button.dart';
import 'package:senior_project_group6/features/requests/request_overview/cubit/request_status_cubit.dart';
import 'package:senior_project_group6/features/requests/request_overview/cubit/request_status_state.dart';

class StatusModalBottomSheet extends StatefulWidget {
  final String status;
  final String requestId;
  const StatusModalBottomSheet({super.key, required this.status, required this.requestId});

  @override
  _StatusModalBottomSheetState createState() => _StatusModalBottomSheetState();
}

class _StatusModalBottomSheetState extends State<StatusModalBottomSheet> {
  String _selectedStatus = ''; // initial value
  late final RequestStatusCubit _cubit;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.status;
    _cubit = context.read<RequestStatusCubit>();
  }

  final List<String> _statuses = ['ACTIVE', 'CANCELED', 'DECLINED', 'IN_PROGRESS', 'PENDING', 'SUCCESS'];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestStatusCubit, RequestStatusState>(listener: (context, state) {
      if (state is RequestStatusLoadingState) {
        _isLoading = true;
      }
      if (state is RequestStatusSuccessState) {
        _isLoading = false;
        Navigator.pop(context, true);
      }
      if (state is RequestStatusErrorState) {
        _isLoading = false;

        final snackBar = SnackBar(
          elevation: 20,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                state.errorMessage,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: (const Color.fromARGB(255, 194, 35, 24)),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        Navigator.pop(context, false);
      }
    }, builder: (context, snapshot) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: _statuses.length,
              itemBuilder: (BuildContext context, int index) {
                final status = _statuses[index];
                return ListTile(
                  title: Text(status),
                  trailing: _selectedStatus == status
                      ? const Icon(
                          Icons.check_box,
                          color: AppColor.primaryBlue,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank,
                          color: AppColor.primaryBlue,
                        ),
                  onTap: () {
                    setState(() {
                      _selectedStatus = status;
                    });
                  },
                );
              },
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: CustomTextButton(
                  isLoading: _isLoading,
                  onPressed: () {
                    _cubit.changeRequestStatus(requestId: widget.requestId, status: _selectedStatus);
                  },
                  buttonText: "Update status"),
            ),
          ],
        ),
      );
    });
  }
}
