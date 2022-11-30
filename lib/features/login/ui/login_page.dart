import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/globals/keys.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [
                  Row(
                    children: [
                      const Text("Email",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.cloudGrey,
                        borderRadius: BorderRadius.circular(6)),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "steve.smith@nu.edu.kz",
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(children: [
                  Row(
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.cloudGrey,
                        borderRadius: BorderRadius.circular(6)),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "********",
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(16)),
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.primaryBlue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Keys.globalNavigationKey.currentState!
                            .pushReplacementNamed('myrequests');
                      },
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {}, child: const Text("Forgot password?")),
              const Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(onPressed: () {}, child: const Text("Sign Up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
