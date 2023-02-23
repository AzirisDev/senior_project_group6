import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/globals/keys.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_input_field.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_text_button.dart';
import 'package:senior_project_group6/features/auth/common/cubit/auth_cubit.dart';

import '../../common/cubit/auth_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late AuthCubit _cubit;
  bool _isLoading = false;

  @override
  void initState() {
    _cubit = context.read<AuthCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              _isLoading = true;
            }

            if (state is LoginSuccessState) {
              Keys.globalNavigationKey.currentState!
                  .pushReplacementNamed('home');
            }
          },
          builder: (context, state) {
            return Padding(
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
                        Icons.phone,
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
                          isLoading: _isLoading,
                          buttonText: "Sign Up",
                          onPressed: () {
                            _cubit.signUp();
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
                            Navigator.pop(context);
                          },
                          child: const Text("Log In"))
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
