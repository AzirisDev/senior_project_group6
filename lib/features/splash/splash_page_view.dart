import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/globals/keys.dart';
import '../../core/utils/assets.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({Key? key}) : super(key: key);

  @override
  _SplashPageViewState createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future _init() async {
    await Future.delayed(const Duration(seconds: 4));
    Keys.globalNavigationKey.currentState!.pushReplacementNamed('login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox.fromSize(
                  size: const Size.square(120),
                  //add the logo
                  child: SvgPicture.asset(
                    AppAssets.logo,
                    color: AppColor.primaryBlue,
                  ),
                ),
              ),
              const SizedBox(
                height: 240,
                child: Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'powered by Group-6',
                style: TextStyle(color: AppColor.primaryBlue),
              ),
            ),
          )
        ],
      ),
    );
  }
}
