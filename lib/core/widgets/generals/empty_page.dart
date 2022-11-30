import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';

class EmptyPage extends StatelessWidget {
  final String message;

  const EmptyPage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            message,
            style: const TextStyle(fontSize: 18, color: AppColor.primaryBlue),
          ),
        ),
      ),
    );
  }
}
