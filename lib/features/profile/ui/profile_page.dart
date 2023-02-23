import 'package:flutter/material.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/features/profile/ui/widgets/profile_info_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBlue,
        title: const Text("Profile"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Azim",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ProfileInfoTile(title: "Role", info: "Student"),
              SizedBox(
                height: 12,
              ),
              ProfileInfoTile(title: "Email", info: "azim.sattykov@nu.edu.kz"),
              SizedBox(
                height: 12,
              ),
              ProfileInfoTile(
                title: "Telephone number",
                info: "+7 777 686 9559",
                icon: Icons.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
