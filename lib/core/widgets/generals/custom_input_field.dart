import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final Icon? prefixIcon;
  final String? labelText;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText ?? "",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColor.cloudGrey,
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(fontWeight: FontWeight.w300),
              prefixIcon: prefixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
