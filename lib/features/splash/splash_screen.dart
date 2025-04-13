import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      context.goNamed(RouteName.signin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                'assets/logos/1fan_logo.png',
                width: 120,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Lights Out to ", style: AppTextStyles.rajdhaniBoldXxl.copyWith(color: AppColors.secondary)),
                Text("1", style: AppTextStyles.rajdhaniBoldXxl.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w900)),
                Text("FAN!", style: AppTextStyles.rajdhaniBoldXxl.copyWith(color: AppColors.primary, fontWeight: FontWeight.w900)),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
