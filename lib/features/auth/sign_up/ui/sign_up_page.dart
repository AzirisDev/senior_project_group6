import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/globals/keys.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_input_field.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_text_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "University requests",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CustomInputField(
                  labelText: "Email",
                  hintText: "steve.smith@nu.edu.kz",
                  prefixIcon: Icon(
                    Icons.email,
                    color: AppColor.grey,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CustomInputField(
                  labelText: "Telephone number",
                  hintText: "+7-(777)-777-77-77",
                  prefixIcon: Icon(
                    Icons.email,
                    color: AppColor.grey,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CustomInputField(
                  labelText: "Password",
                  hintText: "********",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColor.grey,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CustomInputField(
                  labelText: "Confirm password",
                  hintText: "********",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColor.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextButton(
                      buttonText: "Sign Up",
                      onPressed: () {
                        Keys.globalNavigationKey.currentState!
                            .pushReplacementNamed('myrequests');
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Keys.globalNavigationKey.currentState!
                            .pushReplacementNamed('login');
                      },
                      child: const Text("Log In"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
