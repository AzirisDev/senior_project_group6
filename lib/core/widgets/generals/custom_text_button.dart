import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final bool isLoading;
  final bool enabled;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
        backgroundColor: enabled
            ? MaterialStateProperty.all(AppColor.primaryBlue)
            : MaterialStateProperty.all(AppColor.grey),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
      onPressed: () {
        if (enabled) {
          onPressed!();
        }
      },
      child: Center(
        child: isLoading
            ? const SizedBox(
                height: 25.0,
                width: 25.0,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColor.white,
                ),
              )
            : Text(
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
