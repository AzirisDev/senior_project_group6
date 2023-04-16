import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_text_button.dart';
import 'package:senior_project_group6/features/create_request/cubit/create_request_cubit.dart';
import 'package:senior_project_group6/features/create_request/cubit/create_request_state.dart';
import 'package:senior_project_group6/features/create_request/model/service.dart';
import 'package:senior_project_group6/features/requests/request_overview/cubit/request_status_cubit.dart';
import 'package:senior_project_group6/features/requests/request_overview/cubit/request_status_state.dart';
import 'package:senior_project_group6/features/requests/requests_list/cubit/requests_list_cubit.dart';

class StudentFilterModalBottomSheet extends StatefulWidget {
  const StudentFilterModalBottomSheet({super.key});

  @override
  _StudentFilterModalBottomSheetState createState() => _StudentFilterModalBottomSheetState();
}

class _StudentFilterModalBottomSheetState extends State<StudentFilterModalBottomSheet> {
  int _selectedFilterIndex = 0;
  int _selectedTypeIndex = 0;
  late final RequestsListCubit _requestsCubit;
  bool _isServicesLoading = true;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    context.read<CreateRequestCubit>().getServices();
    _requestsCubit = context.read<RequestsListCubit>();
  }

  final List<String> _statuses = ['ACTIVE', 'CANCELED', 'DECLINED', 'IN_PROGRESS', 'PENDING', 'SUCCESS', 'ALL'];
  final List<Service> _types = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestStatusCubit, RequestStatusState>(
      listener: (context, state) {
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
      },
      builder: (context, requestState) {
        int midIndex = (_statuses.length / 2).ceil();

        List<Widget> leftStatusOptions = _statuses
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

        List<Widget> rightStatusOptions = _statuses
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

        return BlocConsumer<CreateRequestCubit, CreateRequestState>(
          listener: (context, state) {
            if (state is GetServicesSuccessState) {
              _types.addAll(state.services);
              _types.add(Service(id: -1, departmentType: "ALL", adminId: -1));
              _isServicesLoading = false;
            }
          },
          builder: (context, createRequestState) {
            int midIndex = (_types.length / 2).ceil();

            List<Widget> leftTypeOptions = _types
                .sublist(0, midIndex)
                .map((option) => RadioListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(option.departmentType ?? ''),
                      value: _types.indexOf(option),
                      groupValue: _selectedTypeIndex,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedTypeIndex = value!;
                        });
                      },
                    ))
                .toList();

            List<Widget> rightTypeOptions = _types
                .sublist(midIndex)
                .map((option) => RadioListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(option.departmentType ?? ''),
                      value: _types.indexOf(option),
                      groupValue: _selectedTypeIndex,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedTypeIndex = value!;
                        });
                      },
                    ))
                .toList();
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 8, bottom: 8),
                    child: Text(
                      "Filter by status and type",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "Request status",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
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
                          children: leftStatusOptions,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: rightStatusOptions,
                        ),
                      ),
                    ],
                  ),
                  if (_statuses[_selectedFilterIndex] != 'ALL')
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "Request Type",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        if (_isServicesLoading) const Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  if (_statuses[_selectedFilterIndex] != 'ALL')
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: leftTypeOptions,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: rightTypeOptions,
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
                          final selectedStatus = _statuses[_selectedFilterIndex];
                          final selectedType = _types[_selectedTypeIndex].departmentType ?? 'ALL';
                          if (selectedStatus == 'ALL') {
                            _requestsCubit.getRequestsByUserId();
                          } else if (selectedType != 'ALL' && selectedStatus != 'ALL') {
                            _requestsCubit.getStudentRequestsByStatusAndType(selectedStatus, selectedType);
                          } else if (selectedType == 'ALL' && selectedStatus != 'ALL') {
                            _requestsCubit.getStudentRequestsByStatus(selectedStatus);
                          }
                          Navigator.of(context).pop();
                        },
                        buttonText: "Load requests"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
