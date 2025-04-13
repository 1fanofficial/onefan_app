import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/auth/views/widgets/custom_filled_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top + MediaQuery.of(context).size.height * 0.1),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/logos/1fan_logo.png", width: 100),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Text("Welcome Back!", style: AppTextStyles.rajdhaniBoldXxl.copyWith(color: Colors.white)),
                const SizedBox(height: 8),
                Text("Sign in to your 1FAN account", style: AppTextStyles.interNormalMd.copyWith(color: Colors.white)),
                const SizedBox(height: 30),
                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) => val != null && val.contains('@') ? null : "Enter a valid email",
                ),
                const SizedBox(height: 20),

                // Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: AppTextStyles.interNormalMd.copyWith(color: AppColors.lightSurface),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: AppTextStyles.interNormalMd.copyWith(color: AppColors.lightSurface),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (val) => val != null && val.length >= 6 ? null : "Password too short",
                ),
                const SizedBox(height: 20),

                CustomFilledButton(title: "Sing In", onTap: () {}),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: AppTextStyles.interSemiBoldMd.copyWith(color: AppColors.primary),
                    ),
                    InkWell(
                      onTap: () {
                        context.goNamed(RouteName.signup);
                      },
                      child: Text(
                        "Sign Up",
                        style: AppTextStyles.interSemiBoldMd.copyWith(
                          color: AppColors.lightSurface,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.lightSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
