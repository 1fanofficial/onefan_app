import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/auth/views/widgets/custom_filled_button.dart';

enum SignUpState { createUser, verifyUser, userDetails }

enum Gender {
  male("Male"),
  female("Female"),
  other("Other");

  const Gender(this.displayName);
  final String displayName;
}

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  // create user state
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // verify user state
  final _otpController = TextEditingController();

  // user details controller
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _bioController = TextEditingController();
  DateTime? _dob;
  Gender? _selectedGender;

  final ValueNotifier<SignUpState> _signUpState = ValueNotifier(SignUpState.createUser);
  final ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      _dob = picked;
      _dobController.text = "${picked.day.toString().padLeft(2, "0")}/${picked.month.toString().padLeft(2, "0")}/${picked.year}";
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
                ValueListenableBuilder(
                  valueListenable: _signUpState,
                  builder: (context, signUpState, _) {
                    return signUpState == SignUpState.verifyUser
                        ? Column(
                            children: [
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  _signUpState.value = SignUpState.createUser;
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink();
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/logos/1fan_logo.png", width: 100),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ValueListenableBuilder(
                  valueListenable: _signUpState,
                  builder: (context, signUpState, child) {
                    switch (signUpState) {
                      case SignUpState.createUser:
                        return _buildCreateUserState();
                      case SignUpState.verifyUser:
                        return _buildVerifyUserState();
                      case SignUpState.userDetails:
                        return _buildUserDetailsState();
                      default:
                        return _buildCreateUserState();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateUserState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Join 1FAN!", style: AppTextStyles.rajdhaniBoldXxl.copyWith(color: Colors.white)),
        const SizedBox(height: 8),
        Text("Create your account to get started", style: AppTextStyles.interNormalMd.copyWith(color: Colors.white)),
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
              validator: (val) => val != null && val.length >= 6 ? null : "Password must be at least 6 characters",
            );
          },
        ),
        const SizedBox(height: 20),

        // Confirm Password
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: true,
          style: AppTextStyles.interNormalMd.copyWith(color: AppColors.lightSurface),
          decoration: InputDecoration(
            labelText: "Confirm Password",
            labelStyle: AppTextStyles.interNormalMd.copyWith(color: AppColors.lightSurface),
            border: const OutlineInputBorder(),
          ),
          validator: (val) => val == _passwordController.text ? null : "Passwords don't match",
        ),

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

        CustomFilledButton(
          title: 'Sign Up',
          onTap: () {
            _signUpState.value = SignUpState.verifyUser;
          },
        ),

        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account? ",
              style: AppTextStyles.interSemiBoldMd.copyWith(color: AppColors.primary),
            ),
            InkWell(
              onTap: () {
                context.goNamed(RouteName.signin);
              },
              child: Text(
                "Sign In",
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
    );
  }

  Widget _buildVerifyUserState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Enter OTP", style: AppTextStyles.rajdhaniBoldXxl.copyWith(color: Colors.white)),
        const SizedBox(height: 8),
        Text("Verify you email to create account", style: AppTextStyles.interNormalMd.copyWith(color: Colors.white)),
        const SizedBox(height: 30),
        TextFormField(
          controller: _otpController,
          keyboardType: TextInputType.number,
          style: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
          decoration: InputDecoration(
            labelText: "OTP",
            labelStyle: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
            border: const OutlineInputBorder(),
          ),
          maxLength: 6,
          validator: (val) => val != null && val.length != 6 ? null : "OTP is invalid",
        ),
        const SizedBox(height: 20),
        CustomFilledButton(
          title: 'Verfiy',
          onTap: () {
            _signUpState.value = SignUpState.userDetails;
          },
        ),
      ],
    );
  }

  Widget _buildUserDetailsState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welocome to 1FAN!", style: AppTextStyles.rajdhaniBoldXxl.copyWith(color: Colors.white)),
        const SizedBox(height: 8),
        Text("Enter your details", style: AppTextStyles.interNormalMd.copyWith(color: Colors.white)),
        const SizedBox(height: 30),

        // Name
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _firstNameController,
                keyboardType: TextInputType.name,
                style: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "First Name",
                  labelStyle: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
                  border: const OutlineInputBorder(),
                ),
                validator: (val) => val != null && val.length >= 2 ? null : "Name is too short",
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                controller: _lastNameController,
                keyboardType: TextInputType.name,
                style: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Last Name",
                  labelStyle: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
                  border: const OutlineInputBorder(),
                ),
                validator: (val) => val != null && val.length >= 2 ? null : "Name is too short",
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // DOB
        TextFormField(
          controller: _dobController,
          readOnly: true,
          onTap: () => _pickDate(context),
          style: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
          decoration: InputDecoration(
            labelText: "Date of Birth",
            labelStyle: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          validator: (val) => val == null || val.isEmpty ? "Please select your date of birth" : null,
        ),
        const SizedBox(height: 20),

        // Gender
        DropdownButtonFormField<Gender>(
          value: _selectedGender,
          items: Gender.values.map((gender) {
            return DropdownMenuItem<Gender>(
              value: gender,
              child: Text(
                gender.displayName,
                style: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
              ),
            );
          }).toList(),
          onChanged: (value) {
            _selectedGender = value;
          },
          decoration: InputDecoration(
            labelText: "Gender",
            labelStyle: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
            border: const OutlineInputBorder(),
          ),
          validator: (val) => val == null ? "Please select a gender" : null,
          dropdownColor: AppColors.secondary,
          iconEnabledColor: AppColors.darkText,
        ),
        const SizedBox(height: 20),

        // Bio
        TextFormField(
          controller: _bioController,
          keyboardType: TextInputType.name,
          style: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
          decoration: InputDecoration(
            labelText: "Bio",
            labelStyle: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        CustomFilledButton(title: 'Let\'s go!', onTap: () {}),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Go back to SignIn? ",
              style: AppTextStyles.interSemiBoldMd.copyWith(color: AppColors.primary),
            ),
            InkWell(
              onTap: () {
                context.goNamed(RouteName.signin);
              },
              child: Text(
                "Sign In",
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
    );
  }
}
