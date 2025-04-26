import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:onefan_app/core/config/app_preferences.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/core/utils/common_functions.dart';
import 'package:onefan_app/features/auth/controller/auth_controller.dart';
import 'package:onefan_app/features/auth/views/sign_up_screen.dart';
import 'package:onefan_app/features/auth/views/widgets/custom_filled_button.dart';
import 'package:onefan_app/features/user_profile/controller/user_profile_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final log = Logger();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);

  Future<void> onSignIn() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      try {
        bool isSuccess = await ref.read(authControllerProvider.notifier).signIn(email: email, password: password, context: context);
        if (isSuccess && context.mounted) {
          final userJson = AppPreferences().getString("user");

          if (userJson == null) {
            context.goNamed(RouteName.signin);
            return;
          }

          final user = User.fromJson(jsonDecode(userJson));
          final userId = user?.id;

          if (userId == null || userId.isEmpty) {
            context.goNamed(RouteName.signin);
            return;
          }

          final userProfileResponse = await ref.read(userProfileControllerProvider.notifier).getUserDetails(userId);

          if (userProfileResponse == null) {
            context.goNamed(RouteName.signup, extra: SignUpState.userDetails);
          } else {
            context.goNamed(RouteName.home);
          }
        }
      } catch (e, st) {
        log.e("Something went wrong", error: e, stackTrace: st);
        CommonFunctions.showToastMessage(context: context, message: e.toString());
      }
    }
  }

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
                ValueListenableBuilder(
                    valueListenable: _isObscure,
                    builder: (context, isObscure, _) {
                      return TextFormField(
                        controller: _passwordController,
                        obscureText: isObscure,
                        style: AppTextStyles.interNormalMd.copyWith(color: AppColors.lightSurface),
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: AppTextStyles.interNormalMd.copyWith(color: AppColors.lightSurface),
                          border: const OutlineInputBorder(),
                        ),
                        validator: (val) => val != null && val.length >= 6 ? null : "Password too short",
                      );
                    }),
                ValueListenableBuilder<bool>(
                  valueListenable: _isObscure,
                  builder: (context, isObscure, _) {
                    return Row(
                      children: [
                        Checkbox(
                          value: !isObscure,
                          onChanged: (val) {
                            _isObscure.value = !(val ?? false);
                          },
                          activeColor: AppColors.primary,
                        ),
                        Text(
                          "Show Password",
                          style: AppTextStyles.interNormalSm.copyWith(color: AppColors.darkText),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),

                ref.watch(authControllerProvider).when(
                      loading: () => const Center(child: CircularProgressIndicator()),
                      data: (_) => CustomFilledButton(title: 'Sign In', onTap: onSignIn),
                      error: (e, st) => CustomFilledButton(title: 'Sign In', onTap: onSignIn),
                    ),

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
