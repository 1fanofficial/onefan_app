import 'package:flutter/material.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({super.key, required this.title, this.buttonColor, required this.onTap, this.textColor});

  final String title;
  final Color? buttonColor;
  final Color? textColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: AppTextStyles.rajdhaniBoldLg.copyWith(color: textColor ?? AppColors.lightSurface),
        ),
      ),
    );
  }
}
