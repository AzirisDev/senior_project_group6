import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final Icon? prefixIcon;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.cloudGrey, borderRadius: BorderRadius.circular(6)),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(fontWeight: FontWeight.w300),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
