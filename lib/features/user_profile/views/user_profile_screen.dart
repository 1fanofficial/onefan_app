import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/config/app_preferences.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Profile', style: AppTextStyles.rajdhaniBoldXl),
        elevation: 0,
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
