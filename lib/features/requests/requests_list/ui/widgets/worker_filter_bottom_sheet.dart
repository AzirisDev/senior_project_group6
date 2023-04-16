import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_text_button.dart';
import 'package:senior_project_group6/features/requests/request_overview/cubit/request_status_cubit.dart';
import 'package:senior_project_group6/features/requests/request_overview/cubit/request_status_state.dart';
import 'package:senior_project_group6/features/requests/requests_list/cubit/requests_list_cubit.dart';

class WorkerFilterModalBottomSheet extends StatefulWidget {
  const WorkerFilterModalBottomSheet({super.key});

  @override
  _WorkerFilterModalBottomSheetState createState() => _WorkerFilterModalBottomSheetState();
}

class _WorkerFilterModalBottomSheetState extends State<WorkerFilterModalBottomSheet> {
  int _selectedFilterIndex = 0;
  late final RequestsListCubit _cubit;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _cubit = context.read<RequestsListCubit>();
  }

  final List<String> _statuses = ['ACTIVE', 'CANCELED', 'DECLINED', 'IN_PROGRESS', 'PENDING', 'SUCCESS', 'ALL'];

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
      int midIndex = (_statuses.length / 2).ceil();

      List<Widget> leftOptions = _statuses
          .sublist(0, midIndex)
          .map((option) => RadioListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(option),
                value: _statuses.indexOf(option),
                groupValue: _selectedFilterIndex,
                onChanged: (int? value) {
                  setState(() {
                    _selectedFilterIndex = value!;
                  });
                },
              ))
          .toList();

      List<Widget> rightOptions = _statuses
          .sublist(midIndex)
          .map((option) => RadioListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(option),
                value: _statuses.indexOf(option),
                groupValue: _selectedFilterIndex,
                onChanged: (int? value) {
                  setState(() {
                    _selectedFilterIndex = value!;
                  });
                },
              ))
          .toList();

      return Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Filter by status",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: leftOptions,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: rightOptions,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: CustomTextButton(
                  isLoading: _isLoading,
                  onPressed: () {
                    if (_statuses[_selectedFilterIndex] == 'ALL') {
                      _cubit.getRequestsByUserId();
                    } else {
                      _cubit.getRequestsByStatusWorkerId(_statuses[_selectedFilterIndex]);
                    }
                    Navigator.of(context).pop();
                  },
                  buttonText: "Load requests"),
            ),
          ],
        ),
      );
    });
  }
}
