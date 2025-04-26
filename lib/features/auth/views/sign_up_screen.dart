import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:logger/logger.dart';
import 'package:onefan_app/core/config/app_preferences.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/core/utils/common_functions.dart';
import 'package:onefan_app/features/auth/controller/auth_controller.dart';
import 'package:onefan_app/features/auth/views/widgets/custom_filled_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:onefan_app/features/user_profile/controller/user_profile_controller.dart';
import 'package:onefan_app/features/user_profile/model/request/user_profile_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum SignUpState { initial, userCreated, otpVerified, userDetailsCompleted }

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key, this.signUpState});

  final SignUpState? signUpState;

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final log = Logger();

  // create user state
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // verify user state
  final _otpController = TextEditingController();
  final ValueNotifier<bool> _isResendOtpEnabled = ValueNotifier(false);
  late Timer _timer;
  int _counter = 60;

  // user details controller
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _phoneController = TextEditingController();
  Country _selectedCountry = const Country(name: "India", flag: "IN", code: "IN", dialCode: "91", nameTranslations: {}, minLength: 10, maxLength: 10);
  DateTime? _dob;

  final ValueNotifier<SignUpState> _signUpState = ValueNotifier(SignUpState.initial);
  final ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.signUpState != null) {
      _signUpState.value = widget.signUpState!;
      if (widget.signUpState == SignUpState.userCreated) {
        _startResendOtpCounter();
      }
    }
  }

  void _startResendOtpCounter() {
    _isResendOtpEnabled.value = false;
    _counter = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _isResendOtpEnabled.value = true;
        _timer.cancel();
      }
    });
  }

  resendOTP() async {
    try {
      String? userJson = AppPreferences().getString('user');
      User user = User.fromJson(jsonDecode(userJson!))!;
      bool isOtpSent = await ref.read(authControllerProvider.notifier).resendOTP(email: user.email ?? "", context: context);
      if (isOtpSent) {
        _startResendOtpCounter();
      }
    } catch (e) {
      CommonFunctions.showToastMessage(context: context, message: "Error while sending OTP");
    }
  }

  Future<void> registerUser() async {
    if (_formKey.currentState!.validate()) {
      if (_phoneController.text.isEmpty) {
        CommonFunctions.showToastMessage(context: context, message: "Please enter your phone number");
        return;
      }

      try {
        String? userJson = AppPreferences().getString("user");

        if (userJson == null) {
          context.goNamed(RouteName.signin);
          return;
        }

        User user = User.fromJson(jsonDecode(userJson))!;

        UserProfileRequest userDetails = UserProfileRequest(
          id: user.id,
          emailId: user.email ?? "",
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          phone: _phoneController.text.trim(),
          country: _selectedCountry.name,
          dob: _dob!,
        );

        bool isSuccess = await ref.read(userProfileControllerProvider.notifier).registerUser(userDetails: userDetails, context: context);

        if (isSuccess) {
          context.goNamed(RouteName.home);
        }
      } catch (e, st) {
        log.e("Something went wrong", error: e, stackTrace: st);
      }
    }
  }

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

  Future<void> onSignUp() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      bool isSuccess = await ref.read(authControllerProvider.notifier).signUp(email: email, password: password, context: context);
      if (isSuccess) {
        _startResendOtpCounter();
        await showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              "Verification Email Sent",
              style: AppTextStyles.rajdhaniBoldLg.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            content: Text(
              "We’ve sent a one-time password (OTP) to your email. Please check your inbox and enter the OTP to verify your account.",
              textAlign: TextAlign.center,
              style: AppTextStyles.interSemiBoldMd,
            ),
            actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            actionsAlignment: MainAxisAlignment.end,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: Text(
                  "Okay",
                  style: AppTextStyles.interBoldLg,
                ),
              ),
            ],
          ),
        );

        _signUpState.value = SignUpState.userCreated;
      }
    }
  }

  Future<void> onVerifyOTP() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final otp = _otpController.text.trim();

      bool isSuccess = await ref.read(authControllerProvider.notifier).verifyEmail(email: email, otp: otp, context: context);
      if (isSuccess) {
        await Future.delayed(const Duration(seconds: 1));
        _signUpState.value = SignUpState.otpVerified;
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).viewPadding.top),
                // back button icon for OTP screen only
                ValueListenableBuilder(
                  valueListenable: _signUpState,
                  builder: (context, signUpState, _) {
                    return signUpState == SignUpState.userCreated
                        ? Column(
                            children: [
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  _signUpState.value = SignUpState.initial;
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
                      case SignUpState.initial:
                        return _buildCreateUserState();
                      case SignUpState.userCreated:
                        return _buildVerifyUserState();
                      case SignUpState.otpVerified:
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
            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
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
                border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              ),
              validator: (val) => val != null && val.length >= 6 ? null : "Password must be at least 6 characters",
            );
          },
        ),
        const SizedBox(height: 20),

        // Confirm Password
        ValueListenableBuilder(
          valueListenable: _isObscure,
          builder: (context, isObscure, _) {
            return TextFormField(
              controller: _confirmPasswordController,
              obscureText: isObscure,
              style: AppTextStyles.interNormalMd.copyWith(color: AppColors.lightSurface),
              decoration: InputDecoration(
                labelText: "Confirm Password",
                labelStyle: AppTextStyles.interNormalMd.copyWith(color: AppColors.lightSurface),
                border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              ),
              validator: (val) => val == _passwordController.text ? null : "Passwords don't match",
            );
          },
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
        ref.watch(authControllerProvider).when(
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (_) => CustomFilledButton(title: 'Sign Up', onTap: onSignUp),
              error: (e, st) {
                return CustomFilledButton(title: 'Sign Up', onTap: onSignUp);
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
            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
          maxLength: 6,
          onChanged: (value) {
            if (value.contains(RegExp(r'[^0-9]'))) {
              _otpController.text = value.replaceAll(RegExp(r'[^0-9]'), '');
              _otpController.selection = TextSelection.fromPosition(
                TextPosition(offset: _otpController.text.length),
              );
            }
          },
          validator: (val) => val != null && val.length != 6 ? "Invalid OTP" : null,
        ),
        const SizedBox(height: 20),
        ref.watch(authControllerProvider).when(
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (_) => CustomFilledButton(title: 'Verfiy', onTap: onVerifyOTP),
              error: (e, st) => CustomFilledButton(title: 'Verfiy', onTap: onVerifyOTP),
            ),
        const SizedBox(height: 20),
        Center(
          child: ValueListenableBuilder(
            valueListenable: _isResendOtpEnabled,
            builder: (context, value, child) {
              switch (value) {
                case true:
                  return InkWell(
                    onTap: () {
                      resendOTP();
                    },
                    child: Text(
                      "Resend OTP",
                      style: AppTextStyles.interBoldMd.copyWith(
                        color: AppColors.info,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.info,
                      ),
                    ),
                  );
                case false:
                  return Text(
                    "Resend OTP in 00:${_counter.toString().padLeft(2, '0')}",
                    style: AppTextStyles.interBoldMd,
                  );
              }
            },
          ),
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
        Text("Complete your profile", style: AppTextStyles.interNormalMd.copyWith(color: Colors.white)),
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
                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
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
                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (val) => val != null && val.length >= 2 ? null : "Name is too short",
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Phone
        IntlPhoneField(
          controller: _phoneController,
          decoration: InputDecoration(
            labelText: 'Phone Number',
            labelStyle: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
            filled: true,
            fillColor: Colors.transparent,
            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
          style: AppTextStyles.interNormalMd.copyWith(color: Colors.white),
          initialCountryCode: 'IN',
          onCountryChanged: (country) {
            _selectedCountry = country;
          },
          dropdownIcon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
          validator: (val) => (val == null || val.number.isEmpty) ? "Please enter phone number" : null,
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
            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please select your date of birth";
            }

            if (_dob == null) return "Invalid date selected";

            final today = DateTime.now();
            final age = today.year - _dob!.year - ((today.month < _dob!.month || (today.month == _dob!.month && today.day < _dob!.day)) ? 1 : 0);

            if (age < 18) {
              return "You must be at least 18 years old";
            }

            return null;
          },
        ),
        const SizedBox(height: 20),

        ref.watch(userProfileControllerProvider).when(
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (data) => CustomFilledButton(title: 'Let\'s go!', onTap: registerUser),
              error: (e, st) => CustomFilledButton(title: 'Let\'s go!', onTap: registerUser),
            ),

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
