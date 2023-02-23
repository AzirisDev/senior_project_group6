import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
        backgroundColor: MaterialStateProperty.all(AppColor.primaryBlue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
