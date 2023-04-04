import 'dart:async';

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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    _cubit = context.read<AuthCubit>();
    super.initState();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignUpLoadingState) {
              _isLoading = true;
            }

            if (state is SignUpSuccessState) {
              Keys.globalNavigationKey.currentState!
                  .pushReplacementNamed('home');
            }

            if (state is SignUpErrorState) {
              _isLoading = false;

              final snackBar = SnackBar(
                elevation: 20,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      state.errorMessage,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                backgroundColor: (const Color.fromARGB(255, 194, 35, 24)),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomInputField(
                      onChanged: _onSearchChanged,
                      controller: _fullNameController,
                      labelText: "Full Name",
                      hintText: "Steve Smith",
                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomInputField(
                      onChanged: _onSearchChanged,
                      controller: _emailController,
                      labelText: "Email",
                      hintText: "steve.smith@nu.edu.kz",
                      prefixIcon: const Icon(
                        Icons.email,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomInputField(
                      onChanged: _onSearchChanged,
                      controller: _phoneNumber,
                      labelText: "Telephone number",
                      hintText: "+7-(777)-777-77-77",
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomInputField(
                      onChanged: _onSearchChanged,
                      controller: _passwordController,
                      labelText: "Password",
                      hintText: "********",
                      obscureText: true,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomInputField(
                      onChanged: _onSearchChanged,
                      controller: _confirmPasswordController,
                      labelText: "Confirm password",
                      hintText: "********",
                      obscureText: true,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          enabled: _passwordController.text ==
                                  _confirmPasswordController.text &&
                              _emailController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty &&
                              _fullNameController.text.isNotEmpty &&
                              _phoneNumber.text.isNotEmpty,
                          isLoading: _isLoading,
                          buttonText: "Sign Up",
                          onPressed: () {
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            final fullName = _fullNameController.text;
                            final phoneNumber = _phoneNumber.text;
                            _cubit.signUp(
                                email, password, fullName, phoneNumber);
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
