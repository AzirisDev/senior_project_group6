import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/globals/constants.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';

class RequestTile extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String type;
  final Status status;
  const RequestTile({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.type,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColor.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "$date - $location",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "Type: $type",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (statusColors[status] ?? Colors.grey)
                            .withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        statusToNames[status] ?? "Unknown",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: (statusColors[status] ?? Colors.grey),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_right_rounded,
                color: AppColor.grey,
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Divider(),
        ),
      ],
    );
  }
}
