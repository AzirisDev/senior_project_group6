import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_project_group6/core/globals/keys.dart';
import 'package:senior_project_group6/core/utils/appcolors.dart';
import 'package:senior_project_group6/features/profile/cubit/profile_cubit.dart';
import 'package:senior_project_group6/features/profile/cubit/profile_state.dart';
import 'package:senior_project_group6/features/profile/ui/widgets/profile_info_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileCubit>().getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBlue,
        title: const Text("Profile"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Keys.globalNavigationKey.currentState!
                  .pushReplacementNamed('login');
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              if (state is ProfileLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ProfileErrorState) {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }

              state = state as ProfileSuccessState;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.student.fullName ?? '',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ProfileInfoTile(
                      title: state.student.role ?? '', info: "Student"),
                  const SizedBox(height: 12),
                  ProfileInfoTile(
                      title: "Email",
                      info: state.student.universityEmail ?? ''),
                  const SizedBox(height: 12),
                  ProfileInfoTile(
                    title: "Telephone number",
                    info: state.student.phoneNumber ?? '',
                    icon: Icons.phone,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
