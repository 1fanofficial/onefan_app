import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/config/app_preferences.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Profile', style: AppTextStyles.rajdhaniBoldXl),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await AppPreferences().clearAuthData();
              context.goNamed(RouteName.signin);
            },
            child: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: const Center(
        child: Text("Profle Screen"),
      ),
    );
  }
}
