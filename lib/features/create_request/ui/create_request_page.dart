import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_text_button.dart';
import 'package:senior_project_group6/features/create_request/cubit/create_request_cubit.dart';
import 'package:senior_project_group6/features/create_request/cubit/create_request_state.dart';
import 'package:senior_project_group6/features/create_request/model/service.dart';

class CreateRequestsPage extends StatefulWidget {
  const CreateRequestsPage({super.key});

  @override
  State<CreateRequestsPage> createState() => _CreateRequestsPageState();
}

class _CreateRequestsPageState extends State<CreateRequestsPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  String? _selectedService;

  late CreateRequestCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<CreateRequestCubit>()..getServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBlue,
        title: const Text("Create Request"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: BlocConsumer<CreateRequestCubit, CreateRequestState>(
          listener: (context, state) {
            if (state is GetServicesSuccessState) {
              _selectedService = state.services.first.departmentType;
            }
          },
          builder: (context, state) {
            if (state is CreateRequestLoadingState ||
                state is GetServicesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is GetServicesSuccessState) {
              return _bodyBuilder(state.services);
            }

            if (state is CreateRequestSuccessState) {
              print(state.request.toString());
              return const Center(child: Text("Request created successfully"));
            }

            return const Center(child: Text("Something went wrong"));
          },
        ),
      ),
    );
  }

  Column _bodyBuilder(List<Service> services) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Request Type",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                    color: AppColor.cloudGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<String>(
                  value: _selectedService,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedService = newValue ?? "";
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  underline: const SizedBox(),
                  isExpanded: true,
                  items: services.map((type) {
                    return DropdownMenuItem(
                      value: type.departmentType,
                      child: Text(type.departmentType ?? ''),
                    );
                  }).toList(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                    color: AppColor.cloudGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    fillColor: AppColor.cloudGrey,
                    border: InputBorder.none,
                    hintText: "Give short title",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                    color: AppColor.cloudGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: descriptionController,
                  maxLines: 6,
                  minLines: 3,
                  decoration: const InputDecoration(
                    fillColor: AppColor.cloudGrey,
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                    hintText: "Write about the problem",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                    color: AppColor.cloudGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    fillColor: AppColor.cloudGrey,
                    border: InputBorder.none,
                    hintText: "Enter location",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Photos",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
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
                      child: index == 0
                          ? const Icon(
                              Icons.add_a_photo_rounded,
                              size: 40,
                              color: AppColor.primaryBlue,
                            )
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: CustomTextButton(
            buttonText: "Create Request",
            onPressed: () {
              _cubit.createRequest(
                description: descriptionController.text,
                location: locationController.text,
                requestType: _selectedService ?? '',
                title: titleController.text,
              );
            },
          ),
        ),
      ],
    );
  }
}
