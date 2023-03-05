import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_text_button.dart';

class CreateRequestsPage extends StatefulWidget {
  const CreateRequestsPage({super.key});

  @override
  State<CreateRequestsPage> createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<CreateRequestsPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final List<String> _services = ['Service Desk', 'Housing', 'IT Department'];
  String _selectedService = 'Service Desk';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBlue,
        title: const Text("Create Request"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
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
                  items: _services.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(location),
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
                  "Photos",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
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
              ),
              const Spacer(),
              CustomTextButton(
                buttonText: "Create Request",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
