import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final Icon? prefixIcon;
  final String? labelText;
  final String? errorText;
  final TextEditingController? controller;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.labelText,
    this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: AppColor.cloudGrey,
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            errorText: errorText,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(fontWeight: FontWeight.w300),
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}
