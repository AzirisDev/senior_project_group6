import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/globals/keys.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_input_field.dart';
import 'package:senior_project_group6/core/widgets/generals/custom_text_button.dart';
import 'package:senior_project_group6/features/auth/common/cubit/auth_cubit.dart';
import 'package:senior_project_group6/features/auth/common/cubit/auth_state.dart';
import 'package:senior_project_group6/features/auth/sign_up/ui/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthCubit _cubit;
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

            if (state is LoginErrorState) {
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
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextButton(
                          buttonText: "Log in",
                          isLoading: _isLoading,
                          onPressed: () {
                            final email = _emailController.text;
                            final password = _passwordController.text;
                            _cubit.login(email, password);
                          },
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text("Forgot password?")),
                  const Spacer(flex: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => const SignUpPage()));
                          },
                          child: const Text("Sign Up"))
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
